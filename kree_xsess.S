/* kree_xsess.S -- service calls on FOREIGN sessions 1,3,4 (subs 0..15).
 * Struct {0,sess,sub,0x20002,zero-ustruct}. Print anomalies only.
 * If any sub reaches past "wait ret failed", we found a live endpoint.
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
msg_rc:     .asciz " se="
msg_out:    .asciz " sub="
msg_nl:     .asciz "\n"
    .align 2
sess_tab:
    .word 1, 3, 4
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
_start:
    movn x0, #99
    adrp x1, dev_path; add x1, x1, :lo12:dev_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0
    cmp x19, #0; b.lt done
    // zero ustruct 64B persistent
    sub sp, sp, #64
    mov x0, sp; mov x1, #64
    // inline zero loop
    mov x2, xzr
zloop:
    str xzr, [x0], #8
    subs x1, x1, #8
    b.ne zloop
    mov x24, sp              // wait: sp unchanged? str post-inc used x0; sp same. x24=sp.
    mov x24, sp
    adrp x20, sess_tab
    add x20, x20, :lo12:sess_tab
    mov w21, #3                // 3 sessions
sess_loop:
    ldr w22, [x20], #4         // session
    mov w25, #0                // sub 0..15
sub_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w22, [sp, #4]
    str w25, [sp, #8]
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x24, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x26, x0              // rc (x26 callee-saved SAFE)
    ldr w27, [sp]            // out (w27 SAFE)
    add sp, sp, #64
    // print only if rc!=0 or out!=0... but rc is ALWAYS 0 (silent)! print dmesg-correlated index instead:
    // print all (48 lines, small):
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w22; bl print_hex32
    mov w0, w25; bl print_hex32
    mov w0, w26; bl print_hex32
    mov w0, w27; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    add w25, w25, #1
    cmp w25, #16
    b.lt sub_loop
    subs w21, w21, #1
    b.ne sess_loop
    add sp, sp, #64
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
