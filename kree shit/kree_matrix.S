/* kree_matrix.S -- systematic sweep: subs 0..1023 x 7 services.
 * Per service: create -> loop 1024x 0x5403{0,sess,sub,0x20002,ustruct} ->
 * print ONLY anomalies (rc!=0 || out!=0) + heartbeat every 256.
 * dmesg drained between services by the operator; anomalous combos get
 * dedicated re-runs with dmesg watch. No flash/reboot. Silent = gated.
 */
    .arch armv8-a
    .text
    .global _start
    .equ SYS_OPENAT, 56
    .equ SYS_IOCTL, 29
    .equ SYS_WRITE, 64
    .equ SYS_EXIT, 93
    .section .rodata
dev_path:   .asciz "/dev/gz_kree"
msg_sv:     .asciz "SVC="
msg_rc:     .asciz " RC="
msg_out:    .asciz " OUT="
msg_sub:    .asciz " SUB="
msg_hb:     .asciz "HB svc="
msg_nl:     .asciz "\n"
s_mem:      .asciz "com.mediatek.geniezone.srv.mem"
s_sys:      .asciz "com.mediatek.geniezone.srv.sys"
s_imgs:     .asciz "com.mediatek.geniezone.srv.imgsensor"
s_test:     .asciz "com.mediatek.geniezone.test"
s_isp:      .asciz "com.mediatek.geniezone.isp"
s_echo:     .asciz "com.mediatek.geniezone.srv.echo"
s_cmdq:     .asciz "com.mediatek.geniezone.cmdq"
    .align 3
svc_table:
    .quad s_mem, s_sys, s_imgs, s_test, s_isp, s_echo, s_cmdq
    .text
print:
    mov x2, x1; mov x1, x0; mov x0, #1; mov x8, #SYS_WRITE; svc #0; ret
print_cstr:
    mov x2, x0; mov x3, #0
1:  ldrb w1, [x2, x3]; cbz w1, 2f; add x3, x3, #1; b 1b
2:  mov x1, x3; b print
print_hex32:
    stp x29, x30, [sp, #-16]!
    mov x29, sp; sub sp, sp, #16; mov w1, w0; add x2, sp, #8; mov w3, #8
1:  sub x2, x2, #1; and w4, w1, #0xf; lsr w1, w1, #4; cmp w4, #10
    add w5, w4, #48; add w6, w4, #87; csel w4, w5, w6, lo; strb w4, [x2]
    subs w3, w3, #1; b.ne 1b
    mov x0, sp; mov x1, #8; bl print
    add sp, sp, #16; ldp x29, x30, [sp], #16; ret
// w10=svc,w11=sub,w12=rc,w13=out -> "SVC=.. SUB=.. RC=.. OUT=..\n" (x10-x15 only)
report_hit:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov w10, w20; mov w11, w25; mov w12, w21; mov w13, w22
    adrp x0, msg_sv; add x0, x0, :lo12:msg_sv; bl print_cstr
    mov w0, w10; bl print_hex32
    adrp x0, msg_sub; add x0, x0, :lo12:msg_sub; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w13; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    ldp x29, x30, [sp], #16; ret
_start:
    movn x0, #99
    adrp x1, dev_path; add x1, x1, :lo12:dev_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0
    cmp x19, #0; b.lt done
    // shared ustruct {0,0,0x1000} persistent
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x24, sp
    adrp x26, svc_table
    add x26, x26, :lo12:svc_table
    mov w20, #0                // svc idx 0..6
svc_loop:
    lsl x0, x20, #3
    add x0, x26, x0
    ldr x27, [x0]              // name ptr (x27 callee-saved: SAFE)
    // create(name) -> w28 sess
    sub sp, sp, #32
    str xzr, [sp]
    str x27, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w28, [sp, #4]
    add sp, sp, #32
    cbz w28, svc_next          // no session: skip service entirely
    mov w25, #0                // sub 0..1023
sub_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]          // session
    str w25, [sp, #8]          // sub
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x24, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp]
    add sp, sp, #64
    // heartbeat every 256
    tst w25, #0xff
    b.ne no_hb
    adrp x0, msg_hb; add x0, x0, :lo12:msg_hb; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w25; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
no_hb:
    // anomaly? (rc!=0 || out!=0)
    cbnz w21, hit
    cbnz w22, hit
    b sub_next
hit:
    bl report_hit
sub_next:
    add w25, w25, #1
    cmp w25, #1024
    b.lt sub_loop
svc_next:
    add w20, w20, #1
    cmp w20, #7
    b.lt svc_loop
    add sp, sp, #64            // free ustruct
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
