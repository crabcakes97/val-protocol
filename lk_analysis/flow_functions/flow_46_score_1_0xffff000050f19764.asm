; flow candidate 0xffff000050f19764-0xffff000050f19888
; score: 1
; matched targets: serialno
; calls: 0xffff000050f7ba44, 0xffff000050f7cc14, 0xffff000050f7c87c, 0xffff000050f1b690, 0xffff000050f8e61c, 0xffff000050f15c18

   0xffff000050f19764: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f19768: str      x21, [sp, #0x10]
   0xffff000050f1976c: mov      x29, sp
   0xffff000050f19770: stp      x20, x19, [sp, #0x20]
   0xffff000050f19774: adrp     x1, #0xffff000050fcf000
   0xffff000050f19778: mov      x19, x0
   0xffff000050f1977c: add      x1, x1, #0x2d3
   0xffff000050f19780: bl       #0xffff000050f7ba44  ; call 0xffff000050f7ba44
   0xffff000050f19784: mov      w20, w0
   0xffff000050f19788: tbz      w0, #0x1f, #0xffff000050f197d8
   0xffff000050f1978c: adrp     x1, #0xffff000050fed000
   0xffff000050f19790: mov      x0, x19
   0xffff000050f19794: add      x1, x1, #0xfa4
   0xffff000050f19798: bl       #0xffff000050f7ba44  ; call 0xffff000050f7ba44
   0xffff000050f1979c: mov      w1, w0
   0xffff000050f197a0: tbz      w0, #0x1f, #0xffff000050f197c0
   0xffff000050f197a4: adrp     x2, #0xffff000050fdf000
   0xffff000050f197a8: mov      x0, x19
   0xffff000050f197ac: add      x2, x2, #0xbac
   0xffff000050f197b0: mov      w1, wzr
   0xffff000050f197b4: bl       #0xffff000050f7cc14  ; call 0xffff000050f7cc14
   0xffff000050f197b8: mov      w1, w0
   0xffff000050f197bc: tbnz     w0, #0x1f, #0xffff000050f19898

loc_ffff000050f197c0:
   0xffff000050f197c0: adrp     x2, #0xffff000050fde000
   0xffff000050f197c4: mov      x0, x19
   0xffff000050f197c8: add      x2, x2, #0xc7
   0xffff000050f197cc: bl       #0xffff000050f7cc14  ; call 0xffff000050f7cc14
   0xffff000050f197d0: mov      w20, w0
   0xffff000050f197d4: tbnz     w0, #0x1f, #0xffff000050f1988c

loc_ffff000050f197d8:
   0xffff000050f197d8: adrp     x2, #0xffff000050ff1000
   0xffff000050f197dc: adrp     x3, #0xffff000050ff5000
   0xffff000050f197e0: add      x2, x2, #0x131
   0xffff000050f197e4: add      x3, x3, #0xe24
   0xffff000050f197e8: mov      x0, x19
   0xffff000050f197ec: mov      w1, w20
   0xffff000050f197f0: mov      w4, #0x11
   0xffff000050f197f4: bl       #0xffff000050f7c87c  ; call 0xffff000050f7c87c
   0xffff000050f197f8: cbnz     w0, #0xffff000050f198b4
   0xffff000050f197fc: bl       #0xffff000050f1b690  ; call 0xffff000050f1b690
   0xffff000050f19800: mov      x21, x0
   0xffff000050f19804: bl       #0xffff000050f1b690  ; call 0xffff000050f1b690
   0xffff000050f19808: bl       #0xffff000050f8e61c  ; call 0xffff000050f8e61c
   0xffff000050f1980c: adrp     x2, #0xffff000050ffd000
   0xffff000050f19810: add      w4, w0, #1
; XREF string 0xffff000050ffd758: 'serialno' -> 'serialno'
>> 0xffff000050f19814: add      x2, x2, #0x758
   0xffff000050f19818: mov      x0, x19
   0xffff000050f1981c: mov      w1, w20
   0xffff000050f19820: mov      x3, x21
   0xffff000050f19824: bl       #0xffff000050f7c87c  ; call 0xffff000050f7c87c
   0xffff000050f19828: cbnz     w0, #0xffff000050f198cc
   0xffff000050f1982c: bl       #0xffff000050f15c18  ; call 0xffff000050f15c18
   0xffff000050f19830: sub      w8, w0, #1
   0xffff000050f19834: cmp      w8, #2
   0xffff000050f19838: b.hi     #0xffff000050f1984c
   0xffff000050f1983c: adrp     x9, #0xffff000051011000
   0xffff000050f19840: add      x9, x9, #0x8f8
   0xffff000050f19844: ldr      x21, [x9, w8, sxtw #3]
   0xffff000050f19848: b        #0xffff000050f19854

loc_ffff000050f1984c:
   0xffff000050f1984c: adrp     x21, #0xffff000050fe4000
   0xffff000050f19850: add      x21, x21, #0x56e

loc_ffff000050f19854:
   0xffff000050f19854: mov      x0, x21
   0xffff000050f19858: bl       #0xffff000050f8e61c  ; call 0xffff000050f8e61c
   0xffff000050f1985c: adrp     x2, #0xffff000050fd5000
   0xffff000050f19860: add      w4, w0, #1
   0xffff000050f19864: add      x2, x2, #0x296
   0xffff000050f19868: mov      x0, x19
   0xffff000050f1986c: mov      w1, w20
   0xffff000050f19870: mov      x3, x21
   0xffff000050f19874: bl       #0xffff000050f7c87c  ; call 0xffff000050f7c87c
   0xffff000050f19878: cbnz     w0, #0xffff000050f198e4
   0xffff000050f1987c: ldp      x20, x19, [sp, #0x20]
   0xffff000050f19880: ldr      x21, [sp, #0x10]
   0xffff000050f19884: ldp      x29, x30, [sp], #0x30
   0xffff000050f19888: ret      
