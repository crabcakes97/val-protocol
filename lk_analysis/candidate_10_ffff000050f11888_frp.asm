; candidate function around xref 0xffff000050f118a0 to 'frp'
; estimated range 0xffff000050f11888-0xffff000050f11930

   0xffff000050f11888: sub      sp, sp, #0xa0
   0xffff000050f1188c: stp      x29, x30, [sp, #0x80]
   0xffff000050f11890: add      x29, sp, #0x80
   0xffff000050f11894: stp      x20, x19, [sp, #0x90]
   0xffff000050f11898: mov      x19, x0
   0xffff000050f1189c: adrp     x0, #0xffff000050fd0000
>> 0xffff000050f118a0: add      x0, x0, #0x6cc
   0xffff000050f118a4: mov      x1, sp
   0xffff000050f118a8: mov      w2, #0x80
   0xffff000050f118ac: bl       #0xffff000050faf27c
   0xffff000050f118b0: tbnz     w0, #0x1f, #0xffff000050f118ec
   0xffff000050f118b4: ldr      w8, [sp, #0x20]
   0xffff000050f118b8: mov      w9, #0x9019
   0xffff000050f118bc: movk     w9, #0x7318, lsl #16
   0xffff000050f118c0: cmp      w8, w9
   0xffff000050f118c4: b.ne     #0xffff000050f118ec
   0xffff000050f118c8: ldr      w8, [sp, #0x24]
   0xffff000050f118cc: rev      w20, w8
   0xffff000050f118d0: bl       #0xffff000050f9ffc0
   0xffff000050f118d4: tbz      w0, #0, #0xffff000050f1190c
   0xffff000050f118d8: cmp      w20, #0xa
   0xffff000050f118dc: b.le     #0xffff000050f1190c
   0xffff000050f118e0: adrp     x1, #0xffff000050ffa000
   0xffff000050f118e4: add      x1, x1, #0x536
   0xffff000050f118e8: b        #0xffff000050f11914
   0xffff000050f118ec: adrp     x9, #0xffff000050fe1000
   0xffff000050f118f0: mov      w8, #0x7272
   0xffff000050f118f4: add      x9, x9, #0x3a7
   0xffff000050f118f8: movk     w8, #0x29, lsl #16
   0xffff000050f118fc: ldp      x9, x10, [x9]
   0xffff000050f11900: str      w8, [x19, #0x10]
   0xffff000050f11904: stp      x9, x10, [x19]
   0xffff000050f11908: b        #0xffff000050f11920
   0xffff000050f1190c: adrp     x1, #0xffff000050fe8000
   0xffff000050f11910: add      x1, x1, #0xfdf
   0xffff000050f11914: mov      x0, x19
   0xffff000050f11918: mov      w2, w20
   0xffff000050f1191c: bl       #0xffff000050f8c790
   0xffff000050f11920: ldp      x20, x19, [sp, #0x90]
   0xffff000050f11924: mov      w0, #1
   0xffff000050f11928: ldp      x29, x30, [sp, #0x80]
   0xffff000050f1192c: add      sp, sp, #0xa0
   0xffff000050f11930: ret      
