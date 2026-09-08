; candidate function around xref 0xffff000050f9fcf4 to 'nvdata'
; estimated range 0xffff000050f9fcc0-0xffff000050f9fdb8

   0xffff000050f9fcc0: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9fcc4: str      x19, [sp, #0x10]
   0xffff000050f9fcc8: mov      x29, sp
   0xffff000050f9fccc: cbz      x0, #0xffff000050f9fcec
   0xffff000050f9fcd0: mov      x19, x0
   0xffff000050f9fcd4: bl       #0xffff000050fa3178
   0xffff000050f9fcd8: tst      w0, #0xff
   0xffff000050f9fcdc: b.eq     #0xffff000050f9fd04
   0xffff000050f9fce0: ldr      x19, [sp, #0x10]
   0xffff000050f9fce4: ldp      x29, x30, [sp], #0x20
   0xffff000050f9fce8: ret      
   0xffff000050f9fcec: ldr      x19, [sp, #0x10]
   0xffff000050f9fcf0: adrp     x1, #0xffff000050fed000
>> 0xffff000050f9fcf4: add      x1, x1, #0x63d
   0xffff000050f9fcf8: mov      w0, #-1
   0xffff000050f9fcfc: ldp      x29, x30, [sp], #0x20
   0xffff000050f9fd00: b        #0xffff000050f29978
   0xffff000050f9fd04: mov      x2, x19
   0xffff000050f9fd08: ldr      x19, [sp, #0x10]
   0xffff000050f9fd0c: adrp     x1, #0xffff000050fda000
   0xffff000050f9fd10: mov      w0, #-1
   0xffff000050f9fd14: add      x1, x1, #0x41d
   0xffff000050f9fd18: ldp      x29, x30, [sp], #0x20
   0xffff000050f9fd1c: b        #0xffff000050f29978
   0xffff000050f9fd20: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9fd24: stp      x28, x19, [sp, #0x10]
   0xffff000050f9fd28: mov      x29, sp
   0xffff000050f9fd2c: sub      sp, sp, #0x200
   0xffff000050f9fd30: cmp      w0, #3
   0xffff000050f9fd34: b.hi     #0xffff000050f9fd48
   0xffff000050f9fd38: adrp     x8, #0xffff00005101b000
   0xffff000050f9fd3c: add      x8, x8, #0x5a8
   0xffff000050f9fd40: ldr      x19, [x8, w0, sxtw #3]
   0xffff000050f9fd44: b        #0xffff000050f9fd50
   0xffff000050f9fd48: adrp     x19, #0xffff000050fd1000
   0xffff000050f9fd4c: add      x19, x19, #0xb0d
   0xffff000050f9fd50: mov      x0, sp
   0xffff000050f9fd54: mov      w1, wzr
   0xffff000050f9fd58: mov      w2, #0x200
   0xffff000050f9fd5c: bl       #0xffff000050f8e214
   0xffff000050f9fd60: adrp     x1, #0xffff000050ff0000
   0xffff000050f9fd64: mov      w0, #1
   0xffff000050f9fd68: add      x1, x1, #0x812
   0xffff000050f9fd6c: mov      x2, x19
   0xffff000050f9fd70: bl       #0xffff000050f29978
   0xffff000050f9fd74: mov      x0, x19
   0xffff000050f9fd78: mov      x1, xzr
   0xffff000050f9fd7c: mov      x2, xzr
   0xffff000050f9fd80: bl       #0xffff000050fa46bc
   0xffff000050f9fd84: cbz      w0, #0xffff000050f9fdac
   0xffff000050f9fd88: mov      x2, sp
   0xffff000050f9fd8c: mov      x0, x19
   0xffff000050f9fd90: mov      w1, #0x200
   0xffff000050f9fd94: bl       #0xffff000050fa3f0c
   0xffff000050f9fd98: cbz      w0, #0xffff000050f9fdac
   0xffff000050f9fd9c: adrp     x1, #0xffff000050fd6000
   0xffff000050f9fda0: mov      w0, #-1
   0xffff000050f9fda4: add      x1, x1, #0x19d
   0xffff000050f9fda8: bl       #0xffff000050f29978
   0xffff000050f9fdac: add      sp, sp, #0x200
   0xffff000050f9fdb0: ldp      x28, x19, [sp, #0x10]
   0xffff000050f9fdb4: ldp      x29, x30, [sp], #0x20
   0xffff000050f9fdb8: ret      
