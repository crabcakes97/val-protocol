; candidate function around xref 0xffff000050f922cc to 'imei'
; estimated range 0xffff000050f921d4-0xffff000050f923c8

   0xffff000050f921d4: sub      sp, sp, #0x50
   0xffff000050f921d8: stp      x29, x30, [sp, #0x10]
   0xffff000050f921dc: add      x29, sp, #0x10
   0xffff000050f921e0: stp      x24, x23, [sp, #0x20]
   0xffff000050f921e4: stp      x22, x21, [sp, #0x30]
   0xffff000050f921e8: stp      x20, x19, [sp, #0x40]
   0xffff000050f921ec: mov      x19, x3
   0xffff000050f921f0: mov      x20, x2
   0xffff000050f921f4: mov      w21, w1
   0xffff000050f921f8: mov      w23, w0
   0xffff000050f921fc: mov      w24, #1
   0xffff000050f92200: mov      w22, #0x55
   0xffff000050f92204: cmp      w0, #0xa9
   0xffff000050f92208: b.gt     #0xffff000050f92224
   0xffff000050f9220c: cmp      w23, #0xf
   0xffff000050f92210: b.eq     #0xffff000050f9224c
   0xffff000050f92214: cmp      w23, #0x33
   0xffff000050f92218: b.ne     #0xffff000050f923a8
   0xffff000050f9221c: mov      w8, #0x16c
   0xffff000050f92220: b        #0xffff000050f92268
   0xffff000050f92224: cmp      w23, #0xaa
   0xffff000050f92228: b.eq     #0xffff000050f92264
   0xffff000050f9222c: cmp      w23, #0xf0
   0xffff000050f92230: b.ne     #0xffff000050f923a8
   0xffff000050f92234: and      w8, w21, #0xffff
   0xffff000050f92238: mov      w9, #0x70
   0xffff000050f9223c: cmp      w8, #2
   0xffff000050f92240: mov      w8, #0x62
   0xffff000050f92244: csel     w8, w9, w8, eq
   0xffff000050f92248: b        #0xffff000050f92268
   0xffff000050f9224c: and      w8, w21, #0xffff
   0xffff000050f92250: mov      w9, #0x46
   0xffff000050f92254: cmp      w8, #2
   0xffff000050f92258: mov      w8, #0x44
   0xffff000050f9225c: csel     w8, w9, w8, eq
   0xffff000050f92260: b        #0xffff000050f92268
   0xffff000050f92264: mov      w8, #0x28
   0xffff000050f92268: adrp     x0, #0xffff000050fe6000
   0xffff000050f9226c: lsr      w9, w23, #8
   0xffff000050f92270: lsr      w10, w8, #8
   0xffff000050f92274: lsr      w11, w21, #8
   0xffff000050f92278: strb     w8, [x20, #7]
   0xffff000050f9227c: mov      w8, #0x10
   0xffff000050f92280: add      x0, x0, #0xc2f
   0xffff000050f92284: strb     w23, [x20, #1]
   0xffff000050f92288: strh     wzr, [x20, #4]
   0xffff000050f9228c: strb     w9, [x20]
   0xffff000050f92290: strb     w10, [x20, #6]
   0xffff000050f92294: strb     w11, [x20, #2]
   0xffff000050f92298: strb     w21, [x20, #3]
   0xffff000050f9229c: stur     w8, [x29, #-4]
   0xffff000050f922a0: bl       #0xffff000050f9b7e8
   0xffff000050f922a4: adrp     x8, #0xffff000051106000
   0xffff000050f922a8: add      x22, x20, #8
   0xffff000050f922ac: ldrb     w8, [x8, #0x8b4]
   0xffff000050f922b0: cmp      w8, #1
   0xffff000050f922b4: b.ne     #0xffff000050f922f0
   0xffff000050f922b8: cmp      w23, #0x33
   0xffff000050f922bc: b.eq     #0xffff000050f922c8
   0xffff000050f922c0: cmp      w23, #0xf
   0xffff000050f922c4: b.ne     #0xffff000050f922f0
   0xffff000050f922c8: adrp     x0, #0xffff000050fd0000
>> 0xffff000050f922cc: add      x0, x0, #0x68
   0xffff000050f922d0: bl       #0xffff000050f9b7e8
   0xffff000050f922d4: adrp     x9, #0xffff000051106000
   0xffff000050f922d8: mov      w8, #0x10
   0xffff000050f922dc: add      x9, x9, #0x8a2
   0xffff000050f922e0: stur     w8, [x29, #-4]
   0xffff000050f922e4: ldp      x10, x9, [x9]
   0xffff000050f922e8: stp      x10, x9, [x22]
   0xffff000050f922ec: b        #0xffff000050f92310
   0xffff000050f922f0: sub      x1, x29, #4
   0xffff000050f922f4: mov      x0, x22
   0xffff000050f922f8: bl       #0xffff000050f9b6fc
   0xffff000050f922fc: cmp      w0, #0xf
   0xffff000050f92300: b.ne     #0xffff000050f92368
   0xffff000050f92304: ldur     w8, [x29, #-4]
   0xffff000050f92308: cmp      w8, #0x10
   0xffff000050f9230c: b.ne     #0xffff000050f92380
   0xffff000050f92310: adrp     x0, #0xffff000050fe6000
   0xffff000050f92314: add      x0, x0, #0xc5f
   0xffff000050f92318: bl       #0xffff000050f9b7e8
   0xffff000050f9231c: mov      w8, #0x10
   0xffff000050f92320: add      x0, x20, #0x18
   0xffff000050f92324: sub      x1, x29, #4
   0xffff000050f92328: stur     w8, [x29, #-4]
   0xffff000050f9232c: bl       #0xffff000050f9b774
   0xffff000050f92330: cmp      w0, #0xf
   0xffff000050f92334: b.ne     #0xffff000050f92374
   0xffff000050f92338: ldur     w8, [x29, #-4]
   0xffff000050f9233c: adrp     x9, #0xffff000050fd8000
   0xffff000050f92340: adrp     x10, #0xffff000050fea000
   0xffff000050f92344: add      x9, x9, #0xf1d
   0xffff000050f92348: add      x10, x10, #0x12b
   0xffff000050f9234c: mov      w11, #0x55
   0xffff000050f92350: cmp      w8, #0x10
   0xffff000050f92354: mov      w8, #0xf
   0xffff000050f92358: csel     x0, x10, x9, eq
   0xffff000050f9235c: csel     w22, w8, w11, eq
   0xffff000050f92360: mov      w24, #4
   0xffff000050f92364: b        #0xffff000050f92390
   0xffff000050f92368: mov      w22, w0
   0xffff000050f9236c: mov      w24, #3
   0xffff000050f92370: b        #0xffff000050f92394
   0xffff000050f92374: mov      w22, w0
   0xffff000050f92378: mov      w24, #4
   0xffff000050f9237c: b        #0xffff000050f92394
   0xffff000050f92380: adrp     x0, #0xffff000050fe2000
   0xffff000050f92384: mov      w24, #3
   0xffff000050f92388: mov      w22, #0x55
   0xffff000050f9238c: add      x0, x0, #0x478
   0xffff000050f92390: bl       #0xffff000050f9b7e8
   0xffff000050f92394: and      w8, w21, #0xffff
   0xffff000050f92398: cmp      w8, #2
   0xffff000050f9239c: b.lo     #0xffff000050f923a8
   0xffff000050f923a0: mov      w8, #2
   0xffff000050f923a4: strh     w8, [x20, #0x28]
   0xffff000050f923a8: cbz      x19, #0xffff000050f923b0
   0xffff000050f923ac: strb     w24, [x19]
   0xffff000050f923b0: mov      w0, w22
   0xffff000050f923b4: ldp      x20, x19, [sp, #0x40]
   0xffff000050f923b8: ldp      x22, x21, [sp, #0x30]
   0xffff000050f923bc: ldp      x24, x23, [sp, #0x20]
   0xffff000050f923c0: ldp      x29, x30, [sp, #0x10]
   0xffff000050f923c4: add      sp, sp, #0x50
   0xffff000050f923c8: ret      
