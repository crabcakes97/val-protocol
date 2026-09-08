; candidate function around xref 0xffff000050f0ee60 to 'all'
; estimated range 0xffff000050f0ea60-0xffff000050f0f1d4

   0xffff000050f0ea60: mov      x0, x20
   0xffff000050f0ea64: add      x1, x1, #0xe04
   0xffff000050f0ea68: bl       #0xffff000050f8e3ec
   0xffff000050f0ea6c: cbz      w0, #0xffff000050f0eaac
   0xffff000050f0ea70: adrp     x1, #0xffff000050ff5000
   0xffff000050f0ea74: mov      x0, x20
   0xffff000050f0ea78: add      x1, x1, #0xcbd
   0xffff000050f0ea7c: bl       #0xffff000050f8e3ec
   0xffff000050f0ea80: cbz      w0, #0xffff000050f0ebc4
   0xffff000050f0ea84: adrp     x1, #0xffff000050fd2000
   0xffff000050f0ea88: mov      x0, x20
   0xffff000050f0ea8c: add      x1, x1, #0xfd
   0xffff000050f0ea90: bl       #0xffff000050f8e3ec
   0xffff000050f0ea94: cbz      w0, #0xffff000050f0ed00
   0xffff000050f0ea98: mov      w20, #3
   0xffff000050f0ea9c: b        #0xffff000050f0edac
   0xffff000050f0eaa0: bl       #0xffff000050f108d0
   0xffff000050f0eaa4: mov      w20, wzr
   0xffff000050f0eaa8: b        #0xffff000050f0edb0
   0xffff000050f0eaac: cmp      w21, #7
   0xffff000050f0eab0: b.ne     #0xffff000050f0ed90
   0xffff000050f0eab4: ldr      x0, [x19, #0x10]
   0xffff000050f0eab8: bl       #0xffff000050f8e61c
   0xffff000050f0eabc: cmp      x0, #1
   0xffff000050f0eac0: b.ne     #0xffff000050f0ed90
   0xffff000050f0eac4: ldr      x0, [x19, #0x18]
   0xffff000050f0eac8: bl       #0xffff000050f8e61c
   0xffff000050f0eacc: cmp      x0, #1
   0xffff000050f0ead0: b.ne     #0xffff000050f0ed90
   0xffff000050f0ead4: ldr      x0, [x19, #0x20]
   0xffff000050f0ead8: bl       #0xffff000050f8c19c
   0xffff000050f0eadc: mov      w20, w0
   0xffff000050f0eae0: ldr      x0, [x19, #0x20]
   0xffff000050f0eae4: bl       #0xffff000050f8c19c
   0xffff000050f0eae8: cmp      w0, w20, uxtb
   0xffff000050f0eaec: b.ne     #0xffff000050f0ed90
   0xffff000050f0eaf0: ldr      x0, [x19, #0x28]
   0xffff000050f0eaf4: bl       #0xffff000050f8e61c
   0xffff000050f0eaf8: cmp      x0, #6
   0xffff000050f0eafc: b.hi     #0xffff000050f0ed90
   0xffff000050f0eb00: ldr      x0, [x19, #0x30]
   0xffff000050f0eb04: bl       #0xffff000050f8e61c
   0xffff000050f0eb08: cmp      x0, #0x1f
   0xffff000050f0eb0c: b.hi     #0xffff000050f0ed90
   0xffff000050f0eb10: ldp      x8, x9, [x19, #0x10]
   0xffff000050f0eb14: ldr      x0, [x19, #0x20]
   0xffff000050f0eb18: ldrb     w8, [x8]
   0xffff000050f0eb1c: strb     w8, [sp, #0x30]
   0xffff000050f0eb20: ldrb     w8, [x9]
   0xffff000050f0eb24: strb     w8, [sp, #0x31]
   0xffff000050f0eb28: bl       #0xffff000050f8c19c
   0xffff000050f0eb2c: add      x20, sp, #0x30
   0xffff000050f0eb30: ldr      x1, [x19, #0x28]
   0xffff000050f0eb34: orr      x8, x20, #3
   0xffff000050f0eb38: strb     w0, [sp, #0x32]
   0xffff000050f0eb3c: mov      x0, x8
   0xffff000050f0eb40: strb     wzr, [sp, #0x33]
   0xffff000050f0eb44: bl       #0xffff000050f8e380
   0xffff000050f0eb48: add      x0, x20, #0xa
   0xffff000050f0eb4c: ldr      x1, [x19, #0x30]
   0xffff000050f0eb50: strb     wzr, [sp, #0x3a]
   0xffff000050f0eb54: bl       #0xffff000050f8e380
   0xffff000050f0eb58: mov      w0, #0x32
   0xffff000050f0eb5c: bl       #0xffff000050f8bed8
   0xffff000050f0eb60: cbz      x0, #0xffff000050f0eba4
   0xffff000050f0eb64: mov      x19, x0
   0xffff000050f0eb68: adrp     x2, #0xffff000050fd6000
   0xffff000050f0eb6c: add      x2, x2, #0x800
   0xffff000050f0eb70: add      x0, sp, #0x30
   0xffff000050f0eb74: mov      x1, x19
   0xffff000050f0eb78: mov      x3, xzr
   0xffff000050f0eb7c: bl       #0xffff000050f41ae8
   0xffff000050f0eb80: cbnz     w0, #0xffff000050f0eb9c
   0xffff000050f0eb84: adrp     x0, #0xffff000050fd9000
   0xffff000050f0eb88: adrp     x1, #0xffff000050fdf000
   0xffff000050f0eb8c: add      x0, x0, #0x53d
   0xffff000050f0eb90: add      x1, x1, #0xb10
   0xffff000050f0eb94: mov      x2, x19
   0xffff000050f0eb98: bl       #0xffff000050f07c4c
   0xffff000050f0eb9c: mov      x0, x19
   0xffff000050f0eba0: bl       #0xffff000050f8c008
   0xffff000050f0eba4: add      x0, sp, #0x30
   0xffff000050f0eba8: bl       #0xffff000050f41d4c
   0xffff000050f0ebac: cbz      w0, #0xffff000050f0ef74
   0xffff000050f0ebb0: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ebb4: adrp     x1, #0xffff000050fec000
   0xffff000050f0ebb8: add      x0, x0, #0x53d
   0xffff000050f0ebbc: add      x1, x1, #0x5d4
   0xffff000050f0ebc0: b        #0xffff000050f0eda0
   0xffff000050f0ebc4: cmp      w21, #3
   0xffff000050f0ebc8: b.eq     #0xffff000050f0ed7c
   0xffff000050f0ebcc: cmp      w21, #7
   0xffff000050f0ebd0: b.ne     #0xffff000050f0ed90
   0xffff000050f0ebd4: ldr      x0, [x19, #0x10]
   0xffff000050f0ebd8: bl       #0xffff000050f8e61c
   0xffff000050f0ebdc: cmp      x0, #1
   0xffff000050f0ebe0: b.ne     #0xffff000050f0ed90
   0xffff000050f0ebe4: ldr      x0, [x19, #0x18]
   0xffff000050f0ebe8: bl       #0xffff000050f8e61c
   0xffff000050f0ebec: cmp      x0, #1
   0xffff000050f0ebf0: b.ne     #0xffff000050f0ed90
   0xffff000050f0ebf4: ldr      x0, [x19, #0x20]
   0xffff000050f0ebf8: bl       #0xffff000050f8c19c
   0xffff000050f0ebfc: mov      w20, w0
   0xffff000050f0ec00: ldr      x0, [x19, #0x20]
   0xffff000050f0ec04: bl       #0xffff000050f8c19c
   0xffff000050f0ec08: cmp      w0, w20, uxtb
   0xffff000050f0ec0c: b.ne     #0xffff000050f0ed90
   0xffff000050f0ec10: ldr      x0, [x19, #0x28]
   0xffff000050f0ec14: bl       #0xffff000050f8e61c
   0xffff000050f0ec18: cmp      x0, #6
   0xffff000050f0ec1c: b.hi     #0xffff000050f0ed90
   0xffff000050f0ec20: ldr      x0, [x19, #0x30]
   0xffff000050f0ec24: bl       #0xffff000050f8e61c
   0xffff000050f0ec28: cmp      x0, #0x1f
   0xffff000050f0ec2c: b.hi     #0xffff000050f0ed90
   0xffff000050f0ec30: ldp      x8, x9, [x19, #0x10]
   0xffff000050f0ec34: ldr      x0, [x19, #0x20]
   0xffff000050f0ec38: ldrb     w8, [x8]
   0xffff000050f0ec3c: strb     w8, [sp, #0x30]
   0xffff000050f0ec40: ldrb     w8, [x9]
   0xffff000050f0ec44: strb     w8, [sp, #0x31]
   0xffff000050f0ec48: bl       #0xffff000050f8c19c
   0xffff000050f0ec4c: add      x20, sp, #0x30
   0xffff000050f0ec50: ldr      x1, [x19, #0x28]
   0xffff000050f0ec54: orr      x8, x20, #3
   0xffff000050f0ec58: strb     w0, [sp, #0x32]
   0xffff000050f0ec5c: mov      x0, x8
   0xffff000050f0ec60: bl       #0xffff000050f8e464
   0xffff000050f0ec64: add      x0, x20, #0xa
   0xffff000050f0ec68: ldr      x1, [x19, #0x30]
   0xffff000050f0ec6c: bl       #0xffff000050f8e464
   0xffff000050f0ec70: mov      w0, #0x32
   0xffff000050f0ec74: bl       #0xffff000050f8bed8
   0xffff000050f0ec78: cbz      x0, #0xffff000050f0ecbc
   0xffff000050f0ec7c: mov      x19, x0
   0xffff000050f0ec80: adrp     x2, #0xffff000050fd6000
   0xffff000050f0ec84: add      x2, x2, #0x800
   0xffff000050f0ec88: add      x0, sp, #0x30
   0xffff000050f0ec8c: mov      x1, x19
   0xffff000050f0ec90: mov      x3, xzr
   0xffff000050f0ec94: bl       #0xffff000050f41ae8
   0xffff000050f0ec98: cbnz     w0, #0xffff000050f0ecb4
   0xffff000050f0ec9c: adrp     x0, #0xffff000050fd9000
   0xffff000050f0eca0: adrp     x1, #0xffff000050fd2000
   0xffff000050f0eca4: add      x0, x0, #0x53d
   0xffff000050f0eca8: add      x1, x1, #0x216
   0xffff000050f0ecac: mov      x2, x19
   0xffff000050f0ecb0: bl       #0xffff000050f07c4c
   0xffff000050f0ecb4: mov      x0, x19
   0xffff000050f0ecb8: bl       #0xffff000050f8c008
   0xffff000050f0ecbc: add      x0, sp, #0x30
   0xffff000050f0ecc0: bl       #0xffff000050f425c4
   0xffff000050f0ecc4: cbz      w0, #0xffff000050f0ef74
   0xffff000050f0ecc8: adrp     x19, #0xffff000050fd9000
   0xffff000050f0eccc: adrp     x1, #0xffff000050ffd000
   0xffff000050f0ecd0: add      x19, x19, #0x53d
   0xffff000050f0ecd4: add      x1, x1, #0xa61
   0xffff000050f0ecd8: mov      x0, x19
   0xffff000050f0ecdc: bl       #0xffff000050f07c4c
   0xffff000050f0ece0: adrp     x1, #0xffff000050fd9000
   0xffff000050f0ece4: mov      x0, x19
   0xffff000050f0ece8: add      x1, x1, #0x6c7
   0xffff000050f0ecec: bl       #0xffff000050f07c4c
   0xffff000050f0ecf0: adrp     x1, #0xffff000050fd4000
   0xffff000050f0ecf4: mov      x0, x19
   0xffff000050f0ecf8: add      x1, x1, #0xfda
   0xffff000050f0ecfc: b        #0xffff000050f0eda0
   0xffff000050f0ed00: mov      w8, #9
   0xffff000050f0ed04: cmp      w21, #2
   0xffff000050f0ed08: str      wzr, [x29, #0x18]
   0xffff000050f0ed0c: stur     wzr, [sp, #0x2b]
   0xffff000050f0ed10: str      wzr, [sp, #0x28]
   0xffff000050f0ed14: strb     w8, [x29, #0x1c]
   0xffff000050f0ed18: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f0ed1c: stp      xzr, xzr, [sp, #8]
   0xffff000050f0ed20: b.ne     #0xffff000050f0edcc
   0xffff000050f0ed24: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ed28: adrp     x1, #0xffff000050fff000
   0xffff000050f0ed2c: add      x0, x0, #0x53d
   0xffff000050f0ed30: add      x1, x1, #0x39d
   0xffff000050f0ed34: bl       #0xffff000050f07c4c
   0xffff000050f0ed38: mov      w0, #1
   0xffff000050f0ed3c: bl       #0xffff000050f10aac
   0xffff000050f0ed40: cmp      w0, #0
   0xffff000050f0ed44: b.gt     #0xffff000050f0ed5c
   0xffff000050f0ed48: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ed4c: adrp     x1, #0xffff000050fdc000
   0xffff000050f0ed50: add      x0, x0, #0x53d
   0xffff000050f0ed54: add      x1, x1, #0x45e
   0xffff000050f0ed58: bl       #0xffff000050f07c4c
   0xffff000050f0ed5c: cmp      w21, #2
   0xffff000050f0ed60: b.ne     #0xffff000050f0ee0c
   0xffff000050f0ed64: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ed68: adrp     x1, #0xffff000050ff5000
   0xffff000050f0ed6c: add      x0, x0, #0x53d
   0xffff000050f0ed70: add      x1, x1, #0xcc4
   0xffff000050f0ed74: bl       #0xffff000050f07c4c
   0xffff000050f0ed78: b        #0xffff000050f0ee88
   0xffff000050f0ed7c: adrp     x1, #0xffff000050fdf000
   0xffff000050f0ed80: ldr      x0, [x19, #0x10]
   0xffff000050f0ed84: add      x1, x1, #0x975
   0xffff000050f0ed88: bl       #0xffff000050f8e3ec
   0xffff000050f0ed8c: cbz      w0, #0xffff000050f0ef98
   0xffff000050f0ed90: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ed94: adrp     x1, #0xffff000050ff2000
   0xffff000050f0ed98: add      x0, x0, #0x53d
   0xffff000050f0ed9c: add      x1, x1, #0x9e0
   0xffff000050f0eda0: bl       #0xffff000050f07c4c
   0xffff000050f0eda4: mov      w20, #3
   0xffff000050f0eda8: cbz      w20, #0xffff000050f0edb0
   0xffff000050f0edac: bl       #0xffff000050f108d0
   0xffff000050f0edb0: mov      w0, w20
   0xffff000050f0edb4: ldr      x23, [sp, #0x70]
   0xffff000050f0edb8: ldp      x20, x19, [sp, #0x90]
   0xffff000050f0edbc: ldp      x22, x21, [sp, #0x80]
   0xffff000050f0edc0: ldp      x29, x30, [sp, #0x60]
   0xffff000050f0edc4: add      sp, sp, #0xa0
   0xffff000050f0edc8: ret      
   0xffff000050f0edcc: cmp      w21, #3
   0xffff000050f0edd0: b.ne     #0xffff000050f0ef7c
   0xffff000050f0edd4: ldr      x22, [x19, #0x10]
   0xffff000050f0edd8: adrp     x1, #0xffff000050fe1000
   0xffff000050f0eddc: add      x1, x1, #0x35c
   0xffff000050f0ede0: mov      x0, x22
   0xffff000050f0ede4: bl       #0xffff000050f8e3ec
   0xffff000050f0ede8: cbz      w0, #0xffff000050f0ed24
   0xffff000050f0edec: adrp     x1, #0xffff000050fdf000
   0xffff000050f0edf0: mov      x0, x22
   0xffff000050f0edf4: add      x1, x1, #0x975
   0xffff000050f0edf8: bl       #0xffff000050f8e3ec
   0xffff000050f0edfc: cbz      w0, #0xffff000050f0ed24
   0xffff000050f0ee00: mov      w23, wzr
   0xffff000050f0ee04: mov      w20, #3
   0xffff000050f0ee08: b        #0xffff000050f0ee18
   0xffff000050f0ee0c: mov      w20, wzr
   0xffff000050f0ee10: ldr      x22, [x19, #0x10]
   0xffff000050f0ee14: mov      w23, #1
   0xffff000050f0ee18: adrp     x1, #0xffff000050fdf000
   0xffff000050f0ee1c: mov      x0, x22
   0xffff000050f0ee20: add      x1, x1, #0x975
   0xffff000050f0ee24: bl       #0xffff000050f8e3ec
   0xffff000050f0ee28: cbnz     w0, #0xffff000050f0ee44
   0xffff000050f0ee2c: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ee30: adrp     x1, #0xffff000050ff5000
   0xffff000050f0ee34: add      x0, x0, #0x53d
   0xffff000050f0ee38: add      x1, x1, #0xcc4
   0xffff000050f0ee3c: bl       #0xffff000050f07c4c
   0xffff000050f0ee40: ldr      x22, [x19, #0x10]
   0xffff000050f0ee44: adrp     x1, #0xffff000050fdf000
   0xffff000050f0ee48: mov      x0, x22
   0xffff000050f0ee4c: add      x1, x1, #0xb1c
   0xffff000050f0ee50: bl       #0xffff000050f8e3ec
   0xffff000050f0ee54: cbz      w0, #0xffff000050f0ee88
   0xffff000050f0ee58: adrp     x1, #0xffff000050fdf000
   0xffff000050f0ee5c: mov      x0, x22
>> 0xffff000050f0ee60: add      x1, x1, #0x975
   0xffff000050f0ee64: bl       #0xffff000050f8e3ec
   0xffff000050f0ee68: cbz      w0, #0xffff000050f0ee88
   0xffff000050f0ee6c: adrp     x1, #0xffff000050ff5000
   0xffff000050f0ee70: mov      x0, x22
   0xffff000050f0ee74: add      x1, x1, #0xcd5
   0xffff000050f0ee78: bl       #0xffff000050f8e3ec
   0xffff000050f0ee7c: cbz      w0, #0xffff000050f0eee0
   0xffff000050f0ee80: tbz      w23, #0, #0xffff000050f0ef80
   0xffff000050f0ee84: b        #0xffff000050f0ef74
   0xffff000050f0ee88: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ee8c: adrp     x1, #0xffff000050fff000
   0xffff000050f0ee90: add      x0, x0, #0x53d
   0xffff000050f0ee94: add      x1, x1, #0x3b3
   0xffff000050f0ee98: bl       #0xffff000050f07c4c
   0xffff000050f0ee9c: mov      w0, #2
   0xffff000050f0eea0: bl       #0xffff000050f10aac
   0xffff000050f0eea4: cmp      w0, #0
   0xffff000050f0eea8: b.gt     #0xffff000050f0eec0
   0xffff000050f0eeac: adrp     x0, #0xffff000050fd9000
   0xffff000050f0eeb0: adrp     x1, #0xffff000050fdc000
   0xffff000050f0eeb4: add      x0, x0, #0x53d
   0xffff000050f0eeb8: add      x1, x1, #0x45e
   0xffff000050f0eebc: bl       #0xffff000050f07c4c
   0xffff000050f0eec0: cmp      w21, #3
   0xffff000050f0eec4: b.ne     #0xffff000050f0ef74
   0xffff000050f0eec8: adrp     x1, #0xffff000050ff5000
   0xffff000050f0eecc: ldr      x0, [x19, #0x10]
   0xffff000050f0eed0: add      x1, x1, #0xcd5
   0xffff000050f0eed4: bl       #0xffff000050f8e3ec
   0xffff000050f0eed8: mov      w20, wzr
   0xffff000050f0eedc: cbnz     w0, #0xffff000050f0eda8
   0xffff000050f0eee0: adrp     x19, #0xffff000050fd9000
   0xffff000050f0eee4: adrp     x1, #0xffff000050fd6000
   0xffff000050f0eee8: add      x19, x19, #0x53d
   0xffff000050f0eeec: add      x1, x1, #0x93c
   0xffff000050f0eef0: mov      x0, x19
   0xffff000050f0eef4: bl       #0xffff000050f07c4c
   0xffff000050f0eef8: adrp     x1, #0xffff000050ff0000
   0xffff000050f0eefc: mov      x0, x19
   0xffff000050f0ef00: add      x1, x1, #0xf43
   0xffff000050f0ef04: mov      w2, #9
   0xffff000050f0ef08: mov      w3, #9
   0xffff000050f0ef0c: mov      w4, #9
   0xffff000050f0ef10: mov      w5, #9
   0xffff000050f0ef14: bl       #0xffff000050f07c4c
   0xffff000050f0ef18: adrp     x1, #0xffff000050ff8000
   0xffff000050f0ef1c: mov      x0, x19
   0xffff000050f0ef20: add      x1, x1, #0x9a0
   0xffff000050f0ef24: bl       #0xffff000050f07c4c
   0xffff000050f0ef28: bl       #0xffff000050f04f70
   0xffff000050f0ef2c: strb     w0, [sp, #0x30]
   0xffff000050f0ef30: bl       #0xffff000050f04fc8
   0xffff000050f0ef34: strb     w0, [sp, #0x31]
   0xffff000050f0ef38: add      x0, sp, #0x30
   0xffff000050f0ef3c: mov      w1, #3
   0xffff000050f0ef40: bl       #0xffff000050f421f8
   0xffff000050f0ef44: cbz      w0, #0xffff000050f0efd0
   0xffff000050f0ef48: mov      x19, xzr
   0xffff000050f0ef4c: cbz      w20, #0xffff000050f0ef64
   0xffff000050f0ef50: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ef54: adrp     x1, #0xffff000050fd3000
   0xffff000050f0ef58: add      x0, x0, #0x53d
   0xffff000050f0ef5c: add      x1, x1, #0x74c
   0xffff000050f0ef60: bl       #0xffff000050f07c4c
   0xffff000050f0ef64: cbz      x19, #0xffff000050f0eda8
   0xffff000050f0ef68: mov      x0, x19
   0xffff000050f0ef6c: bl       #0xffff000050f8c008
   0xffff000050f0ef70: b        #0xffff000050f0eda8
   0xffff000050f0ef74: mov      w20, wzr
   0xffff000050f0ef78: b        #0xffff000050f0eda8
   0xffff000050f0ef7c: mov      w20, #3
   0xffff000050f0ef80: adrp     x0, #0xffff000050fd9000
   0xffff000050f0ef84: adrp     x1, #0xffff000050ff2000
   0xffff000050f0ef88: add      x0, x0, #0x53d
   0xffff000050f0ef8c: add      x1, x1, #0x9e0
   0xffff000050f0ef90: bl       #0xffff000050f07c4c
   0xffff000050f0ef94: b        #0xffff000050f0eda8
   0xffff000050f0ef98: bl       #0xffff000050f42610
   0xffff000050f0ef9c: cbz      w0, #0xffff000050f0efb4
   0xffff000050f0efa0: adrp     x0, #0xffff000050fd9000
   0xffff000050f0efa4: adrp     x1, #0xffff000050ffb000
   0xffff000050f0efa8: add      x0, x0, #0x53d
   0xffff000050f0efac: add      x1, x1, #0xdf8
   0xffff000050f0efb0: b        #0xffff000050f0eda0
   0xffff000050f0efb4: adrp     x0, #0xffff000050fd9000
   0xffff000050f0efb8: adrp     x1, #0xffff000050fd3000
   0xffff000050f0efbc: add      x0, x0, #0x53d
   0xffff000050f0efc0: add      x1, x1, #0x72b
   0xffff000050f0efc4: bl       #0xffff000050f07c4c
   0xffff000050f0efc8: mov      w20, wzr
   0xffff000050f0efcc: b        #0xffff000050f0eda8
   0xffff000050f0efd0: mov      w0, #0x32
   0xffff000050f0efd4: bl       #0xffff000050f8bed8
   0xffff000050f0efd8: cbz      x0, #0xffff000050f0f0c0
   0xffff000050f0efdc: mov      x19, x0
   0xffff000050f0efe0: add      x0, sp, #0x30
   0xffff000050f0efe4: add      x2, x29, #0x1c
   0xffff000050f0efe8: mov      x1, x19
   0xffff000050f0efec: mov      x3, xzr
   0xffff000050f0eff0: bl       #0xffff000050f41ae8
   0xffff000050f0eff4: cbnz     w0, #0xffff000050f0ef4c
   0xffff000050f0eff8: adrp     x0, #0xffff000050fd9000
   0xffff000050f0effc: adrp     x1, #0xffff000050fea000
   0xffff000050f0f000: add      x0, x0, #0x53d
   0xffff000050f0f004: add      x1, x1, #0xb62
   0xffff000050f0f008: mov      x2, x19
   0xffff000050f0f00c: bl       #0xffff000050f07c4c
   0xffff000050f0f010: add      x0, x29, #0x18
   0xffff000050f0f014: bl       #0xffff000050f05044
   0xffff000050f0f018: add      x0, sp, #0x28
   0xffff000050f0f01c: bl       #0xffff000050f05438
   0xffff000050f0f020: add      x0, sp, #8
   0xffff000050f0f024: bl       #0xffff000050f052d8
   0xffff000050f0f028: ldr      w20, [x29, #0x18]
   0xffff000050f0f02c: ldrb     w8, [sp, #0x32]
   0xffff000050f0f030: cmp      w20, w8
   0xffff000050f0f034: b.ne     #0xffff000050f0f05c
   0xffff000050f0f038: add      x21, sp, #0x30
   0xffff000050f0f03c: add      x0, sp, #0x28
   0xffff000050f0f040: orr      x1, x21, #3
   0xffff000050f0f044: bl       #0xffff000050f8e3ec
   0xffff000050f0f048: cbnz     w0, #0xffff000050f0f05c
   0xffff000050f0f04c: add      x1, x21, #0xa
   0xffff000050f0f050: add      x0, sp, #8
   0xffff000050f0f054: bl       #0xffff000050f8e3ec
   0xffff000050f0f058: cbz      w0, #0xffff000050f0f108
   0xffff000050f0f05c: add      x21, sp, #0x30
   0xffff000050f0f060: add      x1, sp, #0x28
   0xffff000050f0f064: orr      x0, x21, #3
   0xffff000050f0f068: strb     w20, [sp, #0x32]
   0xffff000050f0f06c: bl       #0xffff000050f8e464
   0xffff000050f0f070: add      x0, x21, #0xa
   0xffff000050f0f074: add      x1, sp, #8
   0xffff000050f0f078: bl       #0xffff000050f8e464
   0xffff000050f0f07c: adrp     x0, #0xffff000050fd9000
   0xffff000050f0f080: adrp     x1, #0xffff000050fcf000
   0xffff000050f0f084: add      x0, x0, #0x53d
   0xffff000050f0f088: add      x1, x1, #0x189
   0xffff000050f0f08c: bl       #0xffff000050f07c4c
   0xffff000050f0f090: add      x0, sp, #0x30
   0xffff000050f0f094: add      x2, x29, #0x1c
   0xffff000050f0f098: mov      x1, x19
   0xffff000050f0f09c: mov      x3, xzr
   0xffff000050f0f0a0: bl       #0xffff000050f41ae8
   0xffff000050f0f0a4: cbz      w0, #0xffff000050f0f0f0
   0xffff000050f0f0a8: adrp     x0, #0xffff000050fd9000
   0xffff000050f0f0ac: adrp     x1, #0xffff000050fef000
   0xffff000050f0f0b0: add      x0, x0, #0x53d
   0xffff000050f0f0b4: add      x1, x1, #0x643
   0xffff000050f0f0b8: bl       #0xffff000050f07c4c
   0xffff000050f0f0bc: b        #0xffff000050f0f108
   0xffff000050f0f0c0: adrp     x1, #0xffff000050fe2000
   0xffff000050f0f0c4: adrp     x2, #0xffff000050fef000
   0xffff000050f0f0c8: add      x1, x1, #0xc07
   0xffff000050f0f0cc: add      x2, x2, #0x635
   0xffff000050f0f0d0: mov      w0, #-1
   0xffff000050f0f0d4: bl       #0xffff000050f29978
   0xffff000050f0f0d8: adrp     x0, #0xffff000050fd9000
   0xffff000050f0f0dc: adrp     x1, #0xffff000050fff000
   0xffff000050f0f0e0: add      x0, x0, #0x53d
   0xffff000050f0f0e4: add      x1, x1, #0x3c6
   0xffff000050f0f0e8: bl       #0xffff000050f07c4c
   0xffff000050f0f0ec: b        #0xffff000050f0eda8
   0xffff000050f0f0f0: adrp     x0, #0xffff000050fd9000
   0xffff000050f0f0f4: adrp     x1, #0xffff000050fea000
   0xffff000050f0f0f8: add      x0, x0, #0x53d
   0xffff000050f0f0fc: add      x1, x1, #0xb62
   0xffff000050f0f100: mov      x2, x19
   0xffff000050f0f104: bl       #0xffff000050f07c4c
   0xffff000050f0f108: mov      w20, wzr
   0xffff000050f0f10c: b        #0xffff000050f0ef68
   0xffff000050f0f110: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f0f114: str      x19, [sp, #0x10]
   0xffff000050f0f118: mov      x29, sp
   0xffff000050f0f11c: cmp      w0, #2
   0xffff000050f0f120: b.lt     #0xffff000050f0f12c
   0xffff000050f0f124: ldr      x19, [x1, #8]
   0xffff000050f0f128: b        #0xffff000050f0f130
   0xffff000050f0f12c: mov      x19, xzr
   0xffff000050f0f130: adrp     x1, #0xffff000050fdc000
   0xffff000050f0f134: mov      w0, #1
   0xffff000050f0f138: add      x1, x1, #0x465
   0xffff000050f0f13c: mov      x2, x19
   0xffff000050f0f140: bl       #0xffff000050f29978
   0xffff000050f0f144: adrp     x1, #0xffff000050fd0000
   0xffff000050f0f148: mov      x0, x19
   0xffff000050f0f14c: add      x1, x1, #0x6c0
   0xffff000050f0f150: mov      w2, #6
   0xffff000050f0f154: bl       #0xffff000050f8e6fc
   0xffff000050f0f158: cbz      w0, #0xffff000050f0f194
   0xffff000050f0f15c: adrp     x1, #0xffff000050ff8000
   0xffff000050f0f160: mov      x0, x19
   0xffff000050f0f164: add      x1, x1, #0x9b1
   0xffff000050f0f168: mov      w2, #6
   0xffff000050f0f16c: bl       #0xffff000050f8e6fc
   0xffff000050f0f170: cbz      w0, #0xffff000050f0f190
   0xffff000050f0f174: adrp     x0, #0xffff000050fd9000
   0xffff000050f0f178: adrp     x1, #0xffff000050fe2000
   0xffff000050f0f17c: add      x0, x0, #0x53d
   0xffff000050f0f180: add      x1, x1, #0xac6
   0xffff000050f0f184: bl       #0xffff000050f07c4c
   0xffff000050f0f188: mov      w0, #3
   0xffff000050f0f18c: b        #0xffff000050f0f1cc
   0xffff000050f0f190: mov      w0, #1
   0xffff000050f0f194: bl       #0xffff000050f3c254
   0xffff000050f0f198: adrp     x0, #0xffff000050fd9000
   0xffff000050f0f19c: adrp     x1, #0xffff000050ff7000
   0xffff000050f0f1a0: add      x0, x0, #0x53d
   0xffff000050f0f1a4: add      x1, x1, #0x336
   0xffff000050f0f1a8: bl       #0xffff000050f07c4c
   0xffff000050f0f1ac: adrp     x0, #0xffff000050fd4000
   0xffff000050f0f1b0: adrp     x1, #0xffff000050ff8000
   0xffff000050f0f1b4: add      x0, x0, #0xdba
   0xffff000050f0f1b8: add      x1, x1, #0x773
   0xffff000050f0f1bc: bl       #0xffff000050f07b68
   0xffff000050f0f1c0: mov      w0, wzr
   0xffff000050f0f1c4: bl       #0xffff000050f03174
   0xffff000050f0f1c8: mov      w0, #1
   0xffff000050f0f1cc: ldr      x19, [sp, #0x10]
   0xffff000050f0f1d0: ldp      x29, x30, [sp], #0x20
   0xffff000050f0f1d4: ret      
