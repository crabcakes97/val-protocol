; candidate function around xref 0xffff000050f0ed84 to 'all'
; estimated range 0xffff000050f0ea1c-0xffff000050f0edc8

   0xffff000050f0ea1c: sub      sp, sp, #0xa0
   0xffff000050f0ea20: stp      x29, x30, [sp, #0x60]
   0xffff000050f0ea24: add      x29, sp, #0x60
   0xffff000050f0ea28: str      x23, [sp, #0x70]
   0xffff000050f0ea2c: stp      x22, x21, [sp, #0x80]
   0xffff000050f0ea30: stp      x20, x19, [sp, #0x90]
   0xffff000050f0ea34: cmp      w0, #2
   0xffff000050f0ea38: b.lt     #0xffff000050f0eaa0
   0xffff000050f0ea3c: ldr      x20, [x1, #8]
   0xffff000050f0ea40: mov      x19, x1
   0xffff000050f0ea44: adrp     x1, #0xffff000050ff5000
   0xffff000050f0ea48: mov      w21, w0
   0xffff000050f0ea4c: add      x1, x1, #0xb83
   0xffff000050f0ea50: mov      x0, x20
   0xffff000050f0ea54: bl       #0xffff000050f8e3ec
   0xffff000050f0ea58: cbz      w0, #0xffff000050f0eaa0
   0xffff000050f0ea5c: adrp     x1, #0xffff000050fed000
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
>> 0xffff000050f0ed84: add      x1, x1, #0x975
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
