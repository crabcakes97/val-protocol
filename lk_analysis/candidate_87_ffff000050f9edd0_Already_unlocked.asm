; candidate function around xref 0xffff000050f9ee08 to 'Already unlocked'
; estimated range 0xffff000050f9edd0-0xffff000050f9ee90

   0xffff000050f9edd0: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9edd4: str      x19, [sp, #0x10]
   0xffff000050f9edd8: mov      x29, sp
   0xffff000050f9eddc: adrp     x19, #0xffff000051106000
   0xffff000050f9ede0: mov      w9, #0x88ff
   0xffff000050f9ede4: ldr      w8, [x19, #0xa14]
   0xffff000050f9ede8: cmp      w8, w9
   0xffff000050f9edec: b.eq     #0xffff000050f9ee10
   0xffff000050f9edf0: adrp     x0, #0xffff000050fd9000
   0xffff000050f9edf4: mov      w9, #0x77ee
   0xffff000050f9edf8: add      x0, x0, #0x53d
   0xffff000050f9edfc: cmp      w8, w9
   0xffff000050f9ee00: b.ne     #0xffff000050f9ee74
   0xffff000050f9ee04: adrp     x1, #0xffff000050fed000
>> 0xffff000050f9ee08: add      x1, x1, #0x61e
   0xffff000050f9ee0c: b        #0xffff000050f9ee7c
   0xffff000050f9ee10: bl       #0xffff000050f21804
   0xffff000050f9ee14: tbz      w0, #0, #0xffff000050f9ee88
   0xffff000050f9ee18: bl       #0xffff000050f9ffc0
   0xffff000050f9ee1c: tbz      w0, #0, #0xffff000050f9ee94
   0xffff000050f9ee20: mov      w0, wzr
   0xffff000050f9ee24: bl       #0xffff000050f903ec
   0xffff000050f9ee28: cmp      w0, #0xff
   0xffff000050f9ee2c: b.eq     #0xffff000050f9ee94
   0xffff000050f9ee30: adrp     x8, #0xffff000051106000
   0xffff000050f9ee34: ldrb     w8, [x8, #0xa10]
   0xffff000050f9ee38: tbnz     w8, #0, #0xffff000050f9ee94
   0xffff000050f9ee3c: ldr      w8, [x19, #0xa14]
   0xffff000050f9ee40: mov      w9, #0x7070
   0xffff000050f9ee44: cmp      w8, w9
   0xffff000050f9ee48: b.eq     #0xffff000050f9ee94
   0xffff000050f9ee4c: adrp     x8, #0xffff000051106000
   0xffff000050f9ee50: mov      w9, #0x66cc
   0xffff000050f9ee54: ldr      w8, [x8, #0xa18]
   0xffff000050f9ee58: cmp      w8, w9
   0xffff000050f9ee5c: b.eq     #0xffff000050f9ee94
   0xffff000050f9ee60: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ee64: adrp     x1, #0xffff000050ffb000
   0xffff000050f9ee68: add      x0, x0, #0x53d
   0xffff000050f9ee6c: add      x1, x1, #0x520
   0xffff000050f9ee70: b        #0xffff000050f9ee7c
   0xffff000050f9ee74: adrp     x1, #0xffff000050fe6000
   0xffff000050f9ee78: add      x1, x1, #0xd14
   0xffff000050f9ee7c: ldr      x19, [sp, #0x10]
   0xffff000050f9ee80: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ee84: b        #0xffff000050f07c4c
   0xffff000050f9ee88: ldr      x19, [sp, #0x10]
   0xffff000050f9ee8c: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ee90: ret      
