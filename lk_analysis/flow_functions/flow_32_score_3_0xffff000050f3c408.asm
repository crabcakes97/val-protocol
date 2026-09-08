; flow candidate 0xffff000050f3c408-0xffff000050f3c550
; score: 3
; matched targets: userdata
; calls: 0xffff000050f3b8b4, 0xffff000050f7ab90, 0xffff000050f894ac, 0xffff000050f89750, 0xffff000050f89538, 0xffff000050f73c9c, 0xffff000050f29978

   0xffff000050f3c408: sub      sp, sp, #0x50
   0xffff000050f3c40c: stp      x29, x30, [sp, #0x30]
   0xffff000050f3c410: add      x29, sp, #0x30
   0xffff000050f3c414: stp      x20, x19, [sp, #0x40]
   0xffff000050f3c418: add      x0, sp, #0x10
   0xffff000050f3c41c: mov      w1, wzr
   0xffff000050f3c420: bl       #0xffff000050f3b8b4  ; call 0xffff000050f3b8b4
   0xffff000050f3c424: tbnz     w0, #0x1f, #0xffff000050f3c4a8
   0xffff000050f3c428: mov      w8, #0x4342
   0xffff000050f3c42c: mov      w9, #0x77
   0xffff000050f3c430: movk     w8, #0x4241, lsl #16
   0xffff000050f3c434: mov      w10, #0x76
   0xffff000050f3c438: add      x1, sp, #0x10
   0xffff000050f3c43c: mov      x0, xzr
   0xffff000050f3c440: mov      w2, #0x1c
   0xffff000050f3c444: strb     w9, [sp, #0x1c]
   0xffff000050f3c448: str      w8, [sp, #0x14]
   0xffff000050f3c44c: strb     w10, [sp, #0x1e]
   0xffff000050f3c450: bl       #0xffff000050f7ab90  ; call 0xffff000050f7ab90
   0xffff000050f3c454: str      w0, [sp, #0x2c]
   0xffff000050f3c458: adrp     x0, #0xffff000050fd3000
   0xffff000050f3c45c: mov      w8, #1
   0xffff000050f3c460: add      x0, x0, #0x60d
   0xffff000050f3c464: str      w8, [sp, #0xc]
   0xffff000050f3c468: bl       #0xffff000050f894ac  ; call 0xffff000050f894ac
   0xffff000050f3c46c: cbz      x0, #0xffff000050f3c4c8
   0xffff000050f3c470: add      x2, sp, #0xc
   0xffff000050f3c474: mov      w1, #0x100
   0xffff000050f3c478: mov      x20, x0
   0xffff000050f3c47c: bl       #0xffff000050f89750  ; call 0xffff000050f89750
   0xffff000050f3c480: tbnz     w0, #0x1f, #0xffff000050f3c4ec
   0xffff000050f3c484: mov      x0, x20
   0xffff000050f3c488: bl       #0xffff000050f89538  ; call 0xffff000050f89538
   0xffff000050f3c48c: add      x0, sp, #0x10
   0xffff000050f3c490: mov      w1, #1
   0xffff000050f3c494: bl       #0xffff000050f3b8b4  ; call 0xffff000050f3b8b4
   0xffff000050f3c498: tbnz     w0, #0x1f, #0xffff000050f3c51c
   0xffff000050f3c49c: bl       #0xffff000050f73c9c  ; call 0xffff000050f73c9c
   0xffff000050f3c4a0: mov      w19, wzr
   0xffff000050f3c4a4: b        #0xffff000050f3c540

loc_ffff000050f3c4a8:
   0xffff000050f3c4a8: adrp     x1, #0xffff000050fd3000
   0xffff000050f3c4ac: adrp     x2, #0xffff000050fff000
   0xffff000050f3c4b0: mov      w4, w0
   0xffff000050f3c4b4: add      x1, x1, #0xbc2
   0xffff000050f3c4b8: add      x2, x2, #0x95c
   0xffff000050f3c4bc: mov      w0, #1
   0xffff000050f3c4c0: mov      w3, #0x276
   0xffff000050f3c4c4: b        #0xffff000050f3c538

loc_ffff000050f3c4c8:
   0xffff000050f3c4c8: adrp     x1, #0xffff000050ffa000
   0xffff000050f3c4cc: adrp     x2, #0xffff000050fff000
; XREF string 0xffff000050fd39b6: 'userdata' -> 'userdata partition info\n'
>> 0xffff000050f3c4d0: add      x1, x1, #0x9b6
   0xffff000050f3c4d4: add      x2, x2, #0x95c
   0xffff000050f3c4d8: mov      w0, #1
   0xffff000050f3c4dc: mov      w3, #0x291
   0xffff000050f3c4e0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f3c4e4: mov      w19, #-0x13
   0xffff000050f3c4e8: b        #0xffff000050f3c540

loc_ffff000050f3c4ec:
   0xffff000050f3c4ec: mov      w19, w0
   0xffff000050f3c4f0: adrp     x1, #0xffff000050fef000
   0xffff000050f3c4f4: adrp     x2, #0xffff000050fff000
   0xffff000050f3c4f8: add      x1, x1, #0xc19
   0xffff000050f3c4fc: add      x2, x2, #0x95c
   0xffff000050f3c500: mov      w0, #1
   0xffff000050f3c504: mov      w3, #0x297
   0xffff000050f3c508: mov      w4, w19
   0xffff000050f3c50c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f3c510: mov      x0, x20
   0xffff000050f3c514: bl       #0xffff000050f89538  ; call 0xffff000050f89538
   0xffff000050f3c518: b        #0xffff000050f3c540

loc_ffff000050f3c51c:
   0xffff000050f3c51c: adrp     x1, #0xffff000050ff1000
   0xffff000050f3c520: adrp     x2, #0xffff000050fff000
   0xffff000050f3c524: mov      w4, w0
   0xffff000050f3c528: add      x1, x1, #0x432
   0xffff000050f3c52c: add      x2, x2, #0x95c
   0xffff000050f3c530: mov      w0, #1
   0xffff000050f3c534: mov      w3, #0x29f

loc_ffff000050f3c538:
   0xffff000050f3c538: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f3c53c: mov      w19, #-1

loc_ffff000050f3c540:
   0xffff000050f3c540: mov      w0, w19
   0xffff000050f3c544: ldp      x20, x19, [sp, #0x40]
   0xffff000050f3c548: ldp      x29, x30, [sp, #0x30]
   0xffff000050f3c54c: add      sp, sp, #0x50
   0xffff000050f3c550: ret      
