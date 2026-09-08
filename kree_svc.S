/* kree_svc.S -- session+register across ALL known service names.
 * mem/echo/isp known; new: srv.sys, srv.imgsensor, test, srv.m, cmdq.
 * Per service: create -> print rc+sess -> register dma -> print rc+shm.
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
msg_sv:     .asciz " svc="
msg_rc:     .asciz " rc=0x"
msg_se:     .asciz " se=0x"
msg_sh:     .asciz " sh=0x"
msg_nl:     .asciz "\n"
s_mem:      .asciz "com.mediatek.geniezone.srv.mem"
s_sys:      .asciz "com.mediatek.geniezone.srv.sys"
s_imgs:     .asciz "com.mediatek.geniezone.srv.imgsensor"
s_test:     .asciz "com.mediatek.geniezone.test"
s_m:        .asciz "com.mediatek.geniezone.srv.m"
s_cmdq:     .asciz "com.mediatek.geniezone.cmdq"
    .align 3
svc_table:
    .quad s_mem, s_sys, s_imgs, s_test, s_m, s_cmdq
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
    // dma 64KB -> x26
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
    adrp x24, svc_table
    add x24, x24, :lo12:svc_table
    mov w25, #6
svc_loop:
    ldr x20, [x24]           // name
    sub sp, sp, #32
    str xzr, [sp]
    str x20, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0              // rc
    ldr w22, [sp, #4]        // sess
    // register dma under sess (even if rc!=0? sess may still be set: try always)
    str w22, [sp]
    str wzr, [sp, #4]
    str x26, [sp, #8]
    mov x0, #0x1000
    str x0, [sp, #16]
    str xzr, [sp, #24]
    mov x0, x19
    mov w1, #0x5404; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    // print " svc=N rc=.. se=.. sh=.." (need shm OUT: reload struct? sp reused; read [sp+4] now)
    ldr w23, [sp, #4]        // shm (x23: NOT callee-saved! prints use x0-x8 only: SAFE)
    mov x27, x0              // reg rc (x27 callee-saved: SAFE across prints? prints don't touch x19+: YES)
    add sp, sp, #32
    adrp x0, msg_sv; add x0, x0, :lo12:msg_sv; bl print_cstr
    mov w0, #6; sub w0, w0, w25; bl print_hex32
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w21; bl print_hex32
    adrp x0, msg_se; add x0, x0, :lo12:msg_se; bl print_cstr
    mov w0, w22; bl print_hex32
    adrp x0, msg_sh; add x0, x0, :lo12:msg_sh; bl print_cstr
    mov w0, w27; bl print_hex32
    mov w0, w23; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    add x24, x24, #8
    subs w25, w25, #1
    b.ne svc_loop
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
