; candidate function around xref 0xffff000050f9ed50 to "Check 'Allow OEM Unlock'"
; estimated range 0xffff000050f9ecbc-0xffff000050f9ee90

   0xffff000050f9ecbc: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9ecc0: str      x19, [sp, #0x10]
   0xffff000050f9ecc4: mov      x29, sp
   0xffff000050f9ecc8: adrp     x19, #0xffff000051106000
   0xffff000050f9eccc: mov      w9, #0x77ee
   0xffff000050f9ecd0: ldr      w8, [x19, #0xa14]
   0xffff000050f9ecd4: cmp      w8, w9
   0xffff000050f9ecd8: b.eq     #0xffff000050f9ecfc
   0xffff000050f9ecdc: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ece0: mov      w9, #0x88ff
   0xffff000050f9ece4: add      x0, x0, #0x53d
   0xffff000050f9ece8: cmp      w8, w9
   0xffff000050f9ecec: b.ne     #0xffff000050f9ed6c
   0xffff000050f9ecf0: adrp     x1, #0xffff000050ff3000
   0xffff000050f9ecf4: add      x1, x1, #0xa4e
   0xffff000050f9ecf8: b        #0xffff000050f9ed74
   0xffff000050f9ecfc: bl       #0xffff000050f9ffc0
   0xffff000050f9ed00: tbz      w0, #0, #0xffff000050f9ed80
   0xffff000050f9ed04: mov      w0, wzr
   0xffff000050f9ed08: bl       #0xffff000050f903ec
   0xffff000050f9ed0c: cmp      w0, #0xff
   0xffff000050f9ed10: b.eq     #0xffff000050f9ed80
   0xffff000050f9ed14: adrp     x8, #0xffff000051106000
   0xffff000050f9ed18: ldrb     w8, [x8, #0xa10]
   0xffff000050f9ed1c: tbnz     w8, #0, #0xffff000050f9ed80
   0xffff000050f9ed20: ldr      w8, [x19, #0xa14]
   0xffff000050f9ed24: mov      w9, #0x7070
   0xffff000050f9ed28: cmp      w8, w9
   0xffff000050f9ed2c: b.eq     #0xffff000050f9ed80
   0xffff000050f9ed30: adrp     x8, #0xffff000051106000
   0xffff000050f9ed34: mov      w9, #0x66cc
   0xffff000050f9ed38: ldr      w8, [x8, #0xa18]
   0xffff000050f9ed3c: cmp      w8, w9
   0xffff000050f9ed40: b.eq     #0xffff000050f9ed80
   0xffff000050f9ed44: adrp     x19, #0xffff000050fd9000
   0xffff000050f9ed48: adrp     x1, #0xffff000050ffb000
   0xffff000050f9ed4c: add      x19, x19, #0x53d
>> 0xffff000050f9ed50: add      x1, x1, #0x520
   0xffff000050f9ed54: mov      x0, x19
   0xffff000050f9ed58: bl       #0xffff000050f07c4c
   0xffff000050f9ed5c: adrp     x1, #0xffff000050fe6000
   0xffff000050f9ed60: mov      x0, x19
   0xffff000050f9ed64: add      x1, x1, #0xd23
   0xffff000050f9ed68: b        #0xffff000050f9ed74
   0xffff000050f9ed6c: adrp     x1, #0xffff000050fe6000
   0xffff000050f9ed70: add      x1, x1, #0xd14
   0xffff000050f9ed74: ldr      x19, [sp, #0x10]
   0xffff000050f9ed78: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ed7c: b        #0xffff000050f07c4c
   0xffff000050f9ed80: mov      w0, #1
   0xffff000050f9ed84: bl       #0xffff000050f9fd20
   0xffff000050f9ed88: mov      w0, wzr
   0xffff000050f9ed8c: bl       #0xffff000050f9fdbc
   0xffff000050f9ed90: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ed94: adrp     x1, #0xffff000050ffd000
   0xffff000050f9ed98: mov      w8, #0x88ff
   0xffff000050f9ed9c: add      x0, x0, #0x53d
   0xffff000050f9eda0: add      x1, x1, #0x1c2
   0xffff000050f9eda4: str      w8, [x19, #0xa14]
   0xffff000050f9eda8: bl       #0xffff000050f07c4c
   0xffff000050f9edac: adrp     x0, #0xffff000050fd4000
   0xffff000050f9edb0: adrp     x1, #0xffff000050ff8000
   0xffff000050f9edb4: add      x0, x0, #0xdba
   0xffff000050f9edb8: add      x1, x1, #0x773
   0xffff000050f9edbc: bl       #0xffff000050f07b68
   0xffff000050f9edc0: ldr      x19, [sp, #0x10]
   0xffff000050f9edc4: mov      w0, #1
   0xffff000050f9edc8: ldp      x29, x30, [sp], #0x20
   0xffff000050f9edcc: b        #0xffff000050f03174
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
   0xffff000050f9ee08: add      x1, x1, #0x61e
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
