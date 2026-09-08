/* kree_echo.S -- echo-service session + share + service-call sweep.
 * Service: com.mediatek.geniezone.srv.echo (used by driver's own tests).
 * Flow: create -> register dma buffer -> 0x5403 subs 0..5 -> print rc/out.
 * STAGED for 1-by-1 test phase. No flash, root shell only.
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
msg_rc:     .asciz " rc=0x"
msg_out:    .asciz " out=0x"
msg_nl:     .asciz "\n"
svc_echo:   .asciz "com.mediatek.geniezone.srv.echo"
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
// w25=sub -> print " sub=.. rc=.. out=.." (w21=rc, w22=out)
report_sub:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w25; bl print_hex32
    mov w0, w21; bl print_hex32
    adrp x0, msg_out; add x0, x0, :lo12:msg_out; bl print_cstr
    mov w0, w22; bl print_hex32
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
    mov x4, x25; mov x5, xzr; mov x8, #222; svc #0
    mov x26, x0
    add sp, sp, #32
    cmp x26, #0; b.lt done
    // fill dma with 0x5A pattern (dma proven non-writable before? try: faults here => skip)
    // (fill omitted: zero baseline detects secure-side writes)
    // create(echo) -> w22=sess (fresh per sub below? one session reused)
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_echo; add x0, x0, :lo12:svc_echo
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w22, [sp, #4]        // session
    add sp, sp, #32
    mov w27, w22             // saved session (w27 callee-saved? NO - w19-w28 callee-saved: w27 SAFE)
    // register dma under session
    sub sp, sp, #32
    str w27, [sp]
    str wzr, [sp, #4]
    str x26, [sp, #8]
    mov x0, #0x10000
    str x0, [sp, #16]
    str xzr, [sp, #24]
    mov x0, x19
    mov w1, #0x5404; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp, #4]        // shm
    add sp, sp, #32
    adrp x0, msg_rc; add x0, x0, :lo12:msg_rc; bl print_cstr
    mov w0, w21; bl print_hex32
    mov w0, w22; bl print_hex32
    adrp x0, msg_nl; add x0, x0, :lo12:msg_nl; mov x1, #1; bl print
    // user struct {0,0,0x1000@+16} persistent
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x24, sp
    // subs 0..5 (w25), session re-created each iter (service may close)
    mov w25, #0
sub_loop:
    // fresh create(echo)
    sub sp, sp, #32
    str xzr, [sp]
    adrp x0, svc_echo; add x0, x0, :lo12:svc_echo
    str x0, [sp, #8]
    mov x0, x19
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w27, [sp, #4]
    add sp, sp, #32
    cbz w27, sub_next
    // 0x5403 {0,sess,sub,0x20002,ustruct,0}
    sub sp, sp, #64
    str wzr, [sp]
    str w27, [sp, #4]
    str w25, [sp, #8]
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x24, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x19
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x21, x0
    ldr w22, [sp]            // ret OUT
    add sp, sp, #64
    mov w0, w25              // need sub in report: stash via w25 (report uses w25)
    bl report_sub
sub_next:
    add w25, w25, #1
    cmp w25, #6
    b.lt sub_loop
    add sp, sp, #64          // free ustruct
done:
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
