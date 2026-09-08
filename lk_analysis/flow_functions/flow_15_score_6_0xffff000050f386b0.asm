; flow candidate 0xffff000050f386b0-0xffff000050f387bc
; score: 6
; matched targets: metadata, userdata
; calls: 0xffff000050f2e654, 0xffff000050f8e3ec, 0xffff000050f07c4c, 0xffff000050f2e7ac

   0xffff000050f386b0: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f386b4: str      x21, [sp, #0x10]
   0xffff000050f386b8: mov      x29, sp
   0xffff000050f386bc: stp      x20, x19, [sp, #0x20]
   0xffff000050f386c0: cbz      x0, #0xffff000050f387b0
   0xffff000050f386c4: mov      x19, x0
   0xffff000050f386c8: mov      w20, w1
   0xffff000050f386cc: bl       #0xffff000050f2e654  ; call 0xffff000050f2e654
   0xffff000050f386d0: adrp     x1, #0xffff000050fe1000
   0xffff000050f386d4: mov      w21, w0
   0xffff000050f386d8: add      x1, x1, #0x195
   0xffff000050f386dc: mov      x0, x19
   0xffff000050f386e0: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f386e4: cbz      w0, #0xffff000050f38720
   0xffff000050f386e8: adrp     x1, #0xffff000050ff7000
   0xffff000050f386ec: mov      x0, x19
; XREF string 0xffff000050ff7689: 'metadata' -> 'metadata'
>> 0xffff000050f386f0: add      x1, x1, #0x689
   0xffff000050f386f4: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f386f8: cbz      w0, #0xffff000050f38720
   0xffff000050f386fc: adrp     x1, #0xffff000050fd9000
   0xffff000050f38700: mov      x0, x19
; XREF string 0xffff000050fd9574: 'userdata' -> 'userdata'
>> 0xffff000050f38704: add      x1, x1, #0x574
   0xffff000050f38708: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f3870c: cmp      w0, #0
   0xffff000050f38710: cset     w8, eq
   0xffff000050f38714: and      w21, w21, #0xfffffffe
   0xffff000050f38718: cbnz     w8, #0xffff000050f3872c
   0xffff000050f3871c: b        #0xffff000050f38768

loc_ffff000050f38720:
   0xffff000050f38720: mov      w8, #1
   0xffff000050f38724: and      w21, w21, #0xfffffffe
   0xffff000050f38728: cbz      w8, #0xffff000050f38768

loc_ffff000050f3872c:
   0xffff000050f3872c: cmp      w21, #2
   0xffff000050f38730: b.ne     #0xffff000050f38768
   0xffff000050f38734: adrp     x8, #0xffff000050fd7000
   0xffff000050f38738: adrp     x9, #0xffff000050ff2000
   0xffff000050f3873c: add      x8, x8, #0xd51
   0xffff000050f38740: add      x9, x9, #0x7c4
   0xffff000050f38744: tst      w20, #1
   0xffff000050f38748: adrp     x0, #0xffff000050fd9000
   0xffff000050f3874c: adrp     x1, #0xffff000050ff1000
   0xffff000050f38750: csel     x2, x9, x8, ne
   0xffff000050f38754: add      x0, x0, #0x53d
   0xffff000050f38758: add      x1, x1, #0x2ed
   0xffff000050f3875c: mov      x3, x19
   0xffff000050f38760: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f38764: b        #0xffff000050f387ac

loc_ffff000050f38768:
   0xffff000050f38768: adrp     x1, #0xffff000050fff000
   0xffff000050f3876c: mov      x0, x19
   0xffff000050f38770: add      x1, x1, #0x2ac
   0xffff000050f38774: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f38778: mov      w8, w0
   0xffff000050f3877c: mov      w0, #1
   0xffff000050f38780: cbnz     w8, #0xffff000050f387b0
   0xffff000050f38784: cmp      w21, #2
   0xffff000050f38788: b.ne     #0xffff000050f387b0
   0xffff000050f3878c: mov      w0, #4
   0xffff000050f38790: bl       #0xffff000050f2e7ac  ; call 0xffff000050f2e7ac
   0xffff000050f38794: cbz      w0, #0xffff000050f387c0
   0xffff000050f38798: adrp     x0, #0xffff000050fd9000
   0xffff000050f3879c: adrp     x1, #0xffff000050fee000
   0xffff000050f387a0: add      x0, x0, #0x53d
   0xffff000050f387a4: add      x1, x1, #0x1a5
   0xffff000050f387a8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c

loc_ffff000050f387ac:
   0xffff000050f387ac: mov      w0, wzr

loc_ffff000050f387b0:
   0xffff000050f387b0: ldp      x20, x19, [sp, #0x20]
   0xffff000050f387b4: ldr      x21, [sp, #0x10]
   0xffff000050f387b8: ldp      x29, x30, [sp], #0x30
   0xffff000050f387bc: ret      
