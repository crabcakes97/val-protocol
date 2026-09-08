; candidate function around xref 0xffff000050f8b504 to 'metadata'
; estimated range 0xffff000050f8b424-0xffff000050f8b52c

   0xffff000050f8b424: sub      sp, sp, #0x140
   0xffff000050f8b428: stp      x29, x30, [sp, #0x100]
   0xffff000050f8b42c: add      x29, sp, #0x100
   0xffff000050f8b430: str      x28, [sp, #0x110]
   0xffff000050f8b434: stp      x22, x21, [sp, #0x120]
   0xffff000050f8b438: stp      x20, x19, [sp, #0x130]
   0xffff000050f8b43c: cbz      x1, #0xffff000050f8b510
   0xffff000050f8b440: mov      x21, x1
   0xffff000050f8b444: mov      x19, x0
   0xffff000050f8b448: bl       #0xffff000050f3be08
   0xffff000050f8b44c: mov      w20, w0
   0xffff000050f8b450: tbnz     w0, #0x1f, #0xffff000050f8b4f4
   0xffff000050f8b454: ldr      w8, [x21, #0x2c]
   0xffff000050f8b458: cmp      w20, w8
   0xffff000050f8b45c: b.hs     #0xffff000050f8b4f4
   0xffff000050f8b460: ldr      w8, [x21, #0x28]
   0xffff000050f8b464: mov      w9, #0x3000
   0xffff000050f8b468: mov      x1, sp
   0xffff000050f8b46c: mov      x0, x19
   0xffff000050f8b470: mov      w3, #0x100
   0xffff000050f8b474: madd     w22, w8, w20, w9
   0xffff000050f8b478: mov      w8, #0x100
   0xffff000050f8b47c: mov      x2, x22
   0xffff000050f8b480: str      w8, [x29, #0x1c]
   0xffff000050f8b484: bl       #0xffff000050f89638
   0xffff000050f8b488: cmp      w0, #0x100
   0xffff000050f8b48c: b.ne     #0xffff000050f8b510
   0xffff000050f8b490: mov      x1, sp
   0xffff000050f8b494: add      x2, x29, #0x1c
   0xffff000050f8b498: mov      x0, x21
   0xffff000050f8b49c: bl       #0xffff000050fcacbc
   0xffff000050f8b4a0: cmp      w0, #1
   0xffff000050f8b4a4: b.ne     #0xffff000050f8b530
   0xffff000050f8b4a8: ldr      w8, [x29, #0x1c]
   0xffff000050f8b4ac: ldr      w9, [sp, #0x2c]
   0xffff000050f8b4b0: add      w21, w9, w8
   0xffff000050f8b4b4: cmp      w21, #0x80
   0xffff000050f8b4b8: b.lo     #0xffff000050f8b510
   0xffff000050f8b4bc: mov      x0, x21
   0xffff000050f8b4c0: bl       #0xffff000050f8bed8
   0xffff000050f8b4c4: mov      x20, x0
   0xffff000050f8b4c8: cbz      x0, #0xffff000050f8b5c8
   0xffff000050f8b4cc: mov      x0, x19
   0xffff000050f8b4d0: mov      x1, x20
   0xffff000050f8b4d4: mov      x2, x22
   0xffff000050f8b4d8: mov      x3, x21
   0xffff000050f8b4dc: bl       #0xffff000050f89638
   0xffff000050f8b4e0: cmp      w21, w0
   0xffff000050f8b4e4: b.eq     #0xffff000050f8b514
   0xffff000050f8b4e8: mov      x0, x20
   0xffff000050f8b4ec: bl       #0xffff000050f8c008
   0xffff000050f8b4f0: b        #0xffff000050f8b510
   0xffff000050f8b4f4: adrp     x1, #0xffff000050fed000
   0xffff000050f8b4f8: add      x1, x1, #0x4dd
   0xffff000050f8b4fc: adrp     x2, #0xffff000050fea000
   0xffff000050f8b500: mov      w0, wzr
>> 0xffff000050f8b504: add      x2, x2, #0x7b
   0xffff000050f8b508: mov      w3, w20
   0xffff000050f8b50c: bl       #0xffff000050f29978
   0xffff000050f8b510: mov      x20, xzr
   0xffff000050f8b514: mov      x0, x20
   0xffff000050f8b518: ldr      x28, [sp, #0x110]
   0xffff000050f8b51c: ldp      x20, x19, [sp, #0x130]
   0xffff000050f8b520: ldp      x22, x21, [sp, #0x120]
   0xffff000050f8b524: ldp      x29, x30, [sp, #0x100]
   0xffff000050f8b528: add      sp, sp, #0x140
   0xffff000050f8b52c: ret      
