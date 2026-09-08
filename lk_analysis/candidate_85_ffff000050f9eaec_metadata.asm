; candidate function around xref 0xffff000050f9ec68 to 'metadata'
; estimated range 0xffff000050f9eaec-0xffff000050f9ee90

   0xffff000050f9eaec: stp      x29, x30, [sp, #-0x10]!
   0xffff000050f9eaf0: mov      x29, sp
   0xffff000050f9eaf4: adrp     x8, #0xffff000051106000
   0xffff000050f9eaf8: mov      w9, #0x77ed
   0xffff000050f9eafc: ldr      w8, [x8, #0xa14]
   0xffff000050f9eb00: cmp      w8, w9
   0xffff000050f9eb04: b.gt     #0xffff000050f9eb30
   0xffff000050f9eb08: cbz      w8, #0xffff000050f9eb48
   0xffff000050f9eb0c: mov      w9, #0x7070
   0xffff000050f9eb10: cmp      w8, w9
   0xffff000050f9eb14: b.ne     #0xffff000050f9ec3c
   0xffff000050f9eb18: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eb1c: adrp     x1, #0xffff000050ff6000
   0xffff000050f9eb20: add      x0, x0, #0x53d
   0xffff000050f9eb24: add      x1, x1, #0xc8d
   0xffff000050f9eb28: ldp      x29, x30, [sp], #0x10
   0xffff000050f9eb2c: b        #0xffff000050f07c4c
   0xffff000050f9eb30: mov      w9, #0x77ee
   0xffff000050f9eb34: cmp      w8, w9
   0xffff000050f9eb38: b.eq     #0xffff000050f9eb60
   0xffff000050f9eb3c: mov      w9, #0x88ff
   0xffff000050f9eb40: cmp      w8, w9
   0xffff000050f9eb44: b.ne     #0xffff000050f9ec3c
   0xffff000050f9eb48: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eb4c: adrp     x1, #0xffff000050ffb000
   0xffff000050f9eb50: add      x0, x0, #0x53d
   0xffff000050f9eb54: add      x1, x1, #0x511
   0xffff000050f9eb58: ldp      x29, x30, [sp], #0x10
   0xffff000050f9eb5c: b        #0xffff000050f07c4c
   0xffff000050f9eb60: bl       #0xffff000050f21888
   0xffff000050f9eb64: tbz      w0, #0, #0xffff000050f9ec54
   0xffff000050f9eb68: adrp     x0, #0xffff000050ff7000
   0xffff000050f9eb6c: add      x0, x0, #0x689
   0xffff000050f9eb70: bl       #0xffff000050f25598
   0xffff000050f9eb74: cmn      w0, #1
   0xffff000050f9eb78: b.eq     #0xffff000050f9eb8c
   0xffff000050f9eb7c: adrp     x0, #0xffff000050ff7000
   0xffff000050f9eb80: add      x0, x0, #0x689
   0xffff000050f9eb84: bl       #0xffff000050faf874
   0xffff000050f9eb88: tbnz     x0, #0x3f, #0xffff000050f9ec5c
   0xffff000050f9eb8c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eb90: add      x0, x0, #0x574
   0xffff000050f9eb94: bl       #0xffff000050f25598
   0xffff000050f9eb98: cmn      w0, #1
   0xffff000050f9eb9c: b.eq     #0xffff000050f9ebb0
   0xffff000050f9eba0: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eba4: add      x0, x0, #0x574
   0xffff000050f9eba8: bl       #0xffff000050faf874
   0xffff000050f9ebac: tbnz     x0, #0x3f, #0xffff000050f9ec74
   0xffff000050f9ebb0: adrp     x0, #0xffff000050fe5000
   0xffff000050f9ebb4: add      x0, x0, #0xdd6
   0xffff000050f9ebb8: bl       #0xffff000050f25598
   0xffff000050f9ebbc: cmn      w0, #1
   0xffff000050f9ebc0: b.eq     #0xffff000050f9ebd4
   0xffff000050f9ebc4: adrp     x0, #0xffff000050fe5000
   0xffff000050f9ebc8: add      x0, x0, #0xdd6
   0xffff000050f9ebcc: bl       #0xffff000050faf874
   0xffff000050f9ebd0: tbnz     x0, #0x3f, #0xffff000050f9ec8c
   0xffff000050f9ebd4: adrp     x0, #0xffff000050fd7000
   0xffff000050f9ebd8: add      x0, x0, #0x899
   0xffff000050f9ebdc: bl       #0xffff000050f25598
   0xffff000050f9ebe0: cmn      w0, #1
   0xffff000050f9ebe4: b.eq     #0xffff000050f9ebf8
   0xffff000050f9ebe8: adrp     x0, #0xffff000050fd7000
   0xffff000050f9ebec: add      x0, x0, #0x899
   0xffff000050f9ebf0: bl       #0xffff000050faf874
   0xffff000050f9ebf4: tbnz     x0, #0x3f, #0xffff000050f9eca4
   0xffff000050f9ebf8: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ebfc: adrp     x1, #0xffff000050ff1000
   0xffff000050f9ec00: add      x0, x0, #0x53d
   0xffff000050f9ec04: add      x1, x1, #0xfc1
   0xffff000050f9ec08: bl       #0xffff000050f07c4c
   0xffff000050f9ec0c: mov      w0, #1
   0xffff000050f9ec10: bl       #0xffff000050f9fd20
   0xffff000050f9ec14: mov      w0, wzr
   0xffff000050f9ec18: bl       #0xffff000050f9fdbc
   0xffff000050f9ec1c: adrp     x0, #0xffff000050fd4000
   0xffff000050f9ec20: adrp     x1, #0xffff000050ff8000
   0xffff000050f9ec24: add      x0, x0, #0xdba
   0xffff000050f9ec28: add      x1, x1, #0x773
   0xffff000050f9ec2c: bl       #0xffff000050f07b68
   0xffff000050f9ec30: mov      w0, #1
   0xffff000050f9ec34: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec38: b        #0xffff000050f03174
   0xffff000050f9ec3c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ec40: adrp     x1, #0xffff000050ffe000
   0xffff000050f9ec44: add      x0, x0, #0x53d
   0xffff000050f9ec48: add      x1, x1, #0x9e7
   0xffff000050f9ec4c: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec50: b        #0xffff000050f07c4c
   0xffff000050f9ec54: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec58: ret      
   0xffff000050f9ec5c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ec60: adrp     x1, #0xffff000050fd6000
   0xffff000050f9ec64: add      x0, x0, #0x53d
>> 0xffff000050f9ec68: add      x1, x1, #0x166
   0xffff000050f9ec6c: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec70: b        #0xffff000050f07c4c
   0xffff000050f9ec74: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ec78: adrp     x1, #0xffff000050fda000
   0xffff000050f9ec7c: add      x0, x0, #0x53d
   0xffff000050f9ec80: add      x1, x1, #0x3e5
   0xffff000050f9ec84: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec88: b        #0xffff000050f07c4c
   0xffff000050f9ec8c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ec90: adrp     x1, #0xffff000050fdd000
   0xffff000050f9ec94: add      x0, x0, #0x53d
   0xffff000050f9ec98: add      x1, x1, #0x6b3
   0xffff000050f9ec9c: ldp      x29, x30, [sp], #0x10
   0xffff000050f9eca0: b        #0xffff000050f07c4c
   0xffff000050f9eca4: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eca8: adrp     x1, #0xffff000050fdf000
   0xffff000050f9ecac: add      x0, x0, #0x53d
   0xffff000050f9ecb0: add      x1, x1, #0x312
   0xffff000050f9ecb4: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ecb8: b        #0xffff000050f07c4c
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
   0xffff000050f9ed50: add      x1, x1, #0x520
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
