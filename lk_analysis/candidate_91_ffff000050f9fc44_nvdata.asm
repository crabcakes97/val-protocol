; candidate function around xref 0xffff000050f9fc74 to 'nvdata'
; estimated range 0xffff000050f9fc44-0xffff000050f9fcbc

   0xffff000050f9fc44: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9fc48: str      x19, [sp, #0x10]
   0xffff000050f9fc4c: mov      x29, sp
   0xffff000050f9fc50: cbz      x0, #0xffff000050f9fc94
   0xffff000050f9fc54: mov      x19, x0
   0xffff000050f9fc58: adrp     x0, #0xffff000050fd3000
   0xffff000050f9fc5c: add      x0, x0, #0x134
   0xffff000050f9fc60: bl       #0xffff000050fa3078
   0xffff000050f9fc64: tst      w0, #0xff
   0xffff000050f9fc68: b.eq     #0xffff000050f9fca0
   0xffff000050f9fc6c: adrp     x1, #0xffff000050fdf000
   0xffff000050f9fc70: mov      w0, #-1
>> 0xffff000050f9fc74: add      x1, x1, #0x37d
   0xffff000050f9fc78: bl       #0xffff000050f29978
   0xffff000050f9fc7c: mov      w8, #0x6573
   0xffff000050f9fc80: mov      w0, #1
   0xffff000050f9fc84: movk     w8, #0x3163, lsl #16
   0xffff000050f9fc88: strb     wzr, [x19, #4]
   0xffff000050f9fc8c: str      w8, [x19]
   0xffff000050f9fc90: b        #0xffff000050f9fcb4
   0xffff000050f9fc94: adrp     x1, #0xffff000050fd0000
   0xffff000050f9fc98: add      x1, x1, #0x155
   0xffff000050f9fc9c: b        #0xffff000050f9fca8
   0xffff000050f9fca0: adrp     x1, #0xffff000050fe3000
   0xffff000050f9fca4: add      x1, x1, #0xf56
   0xffff000050f9fca8: mov      w0, #-1
   0xffff000050f9fcac: bl       #0xffff000050f29978
   0xffff000050f9fcb0: mov      w0, wzr
   0xffff000050f9fcb4: ldr      x19, [sp, #0x10]
   0xffff000050f9fcb8: ldp      x29, x30, [sp], #0x20
   0xffff000050f9fcbc: ret      
