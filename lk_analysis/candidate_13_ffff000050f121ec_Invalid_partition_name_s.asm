; candidate function around xref 0xffff000050f122e4 to 'Invalid partition name %s'
; estimated range 0xffff000050f121ec-0xffff000050f12318

   0xffff000050f121ec: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f121f0: str      x19, [sp, #0x10]
   0xffff000050f121f4: mov      x29, sp
   0xffff000050f121f8: adrp     x1, #0xffff000050ff8000
   0xffff000050f121fc: mov      x19, x0
   0xffff000050f12200: add      x1, x1, #0x9d2
   0xffff000050f12204: mov      w0, #2
   0xffff000050f12208: bl       #0xffff000050f29978
   0xffff000050f1220c: ldr      x8, [x19, #0x10]
   0xffff000050f12210: adrp     x1, #0xffff000050ff4000
   0xffff000050f12214: add      x1, x1, #0x18
   0xffff000050f12218: mov      w2, #0x48
   0xffff000050f1221c: add      x19, x8, #1
   0xffff000050f12220: mov      x0, x19
   0xffff000050f12224: bl       #0xffff000050f8e6fc
   0xffff000050f12228: cbz      w0, #0xffff000050f122c8
   0xffff000050f1222c: adrp     x1, #0xffff000050fd6000
   0xffff000050f12230: mov      x0, x19
   0xffff000050f12234: add      x1, x1, #0x7f6
   0xffff000050f12238: mov      w2, #0x48
   0xffff000050f1223c: bl       #0xffff000050f8e6fc
   0xffff000050f12240: cbz      w0, #0xffff000050f122c8
   0xffff000050f12244: adrp     x1, #0xffff000050fdd000
   0xffff000050f12248: mov      x0, x19
   0xffff000050f1224c: add      x1, x1, #0xf57
   0xffff000050f12250: mov      w2, #0x48
   0xffff000050f12254: bl       #0xffff000050f8e6fc
   0xffff000050f12258: cbz      w0, #0xffff000050f122c8
   0xffff000050f1225c: adrp     x1, #0xffff000050ffb000
   0xffff000050f12260: mov      x0, x19
   0xffff000050f12264: add      x1, x1, #0xc48
   0xffff000050f12268: mov      w2, #0x48
   0xffff000050f1226c: bl       #0xffff000050f8e6fc
   0xffff000050f12270: cbz      w0, #0xffff000050f122c8
   0xffff000050f12274: adrp     x1, #0xffff000050fd3000
   0xffff000050f12278: mov      x0, x19
   0xffff000050f1227c: add      x1, x1, #0x5ba
   0xffff000050f12280: mov      w2, #0x48
   0xffff000050f12284: bl       #0xffff000050f8e6fc
   0xffff000050f12288: cbz      w0, #0xffff000050f122c8
   0xffff000050f1228c: adrp     x1, #0xffff000050fd4000
   0xffff000050f12290: mov      x0, x19
   0xffff000050f12294: add      x1, x1, #0xe2b
   0xffff000050f12298: mov      w2, #0x48
   0xffff000050f1229c: bl       #0xffff000050f8e6fc
   0xffff000050f122a0: cbz      w0, #0xffff000050f122c8
   0xffff000050f122a4: mov      x0, x19
   0xffff000050f122a8: bl       #0xffff000050f25510
   0xffff000050f122ac: cbz      x0, #0xffff000050f122d8
   0xffff000050f122b0: bl       #0xffff000050f9e600
   0xffff000050f122b4: tbz      w0, #0, #0xffff000050f122f8
   0xffff000050f122b8: mov      x0, x19
   0xffff000050f122bc: mov      w1, #1
   0xffff000050f122c0: bl       #0xffff000050f386b0
   0xffff000050f122c4: tbz      w0, #0, #0xffff000050f1230c
   0xffff000050f122c8: mov      w0, #1
   0xffff000050f122cc: ldr      x19, [sp, #0x10]
   0xffff000050f122d0: ldp      x29, x30, [sp], #0x20
   0xffff000050f122d4: ret      
   0xffff000050f122d8: adrp     x0, #0xffff000050fd9000
   0xffff000050f122dc: adrp     x1, #0xffff000050fe8000
   0xffff000050f122e0: add      x0, x0, #0x53d
>> 0xffff000050f122e4: add      x1, x1, #0xff4
   0xffff000050f122e8: mov      x2, x19
   0xffff000050f122ec: bl       #0xffff000050f07c4c
   0xffff000050f122f0: mov      w0, #3
   0xffff000050f122f4: b        #0xffff000050f122cc
   0xffff000050f122f8: adrp     x0, #0xffff000050fd9000
   0xffff000050f122fc: adrp     x1, #0xffff000050ff0000
   0xffff000050f12300: add      x0, x0, #0x53d
   0xffff000050f12304: add      x1, x1, #0xf71
   0xffff000050f12308: bl       #0xffff000050f07c4c
   0xffff000050f1230c: mov      w0, #3
   0xffff000050f12310: b        #0xffff000050f122cc
   0xffff000050f12314: mov      w0, #1
   0xffff000050f12318: ret      
