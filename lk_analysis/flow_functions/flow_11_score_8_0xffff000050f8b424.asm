; flow candidate 0xffff000050f8b424-0xffff000050f8b88c
; score: 8
; matched targets: metadata
; calls: 0xffff000050f3be08, 0xffff000050f89638, 0xffff000050fcacbc, 0xffff000050f8bed8, 0xffff000050f8c008, 0xffff000050f29978, 0xffff000050f8b8e4, 0xffff000050f8def4

   0xffff000050f8b424: sub      sp, sp, #0x140
   0xffff000050f8b428: stp      x29, x30, [sp, #0x100]
   0xffff000050f8b42c: add      x29, sp, #0x100
   0xffff000050f8b430: str      x28, [sp, #0x110]
   0xffff000050f8b434: stp      x22, x21, [sp, #0x120]
   0xffff000050f8b438: stp      x20, x19, [sp, #0x130]
   0xffff000050f8b43c: cbz      x1, #0xffff000050f8b510
   0xffff000050f8b440: mov      x21, x1
   0xffff000050f8b444: mov      x19, x0
   0xffff000050f8b448: bl       #0xffff000050f3be08  ; call 0xffff000050f3be08
   0xffff000050f8b44c: mov      w20, w0
   0xffff000050f8b450: tbnz     w0, #0x1f, #0xffff000050f8b4f4
   0xffff000050f8b454: ldr      w8, [x21, #0x2c]
   0xffff000050f8b458: cmp      w20, w8
   0xffff000050f8b45c: b.hs     #0xffff000050f8b4f4
   0xffff000050f8b460: ldr      w8, [x21, #0x28]
   0xffff000050f8b464: mov      w9, #0x3000
   0xffff000050f8b468: mov      x1, sp
   0xffff000050f8b46c: mov      x0, x19
   0xffff000050f8b470: mov      w3, #0x100
   0xffff000050f8b474: madd     w22, w8, w20, w9
   0xffff000050f8b478: mov      w8, #0x100
   0xffff000050f8b47c: mov      x2, x22
   0xffff000050f8b480: str      w8, [x29, #0x1c]
   0xffff000050f8b484: bl       #0xffff000050f89638  ; call 0xffff000050f89638
   0xffff000050f8b488: cmp      w0, #0x100
   0xffff000050f8b48c: b.ne     #0xffff000050f8b510
   0xffff000050f8b490: mov      x1, sp
   0xffff000050f8b494: add      x2, x29, #0x1c
   0xffff000050f8b498: mov      x0, x21
   0xffff000050f8b49c: bl       #0xffff000050fcacbc  ; call 0xffff000050fcacbc
   0xffff000050f8b4a0: cmp      w0, #1
   0xffff000050f8b4a4: b.ne     #0xffff000050f8b530
   0xffff000050f8b4a8: ldr      w8, [x29, #0x1c]
   0xffff000050f8b4ac: ldr      w9, [sp, #0x2c]
   0xffff000050f8b4b0: add      w21, w9, w8
   0xffff000050f8b4b4: cmp      w21, #0x80
   0xffff000050f8b4b8: b.lo     #0xffff000050f8b510
   0xffff000050f8b4bc: mov      x0, x21
   0xffff000050f8b4c0: bl       #0xffff000050f8bed8  ; call 0xffff000050f8bed8
   0xffff000050f8b4c4: mov      x20, x0
   0xffff000050f8b4c8: cbz      x0, #0xffff000050f8b5c8
   0xffff000050f8b4cc: mov      x0, x19
   0xffff000050f8b4d0: mov      x1, x20
   0xffff000050f8b4d4: mov      x2, x22
   0xffff000050f8b4d8: mov      x3, x21
   0xffff000050f8b4dc: bl       #0xffff000050f89638  ; call 0xffff000050f89638
   0xffff000050f8b4e0: cmp      w21, w0
   0xffff000050f8b4e4: b.eq     #0xffff000050f8b514
   0xffff000050f8b4e8: mov      x0, x20
   0xffff000050f8b4ec: bl       #0xffff000050f8c008  ; call 0xffff000050f8c008
   0xffff000050f8b4f0: b        #0xffff000050f8b510

loc_ffff000050f8b4f4:
   0xffff000050f8b4f4: adrp     x1, #0xffff000050fed000
   0xffff000050f8b4f8: add      x1, x1, #0x4dd

loc_ffff000050f8b4fc:
   0xffff000050f8b4fc: adrp     x2, #0xffff000050fea000
   0xffff000050f8b500: mov      w0, wzr
; XREF string 0xffff000050fea07b: 'metadata' -> 'ValidateMetadataAndLoad'
>> 0xffff000050f8b504: add      x2, x2, #0x7b
   0xffff000050f8b508: mov      w3, w20
   0xffff000050f8b50c: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f8b510:
   0xffff000050f8b510: mov      x20, xzr

loc_ffff000050f8b514:
   0xffff000050f8b514: mov      x0, x20
   0xffff000050f8b518: ldr      x28, [sp, #0x110]
   0xffff000050f8b51c: ldp      x20, x19, [sp, #0x130]
   0xffff000050f8b520: ldp      x22, x21, [sp, #0x120]
   0xffff000050f8b524: ldp      x29, x30, [sp, #0x100]
   0xffff000050f8b528: add      sp, sp, #0x140
   0xffff000050f8b52c: ret      

loc_ffff000050f8b530:
   0xffff000050f8b530: adrp     x1, #0xffff000050ff6000
   0xffff000050f8b534: adrp     x2, #0xffff000050fea000
; XREF string 0xffff000050ff6ab3: 'metadata' -> '%s: Failed in validating slot %d metadata!\n'
>> 0xffff000050f8b538: add      x1, x1, #0xab3
; XREF string 0xffff000050fea07b: 'metadata' -> 'ValidateMetadataAndLoad'
>> 0xffff000050f8b53c: add      x2, x2, #0x7b
   0xffff000050f8b540: mov      w0, wzr
   0xffff000050f8b544: mov      w3, w20
   0xffff000050f8b548: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f8b54c: ldp      w9, w8, [x21, #0x28]
   0xffff000050f8b550: mov      w10, #0x3000
   0xffff000050f8b554: mov      x1, sp
   0xffff000050f8b558: mov      x0, x19
   0xffff000050f8b55c: mov      w3, #0x100
   0xffff000050f8b560: add      w8, w8, w20
   0xffff000050f8b564: madd     w22, w8, w9, w10
   0xffff000050f8b568: mov      w8, #0x100
   0xffff000050f8b56c: mov      x2, x22
   0xffff000050f8b570: str      w8, [x29, #0x1c]
   0xffff000050f8b574: bl       #0xffff000050f89638  ; call 0xffff000050f89638
   0xffff000050f8b578: ldr      w8, [x29, #0x1c]
   0xffff000050f8b57c: cmp      w8, w0
   0xffff000050f8b580: b.ne     #0xffff000050f8b510
   0xffff000050f8b584: mov      x1, sp
   0xffff000050f8b588: add      x2, x29, #0x1c
   0xffff000050f8b58c: mov      x0, x21
   0xffff000050f8b590: bl       #0xffff000050fcacbc  ; call 0xffff000050fcacbc
   0xffff000050f8b594: cmp      w0, #1
   0xffff000050f8b598: b.ne     #0xffff000050f8b5bc
   0xffff000050f8b59c: ldr      w8, [x29, #0x1c]
   0xffff000050f8b5a0: mov      x0, x19
   0xffff000050f8b5a4: ldr      w9, [sp, #0x2c]
   0xffff000050f8b5a8: mov      x1, x22
   0xffff000050f8b5ac: add      w2, w9, w8
   0xffff000050f8b5b0: bl       #0xffff000050f8b8e4  ; call 0xffff000050f8b8e4
   0xffff000050f8b5b4: mov      x20, x0
   0xffff000050f8b5b8: b        #0xffff000050f8b514

loc_ffff000050f8b5bc:
   0xffff000050f8b5bc: adrp     x1, #0xffff000050ffe000
; XREF string 0xffff000050ffe7f7: 'metadata' -> '%s: Failed in validating slot %d backup metadata!\n'
>> 0xffff000050f8b5c0: add      x1, x1, #0x7f7
   0xffff000050f8b5c4: b        #0xffff000050f8b4fc

loc_ffff000050f8b5c8:
   0xffff000050f8b5c8: adrp     x1, #0xffff000050fdd000
   0xffff000050f8b5cc: adrp     x2, #0xffff000050fe3000
; XREF string 0xffff000050fdd516: 'metadata' -> '%s: Out of memory for metadata!\n'
>> 0xffff000050f8b5d0: add      x1, x1, #0x516
; XREF string 0xffff000050fe3ca4: 'metadata' -> 'LoadMetadata'
>> 0xffff000050f8b5d4: add      x2, x2, #0xca4
   0xffff000050f8b5d8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f8b5dc: b        #0xffff000050f8b514
   0xffff000050f8b5e0: stp      x29, x30, [sp, #-0x60]!
   0xffff000050f8b5e4: str      x27, [sp, #0x10]
   0xffff000050f8b5e8: mov      x29, sp
   0xffff000050f8b5ec: stp      x26, x25, [sp, #0x20]
   0xffff000050f8b5f0: stp      x24, x23, [sp, #0x30]
   0xffff000050f8b5f4: stp      x22, x21, [sp, #0x40]
   0xffff000050f8b5f8: stp      x20, x19, [sp, #0x50]
   0xffff000050f8b5fc: mov      x20, x0
   0xffff000050f8b600: mov      w0, wzr
   0xffff000050f8b604: cbz      x20, #0xffff000050f8b874
   0xffff000050f8b608: mov      x19, x1
   0xffff000050f8b60c: cbz      x1, #0xffff000050f8b874
   0xffff000050f8b610: ldr      w24, [x20, #0x54]
   0xffff000050f8b614: cbz      w24, #0xffff000050f8b648
   0xffff000050f8b618: mov      w8, #0x34
   0xffff000050f8b61c: ldr      w22, [x20, #8]
   0xffff000050f8b620: ldr      w23, [x20, #0x50]
   0xffff000050f8b624: mul      w21, w24, w8
   0xffff000050f8b628: mov      x0, x21
   0xffff000050f8b62c: bl       #0xffff000050f8bed8  ; call 0xffff000050f8bed8
   0xffff000050f8b630: str      x0, [x19, #0x40]
   0xffff000050f8b634: cbz      x0, #0xffff000050f8b7ec
   0xffff000050f8b638: add      x8, x20, x22
   0xffff000050f8b63c: mov      x2, x21
   0xffff000050f8b640: add      x1, x8, x23
   0xffff000050f8b644: bl       #0xffff000050f8def4  ; call 0xffff000050f8def4

loc_ffff000050f8b648:
   0xffff000050f8b648: ldr      w25, [x20, #0x60]
   0xffff000050f8b64c: cbz      w25, #0xffff000050f8b778
   0xffff000050f8b650: cbz      w24, #0xffff000050f8b834
   0xffff000050f8b654: ldr      x8, [x19, #0x40]
   0xffff000050f8b658: cbz      x8, #0xffff000050f8b834
   0xffff000050f8b65c: ldr      w9, [x20, #8]
   0xffff000050f8b660: ldr      w10, [x20, #0x5c]
   0xffff000050f8b664: add      x9, x20, x9
   0xffff000050f8b668: add      x26, x9, x10
   0xffff000050f8b66c: cbz      x26, #0xffff000050f8b834
   0xffff000050f8b670: mov      w22, wzr
   0xffff000050f8b674: mov      x21, xzr
   0xffff000050f8b678: add      x27, x8, #0x2c

loc_ffff000050f8b67c:
   0xffff000050f8b67c: mov      w0, #0x24
   0xffff000050f8b680: bl       #0xffff000050f8bed8  ; call 0xffff000050f8bed8
   0xffff000050f8b684: cbz      x0, #0xffff000050f8b8c8
   0xffff000050f8b688: ldp      x10, x11, [x26]
   0xffff000050f8b68c: mov      x23, x0
   0xffff000050f8b690: mov      w8, wzr
   0xffff000050f8b694: ldr      x12, [x26, #0x10]
   0xffff000050f8b698: mov      x9, x27
   0xffff000050f8b69c: stp      x10, x11, [x0]
   0xffff000050f8b6a0: str      x12, [x0, #0x10]
   0xffff000050f8b6a4: b        #0xffff000050f8b6b8

loc_ffff000050f8b6a8:
   0xffff000050f8b6a8: add      w8, w8, #1
   0xffff000050f8b6ac: add      x9, x9, #0x34
   0xffff000050f8b6b0: cmp      w24, w8
   0xffff000050f8b6b4: b.eq     #0xffff000050f8b7f8

loc_ffff000050f8b6b8:
   0xffff000050f8b6b8: ldr      w10, [x9]
   0xffff000050f8b6bc: cbz      w10, #0xffff000050f8b6a8
   0xffff000050f8b6c0: ldur     w11, [x9, #-4]
   0xffff000050f8b6c4: cmp      w11, w22
   0xffff000050f8b6c8: b.hi     #0xffff000050f8b6a8
   0xffff000050f8b6cc: add      w10, w11, w10
   0xffff000050f8b6d0: cmp      w10, w22
   0xffff000050f8b6d4: b.ls     #0xffff000050f8b6a8
   0xffff000050f8b6d8: tbnz     w8, #0x1f, #0xffff000050f8b814
   0xffff000050f8b6dc: str      w8, [x23, #0x18]
   0xffff000050f8b6e0: stur     xzr, [x23, #0x1c]
   0xffff000050f8b6e4: cbz      x21, #0xffff000050f8b760
   0xffff000050f8b6e8: ldur     x9, [x23, #0xc]
   0xffff000050f8b6ec: mov      x8, xzr
   0xffff000050f8b6f0: ldr      x10, [x23]
   0xffff000050f8b6f4: mov      x11, x21
   0xffff000050f8b6f8: add      x9, x10, x9

loc_ffff000050f8b6fc:
   0xffff000050f8b6fc: mov      x10, x11
   0xffff000050f8b700: cbz      x8, #0xffff000050f8b728
   0xffff000050f8b704: ldur     x12, [x8, #0xc]
   0xffff000050f8b708: ldr      x13, [x8]
   0xffff000050f8b70c: ldur     x11, [x10, #0xc]
   0xffff000050f8b710: add      x12, x13, x12
   0xffff000050f8b714: cmp      x12, x11
   0xffff000050f8b718: b.hi     #0xffff000050f8b890
   0xffff000050f8b71c: cmp      x9, x11
   0xffff000050f8b720: b.hi     #0xffff000050f8b734
   0xffff000050f8b724: b        #0xffff000050f8b748

loc_ffff000050f8b728:
   0xffff000050f8b728: ldur     x11, [x10, #0xc]
   0xffff000050f8b72c: cmp      x9, x11
   0xffff000050f8b730: b.ls     #0xffff000050f8b748

loc_ffff000050f8b734:
   0xffff000050f8b734: ldur     x11, [x10, #0x1c]
   0xffff000050f8b738: mov      x8, x10
   0xffff000050f8b73c: cbnz     x11, #0xffff000050f8b6fc
   0xffff000050f8b740: stur     x23, [x10, #0x1c]
   0xffff000050f8b744: b        #0xffff000050f8b764

loc_ffff000050f8b748:
   0xffff000050f8b748: cmp      x10, x21
   0xffff000050f8b74c: b.eq     #0xffff000050f8b75c
   0xffff000050f8b750: stur     x10, [x23, #0x1c]
   0xffff000050f8b754: stur     x23, [x8, #0x1c]
   0xffff000050f8b758: b        #0xffff000050f8b764

loc_ffff000050f8b75c:
   0xffff000050f8b75c: stur     x21, [x23, #0x1c]

loc_ffff000050f8b760:
   0xffff000050f8b760: mov      x21, x23

loc_ffff000050f8b764:
   0xffff000050f8b764: add      w22, w22, #1
   0xffff000050f8b768: add      x26, x26, #0x18
   0xffff000050f8b76c: cmp      w22, w25
   0xffff000050f8b770: b.ne     #0xffff000050f8b67c
   0xffff000050f8b774: str      x21, [x19, #0x48]

loc_ffff000050f8b778:
   0xffff000050f8b778: ldr      w8, [x20, #0x6c]
   0xffff000050f8b77c: cbz      w8, #0xffff000050f8b7b0
   0xffff000050f8b780: add      w8, w8, w8, lsl #1
   0xffff000050f8b784: ldr      w22, [x20, #8]
   0xffff000050f8b788: lsl      w21, w8, #4
   0xffff000050f8b78c: ldr      w23, [x20, #0x68]
   0xffff000050f8b790: mov      x0, x21
   0xffff000050f8b794: bl       #0xffff000050f8bed8  ; call 0xffff000050f8bed8
   0xffff000050f8b798: str      x0, [x19, #0x50]
   0xffff000050f8b79c: cbz      x0, #0xffff000050f8b850
   0xffff000050f8b7a0: add      x8, x20, x22
   0xffff000050f8b7a4: mov      x2, x21
   0xffff000050f8b7a8: add      x1, x8, x23
   0xffff000050f8b7ac: bl       #0xffff000050f8def4  ; call 0xffff000050f8def4

loc_ffff000050f8b7b0:
   0xffff000050f8b7b0: ldr      w8, [x20, #0x78]
   0xffff000050f8b7b4: cbz      w8, #0xffff000050f8b7e4
   0xffff000050f8b7b8: lsl      w21, w8, #6
   0xffff000050f8b7bc: ldr      w22, [x20, #8]
   0xffff000050f8b7c0: mov      x0, x21
   0xffff000050f8b7c4: ldr      w23, [x20, #0x74]
   0xffff000050f8b7c8: bl       #0xffff000050f8bed8  ; call 0xffff000050f8bed8
   0xffff000050f8b7cc: str      x0, [x19, #0x58]
   0xffff000050f8b7d0: cbz      x0, #0xffff000050f8b85c
   0xffff000050f8b7d4: add      x8, x20, x22
   0xffff000050f8b7d8: mov      x2, x21
   0xffff000050f8b7dc: add      x1, x8, x23
   0xffff000050f8b7e0: bl       #0xffff000050f8def4  ; call 0xffff000050f8def4

loc_ffff000050f8b7e4:
   0xffff000050f8b7e4: mov      w0, #1
   0xffff000050f8b7e8: b        #0xffff000050f8b874

loc_ffff000050f8b7ec:
   0xffff000050f8b7ec: adrp     x1, #0xffff000050fea000
   0xffff000050f8b7f0: add      x1, x1, #0x93
   0xffff000050f8b7f4: b        #0xffff000050f8b864

loc_ffff000050f8b7f8:
   0xffff000050f8b7f8: adrp     x1, #0xffff000050ff0000
   0xffff000050f8b7fc: adrp     x2, #0xffff000050fe8000
   0xffff000050f8b800: add      x1, x1, #0x5e2
   0xffff000050f8b804: add      x2, x2, #0x5a8
   0xffff000050f8b808: mov      w0, wzr
   0xffff000050f8b80c: mov      w3, w22
   0xffff000050f8b810: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f8b814:
   0xffff000050f8b814: mov      x0, x23
   0xffff000050f8b818: bl       #0xffff000050f8c008  ; call 0xffff000050f8c008
   0xffff000050f8b81c: cbz      x21, #0xffff000050f8b834

loc_ffff000050f8b820:
   0xffff000050f8b820: mov      x0, x21
   0xffff000050f8b824: ldur     x20, [x21, #0x1c]
   0xffff000050f8b828: bl       #0xffff000050f8c008  ; call 0xffff000050f8c008
   0xffff000050f8b82c: mov      x21, x20
   0xffff000050f8b830: cbnz     x20, #0xffff000050f8b820

loc_ffff000050f8b834:
   0xffff000050f8b834: adrp     x1, #0xffff000050fe3000
   0xffff000050f8b838: adrp     x2, #0xffff000050ff1000
   0xffff000050f8b83c: str      xzr, [x19, #0x48]
   0xffff000050f8b840: add      x1, x1, #0xcb1
   0xffff000050f8b844: add      x2, x2, #0xe57
   0xffff000050f8b848: mov      w0, wzr
   0xffff000050f8b84c: b        #0xffff000050f8b86c

loc_ffff000050f8b850:
   0xffff000050f8b850: adrp     x1, #0xffff000050ff9000
   0xffff000050f8b854: add      x1, x1, #0xad0
   0xffff000050f8b858: b        #0xffff000050f8b864

loc_ffff000050f8b85c:
   0xffff000050f8b85c: adrp     x1, #0xffff000050ff3000
   0xffff000050f8b860: add      x1, x1, #0x86e

loc_ffff000050f8b864:
   0xffff000050f8b864: adrp     x2, #0xffff000050ff1000
   0xffff000050f8b868: add      x2, x2, #0xe57

loc_ffff000050f8b86c:
   0xffff000050f8b86c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f8b870: mov      w0, wzr

loc_ffff000050f8b874:
   0xffff000050f8b874: ldp      x20, x19, [sp, #0x50]
   0xffff000050f8b878: ldp      x22, x21, [sp, #0x40]
   0xffff000050f8b87c: ldp      x24, x23, [sp, #0x30]
   0xffff000050f8b880: ldp      x26, x25, [sp, #0x20]
   0xffff000050f8b884: ldr      x27, [sp, #0x10]
   0xffff000050f8b888: ldp      x29, x30, [sp], #0x60
   0xffff000050f8b88c: ret      
