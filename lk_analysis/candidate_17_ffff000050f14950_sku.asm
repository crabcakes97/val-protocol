; candidate function around xref 0xffff000050f1496c to 'sku'
; estimated range 0xffff000050f14950-0xffff000050f149a4

   0xffff000050f14950: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f14954: str      x19, [sp, #0x10]
   0xffff000050f14958: mov      x29, sp
   0xffff000050f1495c: mov      x19, x0
   0xffff000050f14960: sxtw     x3, w1
   0xffff000050f14964: adrp     x1, #0xffff000050fd3000
   0xffff000050f14968: strb     wzr, [x0]
>> 0xffff000050f1496c: add      x1, x1, #0x764
   0xffff000050f14970: mov      w0, wzr
   0xffff000050f14974: mov      x2, x19
   0xffff000050f14978: bl       #0xffff000050f38024
   0xffff000050f1497c: cbz      x0, #0xffff000050f1499c
   0xffff000050f14980: mov      x2, x19
   0xffff000050f14984: ldr      x19, [sp, #0x10]
   0xffff000050f14988: adrp     x1, #0xffff000050fe9000
   0xffff000050f1498c: mov      w0, #1
   0xffff000050f14990: add      x1, x1, #0xa2
   0xffff000050f14994: ldp      x29, x30, [sp], #0x20
   0xffff000050f14998: b        #0xffff000050f29978
   0xffff000050f1499c: ldr      x19, [sp, #0x10]
   0xffff000050f149a0: ldp      x29, x30, [sp], #0x20
   0xffff000050f149a4: ret      
