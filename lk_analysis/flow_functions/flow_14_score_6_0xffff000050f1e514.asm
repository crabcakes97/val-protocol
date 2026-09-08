; flow candidate 0xffff000050f1e514-0xffff000050f1ec38
; score: 6
; matched targets: esimid, imei2, meid, sku
; calls: 0xffff000050f29978, 0xffff000050f37438, 0xffff000050f38024, 0xffff000050f75de8, 0xffff000050f76358, 0xffff000050f02ab0, 0xffff000050fc91cc, 0xffff000050f20034, 0xffff000050f8c89c, 0xffff000050fc91b0, 0xffff000050f89374, 0xffff000050f140ac, 0xffff000050f75ea8, 0xffff000050f02ab4, 0xffff000050f02abc, 0xffff000050f765e4, 0xffff000050f02ab8, 0xffff000050f02aac, 0xffff000050f75df4

   0xffff000050f1e514: sub      sp, sp, #0xf0
   0xffff000050f1e518: stp      x29, x30, [sp, #0x90]
   0xffff000050f1e51c: add      x29, sp, #0x90
   0xffff000050f1e520: str      x27, [sp, #0xa0]
   0xffff000050f1e524: stp      x26, x25, [sp, #0xb0]
   0xffff000050f1e528: stp      x24, x23, [sp, #0xc0]
   0xffff000050f1e52c: stp      x22, x21, [sp, #0xd0]
   0xffff000050f1e530: stp      x20, x19, [sp, #0xe0]
   0xffff000050f1e534: adrp     x26, #0xffff000051055000
   0xffff000050f1e538: adrp     x24, #0xffff000051055000
   0xffff000050f1e53c: mov      w8, #7
   0xffff000050f1e540: ldrb     w9, [x26, #0xc7c]
   0xffff000050f1e544: str      w8, [x24, #0xc94]
   0xffff000050f1e548: cbz      w9, #0xffff000050f1e568

loc_ffff000050f1e54c:
   0xffff000050f1e54c: adrp     x1, #0xffff000050fea000
   0xffff000050f1e550: adrp     x2, #0xffff000051055000
   0xffff000050f1e554: add      x1, x1, #0xd4c
   0xffff000050f1e558: add      x2, x2, #0xc7c
   0xffff000050f1e55c: mov      w0, #1
   0xffff000050f1e560: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f1e564: b        #0xffff000050f1e5a8

loc_ffff000050f1e568:
   0xffff000050f1e568: adrp     x1, #0xffff000050fe4000
   0xffff000050f1e56c: mov      w0, wzr
   0xffff000050f1e570: add      x1, x1, #0x6f6
   0xffff000050f1e574: bl       #0xffff000050f37438  ; call 0xffff000050f37438
   0xffff000050f1e578: tbz      w0, #0, #0xffff000050f1e59c
   0xffff000050f1e57c: adrp     x1, #0xffff000050fe4000
   0xffff000050f1e580: adrp     x2, #0xffff000051055000
   0xffff000050f1e584: add      x1, x1, #0x6f6
   0xffff000050f1e588: add      x2, x2, #0xc7c
   0xffff000050f1e58c: mov      w0, wzr
   0xffff000050f1e590: mov      w3, #0x16
   0xffff000050f1e594: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f1e598: cbnz     x0, #0xffff000050f1e54c

loc_ffff000050f1e59c:
   0xffff000050f1e59c: ldr      w8, [x24, #0xc94]
   0xffff000050f1e5a0: sub      w8, w8, #1
   0xffff000050f1e5a4: str      w8, [x24, #0xc94]

loc_ffff000050f1e5a8:
   0xffff000050f1e5a8: mov      w0, #-1
   0xffff000050f1e5ac: bl       #0xffff000050f75de8  ; call 0xffff000050f75de8
   0xffff000050f1e5b0: bl       #0xffff000050f76358  ; call 0xffff000050f76358
   0xffff000050f1e5b4: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1e5b8: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1e5bc: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1e5c0: stp      xzr, xzr, [sp, #8]
   0xffff000050f1e5c4: bl       #0xffff000050f02ab0  ; call 0xffff000050f02ab0
   0xffff000050f1e5c8: mov      x19, x0
   0xffff000050f1e5cc: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e5d0: lsr      w20, w0, #1
   0xffff000050f1e5d4: mov      x1, x19
   0xffff000050f1e5d8: mov      w0, w20
   0xffff000050f1e5dc: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1e5e0: adrp     x2, #0xffff000050fdc000
   0xffff000050f1e5e4: add      x0, sp, #8
; XREF string 0xffff000050fdc6ef: 'meid' -> 'IMEI/MEID: %s'
>> 0xffff000050f1e5e8: add      x2, x2, #0x6ef
   0xffff000050f1e5ec: mov      w1, #0x40
   0xffff000050f1e5f0: mov      x3, x19
   0xffff000050f1e5f4: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1e5f8: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1e5fc: mov      w19, w0
   0xffff000050f1e600: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1e604: mov      w25, #0xb
   0xffff000050f1e608: madd     w19, w0, w25, w19
   0xffff000050f1e60c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e610: mov      w21, w0
   0xffff000050f1e614: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e618: madd     w2, w0, w21, w20
   0xffff000050f1e61c: add      x0, sp, #8
   0xffff000050f1e620: mov      w1, w19
   0xffff000050f1e624: mov      w3, wzr
   0xffff000050f1e628: mov      w4, #-0xffff01
   0xffff000050f1e62c: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1e630: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1e634: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1e638: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1e63c: stp      xzr, xzr, [sp, #8]
   0xffff000050f1e640: bl       #0xffff000050f02ab4  ; call 0xffff000050f02ab4
   0xffff000050f1e644: mov      x19, x0
   0xffff000050f1e648: bl       #0xffff000050f02abc  ; call 0xffff000050f02abc
   0xffff000050f1e64c: mov      x20, x0
   0xffff000050f1e650: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e654: lsr      w27, w0, #1
   0xffff000050f1e658: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1e65c: mov      w21, w0
   0xffff000050f1e660: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e664: mov      w22, w0
   0xffff000050f1e668: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e66c: mov      w23, w0
   0xffff000050f1e670: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e674: madd     w22, w23, w22, w0
   0xffff000050f1e678: ldr      w23, [x24, #0xc94]
   0xffff000050f1e67c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e680: ldr      w8, [x24, #0xc94]
   0xffff000050f1e684: add      w9, w27, w0
   0xffff000050f1e688: madd     w9, w22, w23, w9
   0xffff000050f1e68c: sub      w8, w8, #1
   0xffff000050f1e690: sub      w9, w21, w9
   0xffff000050f1e694: udiv     w23, w9, w8
   0xffff000050f1e698: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e69c: mov      w21, w0
   0xffff000050f1e6a0: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e6a4: mov      w22, w0
   0xffff000050f1e6a8: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e6ac: ldrb     w8, [x20]
   0xffff000050f1e6b0: add      w9, w23, w27
   0xffff000050f1e6b4: madd     w9, w22, w21, w9
   0xffff000050f1e6b8: cmp      w8, #0
   0xffff000050f1e6bc: add      w21, w9, w0
   0xffff000050f1e6c0: csel     x19, x19, x20, eq
   0xffff000050f1e6c4: mov      w0, w21
   0xffff000050f1e6c8: mov      x1, x19
   0xffff000050f1e6cc: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1e6d0: adrp     x2, #0xffff000050fcf000
   0xffff000050f1e6d4: add      x0, sp, #8
; XREF string 0xffff000050fcf397: 'sku' -> 'SKU: %s'
>> 0xffff000050f1e6d8: add      x2, x2, #0x397
   0xffff000050f1e6dc: mov      w1, #0x40
   0xffff000050f1e6e0: mov      x3, x19
   0xffff000050f1e6e4: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1e6e8: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1e6ec: mov      w19, w0
   0xffff000050f1e6f0: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1e6f4: madd     w19, w0, w25, w19
   0xffff000050f1e6f8: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e6fc: mov      w20, w0
   0xffff000050f1e700: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e704: madd     w2, w0, w20, w21
   0xffff000050f1e708: add      x0, sp, #8
   0xffff000050f1e70c: mov      w1, w19
   0xffff000050f1e710: mov      w3, wzr
   0xffff000050f1e714: mov      w4, #-0xffff01
   0xffff000050f1e718: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1e71c: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1e720: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1e724: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1e728: stp      xzr, xzr, [sp, #8]
   0xffff000050f1e72c: bl       #0xffff000050f02ab8  ; call 0xffff000050f02ab8
   0xffff000050f1e730: mov      x19, x0
   0xffff000050f1e734: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e738: lsr      w23, w0, #1
   0xffff000050f1e73c: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1e740: mov      w20, w0
   0xffff000050f1e744: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e748: mov      w21, w0
   0xffff000050f1e74c: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e750: mov      w22, w0
   0xffff000050f1e754: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e758: madd     w21, w22, w21, w0
   0xffff000050f1e75c: ldr      w22, [x24, #0xc94]
   0xffff000050f1e760: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e764: ldr      w8, [x24, #0xc94]
   0xffff000050f1e768: add      w9, w23, w0
   0xffff000050f1e76c: madd     w9, w21, w22, w9
   0xffff000050f1e770: sub      w8, w8, #1
   0xffff000050f1e774: sub      w9, w20, w9
   0xffff000050f1e778: udiv     w21, w9, w8
   0xffff000050f1e77c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e780: mov      w20, w0
   0xffff000050f1e784: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e788: madd     w20, w0, w20, w21
   0xffff000050f1e78c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e790: add      w8, w20, w0
   0xffff000050f1e794: mov      x1, x19
   0xffff000050f1e798: add      w20, w23, w8, lsl #1
   0xffff000050f1e79c: mov      w0, w20
   0xffff000050f1e7a0: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1e7a4: adrp     x2, #0xffff000050fd8000
   0xffff000050f1e7a8: add      x0, sp, #8
   0xffff000050f1e7ac: add      x2, x2, #0x5e
   0xffff000050f1e7b0: mov      w1, #0x40
   0xffff000050f1e7b4: mov      x3, x19
   0xffff000050f1e7b8: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1e7bc: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1e7c0: mov      w19, w0
   0xffff000050f1e7c4: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1e7c8: madd     w19, w0, w25, w19
   0xffff000050f1e7cc: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e7d0: mov      w21, w0
   0xffff000050f1e7d4: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e7d8: madd     w2, w0, w21, w20
   0xffff000050f1e7dc: add      x0, sp, #8
   0xffff000050f1e7e0: mov      w1, w19
   0xffff000050f1e7e4: mov      w3, wzr
   0xffff000050f1e7e8: mov      w4, #-0xffff01
   0xffff000050f1e7ec: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1e7f0: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1e7f4: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1e7f8: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1e7fc: stp      xzr, xzr, [sp, #8]
   0xffff000050f1e800: bl       #0xffff000050f02aac  ; call 0xffff000050f02aac
   0xffff000050f1e804: mov      x19, x0
   0xffff000050f1e808: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e80c: lsr      w23, w0, #1
   0xffff000050f1e810: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1e814: mov      w20, w0
   0xffff000050f1e818: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e81c: mov      w21, w0
   0xffff000050f1e820: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e824: mov      w22, w0
   0xffff000050f1e828: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e82c: madd     w21, w22, w21, w0
   0xffff000050f1e830: ldr      w22, [x24, #0xc94]
   0xffff000050f1e834: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e838: ldr      w8, [x24, #0xc94]
   0xffff000050f1e83c: add      w9, w23, w0
   0xffff000050f1e840: madd     w9, w21, w22, w9
   0xffff000050f1e844: sub      w8, w8, #1
   0xffff000050f1e848: sub      w9, w20, w9
   0xffff000050f1e84c: udiv     w21, w9, w8
   0xffff000050f1e850: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e854: mov      w20, w0
   0xffff000050f1e858: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e85c: madd     w20, w0, w20, w21
   0xffff000050f1e860: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e864: add      w8, w20, w0
   0xffff000050f1e868: mov      x1, x19
   0xffff000050f1e86c: add      w8, w8, w8, lsl #1
   0xffff000050f1e870: add      w20, w8, w23
   0xffff000050f1e874: mov      w0, w20
   0xffff000050f1e878: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1e87c: adrp     x2, #0xffff000050ffa000
   0xffff000050f1e880: add      x0, sp, #8
   0xffff000050f1e884: add      x2, x2, #0x720
   0xffff000050f1e888: mov      w1, #0x40
   0xffff000050f1e88c: mov      x3, x19
   0xffff000050f1e890: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1e894: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1e898: mov      w19, w0
   0xffff000050f1e89c: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1e8a0: madd     w19, w0, w25, w19
   0xffff000050f1e8a4: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e8a8: mov      w21, w0
   0xffff000050f1e8ac: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e8b0: madd     w2, w0, w21, w20
   0xffff000050f1e8b4: add      x0, sp, #8
   0xffff000050f1e8b8: mov      w1, w19
   0xffff000050f1e8bc: mov      w3, wzr
   0xffff000050f1e8c0: mov      w4, #-0xffff01
   0xffff000050f1e8c4: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1e8c8: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1e8cc: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1e8d0: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1e8d4: stp      xzr, xzr, [sp, #8]
   0xffff000050f1e8d8: stur     wzr, [x29, #-0x31]
   0xffff000050f1e8dc: stp      xzr, xzr, [x29, #-0x40]
   0xffff000050f1e8e0: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e8e4: lsr      w22, w0, #1
   0xffff000050f1e8e8: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1e8ec: mov      w19, w0
   0xffff000050f1e8f0: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e8f4: mov      w20, w0
   0xffff000050f1e8f8: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e8fc: mov      w21, w0
   0xffff000050f1e900: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e904: madd     w20, w21, w20, w0
   0xffff000050f1e908: ldr      w21, [x24, #0xc94]
   0xffff000050f1e90c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e910: ldr      w8, [x24, #0xc94]
   0xffff000050f1e914: add      w9, w22, w0
   0xffff000050f1e918: madd     w9, w20, w21, w9
   0xffff000050f1e91c: sub      w8, w8, #1
   0xffff000050f1e920: sub      w9, w19, w9
   0xffff000050f1e924: udiv     w20, w9, w8
   0xffff000050f1e928: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e92c: mov      w19, w0
   0xffff000050f1e930: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e934: madd     w19, w0, w19, w20
   0xffff000050f1e938: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e93c: adrp     x1, #0xffff000050fd7000
   0xffff000050f1e940: add      w8, w19, w0
; XREF string 0xffff000050fd7f6a: 'imei2' -> 'imei2'
>> 0xffff000050f1e944: add      x1, x1, #0xf6a
   0xffff000050f1e948: sub      x2, x29, #0x40
   0xffff000050f1e94c: mov      w0, wzr
   0xffff000050f1e950: mov      w3, #0x13
   0xffff000050f1e954: add      w19, w22, w8, lsl #2
   0xffff000050f1e958: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f1e95c: sub      x1, x29, #0x40
   0xffff000050f1e960: mov      w0, w19
   0xffff000050f1e964: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1e968: adrp     x2, #0xffff000050ffd000
   0xffff000050f1e96c: add      x0, sp, #8
; XREF string 0xffff000050ffdc7e: 'imei2' -> 'IMEI2: %s'
>> 0xffff000050f1e970: add      x2, x2, #0xc7e
   0xffff000050f1e974: sub      x3, x29, #0x40
   0xffff000050f1e978: mov      w1, #0x40
   0xffff000050f1e97c: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1e980: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1e984: mov      w20, w0
   0xffff000050f1e988: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1e98c: madd     w20, w0, w25, w20
   0xffff000050f1e990: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e994: mov      w21, w0
   0xffff000050f1e998: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e99c: madd     w2, w0, w21, w19
   0xffff000050f1e9a0: add      x0, sp, #8
   0xffff000050f1e9a4: mov      w1, w20
   0xffff000050f1e9a8: mov      w3, wzr
   0xffff000050f1e9ac: mov      w4, #-0xffff01
   0xffff000050f1e9b0: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1e9b4: stp      xzr, xzr, [x29, #-0x10]
   0xffff000050f1e9b8: stp      xzr, xzr, [x29, #-0x20]
   0xffff000050f1e9bc: stp      xzr, xzr, [x29, #-0x30]
   0xffff000050f1e9c0: stp      xzr, xzr, [x29, #-0x40]
   0xffff000050f1e9c4: strb     wzr, [sp, #0x48]
   0xffff000050f1e9c8: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1e9cc: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1e9d0: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1e9d4: stp      xzr, xzr, [sp, #8]
   0xffff000050f1e9d8: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e9dc: lsr      w22, w0, #1
   0xffff000050f1e9e0: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1e9e4: mov      w19, w0
   0xffff000050f1e9e8: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e9ec: mov      w20, w0
   0xffff000050f1e9f0: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1e9f4: mov      w21, w0
   0xffff000050f1e9f8: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1e9fc: madd     w20, w21, w20, w0
   0xffff000050f1ea00: ldr      w21, [x24, #0xc94]
   0xffff000050f1ea04: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1ea08: ldr      w8, [x24, #0xc94]
   0xffff000050f1ea0c: add      w9, w22, w0
   0xffff000050f1ea10: madd     w9, w20, w21, w9
   0xffff000050f1ea14: sub      w8, w8, #1
   0xffff000050f1ea18: sub      w9, w19, w9
   0xffff000050f1ea1c: udiv     w20, w9, w8
   0xffff000050f1ea20: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1ea24: mov      w19, w0
   0xffff000050f1ea28: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1ea2c: madd     w19, w0, w19, w20
   0xffff000050f1ea30: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1ea34: adrp     x1, #0xffff000050fdc000
   0xffff000050f1ea38: add      w8, w19, w0
; XREF string 0xffff000050fdc47e: 'esimid' -> 'esimid'
>> 0xffff000050f1ea3c: add      x1, x1, #0x47e
   0xffff000050f1ea40: add      x2, sp, #8
   0xffff000050f1ea44: mov      w0, wzr
   0xffff000050f1ea48: mov      w3, #0x41
   0xffff000050f1ea4c: add      w8, w8, w8, lsl #2
   0xffff000050f1ea50: add      w19, w8, w22
   0xffff000050f1ea54: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f1ea58: add      x1, sp, #8
   0xffff000050f1ea5c: mov      w0, w19
   0xffff000050f1ea60: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1ea64: adrp     x2, #0xffff000050fe2000
   0xffff000050f1ea68: sub      x0, x29, #0x40
; XREF string 0xffff000050fe2db7: 'esimid' -> 'ESIMID: %s'
>> 0xffff000050f1ea6c: add      x2, x2, #0xdb7
   0xffff000050f1ea70: add      x3, sp, #8
   0xffff000050f1ea74: mov      w1, #0x40
   0xffff000050f1ea78: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1ea7c: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1ea80: mov      w20, w0
   0xffff000050f1ea84: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1ea88: madd     w20, w0, w25, w20
   0xffff000050f1ea8c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1ea90: mov      w21, w0
   0xffff000050f1ea94: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1ea98: madd     w2, w0, w21, w19
   0xffff000050f1ea9c: sub      x0, x29, #0x40
   0xffff000050f1eaa0: mov      w1, w20
   0xffff000050f1eaa4: mov      w3, wzr
   0xffff000050f1eaa8: mov      w4, #-0xffff01
   0xffff000050f1eaac: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1eab0: ldrb     w8, [x26, #0xc7c]
   0xffff000050f1eab4: cbz      w8, #0xffff000050f1eba8

loc_ffff000050f1eab8:
   0xffff000050f1eab8: adrp     x19, #0xffff000051055000
   0xffff000050f1eabc: adrp     x1, #0xffff000050fea000
   0xffff000050f1eac0: add      x19, x19, #0xc7c
   0xffff000050f1eac4: add      x1, x1, #0xd4c
   0xffff000050f1eac8: mov      w0, #1
   0xffff000050f1eacc: mov      x2, x19
   0xffff000050f1ead0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f1ead4: stp      xzr, xzr, [sp, #0x38]
   0xffff000050f1ead8: stp      xzr, xzr, [sp, #0x28]
   0xffff000050f1eadc: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f1eae0: stp      xzr, xzr, [sp, #8]
   0xffff000050f1eae4: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eae8: lsr      w23, w0, #1
   0xffff000050f1eaec: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1eaf0: mov      w20, w0
   0xffff000050f1eaf4: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eaf8: mov      w21, w0
   0xffff000050f1eafc: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1eb00: mov      w22, w0
   0xffff000050f1eb04: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eb08: madd     w21, w22, w21, w0
   0xffff000050f1eb0c: ldr      w22, [x24, #0xc94]
   0xffff000050f1eb10: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eb14: ldr      w8, [x24, #0xc94]
   0xffff000050f1eb18: add      w9, w23, w0
   0xffff000050f1eb1c: madd     w9, w21, w22, w9
   0xffff000050f1eb20: sub      w8, w8, #1
   0xffff000050f1eb24: sub      w9, w20, w9
   0xffff000050f1eb28: udiv     w21, w9, w8
   0xffff000050f1eb2c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eb30: mov      w20, w0
   0xffff000050f1eb34: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1eb38: madd     w20, w0, w20, w21
   0xffff000050f1eb3c: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eb40: mov      w8, #6
   0xffff000050f1eb44: add      w9, w20, w0
   0xffff000050f1eb48: mov      x1, x19
   0xffff000050f1eb4c: madd     w20, w9, w8, w23
   0xffff000050f1eb50: mov      w0, w20
   0xffff000050f1eb54: bl       #0xffff000050f20034  ; call 0xffff000050f20034
   0xffff000050f1eb58: adrp     x2, #0xffff000050ff6000
   0xffff000050f1eb5c: add      x0, sp, #8
   0xffff000050f1eb60: add      x2, x2, #0x19
   0xffff000050f1eb64: mov      w1, #0x40
   0xffff000050f1eb68: mov      x3, x19
   0xffff000050f1eb6c: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f1eb70: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1eb74: mov      w19, w0
   0xffff000050f1eb78: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f1eb7c: madd     w19, w0, w25, w19
   0xffff000050f1eb80: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1eb84: mov      w21, w0
   0xffff000050f1eb88: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f1eb8c: madd     w2, w0, w21, w20
   0xffff000050f1eb90: add      x0, sp, #8
   0xffff000050f1eb94: mov      w1, w19
   0xffff000050f1eb98: mov      w3, wzr
   0xffff000050f1eb9c: mov      w4, #-0xffff01
   0xffff000050f1eba0: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1eba4: b        #0xffff000050f1ebdc

loc_ffff000050f1eba8:
   0xffff000050f1eba8: adrp     x1, #0xffff000050fe4000
   0xffff000050f1ebac: mov      w0, wzr
   0xffff000050f1ebb0: add      x1, x1, #0x6f6
   0xffff000050f1ebb4: bl       #0xffff000050f37438  ; call 0xffff000050f37438
   0xffff000050f1ebb8: tbz      w0, #0, #0xffff000050f1ebdc
   0xffff000050f1ebbc: adrp     x1, #0xffff000050fe4000
   0xffff000050f1ebc0: adrp     x2, #0xffff000051055000
   0xffff000050f1ebc4: add      x1, x1, #0x6f6
   0xffff000050f1ebc8: add      x2, x2, #0xc7c
   0xffff000050f1ebcc: mov      w0, wzr
   0xffff000050f1ebd0: mov      w3, #0x16
   0xffff000050f1ebd4: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f1ebd8: cbnz     x0, #0xffff000050f1eab8

loc_ffff000050f1ebdc:
   0xffff000050f1ebdc: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f1ebe0: mov      w19, w0
   0xffff000050f1ebe4: bl       #0xffff000050f765e4  ; call 0xffff000050f765e4
   0xffff000050f1ebe8: mov      w20, w0
   0xffff000050f1ebec: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f1ebf0: sub      w2, w20, w0
   0xffff000050f1ebf4: adrp     x0, #0xffff000050ffa000
   0xffff000050f1ebf8: add      x0, x0, #0x732
   0xffff000050f1ebfc: mov      w1, w19
   0xffff000050f1ec00: mov      w3, wzr
   0xffff000050f1ec04: mov      w4, #-0xff0100
   0xffff000050f1ec08: bl       #0xffff000050f75ea8  ; call 0xffff000050f75ea8
   0xffff000050f1ec0c: mov      x0, xzr
   0xffff000050f1ec10: mov      w1, wzr
   0xffff000050f1ec14: mov      w2, #1
   0xffff000050f1ec18: bl       #0xffff000050f75df4  ; call 0xffff000050f75df4
   0xffff000050f1ec1c: ldp      x20, x19, [sp, #0xe0]
   0xffff000050f1ec20: ldp      x22, x21, [sp, #0xd0]
   0xffff000050f1ec24: ldp      x24, x23, [sp, #0xc0]
   0xffff000050f1ec28: ldp      x26, x25, [sp, #0xb0]
   0xffff000050f1ec2c: ldp      x29, x30, [sp, #0x90]
   0xffff000050f1ec30: ldr      x27, [sp, #0xa0]
   0xffff000050f1ec34: add      sp, sp, #0xf0
   0xffff000050f1ec38: ret      
