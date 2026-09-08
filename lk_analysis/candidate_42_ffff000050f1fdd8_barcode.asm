; candidate function around xref 0xffff000050f1fe50 to 'barcode'
; estimated range 0xffff000050f1fdd8-0xffff000050f20004

   0xffff000050f1fdd8: stp      x29, x30, [sp, #-0x50]!
   0xffff000050f1fddc: stp      x26, x25, [sp, #0x10]
   0xffff000050f1fde0: mov      x29, sp
   0xffff000050f1fde4: stp      x24, x23, [sp, #0x20]
   0xffff000050f1fde8: stp      x22, x21, [sp, #0x30]
   0xffff000050f1fdec: stp      x20, x19, [sp, #0x40]
   0xffff000050f1fdf0: cbz      x1, #0xffff000050f1fff0
   0xffff000050f1fdf4: mov      x23, x1
   0xffff000050f1fdf8: ldrb     w8, [x1]
   0xffff000050f1fdfc: cbz      w8, #0xffff000050f1fff0
   0xffff000050f1fe00: mov      w20, w0
   0xffff000050f1fe04: bl       #0xffff000050fc91b0
   0xffff000050f1fe08: mov      w21, w0
   0xffff000050f1fe0c: bl       #0xffff000050f02cc0
   0xffff000050f1fe10: ldr      w25, [x0, #0x38]
   0xffff000050f1fe14: bl       #0xffff000050fc91cc
   0xffff000050f1fe18: mov      w19, w0
   0xffff000050f1fe1c: bl       #0xffff000050f140ac
   0xffff000050f1fe20: mov      w22, w0
   0xffff000050f1fe24: bl       #0xffff000050f76588
   0xffff000050f1fe28: mov      x1, x23
   0xffff000050f1fe2c: bl       #0xffff000050f89344
   0xffff000050f1fe30: mov      w24, w0
   0xffff000050f1fe34: bl       #0xffff000050f76588
   0xffff000050f1fe38: cmp      w24, w0
   0xffff000050f1fe3c: b.ls     #0xffff000050f1fe64
   0xffff000050f1fe40: ldp      x20, x19, [sp, #0x40]
   0xffff000050f1fe44: adrp     x1, #0xffff000050fe5000
   0xffff000050f1fe48: mov      w0, #1
   0xffff000050f1fe4c: ldp      x22, x21, [sp, #0x30]
>> 0xffff000050f1fe50: add      x1, x1, #0xfb1
   0xffff000050f1fe54: ldp      x24, x23, [sp, #0x20]
   0xffff000050f1fe58: ldp      x26, x25, [sp, #0x10]
   0xffff000050f1fe5c: ldp      x29, x30, [sp], #0x50
   0xffff000050f1fe60: b        #0xffff000050f29978
   0xffff000050f1fe64: mul      w19, w22, w19
   0xffff000050f1fe68: add      w20, w25, w20
   0xffff000050f1fe6c: bl       #0xffff000050f89374
   0xffff000050f1fe70: mov      w8, #0xb
   0xffff000050f1fe74: madd     w22, w0, w8, w21
   0xffff000050f1fe78: bl       #0xffff000050f89374
   0xffff000050f1fe7c: mov      w21, w0
   0xffff000050f1fe80: mov      w0, #0x68
   0xffff000050f1fe84: bl       #0xffff000050f893ac
   0xffff000050f1fe88: mov      w24, #0xc
   0xffff000050f1fe8c: and      w25, w0, #0xffff
   0xffff000050f1fe90: b        #0xffff000050f1fea4
   0xffff000050f1fe94: add      w22, w22, w21
   0xffff000050f1fe98: sub      w24, w24, #1
   0xffff000050f1fe9c: cmp      w24, #1
   0xffff000050f1fea0: b.ls     #0xffff000050f1fecc
   0xffff000050f1fea4: sub      w8, w24, #2
   0xffff000050f1fea8: lsr      w8, w25, w8
   0xffff000050f1feac: tbz      w8, #0, #0xffff000050f1fe94
   0xffff000050f1feb0: mov      w0, w22
   0xffff000050f1feb4: mov      w1, w20
   0xffff000050f1feb8: mov      w2, w19
   0xffff000050f1febc: mov      w3, w21
   0xffff000050f1fec0: mov      w4, #-0x1000000
   0xffff000050f1fec4: bl       #0xffff000050f76700
   0xffff000050f1fec8: b        #0xffff000050f1fe94
   0xffff000050f1fecc: ldrb     w0, [x23]
   0xffff000050f1fed0: cbz      w0, #0xffff000050f1ff30
   0xffff000050f1fed4: mov      x24, xzr
   0xffff000050f1fed8: b        #0xffff000050f1fee8
   0xffff000050f1fedc: add      x24, x24, #1
   0xffff000050f1fee0: ldrb     w0, [x23, x24]
   0xffff000050f1fee4: cbz      w0, #0xffff000050f1ff30
   0xffff000050f1fee8: bl       #0xffff000050f89398
   0xffff000050f1feec: mov      w25, #0xc
   0xffff000050f1fef0: and      w26, w0, #0xffff
   0xffff000050f1fef4: b        #0xffff000050f1ff08
   0xffff000050f1fef8: add      w22, w22, w21
   0xffff000050f1fefc: sub      w25, w25, #1
   0xffff000050f1ff00: cmp      w25, #1
   0xffff000050f1ff04: b.ls     #0xffff000050f1fedc
   0xffff000050f1ff08: sub      w8, w25, #2
   0xffff000050f1ff0c: lsr      w8, w26, w8
   0xffff000050f1ff10: tbz      w8, #0, #0xffff000050f1fef8
   0xffff000050f1ff14: mov      w0, w22
   0xffff000050f1ff18: mov      w1, w20
   0xffff000050f1ff1c: mov      w2, w19
   0xffff000050f1ff20: mov      w3, w21
   0xffff000050f1ff24: mov      w4, #-0x1000000
   0xffff000050f1ff28: bl       #0xffff000050f76700
   0xffff000050f1ff2c: b        #0xffff000050f1fef8
   0xffff000050f1ff30: mov      x0, x23
   0xffff000050f1ff34: bl       #0xffff000050f893c4
   0xffff000050f1ff38: mov      w23, #0xc
   0xffff000050f1ff3c: and      w24, w0, #0xffff
   0xffff000050f1ff40: b        #0xffff000050f1ff54
   0xffff000050f1ff44: add      w22, w22, w21
   0xffff000050f1ff48: sub      w23, w23, #1
   0xffff000050f1ff4c: cmp      w23, #1
   0xffff000050f1ff50: b.ls     #0xffff000050f1ff7c
   0xffff000050f1ff54: sub      w8, w23, #2
   0xffff000050f1ff58: lsr      w8, w24, w8
   0xffff000050f1ff5c: tbz      w8, #0, #0xffff000050f1ff44
   0xffff000050f1ff60: mov      w0, w22
   0xffff000050f1ff64: mov      w1, w20
   0xffff000050f1ff68: mov      w2, w19
   0xffff000050f1ff6c: mov      w3, w21
   0xffff000050f1ff70: mov      w4, #-0x1000000
   0xffff000050f1ff74: bl       #0xffff000050f76700
   0xffff000050f1ff78: b        #0xffff000050f1ff44
   0xffff000050f1ff7c: mov      w0, #0x6a
   0xffff000050f1ff80: bl       #0xffff000050f893ac
   0xffff000050f1ff84: mov      w23, #0xc
   0xffff000050f1ff88: and      w24, w0, #0xffff
   0xffff000050f1ff8c: b        #0xffff000050f1ffa0
   0xffff000050f1ff90: add      w22, w22, w21
   0xffff000050f1ff94: sub      w23, w23, #1
   0xffff000050f1ff98: cmp      w23, #1
   0xffff000050f1ff9c: b.ls     #0xffff000050f1ffc8
   0xffff000050f1ffa0: sub      w8, w23, #2
   0xffff000050f1ffa4: lsr      w8, w24, w8
   0xffff000050f1ffa8: tbz      w8, #0, #0xffff000050f1ff90
   0xffff000050f1ffac: mov      w0, w22
   0xffff000050f1ffb0: mov      w1, w20
   0xffff000050f1ffb4: mov      w2, w19
   0xffff000050f1ffb8: mov      w3, w21
   0xffff000050f1ffbc: mov      w4, #-0x1000000
   0xffff000050f1ffc0: bl       #0xffff000050f76700
   0xffff000050f1ffc4: b        #0xffff000050f1ff90
   0xffff000050f1ffc8: bl       #0xffff000050f893bc
   0xffff000050f1ffcc: and      w23, w0, #0xffff
   0xffff000050f1ffd0: tbz      w0, #1, #0xffff000050f1ffec
   0xffff000050f1ffd4: mov      w0, w22
   0xffff000050f1ffd8: mov      w1, w20
   0xffff000050f1ffdc: mov      w2, w19
   0xffff000050f1ffe0: mov      w3, w21
   0xffff000050f1ffe4: mov      w4, #-0x1000000
   0xffff000050f1ffe8: bl       #0xffff000050f76700
   0xffff000050f1ffec: tbnz     w23, #0, #0xffff000050f20008
   0xffff000050f1fff0: ldp      x20, x19, [sp, #0x40]
   0xffff000050f1fff4: ldp      x22, x21, [sp, #0x30]
   0xffff000050f1fff8: ldp      x24, x23, [sp, #0x20]
   0xffff000050f1fffc: ldp      x26, x25, [sp, #0x10]
   0xffff000050f20000: ldp      x29, x30, [sp], #0x50
   0xffff000050f20004: ret      
