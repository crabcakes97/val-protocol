; candidate function around xref 0xffff000050f918dc to 'imei'
; estimated range 0xffff000050f9187c-0xffff000050f91908

   0xffff000050f9187c: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f91880: stp      x20, x19, [sp, #0x10]
   0xffff000050f91884: mov      x29, sp
   0xffff000050f91888: adrp     x8, #0xffff000051106000
   0xffff000050f9188c: mov      x20, x1
   0xffff000050f91890: mov      x19, x0
   0xffff000050f91894: ldrb     w8, [x8, #0x8b4]
   0xffff000050f91898: cmp      w8, #1
   0xffff000050f9189c: b.ne     #0xffff000050f918c4
   0xffff000050f918a0: cmp      w2, #0xf
   0xffff000050f918a4: b.eq     #0xffff000050f918b0
   0xffff000050f918a8: cmp      w2, #0x33
   0xffff000050f918ac: b.ne     #0xffff000050f918c4
   0xffff000050f918b0: ldr      w8, [x20]
   0xffff000050f918b4: cmp      w8, #0x10
   0xffff000050f918b8: b.hs     #0xffff000050f918d8
   0xffff000050f918bc: mov      w0, #0x55
   0xffff000050f918c0: b        #0xffff000050f91900
   0xffff000050f918c4: mov      x0, x19
   0xffff000050f918c8: mov      x1, x20
   0xffff000050f918cc: ldp      x20, x19, [sp, #0x10]
   0xffff000050f918d0: ldp      x29, x30, [sp], #0x20
   0xffff000050f918d4: b        #0xffff000050f9b6fc
   0xffff000050f918d8: adrp     x0, #0xffff000050fd0000
>> 0xffff000050f918dc: add      x0, x0, #0x68
   0xffff000050f918e0: bl       #0xffff000050f9b7e8
   0xffff000050f918e4: mov      w8, #0x10
   0xffff000050f918e8: adrp     x9, #0xffff000051106000
   0xffff000050f918ec: add      x9, x9, #0x8a2
   0xffff000050f918f0: mov      w0, #0xf
   0xffff000050f918f4: str      w8, [x20]
   0xffff000050f918f8: ldp      x9, x8, [x9]
   0xffff000050f918fc: stp      x9, x8, [x19]
   0xffff000050f91900: ldp      x20, x19, [sp, #0x10]
   0xffff000050f91904: ldp      x29, x30, [sp], #0x20
   0xffff000050f91908: ret      
