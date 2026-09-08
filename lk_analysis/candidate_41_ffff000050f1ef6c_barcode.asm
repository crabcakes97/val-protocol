; candidate function around xref 0xffff000050f1f228 to 'barcode'
; estimated range 0xffff000050f1ef6c-0xffff000050f1f368

   0xffff000050f1ef6c: stp      x29, x30, [sp, #-0x40]!
   0xffff000050f1ef70: str      x23, [sp, #0x10]
   0xffff000050f1ef74: mov      x29, sp
   0xffff000050f1ef78: stp      x22, x21, [sp, #0x20]
   0xffff000050f1ef7c: stp      x20, x19, [sp, #0x30]
   0xffff000050f1ef80: cbz      w1, #0xffff000050f1f060
   0xffff000050f1ef84: adrp     x20, #0xffff000051055000
   0xffff000050f1ef88: and      w8, w0, #0xffff
   0xffff000050f1ef8c: cmp      w8, #0x115
   0xffff000050f1ef90: ldr      w19, [x20, #0xc40]
   0xffff000050f1ef94: b.eq     #0xffff000050f1eff8
   0xffff000050f1ef98: cmp      w8, #0x1fe
   0xffff000050f1ef9c: b.eq     #0xffff000050f1f050
   0xffff000050f1efa0: cmp      w8, #0x116
   0xffff000050f1efa4: b.ne     #0xffff000050f1f060
   0xffff000050f1efa8: add      w8, w19, #1
   0xffff000050f1efac: and      w8, w8, #7
   0xffff000050f1efb0: cmp      w8, w19
   0xffff000050f1efb4: b.eq     #0xffff000050f1f0d8
   0xffff000050f1efb8: adrp     x22, #0xffff000051023000
   0xffff000050f1efbc: mov      w21, #0x18
   0xffff000050f1efc0: mov      w19, w8
   0xffff000050f1efc4: add      x22, x22, #0x888
   0xffff000050f1efc8: bl       #0xffff000050f02a20
   0xffff000050f1efcc: tbz      w0, #0, #0xffff000050f1f0d4
   0xffff000050f1efd0: umaddl   x8, w19, w21, x22
   0xffff000050f1efd4: ldrb     w8, [x8, #0x10]
   0xffff000050f1efd8: cbnz     w8, #0xffff000050f1f0d4
   0xffff000050f1efdc: ldr      w8, [x20, #0xc40]
   0xffff000050f1efe0: add      w9, w19, #1
   0xffff000050f1efe4: and      w19, w9, #7
   0xffff000050f1efe8: cmp      w19, w8
   0xffff000050f1efec: b.ne     #0xffff000050f1efc8
   0xffff000050f1eff0: mov      w19, w8
   0xffff000050f1eff4: b        #0xffff000050f1f0d8
   0xffff000050f1eff8: sub      w8, w19, #1
   0xffff000050f1effc: cmp      w19, #0
   0xffff000050f1f000: mov      w21, #7
   0xffff000050f1f004: csel     w8, w21, w8, eq
   0xffff000050f1f008: cmp      w8, w19
   0xffff000050f1f00c: b.eq     #0xffff000050f1f0d8
   0xffff000050f1f010: adrp     x23, #0xffff000051023000
   0xffff000050f1f014: mov      w22, #0x18
   0xffff000050f1f018: mov      w19, w8
   0xffff000050f1f01c: add      x23, x23, #0x888
   0xffff000050f1f020: bl       #0xffff000050f02a20
   0xffff000050f1f024: tbz      w0, #0, #0xffff000050f1f0d4
   0xffff000050f1f028: smaddl   x8, w19, w22, x23
   0xffff000050f1f02c: ldrb     w8, [x8, #0x10]
   0xffff000050f1f030: cbnz     w8, #0xffff000050f1f0d4
   0xffff000050f1f034: ldr      w8, [x20, #0xc40]
   0xffff000050f1f038: sub      w9, w19, #1
   0xffff000050f1f03c: cmp      w19, #0
   0xffff000050f1f040: csel     w19, w21, w9, eq
   0xffff000050f1f044: cmp      w19, w8
   0xffff000050f1f048: b.ne     #0xffff000050f1f020
   0xffff000050f1f04c: b        #0xffff000050f1f0d8
   0xffff000050f1f050: bl       #0xffff000050f44688
   0xffff000050f1f054: tbz      w0, #0, #0xffff000050f1f074
   0xffff000050f1f058: bl       #0xffff000050f446ec
   0xffff000050f1f05c: tbz      w0, #0, #0xffff000050f1f074
   0xffff000050f1f060: ldp      x20, x19, [sp, #0x30]
   0xffff000050f1f064: ldp      x22, x21, [sp, #0x20]
   0xffff000050f1f068: ldr      x23, [sp, #0x10]
   0xffff000050f1f06c: ldp      x29, x30, [sp], #0x40
   0xffff000050f1f070: ret      
   0xffff000050f1f074: sxtw     x8, w19
   0xffff000050f1f078: mov      w9, #0x18
   0xffff000050f1f07c: mov      w11, #0x1ffffff
   0xffff000050f1f080: mul      x10, x8, x9
   0xffff000050f1f084: adrp     x9, #0xffff000051023000
   0xffff000050f1f088: add      x9, x9, #0x888
   0xffff000050f1f08c: ldr      w10, [x9, x10]
   0xffff000050f1f090: cmp      w10, w11
   0xffff000050f1f094: b.le     #0xffff000050f1f1bc
   0xffff000050f1f098: mov      w11, #0x2000000
   0xffff000050f1f09c: cmp      w10, w11
   0xffff000050f1f0a0: b.eq     #0xffff000050f1f210
   0xffff000050f1f0a4: mov      w11, #0x10000000
   0xffff000050f1f0a8: cmp      w10, w11
   0xffff000050f1f0ac: b.eq     #0xffff000050f1f238
   0xffff000050f1f0b0: mov      w11, #0x20000000
   0xffff000050f1f0b4: cmp      w10, w11
   0xffff000050f1f0b8: b.ne     #0xffff000050f1f2a4
   0xffff000050f1f0bc: adrp     x8, #0xffff000051055000
   0xffff000050f1f0c0: mov      w0, #0x10000
   0xffff000050f1f0c4: ldrb     w9, [x8, #0x5c0]
   0xffff000050f1f0c8: eor      w9, w9, #1
   0xffff000050f1f0cc: strb     w9, [x8, #0x5c0]
   0xffff000050f1f0d0: b        #0xffff000050f1f200
   0xffff000050f1f0d4: str      w19, [x20, #0xc40]
   0xffff000050f1f0d8: mov      w8, #0x18
   0xffff000050f1f0dc: adrp     x9, #0xffff000051023000
   0xffff000050f1f0e0: add      x9, x9, #0x888
   0xffff000050f1f0e4: smull    x8, w19, w8
   0xffff000050f1f0e8: ldr      w8, [x9, x8]
   0xffff000050f1f0ec: mov      w9, #0x10000000
   0xffff000050f1f0f0: cmp      w8, w9
   0xffff000050f1f0f4: b.ne     #0xffff000050f1f134
   0xffff000050f1f0f8: adrp     x8, #0xffff000051055000
   0xffff000050f1f0fc: mov      w20, #0x2000
   0xffff000050f1f100: movk     w20, #0x1000, lsl #16
   0xffff000050f1f104: ldrb     w9, [x8, #0xc20]
   0xffff000050f1f108: tbnz     w9, #0, #0xffff000050f1f170
   0xffff000050f1f10c: adrp     x9, #0xffff000051055000
   0xffff000050f1f110: mov      w10, #1
   0xffff000050f1f114: add      w11, w20, #0xc01
   0xffff000050f1f118: ldrb     w9, [x9, #0xc44]
   0xffff000050f1f11c: strb     w10, [x8, #0xc20]
   0xffff000050f1f120: cmp      w9, #0
   0xffff000050f1f124: mov      w9, #0xec01
   0xffff000050f1f128: movk     w9, #0x1002, lsl #16
   0xffff000050f1f12c: csel     w20, w9, w11, ne
   0xffff000050f1f130: b        #0xffff000050f1f170
   0xffff000050f1f134: adrp     x9, #0xffff000051055000
   0xffff000050f1f138: ldrb     w10, [x9, #0xc20]
   0xffff000050f1f13c: cmp      w10, #1
   0xffff000050f1f140: b.ne     #0xffff000050f1f16c
   0xffff000050f1f144: adrp     x10, #0xffff000051055000
   0xffff000050f1f148: mov      w11, #0x2bbf
   0xffff000050f1f14c: movk     w11, #3, lsl #16
   0xffff000050f1f150: strb     wzr, [x9, #0xc20]
   0xffff000050f1f154: orr      w12, w11, #0x8000
   0xffff000050f1f158: ldrb     w10, [x10, #0xc44]
   0xffff000050f1f15c: cmp      w10, #0
   0xffff000050f1f160: csel     w10, w12, w11, ne
   0xffff000050f1f164: orr      w20, w10, w8
   0xffff000050f1f168: b        #0xffff000050f1f170
   0xffff000050f1f16c: orr      w20, w8, #0x2000
   0xffff000050f1f170: adrp     x19, #0xffff000051055000
   0xffff000050f1f174: mov      w1, #-1
   0xffff000050f1f178: add      x19, x19, #0x440
   0xffff000050f1f17c: mov      x0, x19
   0xffff000050f1f180: bl       #0xffff000050f22ee0
   0xffff000050f1f184: adrp     x8, #0xffff000051055000
   0xffff000050f1f188: mov      x0, x19
   0xffff000050f1f18c: ldr      w9, [x8, #0x4f0]
   0xffff000050f1f190: orr      w9, w9, w20
   0xffff000050f1f194: str      w9, [x8, #0x4f0]
   0xffff000050f1f198: bl       #0xffff000050f22f6c
   0xffff000050f1f19c: adrp     x8, #0xffff000051023000
   0xffff000050f1f1a0: mov      w0, #1
   0xffff000050f1f1a4: ldr      x1, [x8, #0x168]
   0xffff000050f1f1a8: ldp      x20, x19, [sp, #0x30]
   0xffff000050f1f1ac: ldp      x22, x21, [sp, #0x20]
   0xffff000050f1f1b0: ldr      x23, [sp, #0x10]
   0xffff000050f1f1b4: ldp      x29, x30, [sp], #0x40
   0xffff000050f1f1b8: br       x1
   0xffff000050f1f1bc: cmp      w10, #0x200, lsl #12
   0xffff000050f1f1c0: b.eq     #0xffff000050f1f290
   0xffff000050f1f1c4: mov      w11, #0x1000000
   0xffff000050f1f1c8: cmp      w10, w11
   0xffff000050f1f1cc: b.ne     #0xffff000050f1f2a4
   0xffff000050f1f1d0: adrp     x8, #0xffff000051055000
   0xffff000050f1f1d4: adrp     x9, #0xffff000051023000
   0xffff000050f1f1d8: mov      w0, #0x200
   0xffff000050f1f1dc: ldrb     w8, [x8, #0x51c]
   0xffff000050f1f1e0: ldr      w10, [x9, #0x33c]
   0xffff000050f1f1e4: cmp      w8, #0
   0xffff000050f1f1e8: mov      w8, #2
   0xffff000050f1f1ec: add      w10, w10, #1
   0xffff000050f1f1f0: cinc     w8, w8, eq
   0xffff000050f1f1f4: sdiv     w11, w10, w8
   0xffff000050f1f1f8: msub     w8, w11, w8, w10
   0xffff000050f1f1fc: str      w8, [x9, #0x33c]
   0xffff000050f1f200: bl       #0xffff000050f1f764
   0xffff000050f1f204: adrp     x8, #0xffff000051023000
   0xffff000050f1f208: mov      w0, wzr
   0xffff000050f1f20c: b        #0xffff000050f1f1a4
   0xffff000050f1f210: adrp     x8, #0xffff000051023000
   0xffff000050f1f214: ldr      x23, [sp, #0x10]
   0xffff000050f1f218: ldp      x20, x19, [sp, #0x30]
   0xffff000050f1f21c: adrp     x0, #0xffff000050fef000
   0xffff000050f1f220: mov      w1, wzr
   0xffff000050f1f224: ldp      x22, x21, [sp, #0x20]
>> 0xffff000050f1f228: add      x0, x0, #0x77c
   0xffff000050f1f22c: ldr      x2, [x8, #0x160]
   0xffff000050f1f230: ldp      x29, x30, [sp], #0x40
   0xffff000050f1f234: br       x2
   0xffff000050f1f238: bl       #0xffff000050f15df0
   0xffff000050f1f23c: tbz      w0, #0, #0xffff000050f1f060
   0xffff000050f1f240: bl       #0xffff000050f158f4
   0xffff000050f1f244: tbz      w0, #0, #0xffff000050f1f060
   0xffff000050f1f248: mov      w0, wzr
   0xffff000050f1f24c: bl       #0xffff000050f1603c
   0xffff000050f1f250: mov      w19, w0
   0xffff000050f1f254: mov      w0, #1
   0xffff000050f1f258: bl       #0xffff000050f1603c
   0xffff000050f1f25c: mov      w20, w0
   0xffff000050f1f260: adrp     x1, #0xffff000050fdc000
   0xffff000050f1f264: add      x1, x1, #0x72e
   0xffff000050f1f268: mov      w0, wzr
   0xffff000050f1f26c: mov      w2, w19
   0xffff000050f1f270: mov      w3, w20
   0xffff000050f1f274: bl       #0xffff000050f29978
   0xffff000050f1f278: cmp      w19, w20
   0xffff000050f1f27c: b.ls     #0xffff000050f1f2fc
   0xffff000050f1f280: adrp     x1, #0xffff000050fec000
   0xffff000050f1f284: mov      w19, wzr
   0xffff000050f1f288: add      x1, x1, #0x8e6
   0xffff000050f1f28c: b        #0xffff000050f1f310
   0xffff000050f1f290: ldp      x20, x19, [sp, #0x30]
   0xffff000050f1f294: ldp      x22, x21, [sp, #0x20]
   0xffff000050f1f298: ldr      x23, [sp, #0x10]
   0xffff000050f1f29c: ldp      x29, x30, [sp], #0x40
   0xffff000050f1f2a0: b        #0xffff000050f17008
   0xffff000050f1f2a4: mov      w10, #0x18
   0xffff000050f1f2a8: madd     x8, x8, x10, x9
   0xffff000050f1f2ac: ldr      x8, [x8, #8]
   0xffff000050f1f2b0: cbz      x8, #0xffff000050f1f060
   0xffff000050f1f2b4: adrp     x0, #0xffff000051023000
   0xffff000050f1f2b8: add      x0, x0, #0x948
   0xffff000050f1f2bc: str      x8, [x0, #0x58]
   0xffff000050f1f2c0: bl       #0xffff000050f15a0c
   0xffff000050f1f2c4: adrp     x8, #0xffff000051023000
   0xffff000050f1f2c8: adrp     x9, #0xffff000051055000
   0xffff000050f1f2cc: add      x9, x9, #0x590
   0xffff000050f1f2d0: ldr      w8, [x8, #0x33c]
   0xffff000050f1f2d4: ldr      x0, [x9, x8, lsl #3]
   0xffff000050f1f2d8: bl       #0xffff000050f02d18
   0xffff000050f1f2dc: ldp      x20, x19, [sp, #0x30]
   0xffff000050f1f2e0: adrp     x0, #0xffff000051052000
   0xffff000050f1f2e4: mov      w1, wzr
   0xffff000050f1f2e8: ldp      x22, x21, [sp, #0x20]
   0xffff000050f1f2ec: add      x0, x0, #0x590
   0xffff000050f1f2f0: ldr      x23, [sp, #0x10]
   0xffff000050f1f2f4: ldp      x29, x30, [sp], #0x40
   0xffff000050f1f2f8: b        #0xffff000050f22db0
   0xffff000050f1f2fc: cmp      w19, w20
   0xffff000050f1f300: b.hs     #0xffff000050f1f320
   0xffff000050f1f304: adrp     x1, #0xffff000050ff8000
   0xffff000050f1f308: mov      w19, #1
   0xffff000050f1f30c: add      x1, x1, #0xbd0
   0xffff000050f1f310: mov      w0, wzr
   0xffff000050f1f314: bl       #0xffff000050f29978
   0xffff000050f1f318: mov      w0, w19
   0xffff000050f1f31c: bl       #0xffff000050f0a990
   0xffff000050f1f320: ldp      x20, x19, [sp, #0x30]
   0xffff000050f1f324: ldp      x22, x21, [sp, #0x20]
   0xffff000050f1f328: ldr      x23, [sp, #0x10]
   0xffff000050f1f32c: ldp      x29, x30, [sp], #0x40
   0xffff000050f1f330: b        #0xffff000050f0aafc
   0xffff000050f1f334: cbz      w1, #0xffff000050f1f368
   0xffff000050f1f338: and      w8, w0, #0xffff
   0xffff000050f1f33c: sub      w9, w8, #0x115
   0xffff000050f1f340: cmp      w9, #2
   0xffff000050f1f344: b.lo     #0xffff000050f1f350
   0xffff000050f1f348: cmp      w8, #0x1fe
   0xffff000050f1f34c: b.ne     #0xffff000050f1f368
   0xffff000050f1f350: adrp     x8, #0xffff000051023000
   0xffff000050f1f354: adrp     x0, #0xffff000050fe5000
   0xffff000050f1f358: add      x0, x0, #0xb88
   0xffff000050f1f35c: mov      w1, wzr
   0xffff000050f1f360: ldr      x2, [x8, #0x160]
   0xffff000050f1f364: br       x2
   0xffff000050f1f368: ret      
