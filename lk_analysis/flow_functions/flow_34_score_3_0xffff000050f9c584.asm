; flow candidate 0xffff000050f9c584-0xffff000050f9cb08
; score: 3
; matched targets: metadata
; calls: 0xffff000050f9bff8, 0xffff000050f29978, 0xffff000050fcc538, 0xffff000050f9c000, 0xffff000050fc7038, 0xffff000050fcc480, 0xffff000050f909dc, 0xffff000050fc376c, 0xffff000050f9ca1c, 0xffff000050fc7540, 0xffff000050f9cb0c, 0xffff000050fc858c, 0xffff000050fc36b0, 0xffff000050fc32d8, 0xffff000050fc3878, 0xffff000050fc72e0, 0xffff000050f8def4, 0xffff000050f8e3ec, 0xffff000050fc6f0c, 0xffff000050fc4744, 0xffff000050fc4774, 0xffff000050fc4a10, 0xffff000050fcd3c0, 0xffff000050fcd3f0, 0xffff000050fcd42c, 0xffff000050f8deb8, 0xffff000050f9d940, 0xffff000050fc7fb4

   0xffff000050f9c584: mov      w22, w0
   0xffff000050f9c588: adrp     x0, #0xffff000050ff1000
   0xffff000050f9c58c: add      x0, x0, #0xf44
   0xffff000050f9c590: bl       #0xffff000050f9bff8  ; call 0xffff000050f9bff8
   0xffff000050f9c594: cbz      x19, #0xffff000050f9c5b0
   0xffff000050f9c598: cbz      x20, #0xffff000050f9c5b0
   0xffff000050f9c59c: cmp      w23, #0x3f
   0xffff000050f9c5a0: b.hi     #0xffff000050f9c620
   0xffff000050f9c5a4: adrp     x1, #0xffff000050fd1000
   0xffff000050f9c5a8: add      x1, x1, #0x9d6
   0xffff000050f9c5ac: b        #0xffff000050f9c5b8

loc_ffff000050f9c5b0:
   0xffff000050f9c5b0: adrp     x1, #0xffff000050ffd000
   0xffff000050f9c5b4: add      x1, x1, #0x12a

loc_ffff000050f9c5b8:
   0xffff000050f9c5b8: adrp     x2, #0xffff000050ff9000
   0xffff000050f9c5bc: mov      w0, #-1
   0xffff000050f9c5c0: add      x2, x2, #0xbdf

loc_ffff000050f9c5c4:
   0xffff000050f9c5c4: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f9c5c8:
   0xffff000050f9c5c8: mov      x19, xzr

loc_ffff000050f9c5cc:
   0xffff000050f9c5cc: mov      w24, wzr

loc_ffff000050f9c5d0:
   0xffff000050f9c5d0: bl       #0xffff000050fcc538  ; call 0xffff000050fcc538
   0xffff000050f9c5d4: cbz      w0, #0xffff000050f9c5ec
   0xffff000050f9c5d8: adrp     x1, #0xffff000051000000
   0xffff000050f9c5dc: mov      w2, w0
   0xffff000050f9c5e0: add      x1, x1, #0x4fd
   0xffff000050f9c5e4: mov      w0, #-1
   0xffff000050f9c5e8: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f9c5ec:
   0xffff000050f9c5ec: bl       #0xffff000050f9c000  ; call 0xffff000050f9c000
   0xffff000050f9c5f0: cbz      x19, #0xffff000050f9c5fc
   0xffff000050f9c5f4: mov      x0, x19
   0xffff000050f9c5f8: bl       #0xffff000050fc7038  ; call 0xffff000050fc7038

loc_ffff000050f9c5fc:
   0xffff000050f9c5fc: mov      w0, w24
   0xffff000050f9c600: add      sp, sp, #0x3e0
   0xffff000050f9c604: ldp      x20, x19, [sp, #0x50]
   0xffff000050f9c608: ldp      x22, x21, [sp, #0x40]
   0xffff000050f9c60c: ldp      x24, x23, [sp, #0x30]
   0xffff000050f9c610: ldp      x26, x25, [sp, #0x20]
   0xffff000050f9c614: ldp      x28, x27, [sp, #0x10]
   0xffff000050f9c618: ldp      x29, x30, [sp], #0x60
   0xffff000050f9c61c: ret      

loc_ffff000050f9c620:
   0xffff000050f9c620: bl       #0xffff000050fcc480  ; call 0xffff000050fcc480
   0xffff000050f9c624: cbz      w0, #0xffff000050f9c640
   0xffff000050f9c628: adrp     x1, #0xffff000050ffe000
   0xffff000050f9c62c: mov      w2, w0
   0xffff000050f9c630: add      x1, x1, #0x6db
   0xffff000050f9c634: mov      w0, #-1
   0xffff000050f9c638: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c63c: b        #0xffff000050f9c5c8

loc_ffff000050f9c640:
   0xffff000050f9c640: mov      x0, x19
   0xffff000050f9c644: bl       #0xffff000050f909dc  ; call 0xffff000050f909dc
   0xffff000050f9c648: mov      w23, w23
   0xffff000050f9c64c: mov      x21, x0
   0xffff000050f9c650: add      x8, x20, x23
   0xffff000050f9c654: sub      x1, x29, #0x48
   0xffff000050f9c658: sub      x0, x8, #0x40
   0xffff000050f9c65c: bl       #0xffff000050fc376c  ; call 0xffff000050fc376c
   0xffff000050f9c660: tbz      w0, #0, #0xffff000050f9c680
   0xffff000050f9c664: sub      x8, x29, #0x48
   0xffff000050f9c668: ldur     x1, [x8, #0x1c]
   0xffff000050f9c66c: cmp      x1, #0x10, lsl #12
   0xffff000050f9c670: b.ls     #0xffff000050f9c6a0
   0xffff000050f9c674: adrp     x1, #0xffff000050fee000
   0xffff000050f9c678: add      x1, x1, #0xdf4
   0xffff000050f9c67c: b        #0xffff000050f9c988

loc_ffff000050f9c680:
   0xffff000050f9c680: tbz      w22, #0, #0xffff000050f9c6c0
   0xffff000050f9c684: adrp     x1, #0xffff000050fdd000
   0xffff000050f9c688: mov      w0, #-1
   0xffff000050f9c68c: add      x1, x1, #0x57c
   0xffff000050f9c690: mov      x2, x19
   0xffff000050f9c694: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c698: mov      w24, #1
   0xffff000050f9c69c: b        #0xffff000050f9c5fc

loc_ffff000050f9c6a0:
   0xffff000050f9c6a0: ldur     x28, [x8, #0x14]
   0xffff000050f9c6a4: add      x8, x1, x28
   0xffff000050f9c6a8: add      x8, x8, #0x40
   0xffff000050f9c6ac: cmp      x8, x23
   0xffff000050f9c6b0: b.ls     #0xffff000050f9c6cc
   0xffff000050f9c6b4: adrp     x1, #0xffff000050ff5000
   0xffff000050f9c6b8: add      x1, x1, #0x4e2
   0xffff000050f9c6bc: b        #0xffff000050f9c988

loc_ffff000050f9c6c0:
   0xffff000050f9c6c0: adrp     x1, #0xffff000051000000
   0xffff000050f9c6c4: add      x1, x1, #0x522
   0xffff000050f9c6c8: b        #0xffff000050f9c988

loc_ffff000050f9c6cc:
   0xffff000050f9c6cc: add      x0, x20, x28
   0xffff000050f9c6d0: mov      w2, wzr
   0xffff000050f9c6d4: bl       #0xffff000050f9ca1c  ; call 0xffff000050f9ca1c
   0xffff000050f9c6d8: tbz      w0, #0, #0xffff000050f9c980
   0xffff000050f9c6dc: mov      w0, #0x10000
   0xffff000050f9c6e0: bl       #0xffff000050fc7540  ; call 0xffff000050fc7540
   0xffff000050f9c6e4: mov      x19, x0
   0xffff000050f9c6e8: cbz      x0, #0xffff000050f9c5cc
   0xffff000050f9c6ec: add      x1, sp, #0x288
   0xffff000050f9c6f0: mov      x0, x19
   0xffff000050f9c6f4: bl       #0xffff000050f9cb0c  ; call 0xffff000050f9cb0c
   0xffff000050f9c6f8: tbnz     w0, #0, #0xffff000050f9c710
   0xffff000050f9c6fc: adrp     x1, #0xffff000050ff3000
   0xffff000050f9c700: mov      w0, #-1
   0xffff000050f9c704: add      x1, x1, #0x986
   0xffff000050f9c708: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c70c: tbz      w22, #0, #0xffff000050f9c5c8

loc_ffff000050f9c710:
   0xffff000050f9c710: add      x1, sp, #0x298
   0xffff000050f9c714: mov      x0, x19
   0xffff000050f9c718: bl       #0xffff000050fc858c  ; call 0xffff000050fc858c
   0xffff000050f9c71c: ldr      x1, [sp, #0x288]
   0xffff000050f9c720: add      x2, sp, #0x290
   0xffff000050f9c724: mov      x0, x19
   0xffff000050f9c728: bl       #0xffff000050fc36b0  ; call 0xffff000050fc36b0
   0xffff000050f9c72c: mov      x19, x0
   0xffff000050f9c730: cbz      x0, #0xffff000050f9c5cc
   0xffff000050f9c734: ldr      x8, [sp, #0x290]
   0xffff000050f9c738: cbz      x8, #0xffff000050f9c5cc
   0xffff000050f9c73c: add      x8, sp, #0x1a8
   0xffff000050f9c740: adrp     x25, #0xffff000050ff6000
   0xffff000050f9c744: mov      w23, wzr
   0xffff000050f9c748: mov      x27, xzr
   0xffff000050f9c74c: add      x8, x8, #0x18
   0xffff000050f9c750: add      x25, x25, #0xbd1
   0xffff000050f9c754: str      x8, [sp, #0x10]

loc_ffff000050f9c758:
   0xffff000050f9c758: ldr      x0, [x19, x27, lsl #3]
   0xffff000050f9c75c: add      x1, sp, #0x278
   0xffff000050f9c760: bl       #0xffff000050fc32d8  ; call 0xffff000050fc32d8
   0xffff000050f9c764: tbz      w0, #0, #0xffff000050f9c994
   0xffff000050f9c768: ldr      x8, [sp, #0x278]
   0xffff000050f9c76c: cmp      x8, #2
   0xffff000050f9c770: b.ne     #0xffff000050f9c868
   0xffff000050f9c774: ldr      x0, [x19, x27, lsl #3]
   0xffff000050f9c778: add      x1, sp, #0x1a8
   0xffff000050f9c77c: bl       #0xffff000050fc3878  ; call 0xffff000050fc3878
   0xffff000050f9c780: tbz      w0, #0, #0xffff000050f9c7e0
   0xffff000050f9c784: ldr      x8, [x19, x27, lsl #3]
   0xffff000050f9c788: ldr      w1, [sp, #0x1e0]
   0xffff000050f9c78c: add      x26, x8, #0x84
   0xffff000050f9c790: mov      x0, x26
   0xffff000050f9c794: bl       #0xffff000050fc72e0  ; call 0xffff000050fc72e0
   0xffff000050f9c798: tbz      w0, #0, #0xffff000050f9c7f0
   0xffff000050f9c79c: ldr      w8, [sp, #0x1e4]
   0xffff000050f9c7a0: mov      x24, x25
   0xffff000050f9c7a4: ldr      w2, [sp, #0x1e0]
   0xffff000050f9c7a8: ldr      w9, [sp, #0x1e8]
   0xffff000050f9c7ac: cmp      x8, #0
   0xffff000050f9c7b0: add      x10, x26, x2
   0xffff000050f9c7b4: csel     x25, xzr, x10, eq
   0xffff000050f9c7b8: cmp      w9, #0
   0xffff000050f9c7bc: add      x8, x25, x8
   0xffff000050f9c7c0: csel     x8, xzr, x8, eq
   0xffff000050f9c7c4: cmp      w2, #0x48
   0xffff000050f9c7c8: b.lo     #0xffff000050f9c804
   0xffff000050f9c7cc: adrp     x1, #0xffff000050fe5000
   0xffff000050f9c7d0: mov      w0, #-1
   0xffff000050f9c7d4: add      x1, x1, #0x696
   0xffff000050f9c7d8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c7dc: b        #0xffff000050f9c864

loc_ffff000050f9c7e0:
   0xffff000050f9c7e0: mov      w0, #-1
   0xffff000050f9c7e4: mov      x1, x25
   0xffff000050f9c7e8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c7ec: b        #0xffff000050f9c868

loc_ffff000050f9c7f0:
   0xffff000050f9c7f0: adrp     x1, #0xffff000050fd7000
   0xffff000050f9c7f4: mov      w0, #-1
   0xffff000050f9c7f8: add      x1, x1, #0x81c
   0xffff000050f9c7fc: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c800: b        #0xffff000050f9c868

loc_ffff000050f9c804:
   0xffff000050f9c804: add      x0, sp, #0x230
   0xffff000050f9c808: mov      x1, x26
   0xffff000050f9c80c: str      x8, [sp, #8]
   0xffff000050f9c810: str      xzr, [sp, #0x270]
   0xffff000050f9c814: str      xzr, [sp, #0x268]
   0xffff000050f9c818: str      xzr, [sp, #0x260]
   0xffff000050f9c81c: str      xzr, [sp, #0x258]
   0xffff000050f9c820: str      xzr, [sp, #0x250]
   0xffff000050f9c824: str      xzr, [sp, #0x248]
   0xffff000050f9c828: str      xzr, [sp, #0x240]
   0xffff000050f9c82c: str      xzr, [sp, #0x238]
   0xffff000050f9c830: str      xzr, [sp, #0x230]
   0xffff000050f9c834: bl       #0xffff000050f8def4  ; call 0xffff000050f8def4
   0xffff000050f9c838: adrp     x1, #0xffff000050fda000
   0xffff000050f9c83c: adrp     x2, #0xffff000050ff9000
   0xffff000050f9c840: add      x3, sp, #0x230
   0xffff000050f9c844: mov      w0, #-1
   0xffff000050f9c848: add      x1, x1, #0x37b
   0xffff000050f9c84c: add      x2, x2, #0xbdf
   0xffff000050f9c850: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c854: add      x0, sp, #0x230
   0xffff000050f9c858: mov      x1, x21
   0xffff000050f9c85c: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9c860: cbz      w0, #0xffff000050f9c884

loc_ffff000050f9c864:
   0xffff000050f9c864: mov      x25, x24

loc_ffff000050f9c868:
   0xffff000050f9c868: ldr      x8, [sp, #0x290]
   0xffff000050f9c86c: add      x27, x27, #1
   0xffff000050f9c870: and      w24, w23, #1
   0xffff000050f9c874: cmp      x27, x8
   0xffff000050f9c878: b.hs     #0xffff000050f9c5d0
   0xffff000050f9c87c: cbz      w24, #0xffff000050f9c758
   0xffff000050f9c880: b        #0xffff000050f9c5d0

loc_ffff000050f9c884:
   0xffff000050f9c884: ldr      w4, [sp, #0x1e8]
   0xffff000050f9c888: ldr      w3, [sp, #0x1e4]
   0xffff000050f9c88c: ldr      x26, [sp, #0x10]
   0xffff000050f9c890: cbz      w4, #0xffff000050f9c9b4
   0xffff000050f9c894: cbz      w3, #0xffff000050f9c9b4
   0xffff000050f9c898: ldr      x3, [sp, #0x1b8]
   0xffff000050f9c89c: cmp      x3, x28
   0xffff000050f9c8a0: b.hi     #0xffff000050f9c9cc
   0xffff000050f9c8a4: adrp     x1, #0xffff000050fd0000
   0xffff000050f9c8a8: mov      x0, x26
   0xffff000050f9c8ac: add      x1, x1, #0x620
   0xffff000050f9c8b0: bl       #0xffff000050fc6f0c  ; call 0xffff000050fc6f0c
   0xffff000050f9c8b4: cbz      w0, #0xffff000050f9c90c
   0xffff000050f9c8b8: adrp     x1, #0xffff000050fd6000
   0xffff000050f9c8bc: mov      x0, x26
   0xffff000050f9c8c0: add      x1, x1, #0x11e
   0xffff000050f9c8c4: bl       #0xffff000050fc6f0c  ; call 0xffff000050fc6f0c
   0xffff000050f9c8c8: cbnz     w0, #0xffff000050f9ca00
   0xffff000050f9c8cc: ldr      w3, [sp, #0x1e8]
   0xffff000050f9c8d0: cmp      w3, #0x40
   0xffff000050f9c8d4: b.ne     #0xffff000050f9c9e4
   0xffff000050f9c8d8: add      x0, sp, #0x18
   0xffff000050f9c8dc: bl       #0xffff000050fc4744  ; call 0xffff000050fc4744
   0xffff000050f9c8e0: ldr      w2, [sp, #0x1e4]
   0xffff000050f9c8e4: add      x0, sp, #0x18
   0xffff000050f9c8e8: mov      x1, x25
   0xffff000050f9c8ec: bl       #0xffff000050fc4774  ; call 0xffff000050fc4774
   0xffff000050f9c8f0: ldr      x2, [sp, #0x1b8]
   0xffff000050f9c8f4: add      x0, sp, #0x18
   0xffff000050f9c8f8: mov      x1, x20
   0xffff000050f9c8fc: bl       #0xffff000050fc4774  ; call 0xffff000050fc4774
   0xffff000050f9c900: add      x0, sp, #0x18
   0xffff000050f9c904: bl       #0xffff000050fc4a10  ; call 0xffff000050fc4a10
   0xffff000050f9c908: b        #0xffff000050f9c948

loc_ffff000050f9c90c:
   0xffff000050f9c90c: ldr      w3, [sp, #0x1e8]
   0xffff000050f9c910: cmp      w3, #0x20
   0xffff000050f9c914: b.ne     #0xffff000050f9c9e4
   0xffff000050f9c918: add      x0, sp, #0x18
   0xffff000050f9c91c: bl       #0xffff000050fcd3c0  ; call 0xffff000050fcd3c0
   0xffff000050f9c920: ldr      w2, [sp, #0x1e4]
   0xffff000050f9c924: add      x0, sp, #0x18
   0xffff000050f9c928: mov      x1, x25
   0xffff000050f9c92c: bl       #0xffff000050fcd3f0  ; call 0xffff000050fcd3f0
   0xffff000050f9c930: ldr      x2, [sp, #0x1b8]
   0xffff000050f9c934: add      x0, sp, #0x18
   0xffff000050f9c938: mov      x1, x20
   0xffff000050f9c93c: bl       #0xffff000050fcd3f0  ; call 0xffff000050fcd3f0
   0xffff000050f9c940: add      x0, sp, #0x18
   0xffff000050f9c944: bl       #0xffff000050fcd42c  ; call 0xffff000050fcd42c

loc_ffff000050f9c948:
   0xffff000050f9c948: mov      x1, x0
   0xffff000050f9c94c: ldr      w2, [sp, #0x1e8]
   0xffff000050f9c950: ldr      x0, [sp, #8]
   0xffff000050f9c954: bl       #0xffff000050f8deb8  ; call 0xffff000050f8deb8
   0xffff000050f9c958: mov      x25, x24
   0xffff000050f9c95c: cbz      w0, #0xffff000050f9c978
   0xffff000050f9c960: adrp     x1, #0xffff000050ff6000
   0xffff000050f9c964: mov      w0, #-1
   0xffff000050f9c968: add      x1, x1, #0xbf6
   0xffff000050f9c96c: mov      x2, x21
   0xffff000050f9c970: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c974: tbz      w22, #0, #0xffff000050f9c9ac

loc_ffff000050f9c978:
   0xffff000050f9c978: mov      w23, #1
   0xffff000050f9c97c: b        #0xffff000050f9c868

loc_ffff000050f9c980:
   0xffff000050f9c980: adrp     x1, #0xffff000050fd3000
; XREF string 0xffff000050fd304b: 'metadata' -> 'mot_sec: %s: Failed to validate its own avb metadata info\n'
>> 0xffff000050f9c984: add      x1, x1, #0x4b

loc_ffff000050f9c988:
   0xffff000050f9c988: mov      w0, #-1
   0xffff000050f9c98c: mov      x2, x19
   0xffff000050f9c990: b        #0xffff000050f9c5c4

loc_ffff000050f9c994:
   0xffff000050f9c994: adrp     x1, #0xffff000050fd8000
   0xffff000050f9c998: adrp     x2, #0xffff000050ff9000
   0xffff000050f9c99c: add      x1, x1, #0xf93
   0xffff000050f9c9a0: add      x2, x2, #0xbdf
   0xffff000050f9c9a4: mov      w0, #-1
   0xffff000050f9c9a8: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f9c9ac:
   0xffff000050f9c9ac: and      w24, w23, #1
   0xffff000050f9c9b0: b        #0xffff000050f9c5d0

loc_ffff000050f9c9b4:
   0xffff000050f9c9b4: adrp     x1, #0xffff000050fdd000
   0xffff000050f9c9b8: mov      w0, #-1
   0xffff000050f9c9bc: add      x1, x1, #0x5a7
   0xffff000050f9c9c0: mov      x2, x21
   0xffff000050f9c9c4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c9c8: b        #0xffff000050f9c9ac

loc_ffff000050f9c9cc:
   0xffff000050f9c9cc: adrp     x1, #0xffff000050fe0000
   0xffff000050f9c9d0: mov      w0, #-1
   0xffff000050f9c9d4: add      x1, x1, #0xac3
   0xffff000050f9c9d8: mov      x2, x21
   0xffff000050f9c9dc: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c9e0: b        #0xffff000050f9c9ac

loc_ffff000050f9c9e4:
   0xffff000050f9c9e4: adrp     x1, #0xffff000050fee000
   0xffff000050f9c9e8: mov      w0, #-1
   0xffff000050f9c9ec: add      x1, x1, #0xe21
   0xffff000050f9c9f0: mov      x2, x21
   0xffff000050f9c9f4: ldr      x4, [sp, #0x10]
   0xffff000050f9c9f8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9c9fc: b        #0xffff000050f9c9ac

loc_ffff000050f9ca00:
   0xffff000050f9ca00: adrp     x1, #0xffff000050ffd000
   0xffff000050f9ca04: mov      w0, #-1
   0xffff000050f9ca08: add      x1, x1, #0x14a
   0xffff000050f9ca0c: mov      x2, x21
   0xffff000050f9ca10: ldr      x3, [sp, #0x10]
   0xffff000050f9ca14: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9ca18: b        #0xffff000050f9c9ac
   0xffff000050f9ca1c: sub      sp, sp, #0x40
   0xffff000050f9ca20: stp      x29, x30, [sp, #0x10]
   0xffff000050f9ca24: add      x29, sp, #0x10
   0xffff000050f9ca28: stp      x22, x21, [sp, #0x20]
   0xffff000050f9ca2c: stp      x20, x19, [sp, #0x30]
   0xffff000050f9ca30: mov      w20, w2
   0xffff000050f9ca34: mov      w22, w1
   0xffff000050f9ca38: mov      x21, x0
   0xffff000050f9ca3c: stp      xzr, xzr, [sp]
   0xffff000050f9ca40: bl       #0xffff000050f9d940  ; call 0xffff000050f9d940
   0xffff000050f9ca44: mov      w19, w0
   0xffff000050f9ca48: cbz      x21, #0xffff000050f9ca9c
   0xffff000050f9ca4c: cbz      w22, #0xffff000050f9ca9c
   0xffff000050f9ca50: mov      w1, w22
   0xffff000050f9ca54: add      x2, sp, #8
   0xffff000050f9ca58: mov      x3, sp
   0xffff000050f9ca5c: mov      x0, x21
   0xffff000050f9ca60: bl       #0xffff000050fc7fb4  ; call 0xffff000050fc7fb4
   0xffff000050f9ca64: mov      w2, w0
   0xffff000050f9ca68: sub      w8, w0, #4
   0xffff000050f9ca6c: cmp      w8, #2
   0xffff000050f9ca70: b.lo     #0xffff000050f9cab8
   0xffff000050f9ca74: cmp      w2, #1
   0xffff000050f9ca78: b.eq     #0xffff000050f9cac4
   0xffff000050f9ca7c: cbnz     w2, #0xffff000050f9cae4
   0xffff000050f9ca80: ldr      x8, [sp, #8]
   0xffff000050f9ca84: cbz      x8, #0xffff000050f9ca90
   0xffff000050f9ca88: ldr      x8, [sp]
   0xffff000050f9ca8c: cbnz     x8, #0xffff000050f9cadc

loc_ffff000050f9ca90:
   0xffff000050f9ca90: adrp     x1, #0xffff000050fdf000
   0xffff000050f9ca94: add      x1, x1, #0x2b6
   0xffff000050f9ca98: b        #0xffff000050f9cad0

loc_ffff000050f9ca9c:
   0xffff000050f9ca9c: adrp     x1, #0xffff000050fd4000
   0xffff000050f9caa0: adrp     x2, #0xffff000050ffe000
   0xffff000050f9caa4: add      x1, x1, #0x7d9
   0xffff000050f9caa8: add      x2, x2, #0x9ac
   0xffff000050f9caac: mov      w0, #-1
   0xffff000050f9cab0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9cab4: b        #0xffff000050f9caf4

loc_ffff000050f9cab8:
   0xffff000050f9cab8: adrp     x1, #0xffff000050feb000
   0xffff000050f9cabc: add      x1, x1, #0xd19
   0xffff000050f9cac0: b        #0xffff000050f9caec

loc_ffff000050f9cac4:
   0xffff000050f9cac4: tbz      w20, #0, #0xffff000050f9cadc
   0xffff000050f9cac8: adrp     x1, #0xffff000050fea000
   0xffff000050f9cacc: add      x1, x1, #0x1b6

loc_ffff000050f9cad0:
   0xffff000050f9cad0: mov      w0, #-1
   0xffff000050f9cad4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f9cad8: b        #0xffff000050f9caf4

loc_ffff000050f9cadc:
   0xffff000050f9cadc: mov      w19, #1
   0xffff000050f9cae0: b        #0xffff000050f9caf4

loc_ffff000050f9cae4:
   0xffff000050f9cae4: adrp     x1, #0xffff000050fe2000
   0xffff000050f9cae8: add      x1, x1, #0x55a

loc_ffff000050f9caec:
   0xffff000050f9caec: mov      w0, #-1
   0xffff000050f9caf0: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f9caf4:
   0xffff000050f9caf4: and      w0, w19, #1
   0xffff000050f9caf8: ldp      x20, x19, [sp, #0x30]
   0xffff000050f9cafc: ldp      x22, x21, [sp, #0x20]
   0xffff000050f9cb00: ldp      x29, x30, [sp, #0x10]
   0xffff000050f9cb04: add      sp, sp, #0x40
   0xffff000050f9cb08: ret      
