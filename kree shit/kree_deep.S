/* kree_deep.S -- deep 0x5403 sweep + bind + MTEEC-param invokes.
 * Phase 1: create(srv.mem) once, subs 0..31 on the SAME session (tests
 *   session persistence + maps sub responses with dmesg correlation).
 * Phase 2: 0x5415 bind with session (struct guess {sess}).
 * Phase 3: MTEEC-param invokes: paramTypes in {0,0x77,0x7777,0x1111},
 *   memref = {shm=our-handle, size, offset} from a registered dma buffer.
 * All root-shell, no flash/reboot. Watch dmesg [KREE] throughout.
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
msg_ph:     .asciz " ph="
msg_sub:    .asciz " sub="
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
// w20=phase, w21=rc, w22=out, w23=sub -> one line. Uses x10-x15 only
// (x19-x28 survive: loop state lives there).
report:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov w10, w20
    mov w11, w21
    mov w12, w22
    mov w13, w23
    adrp x0, msg_ph; add x0, x0, :lo12:msg_ph; bl print_cstr
    mov w0, w10; bl print_hex32
    adrp x0, msg_sub; add x0, x0, :lo12:msg_sub; bl print_cstr
    mov w0, w13; bl print_hex32
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    ldp x29, x30, [sp], #16; ret
_start:
    // gz fd -> x19
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
    // create(srv.mem) -> w28 session (w28 callee-saved? w19-w28 YES)
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_mem; add x0, x0, :lo12:svc_mem
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w28, [sp, #4]
    add sp, sp, #32
    cbz w28, done              // no session, nothing to drive
    // register dma under session -> w29 shm (w29 safe? w19-w28 callee-saved: w29 SAFE)
    sub sp, sp, #32
    str w28, [sp]
    str wzr, [sp, #4]
    str x26, [sp, #8]
    mov x0, #0x10000
    str x0, [sp, #16]
    str xzr, [sp, #24]
    mov x0, x19
    mov w1, #0x5404; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w29, [sp, #4]
    add sp, sp, #32
    // Phase 1: subs 0..31, shared ustruct {shm,0x10000@+16}
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x10000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x24, sp
    mov w25, #0                // sub
ph1:
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]          // session
    str w25, [sp, #8]          // sub
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x24, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp]
    add sp, sp, #64
    mov w20, #1
    mov w23, w25
    bl report
    add w25, w25, #1
    cmp w25, #256
    b.lt ph1
    // Phase 2: bind 0x5415 (encodings C010 and 4008) with session struct
    sub sp, sp, #16
    str xzr, [sp]
    str w28, [sp, #4]
    mov x0, x19
    mov w1, #0x5415; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    mov w22, #0xC010
    mov w20, #2; mov w23, #0x5415
    bl report
    mov x0, x19
    mov w1, #0x5415; movk w1, #0x4008, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    mov w22, #0x4008
    mov w20, #2; mov w23, #0x5415
    bl report
    add sp, sp, #16
    // Phase 3: MTEEC-param invokes: types in {0,0x77,0x7777,0x1111},
    // memref={shm,0x1000,0} at ustruct+32
    mov w25, #0                // type index
ph3:
    adrp x0, typetab
    add x0, x0, :lo12:typetab
    lsl x1, x25, #2
    ldr w1, [x0, x1]           // paramTypes
    str w29, [x24, #32]        // memref shm
    mov x0, #0x1000
    str x0, [x24, #40]         // size
    str xzr, [x24, #48]        // offset
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]
    mov w0, #1                 // sub=invoke-ish
    str w0, [sp, #8]
    // struct layout: types at +12 (MTEEC attempt, minimal probe)
    sub sp, sp, #64
    str wzr, [sp]
    str w28, [sp, #4]
    mov w0, #1
    str w0, [sp, #8]
    adrp x0, typetab
    add x0, x0, :lo12:typetab
    lsl x1, x25, #2
    ldr w0, [x0, x1]
    str w0, [sp, #12]          // +12 = paramTypes
    str x24, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp]
    add sp, sp, #64
    mov w20, #3; mov w23, w25
    bl report
    add w25, w25, #1
    cmp w25, #4
    b.lt ph3
    add sp, sp, #64            // free ustruct
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
    .section .rodata
typetab:
    .word 0, 0x77, 0x7777, 0x1111
