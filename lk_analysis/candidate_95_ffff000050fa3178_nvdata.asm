; candidate function around xref 0xffff000050fa3210 to 'nvdata'
; estimated range 0xffff000050fa3178-0xffff000050fa3248

   0xffff000050fa3178: sub      sp, sp, #0xb0
   0xffff000050fa317c: stp      x29, x30, [sp, #0x90]
   0xffff000050fa3180: add      x29, sp, #0x90
   0xffff000050fa3184: stp      x20, x19, [sp, #0xa0]
   0xffff000050fa3188: mov      x20, sp
   0xffff000050fa318c: stp      xzr, xzr, [sp, #0x70]
   0xffff000050fa3190: stp      xzr, xzr, [sp, #0x60]
   0xffff000050fa3194: stp      xzr, xzr, [sp, #0x50]
   0xffff000050fa3198: stur     wzr, [x20, #0x87]
   0xffff000050fa319c: str      xzr, [sp, #0x80]
   0xffff000050fa31a0: stp      xzr, xzr, [sp, #0x40]
   0xffff000050fa31a4: stp      xzr, xzr, [sp, #0x30]
   0xffff000050fa31a8: stp      xzr, xzr, [sp, #0x20]
   0xffff000050fa31ac: stp      xzr, xzr, [sp, #0x10]
   0xffff000050fa31b0: stp      xzr, xzr, [sp]
   0xffff000050fa31b4: cbz      x0, #0xffff000050fa3200
   0xffff000050fa31b8: mov      x1, sp
   0xffff000050fa31bc: mov      x2, xzr
   0xffff000050fa31c0: mov      w3, #0x8b
   0xffff000050fa31c4: mov      x19, x0
   0xffff000050fa31c8: bl       #0xffff000050faf574
   0xffff000050fa31cc: tbnz     x0, #0x3f, #0xffff000050fa320c
   0xffff000050fa31d0: mov      x1, sp
   0xffff000050fa31d4: mov      x0, x19
   0xffff000050fa31d8: mov      x2, xzr
   0xffff000050fa31dc: mov      w3, #0x8b
   0xffff000050fa31e0: stur     xzr, [x20, #0x83]
   0xffff000050fa31e4: stur     xzr, [sp, #0x7b]
   0xffff000050fa31e8: stur     xzr, [sp, #0x73]
   0xffff000050fa31ec: stur     xzr, [sp, #0x6b]
   0xffff000050fa31f0: bl       #0xffff000050faf6f4
   0xffff000050fa31f4: tbnz     x0, #0x3f, #0xffff000050fa3228
   0xffff000050fa31f8: mov      w0, #1
   0xffff000050fa31fc: b        #0xffff000050fa323c
   0xffff000050fa3200: adrp     x1, #0xffff000050fdd000
   0xffff000050fa3204: add      x1, x1, #0x74f
   0xffff000050fa3208: b        #0xffff000050fa3214
   0xffff000050fa320c: adrp     x1, #0xffff000050ff2000
>> 0xffff000050fa3210: add      x1, x1, #0x1a5
   0xffff000050fa3214: adrp     x2, #0xffff000050feb000
   0xffff000050fa3218: mov      w0, #-1
   0xffff000050fa321c: add      x2, x2, #0xe8c
   0xffff000050fa3220: bl       #0xffff000050f29978
   0xffff000050fa3224: b        #0xffff000050fa3238
   0xffff000050fa3228: adrp     x1, #0xffff000051000000
   0xffff000050fa322c: mov      w0, #1
   0xffff000050fa3230: add      x1, x1, #0x637
   0xffff000050fa3234: bl       #0xffff000050f29978
   0xffff000050fa3238: mov      w0, wzr
   0xffff000050fa323c: ldp      x20, x19, [sp, #0xa0]
   0xffff000050fa3240: ldp      x29, x30, [sp, #0x90]
   0xffff000050fa3244: add      sp, sp, #0xb0
   0xffff000050fa3248: ret      
