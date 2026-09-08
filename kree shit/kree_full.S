/* kree_full.S -- EXHAUSTIVE sub sweep: subs 0..65535 x 7 services (own
 * session) + x foreign sessions {1,3,4}. struct shape fixed to the proven
 * lib pattern {ret,sess,sub,0x20002,ustruct,0}. Prints anomalies
 * (rc!=0 || out!=0) + heartbeats. Progress persisted to
 * /data/local/tmp/kprog (svc,sub) every 4096 subs for reboot resume.
 * No flash. Worst case per call: silent driver error. Hangs/panics recover
 * via reboot + resume (user: buttons if USB dies).
 */
    .arch armv8-a
    .text
    .global _start
    .equ SYS_OPENAT, 56
    .equ SYS_IOCTL, 29
    .equ SYS_WRITE, 64
    .equ SYS_PWRITE, 61
    .equ SYS_CLOSE, 57
    .equ SYS_EXIT, 93
    .section .rodata
dev_path:   .asciz "/dev/gz_kree"
prog_path:  .asciz "/data/local/tmp/kprog"
msg_sv:     .asciz "SVC="
msg_sb:     .asciz " SUB="
msg_rc:     .asciz " RC="
msg_out:    .asciz " OUT="
msg_nl:     .asciz "\n"
msg_hb:     .asciz "HB "
msg_dn:     .asciz "DONE\n"
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
// w10=svc,w11=sub,w12=rc,w13=out -> full line (x10-x15 only)
report:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov w10, w20; mov w11, w25; mov w12, w21; mov w13, w22
    adrp x0, msg_sv; add x0, x0, :lo12:msg_sv; bl print_cstr
    mov w0, w10; bl print_hex32
    adrp x0, msg_sb; add x0, x0, :lo12:msg_sb; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w13; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    ldp x29, x30, [sp], #16; ret
// write progress (w20=svc,w25=sub) to kprog. clobbers x0-x8.
save_prog:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    stp x20, x25, [sp, #16]
    movn x0, #99
    adrp x1, prog_path; add x1, x1, :lo12:prog_path
    mov w2, #0x241            // O_WRONLY|O_CREAT|O_TRUNC
    mov w3, #0x1a4            // 0644
    mov x8, #SYS_OPENAT; svc #0
    cmp x0, #0; b.lt 1f
    mov x4, x0
    add x0, sp, #16
    mov x1, #8
    // plain write (file was just O_TRUNCed, offset is 0; avoids pwrite64
    // number doubts entirely)
    mov x2, x1
    mov x1, x0
    mov x0, x4
    mov x8, #SYS_WRITE; svc #0
    mov x0, x4
    mov x8, #SYS_CLOSE; svc #0
1:  ldp x29, x30, [sp], #32; ret
_start:
    movn x0, #99
    adrp x1, dev_path; add x1, x1, :lo12:dev_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0
    cmp x19, #0; b.lt done
    adrp x0, msg_hb; add x0, x0, :lo12:msg_hb; bl print_cstr
    mov w0, w19; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    // resume marker: read kprog (svc,sub); default (0,0)
    mov w20, #0
    mov w25, #0
    movn x0, #99
    adrp x1, prog_path; add x1, x1, :lo12:prog_path
    mov x2, xzr               // O_RDONLY
    mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    cmp x0, #0; b.lt no_resume
    mov x4, x0
    sub sp, sp, #16
    mov x0, x4; mov x1, sp; mov x2, #8; mov x8, #63  // SYS_READ
    svc #0
    cmp x0, #8; b.ne no_resume2
    ldp w20, w25, [sp]
    cmp w20, #7; b.hs no_resume2   // svc out of range -> restart
    // w25 sub: clamp < 65536 (mov mask)
    mov w1, #0xffff
    and w25, w25, w1
    b resume_ok
no_resume2:
    add sp, sp, #16
    mov x0, x4; mov x8, #SYS_CLOSE; svc #0
    b no_resume_cont
resume_ok:
    add sp, sp, #16
    mov x0, x4; mov x8, #SYS_CLOSE; svc #0
    b have_start
no_resume:
    nop
no_resume_cont:
    mov w20, #0
    mov w25, #0
have_start:
    // shared ustruct {0,0,0x1000@+16} persistent
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x24, sp
    adrp x26, svc_table
    add x26, x26, :lo12:svc_table
svc_loop:
    // create current service -> w28 (skip if resuming mid-service? always recreate: cheap + fresh)
    lsl x0, x20, #3
    add x0, x26, x0
    ldr x27, [x0]
    sub sp, sp, #32
    str xzr, [sp]
    str x27, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w28, [sp, #4]
    add sp, sp, #32
    cbz w28, svc_next          // no session: skip service
sub_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]
    str w25, [sp, #8]
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
    // pacing: 2ms per call (flood control)
    sub sp, sp, #16
    str xzr, [sp]
    movz x0, #0x8480
    movk x0, #0x1e, lsl #16
    str x0, [sp, #8]
    mov x0, sp
    mov x1, xzr
    mov x8, #101
    svc #0
    add sp, sp, #16
    // heartbeat + progress every 4096
    tst w25, #0xfff
    b.ne no_hb
    adrp x0, msg_hb; add x0, x0, :lo12:msg_hb; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w25; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    // pacing: 200ms sleep per 4K subs (drains dmesg, cools CPU)
    sub sp, sp, #16
    mov x0, xzr
    movz x1, #0xC200
    movk x1, #0xBEB, lsl #16   // 200000000 ns
    str x0, [sp]
    str x1, [sp, #8]
    mov x0, sp
    mov x1, xzr
    mov x8, #101              // SYS_NANOSLEEP
    svc #0
    add sp, sp, #16
    bl save_prog
no_hb:
    cbnz w21, hit
    cbnz w22, hit
    b sub_next
hit:
    bl report
sub_next:
    add w25, w25, #1
    mov w0, #0                  // 65536 bound check via 32-bit compare
    movk w0, #0x1, lsl #16
    cmp w25, w0
    b.lt sub_loop
    mov w25, #0                // reset sub for next service
svc_next:
    add w20, w20, #1
    cmp w20, #7
    b.lt svc_loop
    // foreign sessions {1,3,4} x subs 0..65535 (same struct shape)
    adrp x27, foreign_tab
    add x27, x27, :lo12:foreign_tab
    mov w20, #100              // phase tag 100+
foreign_loop:
    ldr w28, [x27], #4
    mov w25, #0
fsub_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]
    str w25, [sp, #8]
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
    // pacing: 2ms per call (flood control)
    sub sp, sp, #16
    str xzr, [sp]
    movz x0, #0x8480
    movk x0, #0x1e, lsl #16
    str x0, [sp, #8]
    mov x0, sp
    mov x1, xzr
    mov x8, #101
    svc #0
    add sp, sp, #16
    tst w25, #0xfff
    b.ne no_hb2
    adrp x0, msg_hb; add x0, x0, :lo12:msg_hb; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w25; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    // progress: encode foreign phase as svc=100+idx? save (w20, w25)
    bl save_prog
no_hb2:
    cbnz w21, hit2
    cbnz w22, hit2
    b fsub_next
hit2:
    bl report
fsub_next:
    add w25, w25, #1
    mov w0, #0
    movk w0, #0x1, lsl #16
    cmp w25, w0
    b.lt fsub_loop
    // next foreign (w20 counts 100,101,102)
    add w20, w20, #1
    cmp w20, #103
    b.lt foreign_loop
    add sp, sp, #64            // free ustruct
    // clear progress (done)
    movn x0, #99
    adrp x1, prog_path; add x1, x1, :lo12:prog_path
    mov w2, #0x241; mov w3, #0x1a4; mov x8, #SYS_OPENAT; svc #0
    cmp x0, #0; b.lt done
    mov x4, x0
    sub sp, sp, #16
    mov w0, #7                 // svc=7 = DONE marker
    str w0, [sp]
    str wzr, [sp, #4]
    mov x0, x4; mov x1, sp; mov x2, #8; mov x3, xzr; mov x8, #SYS_PWRITE; svc #0
    mov x0, x4; mov x8, #SYS_CLOSE; svc #0
    add sp, sp, #16
    adrp x0, msg_dn; add x0, x0, :lo12:msg_dn; bl print_cstr
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
    .section .rodata
foreign_tab:
    .word 1, 3, 4
