; flow candidate 0xffff000050f91ea4-0xffff000050f923c8
; score: 5
; matched targets: imei
; calls: 0xffff000050f9b7e8, 0xffff000050f925e4, 0xffff000050f9b7e0, 0xffff000050f9190c, 0xffff000050f90b34, 0xffff000050f9b6fc, 0xffff000050f9b774

   0xffff000050f91ea4: sub      sp, sp, #0x60
   0xffff000050f91ea8: stp      x29, x30, [sp, #0x10]
   0xffff000050f91eac: add      x29, sp, #0x10
   0xffff000050f91eb0: str      x25, [sp, #0x20]
   0xffff000050f91eb4: stp      x24, x23, [sp, #0x30]
   0xffff000050f91eb8: stp      x22, x21, [sp, #0x40]
   0xffff000050f91ebc: stp      x20, x19, [sp, #0x50]
   0xffff000050f91ec0: mov      x21, x0
   0xffff000050f91ec4: adrp     x0, #0xffff000050ffd000
   0xffff000050f91ec8: add      x0, x0, #0xe5
   0xffff000050f91ecc: mov      x23, x6
   0xffff000050f91ed0: mov      x20, x5
   0xffff000050f91ed4: mov      w24, w4
   0xffff000050f91ed8: mov      w25, w3
   0xffff000050f91edc: mov      w19, w2
   0xffff000050f91ee0: mov      x22, x1
   0xffff000050f91ee4: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91ee8: mov      w8, #0xe
   0xffff000050f91eec: strb     w8, [x20]
   0xffff000050f91ef0: ldrb     w8, [x21, #2]
   0xffff000050f91ef4: orr      w8, w8, #2
   0xffff000050f91ef8: cmp      w8, #3
   0xffff000050f91efc: b.ne     #0xffff000050f92188
   0xffff000050f91f00: adrp     x0, #0xffff000050fe2000
   0xffff000050f91f04: add      x0, x0, #0x4b0
   0xffff000050f91f08: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91f0c: adrp     x0, #0xffff000050fee000
   0xffff000050f91f10: add      x0, x0, #0xd2d
   0xffff000050f91f14: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91f18: mov      w8, #0xf
   0xffff000050f91f1c: strb     w8, [x20]
   0xffff000050f91f20: ldrb     w8, [x21, #3]
   0xffff000050f91f24: cmp      w8, #6
   0xffff000050f91f28: b.ne     #0xffff000050f92188
   0xffff000050f91f2c: adrp     x0, #0xffff000050ff7000
   0xffff000050f91f30: add      x0, x0, #0xfea
   0xffff000050f91f34: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91f38: adrp     x0, #0xffff000050ff1000
   0xffff000050f91f3c: add      x0, x0, #0xec3
   0xffff000050f91f40: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91f44: mov      w8, #0x10
   0xffff000050f91f48: strb     w8, [x20]
   0xffff000050f91f4c: ldrh     w8, [x21, #4]
   0xffff000050f91f50: lsl      w8, w8, #0x10
   0xffff000050f91f54: rev      w8, w8
   0xffff000050f91f58: cbnz     w8, #0xffff000050f92188
   0xffff000050f91f5c: adrp     x0, #0xffff000050fd8000
   0xffff000050f91f60: add      x0, x0, #0xf51
   0xffff000050f91f64: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91f68: adrp     x0, #0xffff000050ff5000
   0xffff000050f91f6c: add      x0, x0, #0x455
   0xffff000050f91f70: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f91f74: mov      w8, #0xa
   0xffff000050f91f78: strb     w8, [x20]
   0xffff000050f91f7c: ldrb     w10, [x21, #1]
   0xffff000050f91f80: ldrb     w9, [x21]
   0xffff000050f91f84: mov      w12, w10
   0xffff000050f91f88: bfi      w12, w9, #8, #8
   0xffff000050f91f8c: cmp      w12, #4
   0xffff000050f91f90: b.ne     #0xffff000050f91fa0
   0xffff000050f91f94: mov      w8, wzr
   0xffff000050f91f98: mov      x11, x21
   0xffff000050f91f9c: b        #0xffff000050f9200c

loc_ffff000050f91fa0:
   0xffff000050f91fa0: mvn      w8, w9
   0xffff000050f91fa4: adrp     x11, #0xffff00005101a000
   0xffff000050f91fa8: and      x8, x8, #0xff
   0xffff000050f91fac: add      x11, x11, #0x9a8
   0xffff000050f91fb0: subs     w9, w12, #5
   0xffff000050f91fb4: add      x9, x9, #1
   0xffff000050f91fb8: ldr      w8, [x11, x8, lsl #2]
   0xffff000050f91fbc: eor      w8, w8, #0xffffff
   0xffff000050f91fc0: b.eq     #0xffff000050f91ffc
   0xffff000050f91fc4: and      w13, w8, #0xff
   0xffff000050f91fc8: eor      w10, w13, w10
   0xffff000050f91fcc: ldr      w13, [x11, w10, uxtw #2]
   0xffff000050f91fd0: subs     w10, w12, #6
   0xffff000050f91fd4: eor      w8, w13, w8, lsr #8
   0xffff000050f91fd8: b.eq     #0xffff000050f91ffc
   0xffff000050f91fdc: add      x12, x21, #2

loc_ffff000050f91fe0:
   0xffff000050f91fe0: ldrb     w13, [x12], #1
   0xffff000050f91fe4: and      w14, w8, #0xff
   0xffff000050f91fe8: subs     w10, w10, #1
   0xffff000050f91fec: eor      w13, w14, w13
   0xffff000050f91ff0: ldr      w13, [x11, w13, uxtw #2]
   0xffff000050f91ff4: eor      w8, w13, w8, lsr #8
   0xffff000050f91ff8: b.ne     #0xffff000050f91fe0

loc_ffff000050f91ffc:
   0xffff000050f91ffc: add      x11, x21, x9
   0xffff000050f92000: mvn      w8, w8
   0xffff000050f92004: ldrb     w9, [x11]
   0xffff000050f92008: ldrb     w10, [x11, #1]

loc_ffff000050f9200c:
   0xffff000050f9200c: ldrb     w12, [x11, #2]
   0xffff000050f92010: lsl      w10, w10, #0x10
   0xffff000050f92014: ldrb     w11, [x11, #3]
   0xffff000050f92018: bfi      w10, w9, #0x18, #8
   0xffff000050f9201c: bfi      w10, w12, #8, #8
   0xffff000050f92020: orr      w9, w10, w11
   0xffff000050f92024: cmp      w9, w8
   0xffff000050f92028: b.ne     #0xffff000050f92188
   0xffff000050f9202c: adrp     x0, #0xffff000050fd6000
   0xffff000050f92030: add      x0, x0, #0xcf
   0xffff000050f92034: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f92038: adrp     x0, #0xffff000050fe3000
   0xffff000050f9203c: mov      w8, #6
   0xffff000050f92040: add      x0, x0, #0xd89
   0xffff000050f92044: strb     w8, [x20]
   0xffff000050f92048: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f9204c: cmp      w25, #0xf
   0xffff000050f92050: b.ne     #0xffff000050f92060
   0xffff000050f92054: adrp     x0, #0xffff000050fee000
   0xffff000050f92058: add      x0, x0, #0xd48
   0xffff000050f9205c: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8

loc_ffff000050f92060:
   0xffff000050f92060: ldrb     w8, [x21, #0x46]
   0xffff000050f92064: cbnz     w8, #0xffff000050f920b0
   0xffff000050f92068: ldrb     w8, [x21, #0x47]
   0xffff000050f9206c: cmp      w8, #8
   0xffff000050f92070: b.ne     #0xffff000050f920b0
   0xffff000050f92074: add      x0, x29, #0x18
   0xffff000050f92078: bl       #0xffff000050f925e4  ; call 0xffff000050f925e4
   0xffff000050f9207c: cmp      w0, #0xf
   0xffff000050f92080: b.ne     #0xffff000050f92188
   0xffff000050f92084: adrp     x0, #0xffff000050ff0000
; XREF string 0xffff000050ff06ac: 'imei' -> 'Checking SigRsp IMEI - comparing serial number data data'
>> 0xffff000050f92088: add      x0, x0, #0x6ac
   0xffff000050f9208c: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f92090: add      x0, x21, #0x48
   0xffff000050f92094: add      x1, x29, #0x18
   0xffff000050f92098: mov      w2, #8
   0xffff000050f9209c: bl       #0xffff000050f9b7e0  ; call 0xffff000050f9b7e0
   0xffff000050f920a0: cbz      w0, #0xffff000050f921a8

loc_ffff000050f920a4:
   0xffff000050f920a4: adrp     x0, #0xffff000050ffe000
; XREF string 0xffff000050ffe920: 'imei' -> 'FIX ME ! Ignoring IMEI check error'
>> 0xffff000050f920a8: add      x0, x0, #0x920
   0xffff000050f920ac: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8

loc_ffff000050f920b0:
   0xffff000050f920b0: adrp     x0, #0xffff000050fed000
; XREF string 0xffff000050fed536: 'imei' -> 'Checking SigRsp IMEI - Success'
>> 0xffff000050f920b4: add      x0, x0, #0x536
   0xffff000050f920b8: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f920bc: add      x5, x29, #0x18
   0xffff000050f920c0: sub      x6, x29, #4
   0xffff000050f920c4: add      x7, sp, #8
   0xffff000050f920c8: mov      x0, x21
   0xffff000050f920cc: mov      w1, w25
   0xffff000050f920d0: mov      w2, w24
   0xffff000050f920d4: mov      w3, w19
   0xffff000050f920d8: mov      x4, x23
   0xffff000050f920dc: str      x20, [sp]
   0xffff000050f920e0: bl       #0xffff000050f9190c  ; call 0xffff000050f9190c
   0xffff000050f920e4: cmp      w0, #0xf
   0xffff000050f920e8: b.ne     #0xffff000050f92188
   0xffff000050f920ec: adrp     x0, #0xffff000050fea000
   0xffff000050f920f0: mov      w8, #0xc
   0xffff000050f920f4: add      x0, x0, #0x118
   0xffff000050f920f8: strb     w8, [x20]
   0xffff000050f920fc: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f92100: and      w8, w24, #0xffff
   0xffff000050f92104: ldr      x3, [x29, #0x18]
   0xffff000050f92108: cmp      w8, #1
   0xffff000050f9210c: ldur     w0, [x29, #-4]
   0xffff000050f92110: csetm    w8, hi
   0xffff000050f92114: ldr      w4, [sp, #8]
   0xffff000050f92118: sub      w8, w8, w21
   0xffff000050f9211c: mov      x1, x21
   0xffff000050f92120: add      w2, w8, w3
   0xffff000050f92124: mov      x5, x23
   0xffff000050f92128: bl       #0xffff000050f90b34  ; call 0xffff000050f90b34
   0xffff000050f9212c: cmp      w0, #0xf
   0xffff000050f92130: b.ne     #0xffff000050f92188
   0xffff000050f92134: adrp     x0, #0xffff000050fd4000
   0xffff000050f92138: mov      w8, #7
   0xffff000050f9213c: add      x0, x0, #0x791
   0xffff000050f92140: strb     w8, [x20]
   0xffff000050f92144: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f92148: add      x0, x21, #0x88
   0xffff000050f9214c: mov      x1, x22
   0xffff000050f92150: mov      w2, #0x10
   0xffff000050f92154: bl       #0xffff000050f9b7e0  ; call 0xffff000050f9b7e0
   0xffff000050f92158: mov      w8, w0
   0xffff000050f9215c: mov      w0, #0x55
   0xffff000050f92160: cbnz     w8, #0xffff000050f9218c
   0xffff000050f92164: mov      w8, #9
   0xffff000050f92168: strb     w8, [x20]
   0xffff000050f9216c: ldrh     w8, [x21, #0x98]
   0xffff000050f92170: lsl      w8, w8, #0x10
   0xffff000050f92174: rev      w8, w8
   0xffff000050f92178: cmp      w8, w19, uxth
   0xffff000050f9217c: mov      w8, #0xf
   0xffff000050f92180: csel     w0, w8, w0, eq
   0xffff000050f92184: b        #0xffff000050f9218c

loc_ffff000050f92188:
   0xffff000050f92188: mov      w0, #0x55

loc_ffff000050f9218c:
   0xffff000050f9218c: ldp      x20, x19, [sp, #0x50]
   0xffff000050f92190: ldp      x22, x21, [sp, #0x40]
   0xffff000050f92194: ldp      x24, x23, [sp, #0x30]
   0xffff000050f92198: ldp      x29, x30, [sp, #0x10]
   0xffff000050f9219c: ldr      x25, [sp, #0x20]
   0xffff000050f921a0: add      sp, sp, #0x60
   0xffff000050f921a4: ret      

loc_ffff000050f921a8:
   0xffff000050f921a8: adrp     x0, #0xffff000050ff5000
; XREF string 0xffff000050ff5469: 'imei' -> 'Checking SigRsp IMEI - checking zero padding of remaining IMEI bytes'
>> 0xffff000050f921ac: add      x0, x0, #0x469
   0xffff000050f921b0: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f921b4: mov      x8, xzr
   0xffff000050f921b8: add      x9, x21, #0x50

loc_ffff000050f921bc:
   0xffff000050f921bc: ldrb     w10, [x9, x8]
   0xffff000050f921c0: cbnz     w10, #0xffff000050f920a4
   0xffff000050f921c4: add      x8, x8, #1
   0xffff000050f921c8: cmp      x8, #0x38
   0xffff000050f921cc: b.ne     #0xffff000050f921bc
   0xffff000050f921d0: b        #0xffff000050f920b0
   0xffff000050f921d4: sub      sp, sp, #0x50
   0xffff000050f921d8: stp      x29, x30, [sp, #0x10]
   0xffff000050f921dc: add      x29, sp, #0x10
   0xffff000050f921e0: stp      x24, x23, [sp, #0x20]
   0xffff000050f921e4: stp      x22, x21, [sp, #0x30]
   0xffff000050f921e8: stp      x20, x19, [sp, #0x40]
   0xffff000050f921ec: mov      x19, x3
   0xffff000050f921f0: mov      x20, x2
   0xffff000050f921f4: mov      w21, w1
   0xffff000050f921f8: mov      w23, w0
   0xffff000050f921fc: mov      w24, #1
   0xffff000050f92200: mov      w22, #0x55
   0xffff000050f92204: cmp      w0, #0xa9
   0xffff000050f92208: b.gt     #0xffff000050f92224
   0xffff000050f9220c: cmp      w23, #0xf
   0xffff000050f92210: b.eq     #0xffff000050f9224c
   0xffff000050f92214: cmp      w23, #0x33
   0xffff000050f92218: b.ne     #0xffff000050f923a8
   0xffff000050f9221c: mov      w8, #0x16c
   0xffff000050f92220: b        #0xffff000050f92268

loc_ffff000050f92224:
   0xffff000050f92224: cmp      w23, #0xaa
   0xffff000050f92228: b.eq     #0xffff000050f92264
   0xffff000050f9222c: cmp      w23, #0xf0
   0xffff000050f92230: b.ne     #0xffff000050f923a8
   0xffff000050f92234: and      w8, w21, #0xffff
   0xffff000050f92238: mov      w9, #0x70
   0xffff000050f9223c: cmp      w8, #2
   0xffff000050f92240: mov      w8, #0x62
   0xffff000050f92244: csel     w8, w9, w8, eq
   0xffff000050f92248: b        #0xffff000050f92268

loc_ffff000050f9224c:
   0xffff000050f9224c: and      w8, w21, #0xffff
   0xffff000050f92250: mov      w9, #0x46
   0xffff000050f92254: cmp      w8, #2
   0xffff000050f92258: mov      w8, #0x44
   0xffff000050f9225c: csel     w8, w9, w8, eq
   0xffff000050f92260: b        #0xffff000050f92268

loc_ffff000050f92264:
   0xffff000050f92264: mov      w8, #0x28

loc_ffff000050f92268:
   0xffff000050f92268: adrp     x0, #0xffff000050fe6000
   0xffff000050f9226c: lsr      w9, w23, #8
   0xffff000050f92270: lsr      w10, w8, #8
   0xffff000050f92274: lsr      w11, w21, #8
   0xffff000050f92278: strb     w8, [x20, #7]
   0xffff000050f9227c: mov      w8, #0x10
   0xffff000050f92280: add      x0, x0, #0xc2f
   0xffff000050f92284: strb     w23, [x20, #1]
   0xffff000050f92288: strh     wzr, [x20, #4]
   0xffff000050f9228c: strb     w9, [x20]
   0xffff000050f92290: strb     w10, [x20, #6]
   0xffff000050f92294: strb     w11, [x20, #2]
   0xffff000050f92298: strb     w21, [x20, #3]
   0xffff000050f9229c: stur     w8, [x29, #-4]
   0xffff000050f922a0: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f922a4: adrp     x8, #0xffff000051106000
   0xffff000050f922a8: add      x22, x20, #8
   0xffff000050f922ac: ldrb     w8, [x8, #0x8b4]
   0xffff000050f922b0: cmp      w8, #1
   0xffff000050f922b4: b.ne     #0xffff000050f922f0
   0xffff000050f922b8: cmp      w23, #0x33
   0xffff000050f922bc: b.eq     #0xffff000050f922c8
   0xffff000050f922c0: cmp      w23, #0xf
   0xffff000050f922c4: b.ne     #0xffff000050f922f0

loc_ffff000050f922c8:
   0xffff000050f922c8: adrp     x0, #0xffff000050fd0000
; XREF string 0xffff000050fd0068: 'imei' -> 'Using ALT IMEI UID'
>> 0xffff000050f922cc: add      x0, x0, #0x68
   0xffff000050f922d0: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f922d4: adrp     x9, #0xffff000051106000
   0xffff000050f922d8: mov      w8, #0x10
   0xffff000050f922dc: add      x9, x9, #0x8a2
   0xffff000050f922e0: stur     w8, [x29, #-4]
   0xffff000050f922e4: ldp      x10, x9, [x9]
   0xffff000050f922e8: stp      x10, x9, [x22]
   0xffff000050f922ec: b        #0xffff000050f92310

loc_ffff000050f922f0:
   0xffff000050f922f0: sub      x1, x29, #4
   0xffff000050f922f4: mov      x0, x22
   0xffff000050f922f8: bl       #0xffff000050f9b6fc  ; call 0xffff000050f9b6fc
   0xffff000050f922fc: cmp      w0, #0xf
   0xffff000050f92300: b.ne     #0xffff000050f92368
   0xffff000050f92304: ldur     w8, [x29, #-4]
   0xffff000050f92308: cmp      w8, #0x10
   0xffff000050f9230c: b.ne     #0xffff000050f92380

loc_ffff000050f92310:
   0xffff000050f92310: adrp     x0, #0xffff000050fe6000
   0xffff000050f92314: add      x0, x0, #0xc5f
   0xffff000050f92318: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8
   0xffff000050f9231c: mov      w8, #0x10
   0xffff000050f92320: add      x0, x20, #0x18
   0xffff000050f92324: sub      x1, x29, #4
   0xffff000050f92328: stur     w8, [x29, #-4]
   0xffff000050f9232c: bl       #0xffff000050f9b774  ; call 0xffff000050f9b774
   0xffff000050f92330: cmp      w0, #0xf
   0xffff000050f92334: b.ne     #0xffff000050f92374
   0xffff000050f92338: ldur     w8, [x29, #-4]
   0xffff000050f9233c: adrp     x9, #0xffff000050fd8000
   0xffff000050f92340: adrp     x10, #0xffff000050fea000
   0xffff000050f92344: add      x9, x9, #0xf1d
   0xffff000050f92348: add      x10, x10, #0x12b
   0xffff000050f9234c: mov      w11, #0x55
   0xffff000050f92350: cmp      w8, #0x10
   0xffff000050f92354: mov      w8, #0xf
   0xffff000050f92358: csel     x0, x10, x9, eq
   0xffff000050f9235c: csel     w22, w8, w11, eq
   0xffff000050f92360: mov      w24, #4
   0xffff000050f92364: b        #0xffff000050f92390

loc_ffff000050f92368:
   0xffff000050f92368: mov      w22, w0
   0xffff000050f9236c: mov      w24, #3
   0xffff000050f92370: b        #0xffff000050f92394

loc_ffff000050f92374:
   0xffff000050f92374: mov      w22, w0
   0xffff000050f92378: mov      w24, #4
   0xffff000050f9237c: b        #0xffff000050f92394

loc_ffff000050f92380:
   0xffff000050f92380: adrp     x0, #0xffff000050fe2000
   0xffff000050f92384: mov      w24, #3
   0xffff000050f92388: mov      w22, #0x55
   0xffff000050f9238c: add      x0, x0, #0x478

loc_ffff000050f92390:
   0xffff000050f92390: bl       #0xffff000050f9b7e8  ; call 0xffff000050f9b7e8

loc_ffff000050f92394:
   0xffff000050f92394: and      w8, w21, #0xffff
   0xffff000050f92398: cmp      w8, #2
   0xffff000050f9239c: b.lo     #0xffff000050f923a8
   0xffff000050f923a0: mov      w8, #2
   0xffff000050f923a4: strh     w8, [x20, #0x28]

loc_ffff000050f923a8:
   0xffff000050f923a8: cbz      x19, #0xffff000050f923b0
   0xffff000050f923ac: strb     w24, [x19]

loc_ffff000050f923b0:
   0xffff000050f923b0: mov      w0, w22
   0xffff000050f923b4: ldp      x20, x19, [sp, #0x40]
   0xffff000050f923b8: ldp      x22, x21, [sp, #0x30]
   0xffff000050f923bc: ldp      x24, x23, [sp, #0x20]
   0xffff000050f923c0: ldp      x29, x30, [sp, #0x10]
   0xffff000050f923c4: add      sp, sp, #0x50
   0xffff000050f923c8: ret      
