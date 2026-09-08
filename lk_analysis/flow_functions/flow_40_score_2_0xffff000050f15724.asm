; flow candidate 0xffff000050f15724-0xffff000050f158f0
; score: 2
; matched targets: barcode
; calls: 0xffff000050f18d68, 0xffff000050f3bffc, 0xffff000050f8e5bc, 0xffff000050f44770, 0xffff000050f18d74, 0xffff000050f446ec, 0xffff000050f1595c, 0xffff000050f38024, 0xffff000050f24a38, 0xffff000050f24a44, 0xffff000050f8c89c

   0xffff000050f15724: sub      sp, sp, #0x80
   0xffff000050f15728: stp      x29, x30, [sp, #0x60]
   0xffff000050f1572c: add      x29, sp, #0x60
   0xffff000050f15730: str      x19, [sp, #0x70]
   0xffff000050f15734: bl       #0xffff000050f18d68  ; call 0xffff000050f18d68
   0xffff000050f15738: and      w8, w0, #0xff
   0xffff000050f1573c: cmp      w8, #0x63
   0xffff000050f15740: b.ne     #0xffff000050f15784
   0xffff000050f15744: adrp     x0, #0xffff000050fd4000
   0xffff000050f15748: add      x0, x0, #0xdbf
   0xffff000050f1574c: bl       #0xffff000050f3bffc  ; call 0xffff000050f3bffc
   0xffff000050f15750: cbnz     w0, #0xffff000050f15764
   0xffff000050f15754: adrp     x0, #0xffff000050fef000
   0xffff000050f15758: add      x0, x0, #0x473
   0xffff000050f1575c: bl       #0xffff000050f3bffc  ; call 0xffff000050f3bffc
   0xffff000050f15760: cbz      w0, #0xffff000050f15848

loc_ffff000050f15764:
   0xffff000050f15764: adrp     x0, #0xffff000051052000
   0xffff000050f15768: adrp     x1, #0xffff000050ff8000
   0xffff000050f1576c: add      x0, x0, #0x5c9
   0xffff000050f15770: add      x1, x1, #0xa5b
   0xffff000050f15774: mov      w2, #0x40
   0xffff000050f15778: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc
   0xffff000050f1577c: mov      w19, #1
   0xffff000050f15780: b        #0xffff000050f158e0

loc_ffff000050f15784:
   0xffff000050f15784: bl       #0xffff000050f44770  ; call 0xffff000050f44770
   0xffff000050f15788: tbz      w0, #0, #0xffff000050f157b4
   0xffff000050f1578c: adrp     x0, #0xffff000051052000
   0xffff000050f15790: adrp     x1, #0xffff000050fe4000
   0xffff000050f15794: add      x0, x0, #0x5c9
   0xffff000050f15798: add      x1, x1, #0x6fa

loc_ffff000050f1579c:
   0xffff000050f1579c: mov      w2, #0x40
   0xffff000050f157a0: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc

loc_ffff000050f157a4:
   0xffff000050f157a4: mov      w0, #0x63
   0xffff000050f157a8: bl       #0xffff000050f18d74  ; call 0xffff000050f18d74
   0xffff000050f157ac: mov      w19, #1
   0xffff000050f157b0: b        #0xffff000050f158e0

loc_ffff000050f157b4:
   0xffff000050f157b4: bl       #0xffff000050f446ec  ; call 0xffff000050f446ec
   0xffff000050f157b8: tbz      w0, #0, #0xffff000050f157f0
   0xffff000050f157bc: bl       #0xffff000050f1595c  ; call 0xffff000050f1595c
   0xffff000050f157c0: tbz      w0, #0, #0xffff000050f157f0
   0xffff000050f157c4: adrp     x0, #0xffff000051052000
   0xffff000050f157c8: adrp     x1, #0xffff000050ff1000
   0xffff000050f157cc: add      x0, x0, #0x5c9
; XREF string 0xffff000050ff1043: 'barcode' -> 'Volume up key pressed for BARCODE screen'
>> 0xffff000050f157d0: add      x1, x1, #0x43
   0xffff000050f157d4: mov      w2, #0x40
   0xffff000050f157d8: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc
   0xffff000050f157dc: adrp     x9, #0xffff000050fef000
   0xffff000050f157e0: adrp     x8, #0xffff000051052000
; XREF string 0xffff000050fef77c: 'barcode' -> 'barcode_screen'
>> 0xffff000050f157e4: add      x9, x9, #0x77c
   0xffff000050f157e8: str      x9, [x8, #0x580]
   0xffff000050f157ec: b        #0xffff000050f157a4

loc_ffff000050f157f0:
   0xffff000050f157f0: adrp     x1, #0xffff000050fe1000
   0xffff000050f157f4: sub      x2, x29, #0x14
   0xffff000050f157f8: add      x1, x1, #0xc4
   0xffff000050f157fc: mov      w0, wzr
   0xffff000050f15800: mov      w3, #0x11
   0xffff000050f15804: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f15808: cbz      x0, #0xffff000050f15830
   0xffff000050f1580c: mov      x10, #0x6166
   0xffff000050f15810: ldur     x8, [x29, #-0x14]
   0xffff000050f15814: movk     x10, #0x7473, lsl #16
   0xffff000050f15818: ldurb    w9, [x29, #-0xc]
   0xffff000050f1581c: movk     x10, #0x6f62, lsl #32
   0xffff000050f15820: movk     x10, #0x746f, lsl #48
   0xffff000050f15824: eor      x8, x8, x10
   0xffff000050f15828: orr      x8, x8, x9
   0xffff000050f1582c: cbz      x8, #0xffff000050f15884

loc_ffff000050f15830:
   0xffff000050f15830: bl       #0xffff000050f24a38  ; call 0xffff000050f24a38
   0xffff000050f15834: tbz      w0, #0, #0xffff000050f15870
   0xffff000050f15838: bl       #0xffff000050f24a44  ; call 0xffff000050f24a44
   0xffff000050f1583c: tbz      w0, #0, #0xffff000050f158b4
   0xffff000050f15840: mov      w19, wzr
   0xffff000050f15844: b        #0xffff000050f158e0

loc_ffff000050f15848:
   0xffff000050f15848: adrp     x0, #0xffff000051052000
   0xffff000050f1584c: adrp     x1, #0xffff000050ff8000
   0xffff000050f15850: add      x0, x0, #0x5c9
   0xffff000050f15854: add      x1, x1, #0xa46
   0xffff000050f15858: mov      w2, #0x40
   0xffff000050f1585c: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc
   0xffff000050f15860: adrp     x8, #0xffff000051052000
   0xffff000050f15864: mov      w19, #1
   0xffff000050f15868: strb     w19, [x8, #0x5c8]
   0xffff000050f1586c: b        #0xffff000050f158e0

loc_ffff000050f15870:
   0xffff000050f15870: adrp     x0, #0xffff000051052000
   0xffff000050f15874: adrp     x1, #0xffff000050fd0000
   0xffff000050f15878: add      x0, x0, #0x5c9
   0xffff000050f1587c: add      x1, x1, #0x759
   0xffff000050f15880: b        #0xffff000050f158c4

loc_ffff000050f15884:
   0xffff000050f15884: adrp     x2, #0xffff000050fd6000
   0xffff000050f15888: adrp     x3, #0xffff000050fe1000
   0xffff000050f1588c: add      x2, x2, #0xa10
   0xffff000050f15890: add      x3, x3, #0xc4
   0xffff000050f15894: add      x0, sp, #0xc
   0xffff000050f15898: mov      w1, #0x3f
   0xffff000050f1589c: strb     wzr, [sp, #0x4b]
   0xffff000050f158a0: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c
   0xffff000050f158a4: adrp     x0, #0xffff000051052000
   0xffff000050f158a8: add      x1, sp, #0xc
   0xffff000050f158ac: add      x0, x0, #0x5c9
   0xffff000050f158b0: b        #0xffff000050f1579c

loc_ffff000050f158b4:
   0xffff000050f158b4: adrp     x0, #0xffff000051052000
   0xffff000050f158b8: adrp     x1, #0xffff000050fdf000
   0xffff000050f158bc: add      x0, x0, #0x5c9
   0xffff000050f158c0: add      x1, x1, #0xb6d

loc_ffff000050f158c4:
   0xffff000050f158c4: mov      w2, #0x40
   0xffff000050f158c8: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc
   0xffff000050f158cc: adrp     x8, #0xffff000051052000
   0xffff000050f158d0: mov      w19, #1
   0xffff000050f158d4: mov      w0, #0x63
   0xffff000050f158d8: strb     w19, [x8, #0x5c8]
   0xffff000050f158dc: bl       #0xffff000050f18d74  ; call 0xffff000050f18d74

loc_ffff000050f158e0:
   0xffff000050f158e0: ldp      x29, x30, [sp, #0x60]
   0xffff000050f158e4: mov      w0, w19
   0xffff000050f158e8: ldr      x19, [sp, #0x70]
   0xffff000050f158ec: add      sp, sp, #0x80
   0xffff000050f158f0: ret      
