/* kree_enum.S -- enumerate session table via GetChm (0x40085416).
 * struct{0, X@+4} for X in 0..64. Existing sessions return chm handles;
 * dead ones error. READ-ONLY: reveals every live session + handle shape.
 * Goal: find sessions beyond 1,3,4 (camera/widevine/kernel owners?).
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
msg_out:    .asciz " chm="
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
    mov w20, #0                // X 0..64
enum_loop:
    sub sp, sp, #16
    str xzr, [sp]
    str w20, [sp, #4]
    mov x0, x19
    mov w1, #0x5416
    movk w1, #0xc008, lsl #16  // 0xC0085416 (from lib disasm)
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp, #4]        // chm OUT (same offset pattern as create)
    add sp, sp, #16
    // print only successes (rc==0) + any chm!=0
    cbnz w21, next
    cbnz w22, show
    b next
show:
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w21; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w22; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
next:
    add w20, w20, #1
    cmp w20, #65
    b.lt enum_loop
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
