; flow candidate 0xffff000050f140ac-0xffff000050f142c8
; score: 4
; matched targets: barcode
; calls: 0xffff000050f13904, 0xffff000050f7bf08, 0xffff000050f29978

   0xffff000050f140ac: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f140b0: str      x19, [sp, #0x10]
   0xffff000050f140b4: mov      x29, sp
   0xffff000050f140b8: adrp     x19, #0xffff000051022000
   0xffff000050f140bc: ldr      w0, [x19, #0xb90]
   0xffff000050f140c0: cmn      w0, #1
   0xffff000050f140c4: b.eq     #0xffff000050f140d4

loc_ffff000050f140c8:
   0xffff000050f140c8: ldr      x19, [sp, #0x10]
   0xffff000050f140cc: ldp      x29, x30, [sp], #0x20
   0xffff000050f140d0: ret      

loc_ffff000050f140d4:
   0xffff000050f140d4: adrp     x0, #0xffff000050fe2000
; XREF string 0xffff000050fe2cd1: 'barcode' -> 'barcode_setting'
>> 0xffff000050f140d8: add      x0, x0, #0xcd1
   0xffff000050f140dc: bl       #0xffff000050f13904  ; call 0xffff000050f13904
   0xffff000050f140e0: tbnz     w0, #0x1f, #0xffff000050f14138
   0xffff000050f140e4: mov      w1, w0
   0xffff000050f140e8: adrp     x0, #0xffff000051001000
   0xffff000050f140ec: adrp     x2, #0xffff000050fea000
   0xffff000050f140f0: mov      w8, #4
   0xffff000050f140f4: add      x0, x0, #0x880
   0xffff000050f140f8: add      x2, x2, #0xbb5
   0xffff000050f140fc: mov      x3, xzr
   0xffff000050f14100: str      w8, [x19, #0xb90]
   0xffff000050f14104: bl       #0xffff000050f7bf08  ; call 0xffff000050f7bf08
   0xffff000050f14108: cbz      x0, #0xffff000050f14154
   0xffff000050f1410c: ldr      w8, [x0]
   0xffff000050f14110: adrp     x1, #0xffff000050ffd000
   0xffff000050f14114: adrp     x2, #0xffff000050fea000
   0xffff000050f14118: add      x1, x1, #0xa96
   0xffff000050f1411c: add      x2, x2, #0xbb5
   0xffff000050f14120: mov      w0, #2
   0xffff000050f14124: rev      w3, w8
   0xffff000050f14128: str      w3, [x19, #0xb90]
   0xffff000050f1412c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f14130: ldr      w0, [x19, #0xb90]
   0xffff000050f14134: b        #0xffff000050f140c8

loc_ffff000050f14138:
   0xffff000050f14138: adrp     x1, #0xffff000050fe2000
   0xffff000050f1413c: mov      w0, #1
; XREF string 0xffff000050fe2ce1: 'barcode' -> 'No barcode setting, use default scale 4\n'
>> 0xffff000050f14140: add      x1, x1, #0xce1
   0xffff000050f14144: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f14148: mov      w0, #4
   0xffff000050f1414c: str      w0, [x19, #0xb90]
   0xffff000050f14150: b        #0xffff000050f140c8

loc_ffff000050f14154:
   0xffff000050f14154: adrp     x1, #0xffff000050fe2000
   0xffff000050f14158: adrp     x2, #0xffff000050fea000
   0xffff000050f1415c: add      x1, x1, #0xcb7
   0xffff000050f14160: add      x2, x2, #0xbb5
   0xffff000050f14164: mov      w0, #2
   0xffff000050f14168: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f1416c: mov      w0, #-1
   0xffff000050f14170: b        #0xffff000050f140c8
   0xffff000050f14174: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f14178: str      x19, [sp, #0x10]
   0xffff000050f1417c: mov      x29, sp
   0xffff000050f14180: adrp     x19, #0xffff000051022000
   0xffff000050f14184: ldr      w0, [x19, #0xb94]
   0xffff000050f14188: cmn      w0, #1
   0xffff000050f1418c: b.eq     #0xffff000050f1419c

loc_ffff000050f14190:
   0xffff000050f14190: ldr      x19, [sp, #0x10]
   0xffff000050f14194: ldp      x29, x30, [sp], #0x20
   0xffff000050f14198: ret      

loc_ffff000050f1419c:
   0xffff000050f1419c: adrp     x0, #0xffff000050fe2000
; XREF string 0xffff000050fe2cd1: 'barcode' -> 'barcode_setting'
>> 0xffff000050f141a0: add      x0, x0, #0xcd1
   0xffff000050f141a4: bl       #0xffff000050f13904  ; call 0xffff000050f13904
   0xffff000050f141a8: tbnz     w0, #0x1f, #0xffff000050f14200
   0xffff000050f141ac: mov      w1, w0
   0xffff000050f141b0: adrp     x0, #0xffff000051001000
   0xffff000050f141b4: adrp     x2, #0xffff000050fe2000
   0xffff000050f141b8: mov      w8, #3
   0xffff000050f141bc: add      x0, x0, #0x880
   0xffff000050f141c0: add      x2, x2, #0xd0a
   0xffff000050f141c4: mov      x3, xzr
   0xffff000050f141c8: str      w8, [x19, #0xb94]
   0xffff000050f141cc: bl       #0xffff000050f7bf08  ; call 0xffff000050f7bf08
   0xffff000050f141d0: cbz      x0, #0xffff000050f1421c
   0xffff000050f141d4: ldr      w8, [x0]
   0xffff000050f141d8: adrp     x1, #0xffff000050ffd000
   0xffff000050f141dc: adrp     x2, #0xffff000050fe2000
   0xffff000050f141e0: add      x1, x1, #0xa96
   0xffff000050f141e4: add      x2, x2, #0xd0a
   0xffff000050f141e8: mov      w0, #2
   0xffff000050f141ec: rev      w3, w8
   0xffff000050f141f0: str      w3, [x19, #0xb94]
   0xffff000050f141f4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f141f8: ldr      w0, [x19, #0xb94]
   0xffff000050f141fc: b        #0xffff000050f14190

loc_ffff000050f14200:
   0xffff000050f14200: adrp     x1, #0xffff000050fef000
   0xffff000050f14204: mov      w0, #1
; XREF string 0xffff000050fef730: 'barcode' -> 'No barcode setting, use default width 3\n'
>> 0xffff000050f14208: add      x1, x1, #0x730
   0xffff000050f1420c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f14210: mov      w0, #3
   0xffff000050f14214: str      w0, [x19, #0xb94]
   0xffff000050f14218: b        #0xffff000050f14190

loc_ffff000050f1421c:
   0xffff000050f1421c: adrp     x1, #0xffff000050fe2000
   0xffff000050f14220: adrp     x2, #0xffff000050fe2000
   0xffff000050f14224: add      x1, x1, #0xcb7
   0xffff000050f14228: add      x2, x2, #0xd0a
   0xffff000050f1422c: mov      w0, #2
   0xffff000050f14230: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f14234: mov      w0, #-1
   0xffff000050f14238: b        #0xffff000050f14190
   0xffff000050f1423c: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f14240: stp      x20, x19, [sp, #0x10]
   0xffff000050f14244: mov      x29, sp
   0xffff000050f14248: adrp     x0, #0xffff000050ffa000
   0xffff000050f1424c: add      x0, x0, #0x5cd
   0xffff000050f14250: bl       #0xffff000050f13904  ; call 0xffff000050f13904
   0xffff000050f14254: tbnz     w0, #0x1f, #0xffff000050f142ac
   0xffff000050f14258: mov      w1, w0
   0xffff000050f1425c: adrp     x0, #0xffff000051001000
   0xffff000050f14260: adrp     x2, #0xffff000050fd0000
   0xffff000050f14264: add      x0, x0, #0x880
   0xffff000050f14268: add      x2, x2, #0x739
   0xffff000050f1426c: mov      x3, xzr
   0xffff000050f14270: bl       #0xffff000050f7bf08  ; call 0xffff000050f7bf08
   0xffff000050f14274: cbnz     x0, #0xffff000050f142c0
   0xffff000050f14278: adrp     x19, #0xffff000050fe2000
   0xffff000050f1427c: adrp     x20, #0xffff000050fd0000
   0xffff000050f14280: add      x19, x19, #0xcb7
   0xffff000050f14284: add      x20, x20, #0x739
   0xffff000050f14288: mov      w0, #2
   0xffff000050f1428c: mov      x1, x19
   0xffff000050f14290: mov      x2, x20
   0xffff000050f14294: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f14298: mov      w0, #2
   0xffff000050f1429c: mov      x1, x19
   0xffff000050f142a0: mov      x2, x20
   0xffff000050f142a4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f142a8: b        #0xffff000050f142bc

loc_ffff000050f142ac:
   0xffff000050f142ac: adrp     x1, #0xffff000050ff2000
   0xffff000050f142b0: mov      w0, #-1
   0xffff000050f142b4: add      x1, x1, #0xa35
   0xffff000050f142b8: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f142bc:
   0xffff000050f142bc: mov      x0, xzr

loc_ffff000050f142c0:
   0xffff000050f142c0: ldp      x20, x19, [sp, #0x10]
   0xffff000050f142c4: ldp      x29, x30, [sp], #0x20
   0xffff000050f142c8: ret      
