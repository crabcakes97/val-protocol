; flow candidate 0xffff000050f06570-0xffff000050f066e8
; score: 1
; matched targets: meid
; calls: 0xffff000050f8d50c, 0xffff000050f06570, 0xffff000050f8b9b0

   0xffff000050f06570: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f06574: str      x19, [sp, #0x10]
   0xffff000050f06578: mov      x29, sp
   0xffff000050f0657c: mov      x19, x0
   0xffff000050f06580: adrp     x0, #0xffff000050ffb000
   0xffff000050f06584: add      x0, x0, #0xb99
   0xffff000050f06588: mov      x1, x19
   0xffff000050f0658c: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f06590: ldp      x1, x2, [x19]
   0xffff000050f06594: adrp     x0, #0xffff000050fec000
   0xffff000050f06598: ldp      x3, x4, [x19, #0x10]
   0xffff000050f0659c: add      x0, x0, #0x3a9
   0xffff000050f065a0: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f065a4: ldp      x1, x2, [x19, #0x20]
   0xffff000050f065a8: adrp     x0, #0xffff000050fe8000
   0xffff000050f065ac: ldp      x3, x4, [x19, #0x30]
   0xffff000050f065b0: add      x0, x0, #0xd15
   0xffff000050f065b4: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f065b8: ldp      x1, x2, [x19, #0x40]
   0xffff000050f065bc: adrp     x0, #0xffff000050fff000
   0xffff000050f065c0: ldp      x3, x4, [x19, #0x50]
   0xffff000050f065c4: add      x0, x0, #0x1e7
   0xffff000050f065c8: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f065cc: ldp      x1, x2, [x19, #0x60]
   0xffff000050f065d0: adrp     x0, #0xffff000050fdf000
   0xffff000050f065d4: ldp      x3, x4, [x19, #0x70]
   0xffff000050f065d8: add      x0, x0, #0x90a
   0xffff000050f065dc: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f065e0: ldp      x1, x2, [x19, #0x80]
   0xffff000050f065e4: adrp     x0, #0xffff000050fdc000
   0xffff000050f065e8: ldp      x3, x4, [x19, #0x90]
   0xffff000050f065ec: add      x0, x0, #0x1a1
   0xffff000050f065f0: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f065f4: ldp      x1, x2, [x19, #0xa0]
   0xffff000050f065f8: adrp     x0, #0xffff000050fd6000
   0xffff000050f065fc: ldp      x3, x4, [x19, #0xb0]
   0xffff000050f06600: add      x0, x0, #0x7aa
   0xffff000050f06604: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f06608: ldp      x1, x2, [x19, #0xc0]
   0xffff000050f0660c: adrp     x0, #0xffff000050fe8000
   0xffff000050f06610: ldp      x3, x4, [x19, #0xd0]
   0xffff000050f06614: add      x0, x0, #0xd4a
   0xffff000050f06618: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f0661c: ldp      x1, x2, [x19, #0xe0]
   0xffff000050f06620: adrp     x0, #0xffff000050fef000
   0xffff000050f06624: ldp      x3, x4, [x19, #0xf0]
   0xffff000050f06628: add      x0, x0, #0x3ed
   0xffff000050f0662c: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f06630: adrp     x0, #0xffff000050ff0000
   0xffff000050f06634: ldr      x1, [x19, #0x100]
   0xffff000050f06638: add      x0, x0, #0xd66
   0xffff000050f0663c: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f06640: adrp     x0, #0xffff000050fff000
   0xffff000050f06644: ldr      x1, [x19, #0x108]
; XREF string 0xffff000050ff021c: 'meid' -> 'meid_hook'
>> 0xffff000050f06648: add      x0, x0, #0x21c
   0xffff000050f0664c: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f06650: ldr      x0, [x19, #0xe8]
   0xffff000050f06654: ldr      x1, [x19, #0x100]
   0xffff000050f06658: ldr      x19, [sp, #0x10]
   0xffff000050f0665c: ldp      x29, x30, [sp], #0x20
   0xffff000050f06660: b        #0xffff000050f06238
   0xffff000050f06664: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f06668: str      x19, [sp, #0x10]
   0xffff000050f0666c: mov      x29, sp
   0xffff000050f06670: mov      x19, x0
   0xffff000050f06674: adrp     x0, #0xffff000050fd3000
   0xffff000050f06678: add      x0, x0, #0x519
   0xffff000050f0667c: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f06680: mov      x0, x19
   0xffff000050f06684: bl       #0xffff000050f06570  ; call 0xffff000050f06570
   0xffff000050f06688: adrp     x0, #0xffff000050fd4000
   0xffff000050f0668c: add      x0, x0, #0xdb5
   0xffff000050f06690: bl       #0xffff000050f8b9b0  ; call 0xffff000050f8b9b0
   0xffff000050f06694: add      x8, x0, #0x58
   0xffff000050f06698: stp      q0, q1, [x8]
   0xffff000050f0669c: stp      q2, q3, [x8, #0x20]
   0xffff000050f066a0: stp      q4, q5, [x8, #0x40]
   0xffff000050f066a4: stp      q6, q7, [x8, #0x60]
   0xffff000050f066a8: stp      q8, q9, [x8, #0x80]
   0xffff000050f066ac: stp      q10, q11, [x8, #0xa0]
   0xffff000050f066b0: stp      q12, q13, [x8, #0xc0]
   0xffff000050f066b4: stp      q14, q15, [x8, #0xe0]
   0xffff000050f066b8: stp      q16, q17, [x8, #0x100]
   0xffff000050f066bc: stp      q18, q19, [x8, #0x120]
   0xffff000050f066c0: stp      q20, q21, [x8, #0x140]
   0xffff000050f066c4: stp      q22, q23, [x8, #0x160]
   0xffff000050f066c8: stp      q24, q25, [x8, #0x180]
   0xffff000050f066cc: stp      q26, q27, [x8, #0x1a0]
   0xffff000050f066d0: stp      q28, q29, [x8, #0x1c0]
   0xffff000050f066d4: stp      q30, q31, [x8, #0x1e0]
   0xffff000050f066d8: mrs      x8, fpcr
   0xffff000050f066dc: mrs      x9, fpsr
   0xffff000050f066e0: str      w8, [x0, #0x258]
   0xffff000050f066e4: str      w9, [x0, #0x25c]
   0xffff000050f066e8: ret      
