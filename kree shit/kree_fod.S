/* kree_fod.S -- FOD share ioctls 0x5410/0x5411, NULL arg + dmesg.
 * From lib shim: w1 = 0x5410 or 0x5411 (cinc), x2 = NULL. No session setup.
 * Observes driver behavior for the fingerprint-display share path.
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
msg_nl:     .asciz "\n"
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
    mov w20, #0x5410
fod_loop:
    mov x0, x19
    mov w1, w20
    mov x2, xzr
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w21; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    add w20, w20, #1
    mov w0, #0x5412
    cmp w20, w0
    b.lt fod_loop
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
