; candidate function around xref 0xffff000050f9ee98 to 'metadata'
; estimated range 0xffff000050f9edd0-0xffff000050f9effc

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
   0xffff000050f9ee94: adrp     x0, #0xffff000050ff7000
>> 0xffff000050f9ee98: add      x0, x0, #0x689
   0xffff000050f9ee9c: bl       #0xffff000050faf874
   0xffff000050f9eea0: tbnz     x0, #0x3f, #0xffff000050f9ef30
   0xffff000050f9eea4: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eea8: add      x0, x0, #0x574
   0xffff000050f9eeac: bl       #0xffff000050faf874
   0xffff000050f9eeb0: tbnz     x0, #0x3f, #0xffff000050f9ef44
   0xffff000050f9eeb4: adrp     x0, #0xffff000050fe5000
   0xffff000050f9eeb8: add      x0, x0, #0xdd6
   0xffff000050f9eebc: bl       #0xffff000050faf874
   0xffff000050f9eec0: tbnz     x0, #0x3f, #0xffff000050f9ef58
   0xffff000050f9eec4: adrp     x0, #0xffff000050fd7000
   0xffff000050f9eec8: add      x0, x0, #0x899
   0xffff000050f9eecc: bl       #0xffff000050f25598
   0xffff000050f9eed0: cmn      w0, #1
   0xffff000050f9eed4: b.eq     #0xffff000050f9eee8
   0xffff000050f9eed8: adrp     x0, #0xffff000050fd7000
   0xffff000050f9eedc: add      x0, x0, #0x899
   0xffff000050f9eee0: bl       #0xffff000050faf874
   0xffff000050f9eee4: tbnz     x0, #0x3f, #0xffff000050f9ef6c
   0xffff000050f9eee8: mov      w0, wzr
   0xffff000050f9eeec: bl       #0xffff000050f9fd20
   0xffff000050f9eef0: mov      w0, #1
   0xffff000050f9eef4: bl       #0xffff000050f9fdbc
   0xffff000050f9eef8: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eefc: adrp     x1, #0xffff000050fe3000
   0xffff000050f9ef00: add      x0, x0, #0x53d
   0xffff000050f9ef04: add      x1, x1, #0xf19
   0xffff000050f9ef08: bl       #0xffff000050f07c4c
   0xffff000050f9ef0c: adrp     x0, #0xffff000050fd4000
   0xffff000050f9ef10: adrp     x1, #0xffff000050ff8000
   0xffff000050f9ef14: add      x0, x0, #0xdba
   0xffff000050f9ef18: add      x1, x1, #0x773
   0xffff000050f9ef1c: bl       #0xffff000050f07b68
   0xffff000050f9ef20: ldr      x19, [sp, #0x10]
   0xffff000050f9ef24: mov      w0, #1
   0xffff000050f9ef28: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ef2c: b        #0xffff000050f03174
   0xffff000050f9ef30: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ef34: adrp     x1, #0xffff000050fd6000
   0xffff000050f9ef38: add      x0, x0, #0x53d
   0xffff000050f9ef3c: add      x1, x1, #0x166
   0xffff000050f9ef40: b        #0xffff000050f9ee7c
   0xffff000050f9ef44: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ef48: adrp     x1, #0xffff000050fd0000
   0xffff000050f9ef4c: add      x0, x0, #0x53d
   0xffff000050f9ef50: add      x1, x1, #0x122
   0xffff000050f9ef54: b        #0xffff000050f9ee7c
   0xffff000050f9ef58: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ef5c: adrp     x1, #0xffff000050fdd000
   0xffff000050f9ef60: add      x0, x0, #0x53d
   0xffff000050f9ef64: add      x1, x1, #0x6b3
   0xffff000050f9ef68: b        #0xffff000050f9ee7c
   0xffff000050f9ef6c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ef70: adrp     x1, #0xffff000050fdf000
   0xffff000050f9ef74: add      x0, x0, #0x53d
   0xffff000050f9ef78: add      x1, x1, #0x312
   0xffff000050f9ef7c: b        #0xffff000050f9ee7c
   0xffff000050f9ef80: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9ef84: stp      x20, x19, [sp, #0x10]
   0xffff000050f9ef88: mov      x29, sp
   0xffff000050f9ef8c: ldr      x19, [x0, #0x10]
   0xffff000050f9ef90: ldrb     w8, [x19, #1]!
   0xffff000050f9ef94: cmp      w8, #0x20
   0xffff000050f9ef98: b.eq     #0xffff000050f9ef90
   0xffff000050f9ef9c: adrp     x8, #0xffff000051106000
   0xffff000050f9efa0: ldr      w20, [x8, #0xa14]
   0xffff000050f9efa4: cbz      w20, #0xffff000050f9efc8
   0xffff000050f9efa8: mov      w8, #0x7070
   0xffff000050f9efac: cmp      w20, w8
   0xffff000050f9efb0: b.ne     #0xffff000050f9f000
   0xffff000050f9efb4: adrp     x0, #0xffff000050fd9000
   0xffff000050f9efb8: adrp     x1, #0xffff000050fd9000
   0xffff000050f9efbc: add      x0, x0, #0x53d
   0xffff000050f9efc0: add      x1, x1, #0x57
   0xffff000050f9efc4: b        #0xffff000050f9efec
   0xffff000050f9efc8: adrp     x19, #0xffff000050fd9000
   0xffff000050f9efcc: adrp     x1, #0xffff000050fd3000
   0xffff000050f9efd0: add      x19, x19, #0x53d
   0xffff000050f9efd4: add      x1, x1, #0xe6
   0xffff000050f9efd8: mov      x0, x19
   0xffff000050f9efdc: bl       #0xffff000050f07c4c
   0xffff000050f9efe0: adrp     x1, #0xffff000050fe0000
   0xffff000050f9efe4: mov      x0, x19
   0xffff000050f9efe8: add      x1, x1, #0xb3d
   0xffff000050f9efec: bl       #0xffff000050f07c4c
   0xffff000050f9eff0: mov      w0, #3
   0xffff000050f9eff4: ldp      x20, x19, [sp, #0x10]
   0xffff000050f9eff8: ldp      x29, x30, [sp], #0x20
   0xffff000050f9effc: ret      
