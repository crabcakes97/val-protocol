; flow candidate 0xffff000050f26e54-0xffff000050f273e8
; score: 1
; matched targets: imei
; calls: 0xffff000050f29978, 0xffff000050f273f0, 0xffff000050faec40, 0xffff000050faec80, 0xffff000050faeca4, 0xffff000050f8e214, 0xffff000050f89638, 0xffff000050f89538

   0xffff000050f26e54: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f26e58: ldr      w8, [x27, #0xa78]
   0xffff000050f26e5c: adrp     x25, #0xffff000051058000
   0xffff000050f26e60: mov      w1, #1
   0xffff000050f26e64: add      x0, x23, x8
   0xffff000050f26e68: lsl      w8, w8, #1
   0xffff000050f26e6c: add      x21, x23, x8
   0xffff000050f26e70: mov      x2, x21
   0xffff000050f26e74: str      x0, [x25, #0xa80]
   0xffff000050f26e78: bl       #0xffff000050f273f0  ; call 0xffff000050f273f0
   0xffff000050f26e7c: mov      w28, w0
   0xffff000050f26e80: tbnz     w0, #0, #0xffff000050f26e94
   0xffff000050f26e84: adrp     x1, #0xffff000050fd5000
   0xffff000050f26e88: mov      w0, #-1
   0xffff000050f26e8c: add      x1, x1, #0x3bf
   0xffff000050f26e90: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f26e94:
   0xffff000050f26e94: ldr      x8, [x25, #0xa80]
   0xffff000050f26e98: ldr      x26, [x8, #0x20]
   0xffff000050f26e9c: bl       #0xffff000050faec40  ; call 0xffff000050faec40
   0xffff000050f26ea0: cmp      x26, x0
   0xffff000050f26ea4: b.ne     #0xffff000050f26f30
   0xffff000050f26ea8: bl       #0xffff000050faec40  ; call 0xffff000050faec40
   0xffff000050f26eac: ldr      x8, [x25, #0xa80]
   0xffff000050f26eb0: ldr      x8, [x8, #0x30]
   0xffff000050f26eb4: sub      x0, x0, x8
   0xffff000050f26eb8: b        #0xffff000050f26f38
   0xffff000050f26ebc: adrp     x1, #0xffff000050fd6000
   0xffff000050f26ec0: adrp     x2, #0xffff000050fd3000
   0xffff000050f26ec4: add      x1, x1, #0xc0f
   0xffff000050f26ec8: add      x2, x2, #0x60d
   0xffff000050f26ecc: mov      w0, #-1
   0xffff000050f26ed0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f26ed4: mov      w21, #1
   0xffff000050f26ed8: b        #0xffff000050f27208
   0xffff000050f26edc: adrp     x1, #0xffff000050ff1000
   0xffff000050f26ee0: mov      w0, #-1
   0xffff000050f26ee4: add      x1, x1, #0x1e0
   0xffff000050f26ee8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f26eec: mov      w21, wzr
   0xffff000050f26ef0: mov      w25, wzr
   0xffff000050f26ef4: b        #0xffff000050f271e4
   0xffff000050f26ef8: adrp     x1, #0xffff000050fd8000
   0xffff000050f26efc: add      x1, x1, #0x210
   0xffff000050f26f00: b        #0xffff000050f26f0c
   0xffff000050f26f04: adrp     x1, #0xffff000050ff7000
   0xffff000050f26f08: add      x1, x1, #0x577

loc_ffff000050f26f0c:
   0xffff000050f26f0c: mov      w0, #-1
   0xffff000050f26f10: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f26f14: adrp     x1, #0xffff000050fdf000
   0xffff000050f26f18: mov      w0, #-1
   0xffff000050f26f1c: add      x1, x1, #0xd11
   0xffff000050f26f20: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f26f24: mov      x21, xzr
   0xffff000050f26f28: mov      w28, wzr
   0xffff000050f26f2c: b        #0xffff000050f26f64

loc_ffff000050f26f30:
   0xffff000050f26f30: ldr      x8, [x25, #0xa80]
   0xffff000050f26f34: ldr      x0, [x8, #0x20]

loc_ffff000050f26f38:
   0xffff000050f26f38: bl       #0xffff000050faec80  ; call 0xffff000050faec80
   0xffff000050f26f3c: adrp     x8, #0xffff000050fde000
   0xffff000050f26f40: adrp     x9, #0xffff000050fdf000
   0xffff000050f26f44: add      x8, x8, #0x23a
   0xffff000050f26f48: add      x9, x9, #0xd3e
   0xffff000050f26f4c: tst      w28, #1
   0xffff000050f26f50: adrp     x1, #0xffff000050fff000
   0xffff000050f26f54: csel     x2, x9, x8, ne
   0xffff000050f26f58: add      x1, x1, #0x72d
   0xffff000050f26f5c: mov      w0, #1
   0xffff000050f26f60: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f26f64:
   0xffff000050f26f64: ldr      w25, [x19, #0x38]
   0xffff000050f26f68: adrp     x1, #0xffff000050fd0000
   0xffff000050f26f6c: add      x1, x1, #0x96d
   0xffff000050f26f70: mov      w0, #1
   0xffff000050f26f74: mov      x2, x25
   0xffff000050f26f78: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f26f7c: cbz      w25, #0xffff000050f270cc
   0xffff000050f26f80: str      w28, [sp, #4]
   0xffff000050f26f84: bl       #0xffff000050faeca4  ; call 0xffff000050faeca4
   0xffff000050f26f88: ldr      w27, [x27, #0xa78]
   0xffff000050f26f8c: add      x26, x0, #1
   0xffff000050f26f90: mov      w1, wzr
   0xffff000050f26f94: mov      w2, #0x8000
   0xffff000050f26f98: add      w8, w27, #4, lsl #12
   0xffff000050f26f9c: udiv     w8, w8, w27
   0xffff000050f26fa0: sub      x28, x25, x8
   0xffff000050f26fa4: cmp      x28, x26
   0xffff000050f26fa8: csinc    x24, x28, x0, ls
   0xffff000050f26fac: mov      x0, x22
   0xffff000050f26fb0: bl       #0xffff000050f8e214  ; call 0xffff000050f8e214
   0xffff000050f26fb4: mul      x2, x24, x27
   0xffff000050f26fb8: mov      x0, x19
   0xffff000050f26fbc: mov      x1, x22
   0xffff000050f26fc0: mov      w3, #0x8000
   0xffff000050f26fc4: bl       #0xffff000050f89638  ; call 0xffff000050f89638
   0xffff000050f26fc8: tbnz     w0, #0x1f, #0xffff000050f27154
   0xffff000050f26fcc: adrp     x9, #0xffff000051058000
   0xffff000050f26fd0: subs     x8, x28, x26
   0xffff000050f26fd4: csel     x8, xzr, x8, lo
   0xffff000050f26fd8: adrp     x26, #0xffff000051058000
   0xffff000050f26fdc: sub      x1, x25, #1
   0xffff000050f26fe0: adrp     x24, #0xffff000051058000
   0xffff000050f26fe4: ldr      w9, [x9, #0xa78]
   0xffff000050f26fe8: mov      x2, x22
   0xffff000050f26fec: str      x22, [x24, #0xa98]
   0xffff000050f26ff0: madd     x8, x8, x9, x22
   0xffff000050f26ff4: add      x0, x8, #4, lsl #12
   0xffff000050f26ff8: str      x0, [x26, #0xa90]
   0xffff000050f26ffc: bl       #0xffff000050f273f0  ; call 0xffff000050f273f0
   0xffff000050f27000: tbz      w0, #0, #0xffff000050f271a0
   0xffff000050f27004: adrp     x1, #0xffff000050fec000
   0xffff000050f27008: adrp     x2, #0xffff000050fdf000
   0xffff000050f2700c: add      x1, x1, #0x97e
   0xffff000050f27010: add      x2, x2, #0xd3e
   0xffff000050f27014: mov      w0, #1
   0xffff000050f27018: mov      w25, #1
   0xffff000050f2701c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f27020: ldr      w8, [sp, #4]
   0xffff000050f27024: tbz      w8, #0, #0xffff000050f2716c
   0xffff000050f27028: adrp     x24, #0xffff000051058000
   0xffff000050f2702c: ldr      x9, [x26, #0xa90]
   0xffff000050f27030: ldr      x8, [x24, #0xa80]
   0xffff000050f27034: ldr      x11, [x9]
   0xffff000050f27038: ldr      x10, [x8]
   0xffff000050f2703c: cmp      x10, x11
   0xffff000050f27040: b.ne     #0xffff000050f2722c
   0xffff000050f27044: ldr      w10, [x8, #8]
   0xffff000050f27048: ldr      w11, [x9, #8]
   0xffff000050f2704c: cmp      w10, w11
   0xffff000050f27050: b.ne     #0xffff000050f2723c
   0xffff000050f27054: ldr      w10, [x8, #0xc]
   0xffff000050f27058: ldr      w11, [x9, #0xc]
   0xffff000050f2705c: cmp      w10, w11
   0xffff000050f27060: b.ne     #0xffff000050f2724c
   0xffff000050f27064: ldr      x10, [x8, #0x18]
   0xffff000050f27068: ldr      x11, [x9, #0x20]
   0xffff000050f2706c: cmp      x10, x11
   0xffff000050f27070: b.ne     #0xffff000050f2725c
   0xffff000050f27074: ldr      x10, [x8, #0x20]
   0xffff000050f27078: ldr      x11, [x9, #0x18]
   0xffff000050f2707c: cmp      x10, x11
   0xffff000050f27080: b.ne     #0xffff000050f2726c
   0xffff000050f27084: ldr      x10, [x8, #0x28]
   0xffff000050f27088: ldr      x11, [x9, #0x28]
   0xffff000050f2708c: cmp      x10, x11
   0xffff000050f27090: b.ne     #0xffff000050f2727c
   0xffff000050f27094: ldr      x10, [x8, #0x30]
   0xffff000050f27098: ldr      x11, [x9, #0x30]
   0xffff000050f2709c: cmp      x10, x11
   0xffff000050f270a0: b.ne     #0xffff000050f2728c
   0xffff000050f270a4: ldp      x10, x11, [x8, #0x38]
   0xffff000050f270a8: ldp      x12, x13, [x9, #0x38]
   0xffff000050f270ac: eor      x10, x10, x12
   0xffff000050f270b0: eor      x11, x11, x13
   0xffff000050f270b4: orr      x10, x10, x11
   0xffff000050f270b8: cbz      x10, #0xffff000050f27374
   0xffff000050f270bc: adrp     x1, #0xffff000050fd9000
   0xffff000050f270c0: mov      w0, #-1
   0xffff000050f270c4: add      x1, x1, #0x99e
   0xffff000050f270c8: b        #0xffff000050f27298

loc_ffff000050f270cc:
   0xffff000050f270cc: adrp     x1, #0xffff000050fe9000
   0xffff000050f270d0: mov      w0, wzr
   0xffff000050f270d4: add      x1, x1, #0x35f
   0xffff000050f270d8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f270dc: tbz      w28, #0, #0xffff000050f271b8

loc_ffff000050f270e0:
   0xffff000050f270e0: adrp     x25, #0xffff000051058000
   0xffff000050f270e4: adrp     x27, #0xffff000051058000
   0xffff000050f270e8: ldr      x8, [x25, #0xa80]
   0xffff000050f270ec: str      x21, [x27, #0xa88]
   0xffff000050f270f0: ldr      w9, [x8, #0x50]
   0xffff000050f270f4: cbz      w9, #0xffff000050f27174
   0xffff000050f270f8: adrp     x24, #0xffff000050fdc000
   0xffff000050f270fc: mov      x23, xzr
   0xffff000050f27100: mov      w28, #0x20
   0xffff000050f27104: adrp     x26, #0xffff000051058000
   0xffff000050f27108: add      x24, x24, #0x7cc
   0xffff000050f2710c: b        #0xffff000050f27124

loc_ffff000050f27110:
   0xffff000050f27110: ldr      w9, [x8, #0x50]
   0xffff000050f27114: add      x23, x23, #1
   0xffff000050f27118: add      x28, x28, #0x80
   0xffff000050f2711c: cmp      x23, x9
   0xffff000050f27120: b.hs     #0xffff000050f27174

loc_ffff000050f27124:
   0xffff000050f27124: ldr      x3, [x21, x28]
   0xffff000050f27128: cbz      x3, #0xffff000050f27110
   0xffff000050f2712c: ldr      w8, [x26, #0xa68]
   0xffff000050f27130: mov      w0, #2
   0xffff000050f27134: mov      x1, x24
   0xffff000050f27138: mov      w2, w23
   0xffff000050f2713c: add      w8, w8, #1
   0xffff000050f27140: str      w8, [x26, #0xa68]
   0xffff000050f27144: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f27148: ldr      x21, [x27, #0xa88]
   0xffff000050f2714c: ldr      x8, [x25, #0xa80]
   0xffff000050f27150: b        #0xffff000050f27110

loc_ffff000050f27154:
   0xffff000050f27154: adrp     x1, #0xffff000050fd8000
   0xffff000050f27158: mov      w0, #1
   0xffff000050f2715c: add      x1, x1, #0x1f5
   0xffff000050f27160: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f27164: mov      w25, wzr
   0xffff000050f27168: adrp     x24, #0xffff000051058000

loc_ffff000050f2716c:
   0xffff000050f2716c: cbnz     x21, #0xffff000050f271d0
   0xffff000050f27170: b        #0xffff000050f271e4

loc_ffff000050f27174:
   0xffff000050f27174: adrp     x8, #0xffff000051058000
   0xffff000050f27178: adrp     x9, #0xffff000051058000
   0xffff000050f2717c: mov      w25, wzr
   0xffff000050f27180: mov      w21, #1
   0xffff000050f27184: adrp     x24, #0xffff000051058000
   0xffff000050f27188: ldr      w8, [x8, #0xa68]
   0xffff000050f2718c: ldr      w10, [x9, #0xa58]
   0xffff000050f27190: str      w8, [x20, #0x14]
   0xffff000050f27194: add      w10, w10, w8
   0xffff000050f27198: str      w10, [x9, #0xa58]
   0xffff000050f2719c: b        #0xffff000050f271e4

loc_ffff000050f271a0:
   0xffff000050f271a0: adrp     x1, #0xffff000050fcf000
   0xffff000050f271a4: mov      w0, #-1
   0xffff000050f271a8: add      x1, x1, #0x424
   0xffff000050f271ac: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f271b0: ldr      w28, [sp, #4]
   0xffff000050f271b4: tbnz     w28, #0, #0xffff000050f270e0

loc_ffff000050f271b8:
   0xffff000050f271b8: adrp     x1, #0xffff000050ff4000
   0xffff000050f271bc: mov      w0, #-1
   0xffff000050f271c0: add      x1, x1, #0x48b
   0xffff000050f271c4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f271c8: mov      w25, wzr
   0xffff000050f271cc: cbz      x21, #0xffff000050f271e4

loc_ffff000050f271d0:
   0xffff000050f271d0: mov      x0, x23
   0xffff000050f271d4: mov      w1, wzr
   0xffff000050f271d8: mov      w2, #0x8000
   0xffff000050f271dc: bl       #0xffff000050f8e214  ; call 0xffff000050f8e214
   0xffff000050f271e0: mov      w21, wzr

loc_ffff000050f271e4:
   0xffff000050f271e4: tbnz     w25, #0, #0xffff000050f27200
   0xffff000050f271e8: ldr      x8, [x24, #0xa98]
   0xffff000050f271ec: cbz      x8, #0xffff000050f27200
   0xffff000050f271f0: mov      x0, x22
   0xffff000050f271f4: mov      w1, wzr
   0xffff000050f271f8: mov      w2, #0x8000
   0xffff000050f271fc: bl       #0xffff000050f8e214  ; call 0xffff000050f8e214

loc_ffff000050f27200:
   0xffff000050f27200: mov      x0, x19
   0xffff000050f27204: bl       #0xffff000050f89538  ; call 0xffff000050f89538

loc_ffff000050f27208:
   0xffff000050f27208: eor      w0, w21, #1
   0xffff000050f2720c: ldp      x20, x19, [sp, #0x80]
   0xffff000050f27210: ldp      x22, x21, [sp, #0x70]
   0xffff000050f27214: ldp      x24, x23, [sp, #0x60]
   0xffff000050f27218: ldp      x26, x25, [sp, #0x50]
   0xffff000050f2721c: ldp      x28, x27, [sp, #0x40]
   0xffff000050f27220: ldp      x29, x30, [sp, #0x30]
   0xffff000050f27224: add      sp, sp, #0x90
   0xffff000050f27228: ret      

loc_ffff000050f2722c:
   0xffff000050f2722c: adrp     x1, #0xffff000050fd3000
   0xffff000050f27230: mov      w0, #-1
   0xffff000050f27234: add      x1, x1, #0x9cf
   0xffff000050f27238: b        #0xffff000050f27298

loc_ffff000050f2723c:
   0xffff000050f2723c: adrp     x1, #0xffff000050fde000
   0xffff000050f27240: mov      w0, #-1
   0xffff000050f27244: add      x1, x1, #0x25b
   0xffff000050f27248: b        #0xffff000050f27298

loc_ffff000050f2724c:
   0xffff000050f2724c: adrp     x1, #0xffff000050fe1000
   0xffff000050f27250: mov      w0, #-1
; XREF string 0xffff000050fde789: 'imei' -> 'Device IMEI\n(15 decimal digits including the correct checksum)'
>> 0xffff000050f27254: add      x1, x1, #0x789
   0xffff000050f27258: b        #0xffff000050f27298

loc_ffff000050f2725c:
   0xffff000050f2725c: adrp     x1, #0xffff000050fd0000
   0xffff000050f27260: mov      w0, #-1
   0xffff000050f27264: add      x1, x1, #0x984
   0xffff000050f27268: b        #0xffff000050f27298

loc_ffff000050f2726c:
   0xffff000050f2726c: adrp     x1, #0xffff000050fd6000
   0xffff000050f27270: mov      w0, #-1
   0xffff000050f27274: add      x1, x1, #0xc3f
   0xffff000050f27278: b        #0xffff000050f27298

loc_ffff000050f2727c:
   0xffff000050f2727c: adrp     x1, #0xffff000050ffd000
   0xffff000050f27280: mov      w0, #-1
   0xffff000050f27284: add      x1, x1, #0xcc8
   0xffff000050f27288: b        #0xffff000050f27298

loc_ffff000050f2728c:
   0xffff000050f2728c: adrp     x1, #0xffff000050fdf000
   0xffff000050f27290: mov      w0, #-1
   0xffff000050f27294: add      x1, x1, #0xd43

loc_ffff000050f27298:
   0xffff000050f27298: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f2729c: ldr      x8, [x24, #0xa80]
   0xffff000050f272a0: adrp     x26, #0xffff000051058000
   0xffff000050f272a4: adrp     x25, #0xffff000051058000
   0xffff000050f272a8: ldr      w9, [x8, #0x50]
   0xffff000050f272ac: str      x21, [x26, #0xa88]
   0xffff000050f272b0: cbz      w9, #0xffff000050f27354
   0xffff000050f272b4: adrp     x23, #0xffff000050fe1000
   0xffff000050f272b8: mov      x22, xzr
   0xffff000050f272bc: mov      w27, #0x38
   0xffff000050f272c0: add      x28, sp, #8
   0xffff000050f272c4: add      x23, x23, #0x762
   0xffff000050f272c8: b        #0xffff000050f272e0

loc_ffff000050f272cc:
   0xffff000050f272cc: ldr      w9, [x8, #0x50]
   0xffff000050f272d0: add      x22, x22, #1
   0xffff000050f272d4: add      x27, x27, #0x80
   0xffff000050f272d8: cmp      x22, x9
   0xffff000050f272dc: b.hs     #0xffff000050f27354

loc_ffff000050f272e0:
   0xffff000050f272e0: add      x9, x21, x22, lsl #7
   0xffff000050f272e4: ldr      x10, [x9, #0x20]!
   0xffff000050f272e8: cbz      x10, #0xffff000050f272f8
   0xffff000050f272ec: ldr      w10, [x25, #0xa68]
   0xffff000050f272f0: add      w10, w10, #1
   0xffff000050f272f4: str      w10, [x25, #0xa68]

loc_ffff000050f272f8:
   0xffff000050f272f8: mov      x10, xzr
   0xffff000050f272fc: mov      x11, x27
   0xffff000050f27300: stur     xzr, [sp, #0x25]
   0xffff000050f27304: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f27308: stp      xzr, xzr, [sp, #8]

loc_ffff000050f2730c:
   0xffff000050f2730c: ldrb     w12, [x21, x11]
   0xffff000050f27310: add      x11, x11, #2
   0xffff000050f27314: strb     w12, [x28, x10]
   0xffff000050f27318: add      x10, x10, #1
   0xffff000050f2731c: cmp      x10, #0x24
   0xffff000050f27320: b.ne     #0xffff000050f2730c
   0xffff000050f27324: ldrb     w10, [sp, #8]
   0xffff000050f27328: cbz      w10, #0xffff000050f272cc
   0xffff000050f2732c: ldr      x3, [x9]
   0xffff000050f27330: cbz      x3, #0xffff000050f272cc
   0xffff000050f27334: add      x4, sp, #8
   0xffff000050f27338: mov      w0, #2
   0xffff000050f2733c: mov      x1, x23
   0xffff000050f27340: mov      w2, w22
   0xffff000050f27344: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f27348: ldr      x21, [x26, #0xa88]
   0xffff000050f2734c: ldr      x8, [x24, #0xa80]
   0xffff000050f27350: b        #0xffff000050f272cc

loc_ffff000050f27354:
   0xffff000050f27354: adrp     x8, #0xffff000051058000
   0xffff000050f27358: ldr      w9, [x25, #0xa68]
   0xffff000050f2735c: mov      w21, #1
   0xffff000050f27360: ldr      w10, [x8, #0xa58]
   0xffff000050f27364: str      w9, [x20, #0x14]
   0xffff000050f27368: add      w10, w10, w9
   0xffff000050f2736c: str      w10, [x8, #0xa58]
   0xffff000050f27370: b        #0xffff000050f27200

loc_ffff000050f27374:
   0xffff000050f27374: ldr      w10, [x8, #0x50]
   0xffff000050f27378: ldr      w11, [x9, #0x50]
   0xffff000050f2737c: cmp      w10, w11
   0xffff000050f27380: b.ne     #0xffff000050f273b4
   0xffff000050f27384: ldr      w10, [x8, #0x54]
   0xffff000050f27388: ldr      w11, [x9, #0x54]
   0xffff000050f2738c: cmp      w10, w11
   0xffff000050f27390: b.ne     #0xffff000050f273c4
   0xffff000050f27394: ldr      w8, [x8, #0x58]
   0xffff000050f27398: ldr      w9, [x9, #0x58]
   0xffff000050f2739c: cmp      w8, w9
   0xffff000050f273a0: b.ne     #0xffff000050f273d4
   0xffff000050f273a4: adrp     x1, #0xffff000050ff7000
   0xffff000050f273a8: mov      w0, #2
   0xffff000050f273ac: add      x1, x1, #0x59c
   0xffff000050f273b0: b        #0xffff000050f27298

loc_ffff000050f273b4:
   0xffff000050f273b4: adrp     x1, #0xffff000050fef000
   0xffff000050f273b8: mov      w0, #-1
   0xffff000050f273bc: add      x1, x1, #0xa2e
   0xffff000050f273c0: b        #0xffff000050f27298

loc_ffff000050f273c4:
   0xffff000050f273c4: adrp     x1, #0xffff000050ff1000
   0xffff000050f273c8: mov      w0, #-1
   0xffff000050f273cc: add      x1, x1, #0x1fc
   0xffff000050f273d0: b        #0xffff000050f27298

loc_ffff000050f273d4:
   0xffff000050f273d4: adrp     x1, #0xffff000050fe4000
   0xffff000050f273d8: mov      w0, #-1
   0xffff000050f273dc: add      x1, x1, #0x88f
   0xffff000050f273e0: b        #0xffff000050f27298
   0xffff000050f273e4: mov      w0, #1
   0xffff000050f273e8: ret      
