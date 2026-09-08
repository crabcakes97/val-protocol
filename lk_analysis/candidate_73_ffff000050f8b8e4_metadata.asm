; candidate function around xref 0xffff000050f8b954 to 'metadata'
; estimated range 0xffff000050f8b8e4-0xffff000050f8b974

   0xffff000050f8b8e4: stp      x29, x30, [sp, #-0x40]!
   0xffff000050f8b8e8: str      x23, [sp, #0x10]
   0xffff000050f8b8ec: mov      x29, sp
   0xffff000050f8b8f0: stp      x22, x21, [sp, #0x20]
   0xffff000050f8b8f4: stp      x20, x19, [sp, #0x30]
   0xffff000050f8b8f8: cmp      w2, #0x80
   0xffff000050f8b8fc: b.lo     #0xffff000050f8b944
   0xffff000050f8b900: mov      w23, w2
   0xffff000050f8b904: mov      x22, x0
   0xffff000050f8b908: mov      x0, x23
   0xffff000050f8b90c: mov      w20, w2
   0xffff000050f8b910: mov      x21, x1
   0xffff000050f8b914: bl       #0xffff000050f8bed8
   0xffff000050f8b918: mov      x19, x0
   0xffff000050f8b91c: cbz      x0, #0xffff000050f8b94c
   0xffff000050f8b920: mov      x0, x22
   0xffff000050f8b924: mov      x1, x19
   0xffff000050f8b928: mov      x2, x21
   0xffff000050f8b92c: mov      x3, x23
   0xffff000050f8b930: bl       #0xffff000050f89638
   0xffff000050f8b934: cmp      w0, w20
   0xffff000050f8b938: b.eq     #0xffff000050f8b960
   0xffff000050f8b93c: mov      x0, x19
   0xffff000050f8b940: bl       #0xffff000050f8c008
   0xffff000050f8b944: mov      x19, xzr
   0xffff000050f8b948: b        #0xffff000050f8b960
   0xffff000050f8b94c: adrp     x1, #0xffff000050fdd000
   0xffff000050f8b950: adrp     x2, #0xffff000050fe3000
>> 0xffff000050f8b954: add      x1, x1, #0x516
   0xffff000050f8b958: add      x2, x2, #0xca4
   0xffff000050f8b95c: bl       #0xffff000050f29978
   0xffff000050f8b960: mov      x0, x19
   0xffff000050f8b964: ldr      x23, [sp, #0x10]
   0xffff000050f8b968: ldp      x20, x19, [sp, #0x30]
   0xffff000050f8b96c: ldp      x22, x21, [sp, #0x20]
   0xffff000050f8b970: ldp      x29, x30, [sp], #0x40
   0xffff000050f8b974: ret      
