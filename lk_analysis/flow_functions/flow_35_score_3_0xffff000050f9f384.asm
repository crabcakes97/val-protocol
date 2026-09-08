; flow candidate 0xffff000050f9f384-0xffff000050f9f4ec
; score: 3
; matched targets: userdata
; calls: 0xffff000050f07c4c, 0xffff000050f8c094, 0xffff000050f9f2a8, 0xffff000050f9f384

   0xffff000050f9f384: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9f388: str      x19, [sp, #0x10]
   0xffff000050f9f38c: mov      x29, sp
   0xffff000050f9f390: adrp     x19, #0xffff000050fd9000
   0xffff000050f9f394: adrp     x1, #0xffff000050fdb000
   0xffff000050f9f398: add      x19, x19, #0x53d
   0xffff000050f9f39c: add      x1, x1, #0xce6
   0xffff000050f9f3a0: mov      x0, x19
   0xffff000050f9f3a4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f3a8: adrp     x1, #0xffff000050fd0000
   0xffff000050f9f3ac: mov      x0, x19
   0xffff000050f9f3b0: add      x1, x1, #0x13c
   0xffff000050f9f3b4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f3b8: adrp     x1, #0xffff000050ff8000
   0xffff000050f9f3bc: mov      x0, x19
   0xffff000050f9f3c0: add      x1, x1, #0x773
   0xffff000050f9f3c4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f3c8: adrp     x1, #0xffff000050fd9000
   0xffff000050f9f3cc: mov      x0, x19
   0xffff000050f9f3d0: add      x1, x1, #0x5e9
   0xffff000050f9f3d4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f3d8: adrp     x1, #0xffff000050fd6000
   0xffff000050f9f3dc: mov      x0, x19
   0xffff000050f9f3e0: add      x1, x1, #0x180
   0xffff000050f9f3e4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f3e8: adrp     x1, #0xffff000050ffe000
   0xffff000050f9f3ec: mov      x0, x19
   0xffff000050f9f3f0: add      x1, x1, #0xa3f
   0xffff000050f9f3f4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f3f8: adrp     x1, #0xffff000050ffe000
   0xffff000050f9f3fc: mov      x0, x19
   0xffff000050f9f400: add      x1, x1, #0xa5f
   0xffff000050f9f404: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f408: adrp     x1, #0xffff000050ff3000
   0xffff000050f9f40c: mov      x0, x19
; XREF string 0xffff000050ff3a67: 'userdata' -> '  4 - Force userdata use production key'
>> 0xffff000050f9f410: add      x1, x1, #0xa67
   0xffff000050f9f414: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f418: adrp     x1, #0xffff000050ff1000
   0xffff000050f9f41c: mov      x0, x19
   0xffff000050f9f420: add      x1, x1, #0xffd
   0xffff000050f9f424: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f428: adrp     x1, #0xffff000050ff8000
   0xffff000050f9f42c: mov      x0, x19
   0xffff000050f9f430: add      x1, x1, #0x134
   0xffff000050f9f434: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f438: adrp     x1, #0xffff000050fea000
   0xffff000050f9f43c: mov      x0, x19
   0xffff000050f9f440: add      x1, x1, #0x270
   0xffff000050f9f444: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f448: adrp     x1, #0xffff000050ff2000
   0xffff000050f9f44c: mov      x0, x19
   0xffff000050f9f450: add      x1, x1, #0x20
   0xffff000050f9f454: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f458: adrp     x1, #0xffff000050fdf000
   0xffff000050f9f45c: mov      x0, x19
   0xffff000050f9f460: add      x1, x1, #0x33c
   0xffff000050f9f464: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9f468: mov      x0, x19
   0xffff000050f9f46c: ldr      x19, [sp, #0x10]
   0xffff000050f9f470: adrp     x1, #0xffff000050fee000
   0xffff000050f9f474: add      x1, x1, #0xf3e
   0xffff000050f9f478: ldp      x29, x30, [sp], #0x20
   0xffff000050f9f47c: b        #0xffff000050f07c4c
   0xffff000050f9f480: sub      sp, sp, #0x1c0
   0xffff000050f9f484: stp      x29, x30, [sp, #0x190]
   0xffff000050f9f488: add      x29, sp, #0x190
   0xffff000050f9f48c: str      x28, [sp, #0x1a0]
   0xffff000050f9f490: stp      x20, x19, [sp, #0x1b0]
   0xffff000050f9f494: cmp      w0, #2
   0xffff000050f9f498: b.lt     #0xffff000050f9f4d4
   0xffff000050f9f49c: mov      w20, w0
   0xffff000050f9f4a0: ldp      x0, x19, [x1, #8]
   0xffff000050f9f4a4: bl       #0xffff000050f8c094  ; call 0xffff000050f8c094
   0xffff000050f9f4a8: sub      w8, w0, #1
   0xffff000050f9f4ac: cmp      w8, #9
   0xffff000050f9f4b0: b.hi     #0xffff000050f9f4d4
   0xffff000050f9f4b4: adrp     x9, #0xffff00005101b000
   0xffff000050f9f4b8: add      x9, x9, #0x598
   0xffff000050f9f4bc: adr      x10, #0xffff000050f9f4cc
   0xffff000050f9f4c0: ldrb     w11, [x9, x8]
   0xffff000050f9f4c4: add      x10, x10, x11, lsl #2
   0xffff000050f9f4c8: br       x10
   0xffff000050f9f4cc: bl       #0xffff000050f9f2a8  ; call 0xffff000050f9f2a8
   0xffff000050f9f4d0: b        #0xffff000050f9f4d8

loc_ffff000050f9f4d4:
   0xffff000050f9f4d4: bl       #0xffff000050f9f384  ; call 0xffff000050f9f384

loc_ffff000050f9f4d8:
   0xffff000050f9f4d8: ldp      x20, x19, [sp, #0x1b0]
   0xffff000050f9f4dc: mov      w0, wzr
   0xffff000050f9f4e0: ldp      x29, x30, [sp, #0x190]
   0xffff000050f9f4e4: ldr      x28, [sp, #0x1a0]
   0xffff000050f9f4e8: add      sp, sp, #0x1c0
   0xffff000050f9f4ec: ret      
