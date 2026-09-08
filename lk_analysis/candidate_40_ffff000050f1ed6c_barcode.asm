; candidate function around xref 0xffff000050f1eee4 to 'barcode'
; estimated range 0xffff000050f1ed6c-0xffff000050f1ef68

   0xffff000050f1ed6c: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f1ed70: str      x19, [sp, #0x10]
   0xffff000050f1ed74: mov      x29, sp
   0xffff000050f1ed78: cbz      w1, #0xffff000050f1ede4
   0xffff000050f1ed7c: adrp     x8, #0xffff000051023000
   0xffff000050f1ed80: ldr      x8, [x8, #0x2e0]
   0xffff000050f1ed84: cbz      x8, #0xffff000050f1ed90
   0xffff000050f1ed88: ldrb     w8, [x8, #0x38]
   0xffff000050f1ed8c: cbz      w8, #0xffff000050f1ede4
   0xffff000050f1ed90: adrp     x8, #0xffff000051055000
   0xffff000050f1ed94: ldrb     w8, [x8, #0x575]
   0xffff000050f1ed98: tbnz     w8, #0, #0xffff000050f1ede4
   0xffff000050f1ed9c: and      w8, w0, #0xffff
   0xffff000050f1eda0: cmp      w8, #0x1fe
   0xffff000050f1eda4: b.eq     #0xffff000050f1edf0
   0xffff000050f1eda8: cmp      w8, #0x116
   0xffff000050f1edac: b.eq     #0xffff000050f1edfc
   0xffff000050f1edb0: cmp      w8, #0x115
   0xffff000050f1edb4: b.ne     #0xffff000050f1ede4
   0xffff000050f1edb8: adrp     x19, #0xffff000051055000
   0xffff000050f1edbc: ldr      x0, [x19, #0x508]
   0xffff000050f1edc0: cbz      x0, #0xffff000050f1eea8
   0xffff000050f1edc4: ldr      w8, [x0, #0x50]
   0xffff000050f1edc8: cmp      w8, #5
   0xffff000050f1edcc: b.eq     #0xffff000050f1eed4
   0xffff000050f1edd0: cmp      w8, #4
   0xffff000050f1edd4: b.ne     #0xffff000050f1eef4
   0xffff000050f1edd8: ldr      x19, [sp, #0x10]
   0xffff000050f1eddc: ldp      x29, x30, [sp], #0x20
   0xffff000050f1ede0: b        #0xffff000050f1fd0c
   0xffff000050f1ede4: ldr      x19, [sp, #0x10]
   0xffff000050f1ede8: ldp      x29, x30, [sp], #0x20
   0xffff000050f1edec: ret      
   0xffff000050f1edf0: ldr      x19, [sp, #0x10]
   0xffff000050f1edf4: ldp      x29, x30, [sp], #0x20
   0xffff000050f1edf8: b        #0xffff000050f17008
   0xffff000050f1edfc: adrp     x9, #0xffff000051055000
   0xffff000050f1ee00: ldr      x8, [x9, #0x508]
   0xffff000050f1ee04: cbz      x8, #0xffff000050f1eebc
   0xffff000050f1ee08: adrp     x11, #0xffff000051055000
   0xffff000050f1ee0c: adrp     x10, #0xffff000051055000
   0xffff000050f1ee10: mov      x12, x8
   0xffff000050f1ee14: str      x8, [x11, #0x5a8]
   0xffff000050f1ee18: adrp     x11, #0xffff000051055000
   0xffff000050f1ee1c: ldr      x10, [x10, #0x540]
   0xffff000050f1ee20: add      x11, x11, #0x538
   0xffff000050f1ee24: b        #0xffff000050f1ee3c
   0xffff000050f1ee28: mov      x12, xzr
   0xffff000050f1ee2c: str      x12, [x9, #0x508]
   0xffff000050f1ee30: ldr      w13, [x12, #0x50]
   0xffff000050f1ee34: cmp      w13, #3
   0xffff000050f1ee38: b.hs     #0xffff000050f1ee84
   0xffff000050f1ee3c: ldr      x12, [x12, #8]
   0xffff000050f1ee40: cmp      x12, x11
   0xffff000050f1ee44: csel     x12, xzr, x12, eq
   0xffff000050f1ee48: str      x12, [x9, #0x508]
   0xffff000050f1ee4c: cbnz     x12, #0xffff000050f1ee30
   0xffff000050f1ee50: cmp      x10, x11
   0xffff000050f1ee54: b.eq     #0xffff000050f1ee28
   0xffff000050f1ee58: mov      x12, xzr
   0xffff000050f1ee5c: mov      x13, x10
   0xffff000050f1ee60: ldr      w14, [x13, #0x50]
   0xffff000050f1ee64: cmp      x12, #0
   0xffff000050f1ee68: csel     x15, x13, x12, eq
   0xffff000050f1ee6c: ldr      x13, [x13, #8]
   0xffff000050f1ee70: cmp      w14, #3
   0xffff000050f1ee74: csel     x12, x12, x15, lo
   0xffff000050f1ee78: cmp      x13, x11
   0xffff000050f1ee7c: b.ne     #0xffff000050f1ee60
   0xffff000050f1ee80: b        #0xffff000050f1ee2c
   0xffff000050f1ee84: adrp     x1, #0xffff000050fd3000
   0xffff000050f1ee88: add      x2, x12, #0x10
   0xffff000050f1ee8c: add      x3, x8, #0x10
   0xffff000050f1ee90: add      x1, x1, #0x908
   0xffff000050f1ee94: mov      w0, #1
   0xffff000050f1ee98: bl       #0xffff000050f29978
   0xffff000050f1ee9c: ldr      x19, [sp, #0x10]
   0xffff000050f1eea0: ldp      x29, x30, [sp], #0x20
   0xffff000050f1eea4: b        #0xffff000050f1f8a4
   0xffff000050f1eea8: ldr      x19, [sp, #0x10]
   0xffff000050f1eeac: adrp     x0, #0xffff000051023000
   0xffff000050f1eeb0: add      x0, x0, #0x340
   0xffff000050f1eeb4: ldp      x29, x30, [sp], #0x20
   0xffff000050f1eeb8: b        #0xffff000050f15a0c
   0xffff000050f1eebc: ldr      x19, [sp, #0x10]
   0xffff000050f1eec0: adrp     x1, #0xffff000050fe4000
   0xffff000050f1eec4: add      x1, x1, #0x812
   0xffff000050f1eec8: mov      w0, #1
   0xffff000050f1eecc: ldp      x29, x30, [sp], #0x20
   0xffff000050f1eed0: b        #0xffff000050f29978
   0xffff000050f1eed4: adrp     x8, #0xffff000051023000
   0xffff000050f1eed8: ldr      x19, [sp, #0x10]
   0xffff000050f1eedc: adrp     x0, #0xffff000050fef000
   0xffff000050f1eee0: mov      w1, wzr
>> 0xffff000050f1eee4: add      x0, x0, #0x77c
   0xffff000050f1eee8: ldr      x2, [x8, #0x160]
   0xffff000050f1eeec: ldp      x29, x30, [sp], #0x20
   0xffff000050f1eef0: br       x2
   0xffff000050f1eef4: bl       #0xffff000050f15a0c
   0xffff000050f1eef8: ldr      x8, [x19, #0x508]
   0xffff000050f1eefc: adrp     x1, #0xffff000050fd2000
   0xffff000050f1ef00: add      x1, x1, #0x387
   0xffff000050f1ef04: mov      w0, #2
   0xffff000050f1ef08: add      x2, x8, #0x10
   0xffff000050f1ef0c: bl       #0xffff000050f29978
   0xffff000050f1ef10: adrp     x8, #0xffff000051023000
   0xffff000050f1ef14: adrp     x9, #0xffff000051055000
   0xffff000050f1ef18: add      x9, x9, #0x578
   0xffff000050f1ef1c: ldr      x19, [sp, #0x10]
   0xffff000050f1ef20: ldr      w8, [x8, #0x338]
   0xffff000050f1ef24: ldr      x0, [x9, x8, lsl #3]
   0xffff000050f1ef28: ldp      x29, x30, [sp], #0x20
   0xffff000050f1ef2c: b        #0xffff000050f02d18
   0xffff000050f1ef30: cbz      w1, #0xffff000050f1ef68
   0xffff000050f1ef34: and      w8, w0, #0xffff
   0xffff000050f1ef38: sub      w9, w8, #0x115
   0xffff000050f1ef3c: cmp      w9, #2
   0xffff000050f1ef40: b.hs     #0xffff000050f1ef5c
   0xffff000050f1ef44: adrp     x8, #0xffff000051023000
   0xffff000050f1ef48: adrp     x0, #0xffff000050fe5000
   0xffff000050f1ef4c: add      x0, x0, #0xb88
   0xffff000050f1ef50: mov      w1, wzr
   0xffff000050f1ef54: ldr      x2, [x8, #0x160]
   0xffff000050f1ef58: br       x2
   0xffff000050f1ef5c: cmp      w8, #0x1fe
   0xffff000050f1ef60: b.ne     #0xffff000050f1ef68
   0xffff000050f1ef64: b        #0xffff000050f17008
   0xffff000050f1ef68: ret      
