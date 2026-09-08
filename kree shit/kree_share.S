/* kree_sys.S -- gz_kree SERVICE-NAME session + share attempt.
 * UREE_CreateSession takes a SERVICE NAME (not UUID): struct{0, name}.
 * Known names (from camera CA libs): com.mediatek.geniezone.srv.mem (the
 * MEMORY service = share primitive!), com.mediatek.geniezone.isp.
 * Flow per service: create -> capture session OUT (struct+4) ->
 * register dma_heap buffer under that session -> print rc+shm.
 * Session 0 register already proven hd=-99; a real session is the missing
 * piece. No flash, read-only until register (which shares OUR OWN buffer).
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
heap_path:  .asciz "/dev/dma_heap/system"
msg_svc:    .asciz " svc="
msg_rc:     .asciz " rc=0x"
msg_sess:   .asciz " sess=0x"
msg_shm:    .asciz " shm=0x"
msg_nl:     .asciz "\n"
svc_mem:    .asciz "com.mediatek.geniezone.srv.mem"
svc_isp:    .asciz "com.mediatek.geniezone.isp"
    .align 3
svc_table:
    .quad svc_mem
    .quad svc_isp
    .text
print:  // x0=ptr,x1=len
    mov x2, x1
    mov x1, x0
    mov x0, #1
    mov x8, #SYS_WRITE
    svc #0
    ret
print_cstr: // x0=ptr
    mov x2, x0
    mov x3, #0
1:  ldrb w1, [x2, x3]
    cbz w1, 2f
    add x3, x3, #1
    b 1b
2:  mov x1, x3
    b print
print_hex32: // w0
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    mov w1, w0
    add x2, sp, #8
    mov w3, #8
1:  sub x2, x2, #1
    and w4, w1, #0xf
    lsr w1, w1, #4
    cmp w4, #10
    add w5, w4, #48
    add w6, w4, #87
    csel w4, w5, w6, lo
    strb w4, [x2]
    subs w3, w3, #1
    b.ne 1b
    mov x0, sp
    mov x1, #8
    bl print
    add sp, sp, #16
    ldp x29, x30, [sp], #16
    ret
_start:
    // gz fd
    movn x0, #99
    adrp x1, dev_path
    add x1, x1, :lo12:dev_path
    mov x2, #2
    mov x3, xzr
    mov x8, #SYS_OPENAT
    svc #0
    mov x19, x0
    cmp x19, #0
    b.lt done
    // dma_heap buffer 0x1000 -> x26
    movn x0, #99
    adrp x1, heap_path
    add x1, x1, :lo12:heap_path
    mov x2, #2
    mov x3, xzr
    mov x8, #SYS_OPENAT
    svc #0
    mov x24, x0
    sub sp, sp, #32
    mov x0, #0x1000
    str x0, [sp]
    str wzr, [sp, #8]
    mov w0, #2
    movk w0, #0x8, lsl #16
    str w0, [sp, #12]
    str xzr, [sp, #16]
    mov x0, x24
    mov w1, #0x4800
    movk w1, #0xc018, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    ldr w25, [sp, #8]
    mov x0, xzr
    mov x1, #0x1000
    mov x2, #3
    mov x3, #1
    mov x4, x25
    mov x5, xzr
    mov x8, #222
    svc #0
    mov x26, x0              // dma addr
    add sp, sp, #32
    // service loop x2
    adrp x24, svc_table
    add x24, x24, :lo12:svc_table
    mov w25, #2
svc_loop:
    ldr x20, [x24]           // service name ptr
    sub sp, sp, #32
    str xzr, [sp]            // struct+0
    str x20, [sp, #8]        // struct+8 = service name
    mov x0, x19
    mov w1, #0x5401
    movk w1, #0xc010, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0              // rc
    ldr w22, [sp, #4]        // session OUT
    // print " svc=N rc=.. sess=.."
    adrp x0, msg_svc
    add x0, x0, :lo12:msg_svc
    bl print_cstr
    mov w0, #2
    sub w0, w0, w25
    bl print_hex32
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc
    bl print_cstr
    mov w0, w21
    bl print_hex32
    adrp x0, msg_sess
    add x0, x0, :lo12:msg_sess
    bl print_cstr
    mov w0, w22
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
    // if rc==0 and sess valid: register dma under it
    cbnz w21, next_svc
    cbz w22, next_svc
    str w22, [sp]            // struct+0 = session
    str wzr, [sp, #4]        // +4 shm = 0
    str x26, [sp, #8]        // +8 buf = dma
    mov x0, #0x1000
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
    adrp x0, msg_shm
    add x0, x0, :lo12:msg_shm
    bl print_cstr
    mov w0, w21
    bl print_hex32
    mov w0, w22
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
next_svc:
    add sp, sp, #32
    add x24, x24, #8
    subs w25, w25, #1
    b.ne svc_loop
done:
    mov x0, #0
    mov x8, #SYS_EXIT
    svc #0
