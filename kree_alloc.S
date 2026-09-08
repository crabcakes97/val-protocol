/* kree_alloc.S -- secure-mem alloc via 0x5403 sub-cmd (mirrors UREE_Alloc).
 * open -> create(srv.mem) -> 0x5403{ret,sess,2,0x20002,ustruct} where
 * ustruct={0,0,size@+16}. Bounded size 0x1000. Allocation only.
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
msg_rc:     .asciz " rc=0x"
msg_out:    .asciz " out=0x"
msg_nl:     .asciz "\n"
svc_mem:    .asciz "com.mediatek.geniezone.srv.mem"
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
// x0=label -> print " rc=0x........ out=0x........\n" for w21/w22
report:
    stp x29, x30, [sp, #-16]!
    mov x29, sp; mov x20, x0
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w21; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w22; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    ldp x29, x30, [sp], #16; ret
_start:
    movn x0, #99
    adrp x1, dev_path; add x1, x1, :lo12:dev_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0
    cmp x19, #0; b.lt done
    // create(srv.mem)
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_mem; add x0, x0, :lo12:svc_mem
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp, #4]        // session
    bl report
    cbz w21, have_sess
    cbnz w22, have_sess
    b svc_done
have_sess:
    // user struct {0,0,0x1000@+16} at fresh stack area
    sub sp, sp, #64
    str xzr, [sp]
    str xzr, [sp, #8]
    mov x0, #0x1000
    str x0, [sp, #16]
    str xzr, [sp, #24]
    str xzr, [sp, #32]
    str xzr, [sp, #40]
    mov x24, sp              // ustruct (persists across loop)
    add sp, sp, #32          // free create area now; loop manages its own
    // sub sweep 0..8, fresh session per sub (service may close sessions)
    mov w25, #0
sub_loop:
    // fresh create(srv.mem) -> w22=sess
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_mem
    add x0, x0, :lo12:svc_mem
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401
    movk w1, #0xc010, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    ldr w22, [sp, #4]        // session
    add sp, sp, #32
    cbz w22, sub_next        // no session -> still probe (sessionless data)
    // 0x5403 struct {0,sess,sub,0x20002,ustruct,0}
    sub sp, sp, #64
    str wzr, [sp]            // +0 ret
    str w22, [sp, #4]        // +4 session
    str w25, [sp, #8]        // +8 sub
    mov w0, #2
    movk w0, #0x2, lsl #16
    str w0, [sp, #12]        // +12 flags 0x20002
    str x24, [sp, #16]       // +16 ustruct ptr
    str wzr, [sp, #24]       // +24
    str xzr, [sp, #32]
    str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403
    movk w1, #0xc020, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0
    ldr w23, [sp]            // ret OUT
    // print " sub=N rc=.. out=.."
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc
    bl print_cstr
    mov w0, w25
    bl print_hex32
    mov w0, w21
    bl print_hex32
    adrp x0, msg_out
    add x0, x0, :lo12:msg_out
    bl print_cstr
    mov w0, w23
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
    add sp, sp, #64
sub_next:
    add w25, w25, #1
    cmp w25, #9
    b.lt sub_loop
    add sp, sp, #64          // free ustruct area
    b done                   // sp balanced; exit directly
svc_done:
    add sp, sp, #32          // free original create area (early-fail path)
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
