/* marker.S -- minimal /init: find expdb via PARTNAME scan, write marker, reboot.
 * No libc, raw syscalls only. Proves: GKI boots + vendor_boot DTB works +
 * expdb exfil channel + safe return. No mounts, no system, no adbd.
 * SYS: openat 56, read 63, write 64, close 57, mknod 133, reboot 169.
 */
    .arch armv8-a
    .text
    .global _start
    .equ SYS_OPENAT, 56
    .equ SYS_READ, 63
    .equ SYS_WRITE, 64
    .equ SYS_CLOSE, 57
    .equ SYS_MKNOD, 133
    .equ SYS_MOUNT, 165
    .equ SYS_REBOOT, 169
    .section .rodata
sysfs_src:  .asciz "sysfs"
sys_dir:    .asciz "/sys"
sys_prefix: .asciz "/sys/block/sdc/sdc"
suffix:     .asciz "/uevent"
want:       .asciz "PARTNAME=expdb"
devnode:    .asciz "/xexpdb"
marker:     .asciz "MARKER-GKI-BOOT-OK\n"
needle_major: .asciz "MAJOR="
needle_minor: .asciz "MINOR="
rb_reason:  .asciz "bootloader"
    .text
/* x0=fd,x1=buf,x2=len -> x0=bytes */
read_all:
    mov x3, xzr
1:  mov x0, x4
    mov x8, #SYS_READ
    svc #0
    cmp x0, #0
    b.le 2f
    add x1, x1, x0
    sub x2, x2, x0
    cbnz x2, 1b
2:  ret
_start:
    // mount sysfs (nothing is mounted under our own /init)
    adrp x0, sysfs_src
    add x0, x0, :lo12:sysfs_src
    adrp x1, sys_dir
    add x1, x1, :lo12:sys_dir
    mov x2, x0                  // fstype = "sysfs"
    mov x3, xzr
    mov x4, xzr
    mov x8, #SYS_MOUNT
    svc #0
    // build "/sys/block/sdc/sdcN/uevent" on stack, N=1..40
    sub sp, sp, #128
    mov x19, sp              // path buf
    adrp x0, sys_prefix
    add x0, x0, :lo12:sys_prefix
    mov x1, x19
    bl strcpy                // x0=len
    mov x20, x0              // prefix len
    mov w21, #1              // N
scan_next:
    // append decimal N
    mov x0, x19
    add x0, x0, x20
    mov w1, w21
    bl append_dec            // returns len
    // append suffix
    mov x2, x19
    add x2, x2, x20
    add x2, x2, x0
    adrp x0, suffix
    add x0, x0, :lo12:suffix
    mov x1, x2
    bl strcpy
    // open path O_RDONLY
    movn x0, #99
    mov x1, x19
    mov x2, xzr
    mov x3, xzr
    mov x8, #SYS_OPENAT
    svc #0
    cmp x0, #0
    b.lt next_n
    mov x4, x0
    // read uevent into stack+64
    add x1, sp, #64
    mov x2, #60
    bl read_all
    mov x0, x4
    mov x8, #SYS_CLOSE
    svc #0
    // memmem for "PARTNAME=expdb"
    add x0, sp, #64
    bl has_expdb
    cbnz x0, found
next_n:
    add w21, w21, #1
    cmp w21, #40
    b.lt scan_next
    b reboot                 // not found: just reboot
found:
    // mknod /xexpdb block sdcN major/minor: need dev numbers!
    // Simpler: expdb major:minor from /proc/partitions? use uevent MAJOR/MINOR lines!
    // (uevent contains MAJOR=259 MINOR=x) - parse them here: reuse scan.
    // For brevity: mknod needs dev_t; parse MAJOR= and MINOR= from buffer.
    add x0, sp, #64
    bl parse_majmin          // returns dev in x0 (makedev)
    adrp x1, devnode
    add x1, x1, :lo12:devnode
    mov x2, #0x6000          // S_IFBLK
    // x0 already dev? mknod(path, mode|S_IFBLK, dev): x0=path,x1=mode,x2=dev
    mov x3, x0
    mov x0, x1
    mov x1, #0x6000
    mov x8, #SYS_MKNOD
    svc #0
    // open /xexpdb O_WRONLY
    movn x0, #99
    adrp x1, devnode
    add x1, x1, :lo12:devnode
    mov x2, #1
    mov x3, xzr
    mov x8, #SYS_OPENAT
    svc #0
    cmp x0, #0
    b.lt reboot
    mov x4, x0
    adrp x1, marker
    add x1, x1, :lo12:marker
    mov x2, #19
    mov x0, x4
    mov x8, #SYS_WRITE
    svc #0
reboot:
    // reboot INTO BOOTLOADER (not a plain restart: slot B has no system and
    // would loop back into this image; fastboot is the safe landing zone).
    movz x0, #0xdead
    movk x0, #0xfee1, lsl #16   // LINUX_REBOOT_MAGIC1
    movz x1, #0x1969
    movk x1, #0x2812, lsl #16   // LINUX_REBOOT_MAGIC2
    movz x2, #0xc101
    movk x2, #0xa1b2, lsl #16   // LINUX_REBOOT_CMD_RESTART2
    adrp x3, rb_reason
    add x3, x3, :lo12:rb_reason // "bootloader"
    mov x8, #SYS_REBOOT
    svc #0
hang: b hang
/* strcpy: x0=src,x1=dst -> x0=len (excl NUL, NUL copied) */
strcpy:
    mov x2, xzr
1:  ldrb w3, [x0, x2]
    strb w3, [x1, x2]
    cbz w3, 2f
    add x2, x2, #1
    b 1b
2:  mov x0, x2
    ret
/* append_dec: x0=dst, w1=num(1..99) -> x0=len. Clobbers x0-x4. */
append_dec:
    mov x2, x0              // start
    cmp w1, #10
    b.lt 1f
    // tens
    mov w3, w1
    mov w4, #0
10: sub w3, w3, #10
    add w4, w4, #1
    cmp w3, #10
    b.ge 10b
    add w4, w4, #'0'
    strb w4, [x0], #1
    mov w1, w3
1:  add w1, w1, #'0'
    strb w1, [x0], #1
    sub x0, x0, x2
    ret
    ret
/* has_expdb: x0=buf -> 1 if contains PARTNAME=expdb */
has_expdb:
    adrp x1, want
    add x1, x1, :lo12:want
    mov x2, #14              // len("PARTNAME=expdb")
    mov x3, #60
1:  mov x4, xzr
2:  ldrb w5, [x0, x4]
    ldrb w6, [x1, x4]
    cmp w5, w6
    b.ne 3f
    add x4, x4, #1
    cmp x4, x2
    b.lt 2b
    mov x0, #1
    ret
3:  add x0, x0, #1
    subs x3, x3, #1
    b.ne 1b
    mov x0, xzr
    ret
/* parse_majmin: x0=uevent buf -> makedev(maj,min) in x0. Lines MAJOR=259 MINOR=x */
parse_majmin:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    mov x19, x0
    // find "MAJOR="
    bl find_major
    mov x20, x0              // maj
    mov x0, x19
    bl find_minor
    mov x21, x0              // min
    // makedev: ((maj&0xfff)<<8)|((min&0xff)<<... linux makedev: (maj<<8)|min ext...
    // simple (maj<4096,min<256): dev = (maj<<8)|min
    lsl x0, x20, #8
    orr x0, x0, x21
    ldp x29, x30, [sp], #16
    ret
find_major:
    adrp x1, needle_major
    add x1, x1, :lo12:needle_major
    mov x2, #6
    b find_value
find_minor:
    adrp x1, needle_minor
    add x1, x1, :lo12:needle_minor
    mov x2, #6
    // fallthrough
// find_value: x0=buf(48B), x1=needle, x2=nlen -> atoi after needle, else 0.
// Clobbers x0-x8 only.
find_value:
    mov x3, xzr             // index
fv_outer:
    cmp x3, #40
    b.ge fv_miss
    mov x4, xzr             // needle pos
fv_inner:
    add x5, x3, x4
    ldrb w6, [x0, x5]
    ldrb w7, [x1, x4]
    cmp w6, w7
    b.ne fv_next
    add x4, x4, #1
    cmp x4, x2
    b.lt fv_inner
    // matched: atoi at buf+index+nlen
    add x0, x0, x3
    add x0, x0, x2
    mov w1, wzr             // acc
fv_atoi:
    ldrb w2, [x0], #1
    sub w2, w2, #'0'
    cmp w2, #9
    b.hi fv_atoi_done
    mov w3, w1, lsl #3      // acc*10
    add w1, w3, w1, lsl #1
    add w1, w1, w2
    b fv_atoi
fv_atoi_done:
    mov w0, w1
    ret
fv_next:
    add x3, x3, #1
    b fv_outer
fv_miss:
    mov x0, xzr
    ret
