; candidate function around xref 0xffff000050f140d8 to 'barcode'
; estimated range 0xffff000050f140ac-0xffff000050f14198

   0xffff000050f140ac: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f140b0: str      x19, [sp, #0x10]
   0xffff000050f140b4: mov      x29, sp
   0xffff000050f140b8: adrp     x19, #0xffff000051022000
   0xffff000050f140bc: ldr      w0, [x19, #0xb90]
   0xffff000050f140c0: cmn      w0, #1
   0xffff000050f140c4: b.eq     #0xffff000050f140d4
   0xffff000050f140c8: ldr      x19, [sp, #0x10]
   0xffff000050f140cc: ldp      x29, x30, [sp], #0x20
   0xffff000050f140d0: ret      
   0xffff000050f140d4: adrp     x0, #0xffff000050fe2000
>> 0xffff000050f140d8: add      x0, x0, #0xcd1
   0xffff000050f140dc: bl       #0xffff000050f13904
   0xffff000050f140e0: tbnz     w0, #0x1f, #0xffff000050f14138
   0xffff000050f140e4: mov      w1, w0
   0xffff000050f140e8: adrp     x0, #0xffff000051001000
   0xffff000050f140ec: adrp     x2, #0xffff000050fea000
   0xffff000050f140f0: mov      w8, #4
   0xffff000050f140f4: add      x0, x0, #0x880
   0xffff000050f140f8: add      x2, x2, #0xbb5
   0xffff000050f140fc: mov      x3, xzr
   0xffff000050f14100: str      w8, [x19, #0xb90]
   0xffff000050f14104: bl       #0xffff000050f7bf08
   0xffff000050f14108: cbz      x0, #0xffff000050f14154
   0xffff000050f1410c: ldr      w8, [x0]
   0xffff000050f14110: adrp     x1, #0xffff000050ffd000
   0xffff000050f14114: adrp     x2, #0xffff000050fea000
   0xffff000050f14118: add      x1, x1, #0xa96
   0xffff000050f1411c: add      x2, x2, #0xbb5
   0xffff000050f14120: mov      w0, #2
   0xffff000050f14124: rev      w3, w8
   0xffff000050f14128: str      w3, [x19, #0xb90]
   0xffff000050f1412c: bl       #0xffff000050f29978
   0xffff000050f14130: ldr      w0, [x19, #0xb90]
   0xffff000050f14134: b        #0xffff000050f140c8
   0xffff000050f14138: adrp     x1, #0xffff000050fe2000
   0xffff000050f1413c: mov      w0, #1
   0xffff000050f14140: add      x1, x1, #0xce1
   0xffff000050f14144: bl       #0xffff000050f29978
   0xffff000050f14148: mov      w0, #4
   0xffff000050f1414c: str      w0, [x19, #0xb90]
   0xffff000050f14150: b        #0xffff000050f140c8
   0xffff000050f14154: adrp     x1, #0xffff000050fe2000
   0xffff000050f14158: adrp     x2, #0xffff000050fea000
   0xffff000050f1415c: add      x1, x1, #0xcb7
   0xffff000050f14160: add      x2, x2, #0xbb5
   0xffff000050f14164: mov      w0, #2
   0xffff000050f14168: bl       #0xffff000050f29978
   0xffff000050f1416c: mov      w0, #-1
   0xffff000050f14170: b        #0xffff000050f140c8
   0xffff000050f14174: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f14178: str      x19, [sp, #0x10]
   0xffff000050f1417c: mov      x29, sp
   0xffff000050f14180: adrp     x19, #0xffff000051022000
   0xffff000050f14184: ldr      w0, [x19, #0xb94]
   0xffff000050f14188: cmn      w0, #1
   0xffff000050f1418c: b.eq     #0xffff000050f1419c
   0xffff000050f14190: ldr      x19, [sp, #0x10]
   0xffff000050f14194: ldp      x29, x30, [sp], #0x20
   0xffff000050f14198: ret      
