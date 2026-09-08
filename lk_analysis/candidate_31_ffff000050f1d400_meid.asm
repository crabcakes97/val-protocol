; candidate function around xref 0xffff000050f1d45c to 'meid'
; estimated range 0xffff000050f1d400-0xffff000050f1d78c

   0xffff000050f1d400: sub      sp, sp, #0x90
   0xffff000050f1d404: stp      x29, x30, [sp, #0x40]
   0xffff000050f1d408: add      x29, sp, #0x40
   0xffff000050f1d40c: stp      x26, x25, [sp, #0x50]
   0xffff000050f1d410: stp      x24, x23, [sp, #0x60]
   0xffff000050f1d414: stp      x22, x21, [sp, #0x70]
   0xffff000050f1d418: stp      x20, x19, [sp, #0x80]
   0xffff000050f1d41c: mov      w0, #-1
   0xffff000050f1d420: bl       #0xffff000050f75de8
   0xffff000050f1d424: bl       #0xffff000050f76358
   0xffff000050f1d428: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f1d42c: stp      xzr, xzr, [sp, #0x20]
   0xffff000050f1d430: stp      xzr, xzr, [sp, #0x10]
   0xffff000050f1d434: stp      xzr, xzr, [sp]
   0xffff000050f1d438: bl       #0xffff000050f02ab0
   0xffff000050f1d43c: mov      x19, x0
   0xffff000050f1d440: bl       #0xffff000050fc91cc
   0xffff000050f1d444: lsr      w20, w0, #1
   0xffff000050f1d448: mov      x1, x19
   0xffff000050f1d44c: mov      w0, w20
   0xffff000050f1d450: bl       #0xffff000050f1fdd8
   0xffff000050f1d454: adrp     x2, #0xffff000050fdc000
   0xffff000050f1d458: mov      x0, sp
>> 0xffff000050f1d45c: add      x2, x2, #0x6ef
   0xffff000050f1d460: mov      w1, #0x40
   0xffff000050f1d464: mov      x3, x19
   0xffff000050f1d468: bl       #0xffff000050f8c89c
   0xffff000050f1d46c: bl       #0xffff000050fc91b0
   0xffff000050f1d470: mov      w19, w0
   0xffff000050f1d474: bl       #0xffff000050f89374
   0xffff000050f1d478: mov      w24, #0xb
   0xffff000050f1d47c: madd     w19, w0, w24, w19
   0xffff000050f1d480: bl       #0xffff000050fc91cc
   0xffff000050f1d484: mov      w21, w0
   0xffff000050f1d488: bl       #0xffff000050f140ac
   0xffff000050f1d48c: madd     w2, w0, w21, w20
   0xffff000050f1d490: mov      x0, sp
   0xffff000050f1d494: mov      w1, w19
   0xffff000050f1d498: mov      w3, wzr
   0xffff000050f1d49c: mov      w4, #-0xffff01
   0xffff000050f1d4a0: bl       #0xffff000050f75ea8
   0xffff000050f1d4a4: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f1d4a8: stp      xzr, xzr, [sp, #0x20]
   0xffff000050f1d4ac: stp      xzr, xzr, [sp, #0x10]
   0xffff000050f1d4b0: stp      xzr, xzr, [sp]
   0xffff000050f1d4b4: bl       #0xffff000050f02ab4
   0xffff000050f1d4b8: mov      x19, x0
   0xffff000050f1d4bc: bl       #0xffff000050f02abc
   0xffff000050f1d4c0: mov      x20, x0
   0xffff000050f1d4c4: bl       #0xffff000050fc91cc
   0xffff000050f1d4c8: lsr      w25, w0, #1
   0xffff000050f1d4cc: bl       #0xffff000050f765e4
   0xffff000050f1d4d0: mov      w21, w0
   0xffff000050f1d4d4: bl       #0xffff000050fc91cc
   0xffff000050f1d4d8: mov      w22, w0
   0xffff000050f1d4dc: bl       #0xffff000050f140ac
   0xffff000050f1d4e0: mov      w23, w0
   0xffff000050f1d4e4: bl       #0xffff000050fc91cc
   0xffff000050f1d4e8: madd     w22, w23, w22, w0
   0xffff000050f1d4ec: bl       #0xffff000050fc91cc
   0xffff000050f1d4f0: add      w8, w25, w0
   0xffff000050f1d4f4: mov      w23, #0xaaab
   0xffff000050f1d4f8: sub      w8, w21, w8
   0xffff000050f1d4fc: movk     w23, #0xaaaa, lsl #16
   0xffff000050f1d500: sub      w8, w8, w22, lsl #2
   0xffff000050f1d504: umull    x8, w8, w23
   0xffff000050f1d508: lsr      x26, x8, #0x21
   0xffff000050f1d50c: bl       #0xffff000050fc91cc
   0xffff000050f1d510: mov      w21, w0
   0xffff000050f1d514: bl       #0xffff000050f140ac
   0xffff000050f1d518: mov      w22, w0
   0xffff000050f1d51c: bl       #0xffff000050fc91cc
   0xffff000050f1d520: ldrb     w8, [x20]
   0xffff000050f1d524: madd     w9, w22, w21, w25
   0xffff000050f1d528: add      w9, w9, w0
   0xffff000050f1d52c: cmp      w8, #0
   0xffff000050f1d530: add      w21, w9, w26
   0xffff000050f1d534: csel     x19, x19, x20, eq
   0xffff000050f1d538: mov      w0, w21
   0xffff000050f1d53c: mov      x1, x19
   0xffff000050f1d540: bl       #0xffff000050f1fdd8
   0xffff000050f1d544: adrp     x2, #0xffff000050fcf000
   0xffff000050f1d548: mov      x0, sp
   0xffff000050f1d54c: add      x2, x2, #0x397
   0xffff000050f1d550: mov      w1, #0x40
   0xffff000050f1d554: mov      x3, x19
   0xffff000050f1d558: bl       #0xffff000050f8c89c
   0xffff000050f1d55c: bl       #0xffff000050fc91b0
   0xffff000050f1d560: mov      w19, w0
   0xffff000050f1d564: bl       #0xffff000050f89374
   0xffff000050f1d568: madd     w19, w0, w24, w19
   0xffff000050f1d56c: bl       #0xffff000050fc91cc
   0xffff000050f1d570: mov      w20, w0
   0xffff000050f1d574: bl       #0xffff000050f140ac
   0xffff000050f1d578: madd     w2, w0, w20, w21
   0xffff000050f1d57c: mov      x0, sp
   0xffff000050f1d580: mov      w1, w19
   0xffff000050f1d584: mov      w3, wzr
   0xffff000050f1d588: mov      w4, #-0xffff01
   0xffff000050f1d58c: bl       #0xffff000050f75ea8
   0xffff000050f1d590: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f1d594: stp      xzr, xzr, [sp, #0x20]
   0xffff000050f1d598: stp      xzr, xzr, [sp, #0x10]
   0xffff000050f1d59c: stp      xzr, xzr, [sp]
   0xffff000050f1d5a0: bl       #0xffff000050f02ab8
   0xffff000050f1d5a4: mov      x19, x0
   0xffff000050f1d5a8: bl       #0xffff000050fc91cc
   0xffff000050f1d5ac: lsr      w25, w0, #1
   0xffff000050f1d5b0: bl       #0xffff000050f765e4
   0xffff000050f1d5b4: mov      w20, w0
   0xffff000050f1d5b8: bl       #0xffff000050fc91cc
   0xffff000050f1d5bc: mov      w21, w0
   0xffff000050f1d5c0: bl       #0xffff000050f140ac
   0xffff000050f1d5c4: mov      w22, w0
   0xffff000050f1d5c8: bl       #0xffff000050fc91cc
   0xffff000050f1d5cc: madd     w21, w22, w21, w0
   0xffff000050f1d5d0: bl       #0xffff000050fc91cc
   0xffff000050f1d5d4: add      w8, w25, w0
   0xffff000050f1d5d8: sub      w8, w20, w8
   0xffff000050f1d5dc: sub      w8, w8, w21, lsl #2
   0xffff000050f1d5e0: umull    x8, w8, w23
   0xffff000050f1d5e4: lsr      x22, x8, #0x21
   0xffff000050f1d5e8: bl       #0xffff000050fc91cc
   0xffff000050f1d5ec: mov      w20, w0
   0xffff000050f1d5f0: bl       #0xffff000050f140ac
   0xffff000050f1d5f4: mov      w21, w0
   0xffff000050f1d5f8: bl       #0xffff000050fc91cc
   0xffff000050f1d5fc: madd     w8, w21, w20, w0
   0xffff000050f1d600: mov      x1, x19
   0xffff000050f1d604: add      w8, w8, w22
   0xffff000050f1d608: add      w20, w25, w8, lsl #1
   0xffff000050f1d60c: mov      w0, w20
   0xffff000050f1d610: bl       #0xffff000050f1fdd8
   0xffff000050f1d614: adrp     x2, #0xffff000050fd8000
   0xffff000050f1d618: mov      x0, sp
   0xffff000050f1d61c: add      x2, x2, #0x5e
   0xffff000050f1d620: mov      w1, #0x40
   0xffff000050f1d624: mov      x3, x19
   0xffff000050f1d628: bl       #0xffff000050f8c89c
   0xffff000050f1d62c: bl       #0xffff000050fc91b0
   0xffff000050f1d630: mov      w19, w0
   0xffff000050f1d634: bl       #0xffff000050f89374
   0xffff000050f1d638: madd     w19, w0, w24, w19
   0xffff000050f1d63c: bl       #0xffff000050fc91cc
   0xffff000050f1d640: mov      w21, w0
   0xffff000050f1d644: bl       #0xffff000050f140ac
   0xffff000050f1d648: madd     w2, w0, w21, w20
   0xffff000050f1d64c: mov      x0, sp
   0xffff000050f1d650: mov      w1, w19
   0xffff000050f1d654: mov      w3, wzr
   0xffff000050f1d658: mov      w4, #-0xffff01
   0xffff000050f1d65c: bl       #0xffff000050f75ea8
   0xffff000050f1d660: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f1d664: stp      xzr, xzr, [sp, #0x20]
   0xffff000050f1d668: stp      xzr, xzr, [sp, #0x10]
   0xffff000050f1d66c: stp      xzr, xzr, [sp]
   0xffff000050f1d670: bl       #0xffff000050f02aac
   0xffff000050f1d674: mov      x19, x0
   0xffff000050f1d678: bl       #0xffff000050fc91cc
   0xffff000050f1d67c: lsr      w25, w0, #1
   0xffff000050f1d680: bl       #0xffff000050f765e4
   0xffff000050f1d684: mov      w20, w0
   0xffff000050f1d688: bl       #0xffff000050fc91cc
   0xffff000050f1d68c: mov      w21, w0
   0xffff000050f1d690: bl       #0xffff000050f140ac
   0xffff000050f1d694: mov      w22, w0
   0xffff000050f1d698: bl       #0xffff000050fc91cc
   0xffff000050f1d69c: madd     w21, w22, w21, w0
   0xffff000050f1d6a0: bl       #0xffff000050fc91cc
   0xffff000050f1d6a4: add      w8, w25, w0
   0xffff000050f1d6a8: sub      w8, w20, w8
   0xffff000050f1d6ac: sub      w8, w8, w21, lsl #2
   0xffff000050f1d6b0: umull    x8, w8, w23
   0xffff000050f1d6b4: lsr      x22, x8, #0x21
   0xffff000050f1d6b8: bl       #0xffff000050fc91cc
   0xffff000050f1d6bc: mov      w20, w0
   0xffff000050f1d6c0: bl       #0xffff000050f140ac
   0xffff000050f1d6c4: mov      w21, w0
   0xffff000050f1d6c8: bl       #0xffff000050fc91cc
   0xffff000050f1d6cc: madd     w8, w21, w20, w0
   0xffff000050f1d6d0: mov      x1, x19
   0xffff000050f1d6d4: add      w8, w8, w22
   0xffff000050f1d6d8: add      w8, w8, w8, lsl #1
   0xffff000050f1d6dc: add      w20, w8, w25
   0xffff000050f1d6e0: mov      w0, w20
   0xffff000050f1d6e4: bl       #0xffff000050f1fdd8
   0xffff000050f1d6e8: adrp     x2, #0xffff000050ffa000
   0xffff000050f1d6ec: mov      x0, sp
   0xffff000050f1d6f0: add      x2, x2, #0x720
   0xffff000050f1d6f4: mov      w1, #0x40
   0xffff000050f1d6f8: mov      x3, x19
   0xffff000050f1d6fc: bl       #0xffff000050f8c89c
   0xffff000050f1d700: bl       #0xffff000050fc91b0
   0xffff000050f1d704: mov      w19, w0
   0xffff000050f1d708: bl       #0xffff000050f89374
   0xffff000050f1d70c: madd     w19, w0, w24, w19
   0xffff000050f1d710: bl       #0xffff000050fc91cc
   0xffff000050f1d714: mov      w21, w0
   0xffff000050f1d718: bl       #0xffff000050f140ac
   0xffff000050f1d71c: madd     w2, w0, w21, w20
   0xffff000050f1d720: mov      x0, sp
   0xffff000050f1d724: mov      w1, w19
   0xffff000050f1d728: mov      w3, wzr
   0xffff000050f1d72c: mov      w4, #-0xffff01
   0xffff000050f1d730: bl       #0xffff000050f75ea8
   0xffff000050f1d734: bl       #0xffff000050fc91b0
   0xffff000050f1d738: mov      w19, w0
   0xffff000050f1d73c: bl       #0xffff000050f765e4
   0xffff000050f1d740: mov      w20, w0
   0xffff000050f1d744: bl       #0xffff000050fc91cc
   0xffff000050f1d748: sub      w2, w20, w0
   0xffff000050f1d74c: adrp     x0, #0xffff000050ffa000
   0xffff000050f1d750: add      x0, x0, #0x732
   0xffff000050f1d754: mov      w1, w19
   0xffff000050f1d758: mov      w3, wzr
   0xffff000050f1d75c: mov      w4, #-0xff0100
   0xffff000050f1d760: bl       #0xffff000050f75ea8
   0xffff000050f1d764: mov      x0, xzr
   0xffff000050f1d768: mov      w1, wzr
   0xffff000050f1d76c: mov      w2, #1
   0xffff000050f1d770: bl       #0xffff000050f75df4
   0xffff000050f1d774: ldp      x20, x19, [sp, #0x80]
   0xffff000050f1d778: ldp      x22, x21, [sp, #0x70]
   0xffff000050f1d77c: ldp      x24, x23, [sp, #0x60]
   0xffff000050f1d780: ldp      x26, x25, [sp, #0x50]
   0xffff000050f1d784: ldp      x29, x30, [sp, #0x40]
   0xffff000050f1d788: add      sp, sp, #0x90
   0xffff000050f1d78c: ret      
