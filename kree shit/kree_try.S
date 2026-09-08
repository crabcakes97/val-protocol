/* kree_try.S -- freestanding aarch64 static-PIE KREE prober (no libc).
 * Syscalls only: openat, ioctl, write, exit. No bionic, no NDK.
 * Phase 1: open /dev/gz_kree + scan UREE_CreateSession (0xC0105401, 16B
 *   struct {u64 zero, u64 client}) over client IDs 1..8, print fd +
 *   per-client rc. Benign: session-create is what every TEE app does at
 *   boot. No share, no SMC, no flash.
 * Build: aarch64-linux-gnu-gcc -nostdlib -static-pie -o kree_try kree_try.S
 */
    .arch armv8-a
    .text
    .global _start

    .equ SYS_OPENAT, 56
    .equ SYS_IOCTL, 29
    .equ SYS_WRITE, 64
    .equ SYS_MMAP, 222
    .equ DMAHEAP_ALLOC, 0xC0184800  // _IOWR('H',0,24B)
    .equ SYS_EXIT, 93
    .equ AT_FDCWD, -100
    .equ CREATE_CMD, 0xC0105401

    .section .rodata
dev_path:   .asciz "/dev/gz_kree"
heap_path:  .asciz "/dev/dma_heap/system"
trusty_path: .asciz "/dev/trusty-ipc-dev0"
msg_fd:     .asciz "fd=0x"
msg_c:      .asciz " c="
msg_rc:     .asciz " rc=0x"
msg_sess:    .asciz " sess=0x"
msg_nl:     .asciz "\n"

    .text
/* x0=ptr, x1=len -> stdout. Clobbers x0-x2,x8. */
print:
    mov x2, x1
    mov x1, x0
    mov x0, #1
    mov x8, #SYS_WRITE
    svc #0
    ret

/* w0=value -> stdout as 8 hex chars. Clobbers x0-x6,x8. Preserves x19+. */
print_hex32:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    mov w1, w0
    add x2, sp, #8
    mov w3, #8
hex_loop:
    sub x2, x2, #1
    and w4, w1, #0xf
    lsr w1, w1, #4
    cmp w4, #10
    add w5, w4, #48          // '0'..'9'
    add w6, w4, #87          // 'a'..'f'
    csel w4, w5, w6, lo
    strb w4, [x2]
    subs w3, w3, #1
    b.ne hex_loop
    mov x0, sp
    mov x1, #8
    bl print
    add sp, sp, #16
    ldp x29, x30, [sp], #16
    ret

/* x0=ptr -> stdout c-string. Clobbers x0-x3,x8. */
print_cstr:
    mov x2, x0
    mov x3, #0
strlen_loop:
    ldrb w1, [x2, x3]
    cbz w1, strlen_done
    add x3, x3, #1
    b strlen_loop
strlen_done:
    mov x1, x3
    mov x3, x0               // save ptr (print uses x0,x1)
    mov x0, x3
    // x0=ptr, x1=len already
    b print

_start:
    // fd = openat(AT_FDCWD, "/dev/gz_kree", O_RDWR)
    mov x0, #AT_FDCWD
    adrp x1, dev_path
    add x1, x1, :lo12:dev_path
    mov x2, #2
    mov x3, #0
    mov x8, #SYS_OPENAT
    svc #0
    mov x19, x0              // fd (or -errno)
    // "fd=0x%x\n"
    adrp x0, msg_fd
    add x0, x0, :lo12:msg_fd
    bl print_cstr
    mov w0, w19
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
    cmp x19, #0
    b.lt done
    // struct at sp: {u64 0, u64 params_ptr}; params = dma_heap buffer.
    // Theory 2: driver pins the buffer (FOLL_LONGTERM) -> needs dmabuf.
    // heap = open("/dev/dma_heap/system"); alloc 0x1000; mmap it.
    movn x0, #99
    adrp x1, heap_path
    add x1, x1, :lo12:heap_path
    mov x2, #2
    mov x3, xzr
    mov x8, #SYS_OPENAT
    svc #0
    mov x24, x0              // heap fd
    cmp x24, #0
    b.lt done
    sub sp, sp, #64
    mov x0, #0x1000
    str x0, [sp]             // len
    str wzr, [sp, #8]        // fd OUT
    mov w0, #2
    movk w0, #0x8, lsl #16   // fd_flags = O_RDWR|O_CLOEXEC
    str w0, [sp, #12]
    str xzr, [sp, #16]       // heap_flags
    mov x0, x24
    mov w1, #0x4800
    movk w1, #0xc018, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0                  // rc ignored here; dbfd tells
    ldr w25, [sp, #8]        // dmabuf fd
    // addr = mmap(0,0x1000,PROT RW,MAP_SHARED,dbfd,0)
    mov x0, xzr
    mov x1, #0x1000
    mov x2, #3
    mov x3, #1
    mov x4, x25
    mov x5, xzr
    mov x8, #SYS_MMAP
    svc #0
    mov x26, x0              // dma addr (or -errno)
    add sp, sp, #64
    // params = {dma_addr, 0x1000}: the buffer describes ITSELF.
    // (If the kernel pins params->{addr,size}, zeros faulted before.)
    cmp x26, #0
    b.lt skip_params
    str x26, [x26]
    mov x0, #0x1000
    str x0, [x26, #8]
skip_params:
    // print " dmafd=0x.. addr=0x................" (reuse msg_c/msg_rc)
    adrp x0, msg_c
    add x0, x0, :lo12:msg_c
    bl print_cstr
    mov w0, w25
    bl print_hex32
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc
    bl print_cstr
    // 64-bit addr print: hi then lo
    mov x0, x26
    lsr x1, x0, #32
    mov w0, w1
    bl print_hex32
    mov x0, x26
    // fallthrough: low32
    mov w0, w0
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
    // create with params = dma addr
    // FIRST: mmap the gz fd itself (driver may need fd mapping first)
    mov x0, xzr
    mov x1, #0x1000
    mov x2, #3
    mov x3, #1
    mov x4, x19
    mov x5, xzr
    mov x8, #SYS_MMAP
    svc #0
    mov x27, x0              // mmap rc (addr or -errno)
    // print mmap rc hi/lo (reuse pattern)
    adrp x0, msg_rc
    add x0, x0, :lo12:msg_rc
    bl print_cstr
    lsr x1, x27, #32
    mov w0, w1
    bl print_hex32
    mov w0, w27
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
    sub sp, sp, #32
    str xzr, [sp]            // struct+0
    str x26, [sp, #8]        // struct+8 = dma params pointer
    mov x20, x26             // marker for print block
    mov x0, x19
    mov w1, #CREATE_CMD & 0xffff
    movk w1, #(CREATE_CMD >> 16) & 0xffff, lsl #16
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0              // rc
    ldr w22, [sp, #4]        // session OUT (kernel writes struct+4)
    // " ptr rc=0x........ sess=0x........\n"
    adrp x0, msg_c
    add x0, x0, :lo12:msg_c
    bl print_cstr
    mov w0, w20              // low32 of ptr (unique marker)
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
    add sp, sp, #32
    // --- discriminator: trusty GETApiVersion (no input pointers) ---
    movn x0, #99             // AT_FDCWD = -100
    adrp x1, trusty_path
    add x1, x1, :lo12:trusty_path
    mov x2, #2               // O_RDWR
    mov x3, xzr
    mov x8, #SYS_OPENAT
    svc #0
    mov x19, x0
    adrp x0, msg_fd
    add x0, x0, :lo12:msg_fd
    bl print_cstr
    mov w0, w19
    bl print_hex32
    adrp x0, msg_nl
    add x0, x0, :lo12:msg_nl
    mov x1, #1
    bl print
    cmp x19, #0
    b.lt done
    sub sp, sp, #16
    str wzr, [sp]
    mov x0, x19
    mov w1, #0x5400
    movk w1, #0x8004, lsl #16   // 0x80045400 = _IOR('T',0,u32)
    mov x2, sp
    mov x8, #SYS_IOCTL
    svc #0
    mov x21, x0
    ldr w22, [sp]               // version OUT
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
    add sp, sp, #16
    b done
    // (old client-scan loop removed: small-int theory disproven by EFAULT)

/* x0=dst, x1=len -> zero. Clobbers x0-x3. */
memzero:
    cbz x1, memzero_done
memzero_loop:
    sub x1, x1, #1
    strb wzr, [x0, x1]
    cbnz x1, memzero_loop
memzero_done:
    ret
done:
    mov x0, #0
    mov x8, #SYS_EXIT
    svc #0
