; candidate function around xref 0xffff000050f73878 to 'serialno'
; estimated range 0xffff000050f73864-0xffff000050f738b0

   0xffff000050f73864: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f73868: str      x19, [sp, #0x10]
   0xffff000050f7386c: mov      x29, sp
   0xffff000050f73870: mov      x19, x0
   0xffff000050f73874: adrp     x1, #0xffff000050ffd000
>> 0xffff000050f73878: add      x1, x1, #0x758
   0xffff000050f7387c: mov      w0, wzr
   0xffff000050f73880: mov      x2, x19
   0xffff000050f73884: mov      w3, #0x11
   0xffff000050f73888: bl       #0xffff000050f38024
   0xffff000050f7388c: cbnz     x0, #0xffff000050f738a8
   0xffff000050f73890: adrp     x1, #0xffff000050fdb000
   0xffff000050f73894: mov      x2, x19
   0xffff000050f73898: add      x1, x1, #0x165
   0xffff000050f7389c: mov      w3, #0x11
   0xffff000050f738a0: bl       #0xffff000050f38024
   0xffff000050f738a4: cbz      x0, #0xffff000050f738b4
   0xffff000050f738a8: ldr      x19, [sp, #0x10]
   0xffff000050f738ac: ldp      x29, x30, [sp], #0x20
   0xffff000050f738b0: ret      
