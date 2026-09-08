/* kree_close.S -- close our leaked sessions 4..40 (NOT 1-3: foreign).
 * close = 0xC0205402 (driver dispatch), struct {0 x8, session u32 @+4}.
 * Frees session-table slots; then echo/create behavior re-tested.
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
    mov w20, #4
close_loop:
    sub sp, sp, #16
    str xzr, [sp]            // +0 zero
    str w20, [sp, #8]        // +8 session? lib: [sp,#0xc] rel struct base+4
    // NOTE: lib struct base is sp+8 with session @+4 => [sp+12]. Adjust:
    // rebuild exactly: struct16 at sp: [0]=0,[8]=0 then [12]=sess
    str wzr, [sp, #12]       // placeholder, overwritten below
    mov x0, x19
    mov w1, #0x5402
    movk w1, #0xc010, lsl #16
    mov x2, sp
    // fix layout: need u64 zero @+0, u32 sess @+4 of a 16B struct at sp
    // [sp]=0 already (str xzr covers 8B), [sp+8]=w20? redo cleanly:
    str xzr, [sp]
    str xzr, [sp, #8]
    str w20, [sp, #4]
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0
    add sp, sp, #16
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w21; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    add w20, w20, #1
    cmp w20, #41
    b.lt close_loop
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
