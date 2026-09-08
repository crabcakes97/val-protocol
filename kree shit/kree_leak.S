/* kree_leak.S -- 3000x COMM-err-path calls (sub 0x24, test service).
 * Isolates whether the error path leaks (per-call alloc without free?).
 * Prints progress every 1000. Then operator watches 5 min for drop/reboot.
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
msg_rc:     .asciz " n="
msg_nl:     .asciz "\n"
svc_test:   .asciz "com.mediatek.geniezone.test"
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
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x24, sp
    // create(test) -> w28
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_test; add x0, x0, :lo12:svc_test
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w28, [sp, #4]
    add sp, sp, #32
    cbz w28, done
    mov w25, #3000
leak_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]
    mov w0, #0x24
    str w0, [sp, #8]
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x24, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    add sp, sp, #64
    // progress every 1000 (w25 counts down from 3000)
    mov w0, w25
    mov w1, #1000
    udiv w2, w0, w1
    msub w2, w2, w1, w0       // w2 = w25 % 1000
    cbnz w2, no_pr
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w25; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
no_pr:
    subs w25, w25, #1
    b.ne leak_loop
    add sp, sp, #64
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
