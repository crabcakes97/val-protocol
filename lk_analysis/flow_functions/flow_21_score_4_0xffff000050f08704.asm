; flow candidate 0xffff000050f08704-0xffff000050f08bd0
; score: 4
; matched targets: is-userspace, max-download-size, serialno, version-bootloader
; calls: 0xffff000050f29978, 0xffff000050f22d30, 0xffff000050f22e48, 0xffff000050f23ea0, 0xffff000050f24030, 0xffff000050f89ffc, 0xffff000050f12910, 0xffff000050f1245c, 0xffff000050f8c790, 0xffff000050f079fc, 0xffff000050f09604, 0xffff000050f1b690, 0xffff000050f09654, 0xffff000050f1278c, 0xffff000050f3bbc4, 0xffff000050f3b800, 0xffff000050f8e6fc, 0xffff000050f0791c, 0xffff000050f8c784, 0xffff000050f3ba78, 0xffff000050f2ac68, 0xffff000050f88fc0, 0xffff000050f2c298, 0xffff000050f0827c, 0xffff000050f8926c, 0xffff000050f8e214, 0xffff000050f078e4, 0xffff000050f0798c

   0xffff000050f08704: sub      sp, sp, #0x40
   0xffff000050f08708: stp      x29, x30, [sp, #0x20]
   0xffff000050f0870c: add      x29, sp, #0x20
   0xffff000050f08710: stp      x20, x19, [sp, #0x30]
   0xffff000050f08714: adrp     x19, #0xffff000050fff000
   0xffff000050f08718: adrp     x1, #0xffff000050ffb000
   0xffff000050f0871c: add      x19, x19, #0x240
   0xffff000050f08720: add      x1, x1, #0xbf8
   0xffff000050f08724: mov      w0, #1
   0xffff000050f08728: mov      x2, x19
   0xffff000050f0872c: mov      w3, #0x86
   0xffff000050f08730: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f08734: adrp     x20, #0xffff000051022000
   0xffff000050f08738: mov      w1, #-1
   0xffff000050f0873c: add      x20, x20, #0x4b8
   0xffff000050f08740: mov      x0, x20
   0xffff000050f08744: bl       #0xffff000050f22d30  ; call 0xffff000050f22d30
   0xffff000050f08748: mov      x0, x20
   0xffff000050f0874c: bl       #0xffff000050f22e48  ; call 0xffff000050f22e48
   0xffff000050f08750: adrp     x1, #0xffff000050ff2000
   0xffff000050f08754: mov      w0, #1
   0xffff000050f08758: add      x1, x1, #0x756
   0xffff000050f0875c: mov      x2, x19
   0xffff000050f08760: mov      w3, #0x89
   0xffff000050f08764: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f08768: adrp     x19, #0xffff000051052000
   0xffff000050f0876c: add      x19, x19, #0x2e0
   0xffff000050f08770: mov      x0, x19
   0xffff000050f08774: bl       #0xffff000050f23ea0  ; call 0xffff000050f23ea0
   0xffff000050f08778: adrp     x2, #0xffff000050f62000
   0xffff000050f0877c: mov      x0, x19
   0xffff000050f08780: add      x2, x2, #0x2c0
   0xffff000050f08784: mov      w1, #0x1388
   0xffff000050f08788: mov      x3, xzr
   0xffff000050f0878c: bl       #0xffff000050f24030  ; call 0xffff000050f24030
   0xffff000050f08790: bl       #0xffff000050f89ffc  ; call 0xffff000050f89ffc
   0xffff000050f08794: bl       #0xffff000050f12910  ; call 0xffff000050f12910
   0xffff000050f08798: adrp     x19, #0xffff000051020000
   0xffff000050f0879c: adrp     x8, #0xffff000051020000
   0xffff000050f087a0: add      x19, x19, #0xe48
   0xffff000050f087a4: add      x8, x8, #0xd70
   0xffff000050f087a8: cmp      x8, x19
   0xffff000050f087ac: b.ne     #0xffff000050f088d8

loc_ffff000050f087b0:
   0xffff000050f087b0: bl       #0xffff000050f1245c  ; call 0xffff000050f1245c
   0xffff000050f087b4: adrp     x1, #0xffff000050fd3000
   0xffff000050f087b8: mov      w0, wzr
   0xffff000050f087bc: add      x1, x1, #0x54b
   0xffff000050f087c0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f087c4: adrp     x1, #0xffff000050fdd000
   0xffff000050f087c8: add      x0, sp, #0xc
   0xffff000050f087cc: add      x1, x1, #0xcd6
   0xffff000050f087d0: mov      w2, #0x8000000
   0xffff000050f087d4: bl       #0xffff000050f8c790  ; call 0xffff000050f8c790
   0xffff000050f087d8: adrp     x0, #0xffff000050fdf000
   0xffff000050f087dc: adrp     x1, #0xffff000050fe4000
   0xffff000050f087e0: add      x0, x0, #0x96d
   0xffff000050f087e4: add      x1, x1, #0x4eb
   0xffff000050f087e8: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f087ec: bl       #0xffff000050f09604  ; call 0xffff000050f09604
   0xffff000050f087f0: mov      x1, x0
   0xffff000050f087f4: adrp     x0, #0xffff000050fed000
; XREF string 0xffff000050fedbf0: 'version-bootloader' -> 'version-bootloader'
>> 0xffff000050f087f8: add      x0, x0, #0xbf0
   0xffff000050f087fc: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08800: adrp     x0, #0xffff000050fe8000
   0xffff000050f08804: add      x1, sp, #0xc
; XREF string 0xffff000050fe8da4: 'max-download-size' -> 'max-download-size'
>> 0xffff000050f08808: add      x0, x0, #0xda4
   0xffff000050f0880c: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08810: adrp     x0, #0xffff000050fdd000
   0xffff000050f08814: adrp     x1, #0xffff000050ffa000
   0xffff000050f08818: add      x0, x0, #0xc2d
   0xffff000050f0881c: add      x1, x1, #0x228
   0xffff000050f08820: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08824: bl       #0xffff000050f1b690  ; call 0xffff000050f1b690
   0xffff000050f08828: mov      x1, x0
   0xffff000050f0882c: adrp     x0, #0xffff000050ffd000
; XREF string 0xffff000050ffd758: 'serialno' -> 'serialno'
>> 0xffff000050f08830: add      x0, x0, #0x758
   0xffff000050f08834: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08838: adrp     x19, #0xffff000050fe2000
   0xffff000050f0883c: adrp     x0, #0xffff000050ff5000
   0xffff000050f08840: add      x19, x19, #0xa8a
; XREF string 0xffff000050ff5adf: 'is-userspace' -> 'is-userspace'
>> 0xffff000050f08844: add      x0, x0, #0xadf
   0xffff000050f08848: mov      x1, x19
   0xffff000050f0884c: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08850: adrp     x0, #0xffff000050fd7000
   0xffff000050f08854: adrp     x1, #0xffff000050fef000
   0xffff000050f08858: add      x0, x0, #0xd19
   0xffff000050f0885c: add      x1, x1, #0x442
   0xffff000050f08860: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08864: bl       #0xffff000050f09654  ; call 0xffff000050f09654
   0xffff000050f08868: bl       #0xffff000050f1278c  ; call 0xffff000050f1278c
   0xffff000050f0886c: bl       #0xffff000050f3bbc4  ; call 0xffff000050f3bbc4
   0xffff000050f08870: tbz      w0, #0, #0xffff000050f08908
   0xffff000050f08874: bl       #0xffff000050f3b800  ; call 0xffff000050f3b800
   0xffff000050f08878: adrp     x1, #0xffff000050fd4000
   0xffff000050f0887c: mov      w2, #2
   0xffff000050f08880: add      x1, x1, #0xdbf
   0xffff000050f08884: bl       #0xffff000050f8e6fc  ; call 0xffff000050f8e6fc
   0xffff000050f08888: adrp     x8, #0xffff000050ff0000
   0xffff000050f0888c: adrp     x9, #0xffff000050fec000
   0xffff000050f08890: add      x8, x8, #0xdb6
   0xffff000050f08894: add      x9, x9, #0x44d
   0xffff000050f08898: cmp      w0, #0
   0xffff000050f0889c: adrp     x0, #0xffff000050ffa000
   0xffff000050f088a0: csel     x1, x9, x8, eq
   0xffff000050f088a4: add      x0, x0, #0x233
   0xffff000050f088a8: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f088ac: adrp     x1, #0xffff000050fcf000
   0xffff000050f088b0: add      x0, sp, #0xc
   0xffff000050f088b4: add      x1, x1, #0x4f
   0xffff000050f088b8: mov      w2, #2
   0xffff000050f088bc: bl       #0xffff000050f8c790  ; call 0xffff000050f8c790
   0xffff000050f088c0: tbnz     w0, #0x1f, #0xffff000050f0891c

loc_ffff000050f088c4:
   0xffff000050f088c4: adrp     x0, #0xffff000050fef000
   0xffff000050f088c8: add      x1, sp, #0xc
   0xffff000050f088cc: add      x0, x0, #0x468
   0xffff000050f088d0: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f088d4: b        #0xffff000050f08944

loc_ffff000050f088d8:
   0xffff000050f088d8: adrp     x20, #0xffff000051020000
   0xffff000050f088dc: add      x20, x20, #0xd70
   0xffff000050f088e0: b        #0xffff000050f088f0

loc_ffff000050f088e4:
   0xffff000050f088e4: add      x20, x20, #0x18
   0xffff000050f088e8: cmp      x20, x19
   0xffff000050f088ec: b.eq     #0xffff000050f087b0

loc_ffff000050f088f0:
   0xffff000050f088f0: ldr      x1, [x20, #0x10]
   0xffff000050f088f4: cbz      x1, #0xffff000050f088e4
   0xffff000050f088f8: ldp      w2, w3, [x20]
   0xffff000050f088fc: ldr      x0, [x20, #8]
   0xffff000050f08900: bl       #0xffff000050f0791c  ; call 0xffff000050f0791c
   0xffff000050f08904: b        #0xffff000050f088e4

loc_ffff000050f08908:
   0xffff000050f08908: adrp     x0, #0xffff000050fef000
   0xffff000050f0890c: adrp     x1, #0xffff000050fe2000
   0xffff000050f08910: add      x0, x0, #0x468
   0xffff000050f08914: add      x1, x1, #0xa8d
   0xffff000050f08918: b        #0xffff000050f08a74

loc_ffff000050f0891c:
   0xffff000050f0891c: bl       #0xffff000050f8c784  ; call 0xffff000050f8c784
   0xffff000050f08920: ldr      w8, [x0]
   0xffff000050f08924: cbz      w8, #0xffff000050f088c4
   0xffff000050f08928: adrp     x1, #0xffff000050fef000
   0xffff000050f0892c: adrp     x2, #0xffff000050fdc000
   0xffff000050f08930: add      x1, x1, #0x444
   0xffff000050f08934: add      x2, x2, #0x23a
   0xffff000050f08938: mov      w0, #1
   0xffff000050f0893c: mov      w3, #0xb9
   0xffff000050f08940: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f08944:
   0xffff000050f08944: mov      w0, wzr
   0xffff000050f08948: mov      w1, wzr
   0xffff000050f0894c: bl       #0xffff000050f3ba78  ; call 0xffff000050f3ba78
   0xffff000050f08950: adrp     x20, #0xffff000050fd4000
   0xffff000050f08954: add      x20, x20, #0xdc2
   0xffff000050f08958: tbnz     w0, #0x1f, #0xffff000050f08970
   0xffff000050f0895c: cmp      w0, #0
   0xffff000050f08960: adrp     x0, #0xffff000050fd3000
   0xffff000050f08964: csel     x1, x19, x20, eq
   0xffff000050f08968: add      x0, x0, #0x567
   0xffff000050f0896c: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc

loc_ffff000050f08970:
   0xffff000050f08970: mov      w0, #1
   0xffff000050f08974: mov      w1, wzr
   0xffff000050f08978: bl       #0xffff000050f3ba78  ; call 0xffff000050f3ba78
   0xffff000050f0897c: tbnz     w0, #0x1f, #0xffff000050f08994
   0xffff000050f08980: cmp      w0, #0
   0xffff000050f08984: adrp     x0, #0xffff000050fd7000
   0xffff000050f08988: csel     x1, x19, x20, eq
   0xffff000050f0898c: add      x0, x0, #0xd2a
   0xffff000050f08990: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc

loc_ffff000050f08994:
   0xffff000050f08994: mov      w0, wzr
   0xffff000050f08998: mov      w1, #1
   0xffff000050f0899c: bl       #0xffff000050f3ba78  ; call 0xffff000050f3ba78
   0xffff000050f089a0: tbnz     w0, #0x1f, #0xffff000050f089b8
   0xffff000050f089a4: cmp      w0, #0
   0xffff000050f089a8: adrp     x0, #0xffff000050ff0000
   0xffff000050f089ac: csel     x1, x19, x20, eq
   0xffff000050f089b0: add      x0, x0, #0xdb8
   0xffff000050f089b4: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc

loc_ffff000050f089b8:
   0xffff000050f089b8: mov      w0, #1
   0xffff000050f089bc: mov      w1, #1
   0xffff000050f089c0: bl       #0xffff000050f3ba78  ; call 0xffff000050f3ba78
   0xffff000050f089c4: tbnz     w0, #0x1f, #0xffff000050f089dc
   0xffff000050f089c8: cmp      w0, #0
   0xffff000050f089cc: adrp     x0, #0xffff000050fe7000
   0xffff000050f089d0: csel     x1, x19, x20, eq
   0xffff000050f089d4: add      x0, x0, #0x485
   0xffff000050f089d8: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc

loc_ffff000050f089dc:
   0xffff000050f089dc: mov      w0, wzr
   0xffff000050f089e0: mov      w1, #2
   0xffff000050f089e4: bl       #0xffff000050f3ba78  ; call 0xffff000050f3ba78
   0xffff000050f089e8: tbnz     w0, #0x1f, #0xffff000050f08a40
   0xffff000050f089ec: adrp     x1, #0xffff000050fcf000
   0xffff000050f089f0: mov      w2, w0
   0xffff000050f089f4: add      x1, x1, #0x4f
   0xffff000050f089f8: add      x0, sp, #0xc
   0xffff000050f089fc: bl       #0xffff000050f8c790  ; call 0xffff000050f8c790
   0xffff000050f08a00: tbnz     w0, #0x1f, #0xffff000050f08a18

loc_ffff000050f08a04:
   0xffff000050f08a04: adrp     x0, #0xffff000050fd2000
   0xffff000050f08a08: add      x1, sp, #0xc
   0xffff000050f08a0c: add      x0, x0, #0xb3
   0xffff000050f08a10: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc
   0xffff000050f08a14: b        #0xffff000050f08a40

loc_ffff000050f08a18:
   0xffff000050f08a18: bl       #0xffff000050f8c784  ; call 0xffff000050f8c784
   0xffff000050f08a1c: ldr      w8, [x0]
   0xffff000050f08a20: cbz      w8, #0xffff000050f08a04
   0xffff000050f08a24: adrp     x1, #0xffff000050fd4000
   0xffff000050f08a28: adrp     x2, #0xffff000050fdc000
   0xffff000050f08a2c: add      x1, x1, #0xdc6
   0xffff000050f08a30: add      x2, x2, #0x23a
   0xffff000050f08a34: mov      w0, #1
   0xffff000050f08a38: mov      w3, #0xd1
   0xffff000050f08a3c: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f08a40:
   0xffff000050f08a40: mov      w0, #1
   0xffff000050f08a44: mov      w1, #2
   0xffff000050f08a48: bl       #0xffff000050f3ba78  ; call 0xffff000050f3ba78
   0xffff000050f08a4c: tbnz     w0, #0x1f, #0xffff000050f08a78
   0xffff000050f08a50: adrp     x1, #0xffff000050fcf000
   0xffff000050f08a54: mov      w2, w0
   0xffff000050f08a58: add      x1, x1, #0x4f
   0xffff000050f08a5c: add      x0, sp, #0xc
   0xffff000050f08a60: bl       #0xffff000050f8c790  ; call 0xffff000050f8c790
   0xffff000050f08a64: tbnz     w0, #0x1f, #0xffff000050f08bd4
   0xffff000050f08a68: adrp     x0, #0xffff000050fcf000
   0xffff000050f08a6c: add      x1, sp, #0xc
   0xffff000050f08a70: add      x0, x0, #0xa2

loc_ffff000050f08a74:
   0xffff000050f08a74: bl       #0xffff000050f079fc  ; call 0xffff000050f079fc

loc_ffff000050f08a78:
   0xffff000050f08a78: adrp     x5, #0xffff000050fd9000
   0xffff000050f08a7c: mov      w0, #0x10000000
   0xffff000050f08a80: add      x5, x5, #0x527
   0xffff000050f08a84: mov      w1, #0x1000
   0xffff000050f08a88: mov      w2, #-0x30000000
   0xffff000050f08a8c: mov      x3, xzr
   0xffff000050f08a90: mov      w4, wzr
   0xffff000050f08a94: bl       #0xffff000050f2ac68  ; call 0xffff000050f2ac68
   0xffff000050f08a98: adrp     x20, #0xffff000051052000
   0xffff000050f08a9c: str      x0, [x20, #0x2d8]
   0xffff000050f08aa0: cbz      x0, #0xffff000050f08b14
   0xffff000050f08aa4: adrp     x1, #0xffff000050fdd000
   0xffff000050f08aa8: mov      x2, x0
   0xffff000050f08aac: add      x1, x1, #0xcdb
   0xffff000050f08ab0: mov      w0, #-1
   0xffff000050f08ab4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f08ab8: adrp     x0, #0xffff000051105000
   0xffff000050f08abc: adrp     x1, #0xffff000050fd9000
   0xffff000050f08ac0: adrp     x3, #0xffff000051052000
   0xffff000050f08ac4: ldr      x5, [x20, #0x2d8]
   0xffff000050f08ac8: add      x0, x0, #0xb18
   0xffff000050f08acc: add      x1, x1, #0x527
   0xffff000050f08ad0: add      x3, x3, #0x2d0
   0xffff000050f08ad4: mov      w2, #0x10000000
   0xffff000050f08ad8: mov      w4, #0xc
   0xffff000050f08adc: mov      w6, wzr
   0xffff000050f08ae0: mov      w7, wzr
   0xffff000050f08ae4: bl       #0xffff000050f88fc0  ; call 0xffff000050f88fc0
   0xffff000050f08ae8: cbz      w0, #0xffff000050f08b68
   0xffff000050f08aec: adrp     x1, #0xffff000050fe8000
   0xffff000050f08af0: mov      w0, #-1
   0xffff000050f08af4: add      x1, x1, #0xdb6
   0xffff000050f08af8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f08afc: ldr      x0, [x20, #0x2d8]
   0xffff000050f08b00: mov      w1, #0x10000000
   0xffff000050f08b04: bl       #0xffff000050f2c298  ; call 0xffff000050f2c298
   0xffff000050f08b08: ldr      x8, [x20, #0x2d8]
   0xffff000050f08b0c: cbnz     x8, #0xffff000050f08b2c
   0xffff000050f08b10: b        #0xffff000050f08b9c

loc_ffff000050f08b14:
   0xffff000050f08b14: adrp     x1, #0xffff000050fcf000
   0xffff000050f08b18: mov      w0, #-1
   0xffff000050f08b1c: add      x1, x1, #0xb5
   0xffff000050f08b20: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f08b24: ldr      x8, [x20, #0x2d8]
   0xffff000050f08b28: cbz      x8, #0xffff000050f08b9c

loc_ffff000050f08b2c:
   0xffff000050f08b2c: adrp     x19, #0xffff000051052000
   0xffff000050f08b30: mov      w1, #0x10000000
   0xffff000050f08b34: ldr      x0, [x19, #0x2d0]
   0xffff000050f08b38: bl       #0xffff000050f0827c  ; call 0xffff000050f0827c
   0xffff000050f08b3c: ldr      x1, [x19, #0x2d0]
   0xffff000050f08b40: cbz      x1, #0xffff000050f08bbc
   0xffff000050f08b44: adrp     x0, #0xffff000051105000
   0xffff000050f08b48: add      x0, x0, #0xb18
   0xffff000050f08b4c: bl       #0xffff000050f8926c  ; call 0xffff000050f8926c
   0xffff000050f08b50: ldr      x0, [x20, #0x2d8]
   0xffff000050f08b54: mov      w1, #0x10000000
   0xffff000050f08b58: bl       #0xffff000050f2c298  ; call 0xffff000050f2c298
   0xffff000050f08b5c: str      xzr, [x19, #0x2d0]
   0xffff000050f08b60: str      xzr, [x20, #0x2d8]
   0xffff000050f08b64: b        #0xffff000050f08bbc

loc_ffff000050f08b68:
   0xffff000050f08b68: adrp     x8, #0xffff000051052000
   0xffff000050f08b6c: mov      w1, wzr
   0xffff000050f08b70: mov      w2, #0x10000000
   0xffff000050f08b74: ldr      x19, [x8, #0x2d0]
   0xffff000050f08b78: mov      x0, x19
   0xffff000050f08b7c: bl       #0xffff000050f8e214  ; call 0xffff000050f8e214
   0xffff000050f08b80: adrp     x1, #0xffff000050fec000
   0xffff000050f08b84: mov      w0, #-1
   0xffff000050f08b88: add      x1, x1, #0x44f
   0xffff000050f08b8c: mov      x2, x19
   0xffff000050f08b90: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f08b94: ldr      x8, [x20, #0x2d8]
   0xffff000050f08b98: cbnz     x8, #0xffff000050f08b2c

loc_ffff000050f08b9c:
   0xffff000050f08b9c: adrp     x1, #0xffff000050fed000
   0xffff000050f08ba0: adrp     x2, #0xffff000050ffb000
   0xffff000050f08ba4: add      x1, x1, #0xbce
   0xffff000050f08ba8: add      x2, x2, #0xbe9
   0xffff000050f08bac: mov      w0, #1
   0xffff000050f08bb0: mov      w3, #0x18a
   0xffff000050f08bb4: mov      w4, #0x10000000
   0xffff000050f08bb8: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f08bbc:
   0xffff000050f08bbc: bl       #0xffff000050f078e4  ; call 0xffff000050f078e4
   0xffff000050f08bc0: bl       #0xffff000050f0798c  ; call 0xffff000050f0798c
   0xffff000050f08bc4: ldp      x20, x19, [sp, #0x30]
   0xffff000050f08bc8: ldp      x29, x30, [sp, #0x20]
   0xffff000050f08bcc: add      sp, sp, #0x40
   0xffff000050f08bd0: ret      
