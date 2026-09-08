; candidate function around xref 0xffff000050f8b390 to 'Invalid partition table!'
; estimated range 0xffff000050f8b2a0-0xffff000050f8b3b0

   0xffff000050f8b2a0: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f8b2a4: stp      x20, x19, [sp, #0x10]
   0xffff000050f8b2a8: mov      x29, sp
   0xffff000050f8b2ac: mov      w19, w0
   0xffff000050f8b2b0: bl       #0xffff000050f8aaf4
   0xffff000050f8b2b4: mov      x20, x0
   0xffff000050f8b2b8: bl       #0xffff000050f24d58
   0xffff000050f8b2bc: cbz      x20, #0xffff000050f8b3a0
   0xffff000050f8b2c0: sub      w19, w19, w0
   0xffff000050f8b2c4: lsr      w8, w19, #0x18
   0xffff000050f8b2c8: cbnz     w8, #0xffff000050f8b3a0
   0xffff000050f8b2cc: bl       #0xffff000050f8aaf4
   0xffff000050f8b2d0: cbz      x0, #0xffff000050f8b3a0
   0xffff000050f8b2d4: bl       #0xffff000050f8aaf4
   0xffff000050f8b2d8: adrp     x8, #0xffff000051105000
   0xffff000050f8b2dc: ldr      w3, [x0, #0x74]
   0xffff000050f8b2e0: ldr      x8, [x8, #0xbc0]
   0xffff000050f8b2e4: cmp      w3, #0
   0xffff000050f8b2e8: csel     x9, x8, xzr, eq
   0xffff000050f8b2ec: cbnz     x9, #0xffff000050f8b2fc
   0xffff000050f8b2f0: mov      w8, #0x38
   0xffff000050f8b2f4: ldr      x8, [x8]
   0xffff000050f8b2f8: cbz      x8, #0xffff000050f8b388
   0xffff000050f8b2fc: ldr      x8, [x9, #0x38]
   0xffff000050f8b300: ldr      w4, [x8, #0x54]
   0xffff000050f8b304: and      w8, w19, #0xff
   0xffff000050f8b308: cmp      w4, w8
   0xffff000050f8b30c: b.ls     #0xffff000050f8b340
   0xffff000050f8b310: ldr      x9, [x9, #0x48]
   0xffff000050f8b314: cbz      x9, #0xffff000050f8b360
   0xffff000050f8b318: mov      x19, xzr
   0xffff000050f8b31c: b        #0xffff000050f8b328
   0xffff000050f8b320: ldur     x9, [x9, #0x1c]
   0xffff000050f8b324: cbz      x9, #0xffff000050f8b364
   0xffff000050f8b328: ldr      w10, [x9, #0x18]
   0xffff000050f8b32c: cmp      w10, w8
   0xffff000050f8b330: b.ne     #0xffff000050f8b320
   0xffff000050f8b334: ldr      x10, [x9]
   0xffff000050f8b338: add      x19, x19, x10, lsl #9
   0xffff000050f8b33c: b        #0xffff000050f8b320
   0xffff000050f8b340: adrp     x1, #0xffff000050fd4000
   0xffff000050f8b344: adrp     x2, #0xffff000050ffb000
   0xffff000050f8b348: add      x1, x1, #0x692
   0xffff000050f8b34c: add      x2, x2, #0x3b8
   0xffff000050f8b350: mov      w0, wzr
   0xffff000050f8b354: mov      w3, w8
   0xffff000050f8b358: bl       #0xffff000050f29978
   0xffff000050f8b35c: b        #0xffff000050f8b3a0
   0xffff000050f8b360: mov      x19, xzr
   0xffff000050f8b364: adrp     x1, #0xffff000050ff9000
   0xffff000050f8b368: adrp     x2, #0xffff000050ffb000
   0xffff000050f8b36c: add      x1, x1, #0xb09
   0xffff000050f8b370: add      x2, x2, #0x3b8
   0xffff000050f8b374: mov      w0, #2
   0xffff000050f8b378: mov      w4, w8
   0xffff000050f8b37c: mov      x5, x19
   0xffff000050f8b380: bl       #0xffff000050f29978
   0xffff000050f8b384: b        #0xffff000050f8b3a4
   0xffff000050f8b388: adrp     x1, #0xffff000050fd1000
   0xffff000050f8b38c: adrp     x2, #0xffff000050ffb000
>> 0xffff000050f8b390: add      x1, x1, #0x7f4
   0xffff000050f8b394: add      x2, x2, #0x3b8
   0xffff000050f8b398: mov      w0, wzr
   0xffff000050f8b39c: bl       #0xffff000050f29978
   0xffff000050f8b3a0: mov      x19, xzr
   0xffff000050f8b3a4: mov      x0, x19
   0xffff000050f8b3a8: ldp      x20, x19, [sp, #0x10]
   0xffff000050f8b3ac: ldp      x29, x30, [sp], #0x20
   0xffff000050f8b3b0: ret      
