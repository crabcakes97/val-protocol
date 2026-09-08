; flow candidate 0xffff000050f9ffc0-0xffff000050fa00d0
; score: 34
; matched targets: frp, mot_sec: Couldn't read from %llx, mot_sec: FRP partition is invalid, lock anyway!, mot_sec: Invalid partition table!
; calls: 0xffff000050f25598, 0xffff000050f256e8, 0xffff000050f24d58, 0xffff000050f29978, 0xffff000050fa216c

   0xffff000050f9ffc0: sub      sp, sp, #0x130
   0xffff000050f9ffc4: stp      x29, x30, [sp, #0x100]
   0xffff000050f9ffc8: add      x29, sp, #0x100
   0xffff000050f9ffcc: str      x28, [sp, #0x110]
   0xffff000050f9ffd0: stp      x20, x19, [sp, #0x120]
   0xffff000050f9ffd4: adrp     x0, #0xffff000050fd0000
   0xffff000050f9ffd8: stp      xzr, xzr, [sp, #0xf0]
; XREF string 0xffff000050fd06cc: 'frp' -> 'frp'
>> 0xffff000050f9ffdc: add      x0, x0, #0x6cc
   0xffff000050f9ffe0: stp      xzr, xzr, [sp, #0xe0]
   0xffff000050f9ffe4: stp      xzr, xzr, [sp, #0xd0]
   0xffff000050f9ffe8: stp      xzr, xzr, [sp, #0xc0]
   0xffff000050f9ffec: stp      xzr, xzr, [sp, #0xb0]
   0xffff000050f9fff0: stp      xzr, xzr, [sp, #0xa0]
   0xffff000050f9fff4: stp      xzr, xzr, [sp, #0x90]
   0xffff000050f9fff8: stp      xzr, xzr, [sp, #0x80]
   0xffff000050f9fffc: stp      xzr, xzr, [sp, #0x70]
   0xffff000050fa0000: stp      xzr, xzr, [sp, #0x60]
   0xffff000050fa0004: stp      xzr, xzr, [sp, #0x50]
   0xffff000050fa0008: stp      xzr, xzr, [sp, #0x40]
   0xffff000050fa000c: stp      xzr, xzr, [sp, #0x30]
   0xffff000050fa0010: stp      xzr, xzr, [sp, #0x20]
   0xffff000050fa0014: stp      xzr, xzr, [sp, #0x10]
   0xffff000050fa0018: stp      xzr, xzr, [sp]
   0xffff000050fa001c: bl       #0xffff000050f25598  ; call 0xffff000050f25598
   0xffff000050fa0020: mov      w20, w0
   0xffff000050fa0024: bl       #0xffff000050f256e8  ; call 0xffff000050f256e8
   0xffff000050fa0028: mov      x19, x0
   0xffff000050fa002c: cmn      w20, #1
   0xffff000050fa0030: b.ne     #0xffff000050fa0058
   0xffff000050fa0034: bl       #0xffff000050f24d58  ; call 0xffff000050f24d58
   0xffff000050fa0038: cmp      w0, #0xb
   0xffff000050fa003c: b.lo     #0xffff000050fa0058
   0xffff000050fa0040: adrp     x1, #0xffff000050fda000
   0xffff000050fa0044: mov      w0, #-1
; XREF string 0xffff000050fda456: 'mot_sec: Invalid partition table!' -> 'mot_sec: Invalid partition table!\n'
>> 0xffff000050fa0048: add      x1, x1, #0x456
   0xffff000050fa004c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050fa0050: mov      w0, wzr
   0xffff000050fa0054: b        #0xffff000050fa00c0

loc_ffff000050fa0058:
   0xffff000050fa0058: cbz      x19, #0xffff000050fa009c
   0xffff000050fa005c: sub      x19, x19, #0x100
   0xffff000050fa0060: adrp     x0, #0xffff000050fd0000
; XREF string 0xffff000050fd06cc: 'frp' -> 'frp'
>> 0xffff000050fa0064: add      x0, x0, #0x6cc
   0xffff000050fa0068: mov      x2, sp
   0xffff000050fa006c: mov      x1, x19
   0xffff000050fa0070: mov      w3, #0x100
   0xffff000050fa0074: bl       #0xffff000050fa216c  ; call 0xffff000050fa216c
   0xffff000050fa0078: cmp      w0, #0x10
   0xffff000050fa007c: b.ne     #0xffff000050fa00b4
   0xffff000050fa0080: adrp     x1, #0xffff000050fe5000
   0xffff000050fa0084: mov      w0, #-1
; XREF string 0xffff000050fe570e: "mot_sec: Couldn't read from %llx" -> "mot_sec: Couldn't read from %llx\n"
>> 0xffff000050fa0088: add      x1, x1, #0x70e
   0xffff000050fa008c: mov      x2, x19
   0xffff000050fa0090: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050fa0094: mov      w0, #1
   0xffff000050fa0098: b        #0xffff000050fa00c0

loc_ffff000050fa009c:
   0xffff000050fa009c: adrp     x1, #0xffff000050fea000
   0xffff000050fa00a0: mov      w0, #-1
; XREF string 0xffff000050fea29b: 'mot_sec: FRP partition is invalid, lock anyway!' -> 'mot_sec: FRP partition is invalid, lock anyway!\n'
>> 0xffff000050fa00a4: add      x1, x1, #0x29b
   0xffff000050fa00a8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050fa00ac: mov      w0, #1
   0xffff000050fa00b0: b        #0xffff000050fa00c0

loc_ffff000050fa00b4:
   0xffff000050fa00b4: ldrb     w8, [sp, #0xff]
   0xffff000050fa00b8: cmp      w8, #0
   0xffff000050fa00bc: cset     w0, eq

loc_ffff000050fa00c0:
   0xffff000050fa00c0: ldp      x20, x19, [sp, #0x120]
   0xffff000050fa00c4: ldp      x29, x30, [sp, #0x100]
   0xffff000050fa00c8: ldr      x28, [sp, #0x110]
   0xffff000050fa00cc: add      sp, sp, #0x130
   0xffff000050fa00d0: ret      
