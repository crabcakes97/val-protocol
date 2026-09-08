; candidate function around xref 0xffff000050fcaf68 to 'metadata'
; estimated range 0xffff000050fcaccc-0xffff000050fcb1f0

   0xffff000050fcaccc: sub      sp, sp, #0x1e0
   0xffff000050fcacd0: mov      x8, x0
   0xffff000050fcacd4: mov      w0, wzr
   0xffff000050fcacd8: cbz      x8, #0xffff000050fcad54
   0xffff000050fcacdc: mov      x19, x1
   0xffff000050fcace0: cbz      x1, #0xffff000050fcad54
   0xffff000050fcace4: cbz      x2, #0xffff000050fcad54
   0xffff000050fcace8: ldr      w11, [x2]
   0xffff000050fcacec: ldr      w8, [x8, #0x28]
   0xffff000050fcacf0: cmp      w11, w8
   0xffff000050fcacf4: b.hi     #0xffff000050fcad50
   0xffff000050fcacf8: ldr      w9, [x19]
   0xffff000050fcacfc: mov      w10, #0x5030
   0xffff000050fcad00: movk     w10, #0x414c, lsl #16
   0xffff000050fcad04: cmp      w9, w10
   0xffff000050fcad08: b.ne     #0xffff000050fcad50
   0xffff000050fcad0c: ldrh     w9, [x19, #6]
   0xffff000050fcad10: ldrh     w10, [x19, #4]
   0xffff000050fcad14: mov      w12, w9
   0xffff000050fcad18: bfi      w12, w10, #0x10, #0x10
   0xffff000050fcad1c: sub      w12, w12, #0xa0, lsl #12
   0xffff000050fcad20: cmp      w12, #3
   0xffff000050fcad24: b.hs     #0xffff000050fcad68
   0xffff000050fcad28: lsl      w10, w10, #0x10
   0xffff000050fcad2c: mov      w12, #1
   0xffff000050fcad30: movk     w12, #0xa, lsl #16
   0xffff000050fcad34: orr      w9, w10, w9
   0xffff000050fcad38: cmp      w9, w12
   0xffff000050fcad3c: mov      w10, #0x80
   0xffff000050fcad40: mov      w12, #0x100
   0xffff000050fcad44: csel     w10, w12, w10, hi
   0xffff000050fcad48: cmp      w11, w10
   0xffff000050fcad4c: b.hs     #0xffff000050fcadc8
   0xffff000050fcad50: mov      w0, wzr
   0xffff000050fcad54: add      sp, sp, #0x1e0
   0xffff000050fcad58: ldp      x20, x19, [sp, #0x20]
   0xffff000050fcad5c: ldp      x28, x21, [sp, #0x10]
   0xffff000050fcad60: ldp      x29, x30, [sp], #0x30
   0xffff000050fcad64: ret      
   0xffff000050fcad68: adrp     x1, #0xffff000050ff3000
   0xffff000050fcad6c: mov      w0, wzr
   0xffff000050fcad70: add      x1, x1, #0xf3a
   0xffff000050fcad74: mov      w2, #0xa
   0xffff000050fcad78: mov      w3, wzr
   0xffff000050fcad7c: mov      w4, #0xa
   0xffff000050fcad80: mov      w5, #2
   0xffff000050fcad84: mov      w20, #2
   0xffff000050fcad88: bl       #0xffff000050f29978
   0xffff000050fcad8c: adrp     x1, #0xffff000050fe7000
   0xffff000050fcad90: ldrh     w2, [x19, #4]
   0xffff000050fcad94: ldrh     w3, [x19, #6]
   0xffff000050fcad98: add      x1, x1, #0x36e
   0xffff000050fcad9c: mov      w0, wzr
   0xffff000050fcada0: bl       #0xffff000050f29978
   0xffff000050fcada4: ldrh     w8, [x19, #6]
   0xffff000050fcada8: mov      w10, #1
   0xffff000050fcadac: ldrh     w9, [x19, #4]
   0xffff000050fcadb0: movk     w10, #0xa, lsl #16
   0xffff000050fcadb4: bfi      w8, w9, #0x10, #0x10
   0xffff000050fcadb8: add      w9, w10, #1
   0xffff000050fcadbc: cmp      w8, w9
   0xffff000050fcadc0: cinc     w0, w20, ls
   0xffff000050fcadc4: b        #0xffff000050fcad54
   0xffff000050fcadc8: ldr      w11, [x19, #8]
   0xffff000050fcadcc: mov      w0, wzr
   0xffff000050fcadd0: cmp      w11, w10
   0xffff000050fcadd4: b.ne     #0xffff000050fcad54
   0xffff000050fcadd8: cmp      w11, w8
   0xffff000050fcaddc: b.hi     #0xffff000050fcad54
   0xffff000050fcade0: ldr      w11, [x19, #0x2c]
   0xffff000050fcade4: mov      w0, wzr
   0xffff000050fcade8: cmp      w11, w8
   0xffff000050fcadec: b.hi     #0xffff000050fcad54
   0xffff000050fcadf0: add      w12, w11, w10
   0xffff000050fcadf4: cmp      w12, w8
   0xffff000050fcadf8: b.hi     #0xffff000050fcad54
   0xffff000050fcadfc: ldr      w12, [x19, #0x58]
   0xffff000050fcae00: cmp      w12, #0x34
   0xffff000050fcae04: b.ne     #0xffff000050fcad50
   0xffff000050fcae08: ldr      w12, [x19, #0x64]
   0xffff000050fcae0c: cmp      w12, #0x18
   0xffff000050fcae10: b.ne     #0xffff000050fcad50
   0xffff000050fcae14: ldr      w12, [x19, #0x70]
   0xffff000050fcae18: cmp      w12, #0x30
   0xffff000050fcae1c: b.ne     #0xffff000050fcad50
   0xffff000050fcae20: ldr      w12, [x19, #0x7c]
   0xffff000050fcae24: cmp      w12, #0x40
   0xffff000050fcae28: b.ne     #0xffff000050fcad50
   0xffff000050fcae2c: mov      w13, #0xec4f
   0xffff000050fcae30: ldr      w12, [x19, #0x54]
   0xffff000050fcae34: movk     w13, #0x4ec4, lsl #16
   0xffff000050fcae38: umull    x13, w8, w13
   0xffff000050fcae3c: lsr      x13, x13, #0x24
   0xffff000050fcae40: cmp      w13, w12
   0xffff000050fcae44: b.lo     #0xffff000050fcad50
   0xffff000050fcae48: mov      w13, #0xaaab
   0xffff000050fcae4c: ldr      w14, [x19, #0x60]
   0xffff000050fcae50: movk     w13, #0xaaaa, lsl #16
   0xffff000050fcae54: umull    x13, w8, w13
   0xffff000050fcae58: lsr      x15, x13, #0x24
   0xffff000050fcae5c: cmp      w15, w14
   0xffff000050fcae60: b.lo     #0xffff000050fcad50
   0xffff000050fcae64: ldr      w14, [x19, #0x6c]
   0xffff000050fcae68: lsr      x13, x13, #0x25
   0xffff000050fcae6c: cmp      w13, w14
   0xffff000050fcae70: b.lo     #0xffff000050fcad50
   0xffff000050fcae74: str      w9, [sp, #0xc]
   0xffff000050fcae78: ldr      w9, [x19, #0x78]
   0xffff000050fcae7c: stp      x2, x10, [sp, #0x10]
   0xffff000050fcae80: cmp      w9, w8, lsr #6
   0xffff000050fcae84: b.hi     #0xffff000050fcad50
   0xffff000050fcae88: add      x8, x19, #0x50
   0xffff000050fcae8c: mov      w0, wzr
   0xffff000050fcae90: ldr      w9, [x8]
   0xffff000050fcae94: cmp      w9, w11
   0xffff000050fcae98: b.hi     #0xffff000050fcad54
   0xffff000050fcae9c: mov      w10, #0x34
   0xffff000050fcaea0: madd     w9, w12, w10, w9
   0xffff000050fcaea4: cmp      w9, w11
   0xffff000050fcaea8: b.hi     #0xffff000050fcad54
   0xffff000050fcaeac: ldp      x9, x10, [x8, #0x10]
   0xffff000050fcaeb0: add      x0, sp, #0xb0
   0xffff000050fcaeb4: ldp      x11, x12, [x8, #0x20]
   0xffff000050fcaeb8: stp      x9, x10, [sp, #0xc0]
   0xffff000050fcaebc: ldp      x9, x8, [x8]
   0xffff000050fcaec0: stp      x11, x12, [sp, #0xd0]
   0xffff000050fcaec4: stp      x9, x8, [sp, #0xb0]
   0xffff000050fcaec8: bl       #0xffff000050fcb054
   0xffff000050fcaecc: tbz      w0, #0, #0xffff000050fcad50
   0xffff000050fcaed0: ldr      x20, [sp, #0x18]
   0xffff000050fcaed4: add      x0, sp, #0xe0
   0xffff000050fcaed8: mov      x1, x19
   0xffff000050fcaedc: add      x21, sp, #0xe0
   0xffff000050fcaee0: mov      x2, x20
   0xffff000050fcaee4: bl       #0xffff000050f8def4
   0xffff000050fcaee8: add      x0, sp, #0x20
   0xffff000050fcaeec: stur     xzr, [x21, #0xc]
   0xffff000050fcaef0: stur     xzr, [x21, #0x14]
   0xffff000050fcaef4: stur     xzr, [x21, #0x1c]
   0xffff000050fcaef8: stur     xzr, [x21, #0x24]
   0xffff000050fcaefc: bl       #0xffff000050fca6e0
   0xffff000050fcaf00: add      x0, sp, #0x20
   0xffff000050fcaf04: add      x1, sp, #0xe0
   0xffff000050fcaf08: mov      w2, w20
   0xffff000050fcaf0c: bl       #0xffff000050fca738
   0xffff000050fcaf10: add      x0, sp, #0x20
   0xffff000050fcaf14: bl       #0xffff000050fca924
   0xffff000050fcaf18: ldp      x10, x9, [x0, #0x10]
   0xffff000050fcaf1c: ldp      x12, x11, [x0]
   0xffff000050fcaf20: ldur     x8, [x19, #0xc]
   0xffff000050fcaf24: ldur     x13, [x19, #0x14]
   0xffff000050fcaf28: stp      x10, x9, [sp, #0xa0]
   0xffff000050fcaf2c: ldur     x14, [x19, #0x1c]
   0xffff000050fcaf30: ldur     x15, [x19, #0x24]
   0xffff000050fcaf34: eor      x8, x12, x8
   0xffff000050fcaf38: eor      x13, x11, x13
   0xffff000050fcaf3c: stp      x12, x11, [sp, #0x90]
   0xffff000050fcaf40: eor      x14, x10, x14
   0xffff000050fcaf44: orr      x8, x8, x13
   0xffff000050fcaf48: eor      x15, x9, x15
   0xffff000050fcaf4c: orr      x13, x14, x15
   0xffff000050fcaf50: orr      x8, x8, x13
   0xffff000050fcaf54: cbz      x8, #0xffff000050fcaf74
   0xffff000050fcaf58: adrp     x1, #0xffff000050ff8000
   0xffff000050fcaf5c: add      x1, x1, #0x641
   0xffff000050fcaf60: adrp     x2, #0xffff000050fdf000
   0xffff000050fcaf64: mov      w0, wzr
>> 0xffff000050fcaf68: add      x2, x2, #0x7c8
   0xffff000050fcaf6c: bl       #0xffff000050f29978
   0xffff000050fcaf70: b        #0xffff000050fcad50
   0xffff000050fcaf74: ldr      w8, [x19, #0x2c]
   0xffff000050fcaf78: cbz      w8, #0xffff000050fcafd4
   0xffff000050fcaf7c: ldr      x9, [sp, #0x10]
   0xffff000050fcaf80: ldr      w3, [x9]
   0xffff000050fcaf84: cmp      w3, #0x100
   0xffff000050fcaf88: b.eq     #0xffff000050fcafd4
   0xffff000050fcaf8c: cmp      w3, #0x80
   0xffff000050fcaf90: b.ne     #0xffff000050fcafa8
   0xffff000050fcaf94: ldr      w9, [sp, #0xc]
   0xffff000050fcaf98: mov      w10, #1
   0xffff000050fcaf9c: movk     w10, #0xa, lsl #16
   0xffff000050fcafa0: cmp      w9, w10
   0xffff000050fcafa4: b.ls     #0xffff000050fcafd4
   0xffff000050fcafa8: ldr      x9, [sp, #0x18]
   0xffff000050fcafac: add      w4, w8, w9
   0xffff000050fcafb0: cmp      w3, w4
   0xffff000050fcafb4: b.hs     #0xffff000050fcafe4
   0xffff000050fcafb8: adrp     x1, #0xffff000050ff0000
   0xffff000050fcafbc: adrp     x2, #0xffff000050fdf000
   0xffff000050fcafc0: add      x1, x1, #0xce1
   0xffff000050fcafc4: add      x2, x2, #0x7c8
   0xffff000050fcafc8: mov      w0, wzr
   0xffff000050fcafcc: bl       #0xffff000050f29978
   0xffff000050fcafd0: b        #0xffff000050fcad50
   0xffff000050fcafd4: ldp      x8, x9, [sp, #0x10]
   0xffff000050fcafd8: mov      w0, #1
   0xffff000050fcafdc: str      w9, [x8]
   0xffff000050fcafe0: b        #0xffff000050fcad54
   0xffff000050fcafe4: add      x0, sp, #0x20
   0xffff000050fcafe8: bl       #0xffff000050fca6e0
   0xffff000050fcafec: ldr      x8, [sp, #0x18]
   0xffff000050fcaff0: add      x0, sp, #0x20
   0xffff000050fcaff4: ldr      w2, [x19, #0x2c]
   0xffff000050fcaff8: add      x1, x19, x8
   0xffff000050fcaffc: bl       #0xffff000050fca738
   0xffff000050fcb000: add      x0, sp, #0x20
   0xffff000050fcb004: bl       #0xffff000050fca924
   0xffff000050fcb008: ldp      x8, x13, [x19, #0x30]
   0xffff000050fcb00c: ldp      x10, x9, [x0, #0x10]
   0xffff000050fcb010: ldp      x12, x11, [x0]
   0xffff000050fcb014: ldp      x14, x15, [x19, #0x40]
   0xffff000050fcb018: stp      x10, x9, [sp, #0xa0]
   0xffff000050fcb01c: eor      x8, x12, x8
   0xffff000050fcb020: eor      x13, x11, x13
   0xffff000050fcb024: stp      x12, x11, [sp, #0x90]
   0xffff000050fcb028: eor      x14, x10, x14
   0xffff000050fcb02c: orr      x8, x8, x13
   0xffff000050fcb030: eor      x15, x9, x15
   0xffff000050fcb034: orr      x13, x14, x15
   0xffff000050fcb038: orr      x8, x8, x13
   0xffff000050fcb03c: cbz      x8, #0xffff000050fcb04c
   0xffff000050fcb040: adrp     x1, #0xffff000050fdc000
   0xffff000050fcb044: add      x1, x1, #0xb6
   0xffff000050fcb048: b        #0xffff000050fcaf60
   0xffff000050fcb04c: mov      w0, #1
   0xffff000050fcb050: b        #0xffff000050fcad54
   0xffff000050fcb054: sub      sp, sp, #0x10
   0xffff000050fcb058: cbz      x0, #0xffff000050fcb208
   0xffff000050fcb05c: mov      x9, x0
   0xffff000050fcb060: ldr      w8, [x0]
   0xffff000050fcb064: ldr      w10, [x9, #0xc]!
   0xffff000050fcb068: cmp      w10, w8
   0xffff000050fcb06c: b.hs     #0xffff000050fcb098
   0xffff000050fcb070: ldr      x8, [x9]
   0xffff000050fcb074: ldr      w10, [x9, #8]
   0xffff000050fcb078: ldr      x11, [x0]
   0xffff000050fcb07c: ldr      w12, [x0, #8]
   0xffff000050fcb080: str      x8, [sp]
   0xffff000050fcb084: str      w10, [sp, #8]
   0xffff000050fcb088: str      x11, [x9]
   0xffff000050fcb08c: str      w12, [x9, #8]
   0xffff000050fcb090: str      x8, [x0]
   0xffff000050fcb094: str      w10, [x0, #8]
   0xffff000050fcb098: mov      x9, x0
   0xffff000050fcb09c: ldr      w10, [x9, #0x18]!
   0xffff000050fcb0a0: cmp      w10, w8
   0xffff000050fcb0a4: b.hs     #0xffff000050fcb0d0
   0xffff000050fcb0a8: ldr      x8, [x9]
   0xffff000050fcb0ac: ldr      w10, [x9, #8]
   0xffff000050fcb0b0: ldr      x11, [x0]
   0xffff000050fcb0b4: ldr      w12, [x0, #8]
   0xffff000050fcb0b8: str      x8, [sp]
   0xffff000050fcb0bc: str      w10, [sp, #8]
   0xffff000050fcb0c0: str      x11, [x9]
   0xffff000050fcb0c4: str      x8, [x0]
   0xffff000050fcb0c8: str      w12, [x9, #8]
   0xffff000050fcb0cc: str      w10, [x0, #8]
   0xffff000050fcb0d0: mov      x9, x0
   0xffff000050fcb0d4: ldr      w10, [x9, #0x24]!
   0xffff000050fcb0d8: cmp      w10, w8
   0xffff000050fcb0dc: b.hs     #0xffff000050fcb108
   0xffff000050fcb0e0: ldr      x8, [x9]
   0xffff000050fcb0e4: ldr      w10, [x9, #8]
   0xffff000050fcb0e8: ldr      x11, [x0]
   0xffff000050fcb0ec: ldr      w12, [x0, #8]
   0xffff000050fcb0f0: str      x8, [sp]
   0xffff000050fcb0f4: str      w10, [sp, #8]
   0xffff000050fcb0f8: str      x11, [x9]
   0xffff000050fcb0fc: str      w12, [x9, #8]
   0xffff000050fcb100: str      x8, [x0]
   0xffff000050fcb104: str      w10, [x0, #8]
   0xffff000050fcb108: mov      x8, x0
   0xffff000050fcb10c: ldr      w9, [x8, #0xc]!
   0xffff000050fcb110: mov      x10, x8
   0xffff000050fcb114: ldr      w11, [x10, #0xc]!
   0xffff000050fcb118: cmp      w11, w9
   0xffff000050fcb11c: b.hs     #0xffff000050fcb148
   0xffff000050fcb120: ldr      x9, [x10]
   0xffff000050fcb124: ldr      w11, [x10, #8]
   0xffff000050fcb128: ldr      x12, [x8]
   0xffff000050fcb12c: ldr      w13, [x8, #8]
   0xffff000050fcb130: str      x9, [sp]
   0xffff000050fcb134: str      w11, [sp, #8]
   0xffff000050fcb138: str      x12, [x10]
   0xffff000050fcb13c: str      w13, [x10, #8]
   0xffff000050fcb140: str      x9, [x8]
   0xffff000050fcb144: str      w11, [x8, #8]
   0xffff000050fcb148: mov      x10, x0
   0xffff000050fcb14c: ldr      w11, [x10, #0x24]!
   0xffff000050fcb150: cmp      w11, w9
   0xffff000050fcb154: b.hs     #0xffff000050fcb180
   0xffff000050fcb158: ldr      x9, [x10]
   0xffff000050fcb15c: ldr      w11, [x10, #8]
   0xffff000050fcb160: ldr      x12, [x8]
   0xffff000050fcb164: ldr      w13, [x8, #8]
   0xffff000050fcb168: str      x9, [sp]
   0xffff000050fcb16c: str      w11, [sp, #8]
   0xffff000050fcb170: str      x12, [x10]
   0xffff000050fcb174: str      w13, [x10, #8]
   0xffff000050fcb178: str      x9, [x8]
   0xffff000050fcb17c: str      w11, [x8, #8]
   0xffff000050fcb180: mov      x8, x0
   0xffff000050fcb184: ldr      w10, [x8, #0x18]!
   0xffff000050fcb188: mov      x9, x8
   0xffff000050fcb18c: ldr      w11, [x9, #0xc]!
   0xffff000050fcb190: cmp      w11, w10
   0xffff000050fcb194: b.hs     #0xffff000050fcb1c0
   0xffff000050fcb198: ldr      x10, [x9]
   0xffff000050fcb19c: ldr      w11, [x9, #8]
   0xffff000050fcb1a0: ldr      x12, [x8]
   0xffff000050fcb1a4: ldr      w13, [x8, #8]
   0xffff000050fcb1a8: str      x10, [sp]
   0xffff000050fcb1ac: str      w11, [sp, #8]
   0xffff000050fcb1b0: str      x12, [x9]
   0xffff000050fcb1b4: str      w13, [x9, #8]
   0xffff000050fcb1b8: str      x10, [x8]
   0xffff000050fcb1bc: str      w11, [x8, #8]
   0xffff000050fcb1c0: ldp      w9, w10, [x0]
   0xffff000050fcb1c4: ldp      w11, w8, [x0, #8]
   0xffff000050fcb1c8: madd     w9, w11, w10, w9
   0xffff000050fcb1cc: cmp      w9, w8
   0xffff000050fcb1d0: b.hi     #0xffff000050fcb1e8
   0xffff000050fcb1d4: ldp      w10, w11, [x0, #0x10]
   0xffff000050fcb1d8: ldr      w9, [x0, #0x18]
   0xffff000050fcb1dc: madd     w8, w11, w10, w8
   0xffff000050fcb1e0: cmp      w8, w9
   0xffff000050fcb1e4: b.ls     #0xffff000050fcb1f4
   0xffff000050fcb1e8: mov      w0, wzr
   0xffff000050fcb1ec: add      sp, sp, #0x10
   0xffff000050fcb1f0: ret      
