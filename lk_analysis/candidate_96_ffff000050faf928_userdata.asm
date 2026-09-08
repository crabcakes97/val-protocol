; candidate function around xref 0xffff000050faf954 to 'userdata'
; estimated range 0xffff000050faf928-0xffff000050fafa00

   0xffff000050faf928: stp      x29, x30, [sp, #-0x30]!
   0xffff000050faf92c: str      x21, [sp, #0x10]
   0xffff000050faf930: mov      x29, sp
   0xffff000050faf934: stp      x20, x19, [sp, #0x20]
   0xffff000050faf938: mov      x20, x0
   0xffff000050faf93c: mov      w0, #-0x16
   0xffff000050faf940: cbz      x20, #0xffff000050faf9f4
   0xffff000050faf944: mov      x19, x1
   0xffff000050faf948: cbz      x1, #0xffff000050faf9f4
   0xffff000050faf94c: adrp     x1, #0xffff000050fd9000
   0xffff000050faf950: mov      x0, x20
>> 0xffff000050faf954: add      x1, x1, #0x574
   0xffff000050faf958: str      wzr, [x29, #0x1c]
   0xffff000050faf95c: bl       #0xffff000050f8e3ec
   0xffff000050faf960: cbz      w0, #0xffff000050faf9c4
   0xffff000050faf964: adrp     x1, #0xffff000050ff7000
   0xffff000050faf968: mov      x0, x20
   0xffff000050faf96c: add      x1, x1, #0x689
   0xffff000050faf970: bl       #0xffff000050f8e3ec
   0xffff000050faf974: cbz      w0, #0xffff000050faf9c4
   0xffff000050faf978: mov      x0, x20
   0xffff000050faf97c: bl       #0xffff000050f895ac
   0xffff000050faf980: cbz      x0, #0xffff000050faf9cc
   0xffff000050faf984: add      x1, x29, #0x1c
   0xffff000050faf988: mov      w2, #0x438
   0xffff000050faf98c: mov      w3, #2
   0xffff000050faf990: mov      x21, x0
   0xffff000050faf994: bl       #0xffff000050f89638
   0xffff000050faf998: cmp      x0, #2
   0xffff000050faf99c: b.ne     #0xffff000050faf9e8
   0xffff000050faf9a0: ldr      w8, [x29, #0x1c]
   0xffff000050faf9a4: mov      w9, #0xef53
   0xffff000050faf9a8: mov      x0, x21
   0xffff000050faf9ac: cmp      w8, w9
   0xffff000050faf9b0: cset     w8, eq
   0xffff000050faf9b4: str      w8, [x19]
   0xffff000050faf9b8: bl       #0xffff000050f89538
   0xffff000050faf9bc: mov      w0, wzr
   0xffff000050faf9c0: b        #0xffff000050faf9f4
   0xffff000050faf9c4: str      wzr, [x19]
   0xffff000050faf9c8: b        #0xffff000050faf9f4
   0xffff000050faf9cc: adrp     x1, #0xffff000050ff4000
   0xffff000050faf9d0: mov      w0, #-1
   0xffff000050faf9d4: add      x1, x1, #0x438
   0xffff000050faf9d8: mov      x2, x20
   0xffff000050faf9dc: bl       #0xffff000050f29978
   0xffff000050faf9e0: mov      w0, #-0x13
   0xffff000050faf9e4: b        #0xffff000050faf9f4
   0xffff000050faf9e8: mov      x0, x21
   0xffff000050faf9ec: bl       #0xffff000050f89538
   0xffff000050faf9f0: mov      w0, #-5
   0xffff000050faf9f4: ldp      x20, x19, [sp, #0x20]
   0xffff000050faf9f8: ldr      x21, [sp, #0x10]
   0xffff000050faf9fc: ldp      x29, x30, [sp], #0x30
   0xffff000050fafa00: ret      
