; flow candidate 0xffff000050f13240-0xffff000050f1340c
; score: 2
; matched targets: max-download-size
; calls: 0xffff000050f8e73c, 0xffff000050f13080, 0xffff000050f07b00, 0xffff000050f07c4c, 0xffff000050f895ac, 0xffff000050f894ac, 0xffff000050f89718, 0xffff000050f8f040, 0xffff000050f89ffc, 0xffff000050f07b68

   0xffff000050f13240: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f13244: str      x21, [sp, #0x10]
   0xffff000050f13248: mov      x29, sp
   0xffff000050f1324c: stp      x20, x19, [sp, #0x20]
   0xffff000050f13250: adrp     x8, #0xffff000051022000
   0xffff000050f13254: adrp     x9, #0xffff000051052000
   0xffff000050f13258: mov      w19, w2
   0xffff000050f1325c: mov      x20, x1
   0xffff000050f13260: mov      x21, x0
   0xffff000050f13264: ldrb     w8, [x8, #0xac8]
   0xffff000050f13268: ldr      w9, [x9, #0x498]
   0xffff000050f1326c: cmp      w8, #0
   0xffff000050f13270: ccmp     w9, #0, #4, ne
   0xffff000050f13274: b.eq     #0xffff000050f132b0
   0xffff000050f13278: adrp     x0, #0xffff000050fef000
   0xffff000050f1327c: adrp     x1, #0xffff000051052000
   0xffff000050f13280: add      x0, x0, #0x4b1
   0xffff000050f13284: add      x1, x1, #0x469
   0xffff000050f13288: mov      w2, #0x20
   0xffff000050f1328c: bl       #0xffff000050f8e73c  ; call 0xffff000050f8e73c
   0xffff000050f13290: cbz      w0, #0xffff000050f1330c
   0xffff000050f13294: adrp     x0, #0xffff000050fff000
   0xffff000050f13298: adrp     x1, #0xffff000051052000
   0xffff000050f1329c: add      x0, x0, #0x2ac
   0xffff000050f132a0: add      x1, x1, #0x469
   0xffff000050f132a4: mov      w2, #0x20
   0xffff000050f132a8: bl       #0xffff000050f8e73c  ; call 0xffff000050f8e73c
   0xffff000050f132ac: cbz      w0, #0xffff000050f1330c

loc_ffff000050f132b0:
   0xffff000050f132b0: mov      x0, x21
   0xffff000050f132b4: mov      x1, x20
   0xffff000050f132b8: mov      w2, w19
   0xffff000050f132bc: bl       #0xffff000050f13080  ; call 0xffff000050f13080
   0xffff000050f132c0: tbz      w0, #0, #0xffff000050f132d4
   0xffff000050f132c4: ldp      x20, x19, [sp, #0x20]
   0xffff000050f132c8: ldr      x21, [sp, #0x10]
   0xffff000050f132cc: ldp      x29, x30, [sp], #0x30
   0xffff000050f132d0: ret      

loc_ffff000050f132d4:
   0xffff000050f132d4: adrp     x19, #0xffff000051052000
   0xffff000050f132d8: ldr      x1, [x19, #0x490]
   0xffff000050f132dc: cbnz     x1, #0xffff000050f132f4
   0xffff000050f132e0: adrp     x0, #0xffff000050fe8000
; XREF string 0xffff000050fe8da4: 'max-download-size' -> 'max-download-size'
>> 0xffff000050f132e4: add      x0, x0, #0xda4
   0xffff000050f132e8: bl       #0xffff000050f07b00  ; call 0xffff000050f07b00
   0xffff000050f132ec: mov      x1, x0
   0xffff000050f132f0: str      x0, [x19, #0x490]

loc_ffff000050f132f4:
   0xffff000050f132f4: ldp      x20, x19, [sp, #0x20]
   0xffff000050f132f8: adrp     x0, #0xffff000050fe8000
   0xffff000050f132fc: ldr      x21, [sp, #0x10]
; XREF string 0xffff000050fe8da4: 'max-download-size' -> 'max-download-size'
>> 0xffff000050f13300: add      x0, x0, #0xda4
   0xffff000050f13304: ldp      x29, x30, [sp], #0x30
   0xffff000050f13308: b        #0xffff000050f07aa8

loc_ffff000050f1330c:
   0xffff000050f1330c: adrp     x0, #0xffff000050fd9000
   0xffff000050f13310: adrp     x1, #0xffff000050fd6000
   0xffff000050f13314: adrp     x2, #0xffff000051052000
   0xffff000050f13318: add      x0, x0, #0x53d
   0xffff000050f1331c: add      x1, x1, #0x768
   0xffff000050f13320: add      x2, x2, #0x469
   0xffff000050f13324: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f13328: ldp      x20, x19, [sp, #0x20]
   0xffff000050f1332c: adrp     x0, #0xffff000050fd4000
   0xffff000050f13330: adrp     x1, #0xffff000050ff8000
   0xffff000050f13334: ldr      x21, [sp, #0x10]
   0xffff000050f13338: add      x0, x0, #0xdba
   0xffff000050f1333c: add      x1, x1, #0x773
   0xffff000050f13340: ldp      x29, x30, [sp], #0x30
   0xffff000050f13344: b        #0xffff000050f07b68
   0xffff000050f13348: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f1334c: stp      x20, x19, [sp, #0x10]
   0xffff000050f13350: mov      x29, sp
   0xffff000050f13354: mov      x20, x0
   0xffff000050f13358: bl       #0xffff000050f895ac  ; call 0xffff000050f895ac
   0xffff000050f1335c: mov      x19, x0
   0xffff000050f13360: cbnz     x0, #0xffff000050f13374
   0xffff000050f13364: mov      x0, x20
   0xffff000050f13368: bl       #0xffff000050f894ac  ; call 0xffff000050f894ac
   0xffff000050f1336c: mov      x19, x0
   0xffff000050f13370: cbz      x0, #0xffff000050f133dc

loc_ffff000050f13374:
   0xffff000050f13374: ldr      x2, [x19, #0x20]
   0xffff000050f13378: mov      x0, x19
   0xffff000050f1337c: mov      x1, xzr
   0xffff000050f13380: bl       #0xffff000050f89718  ; call 0xffff000050f89718
   0xffff000050f13384: tbnz     x0, #0x3f, #0xffff000050f133b8
   0xffff000050f13388: ldrb     w8, [x19, #0x48]
   0xffff000050f1338c: cbnz     w8, #0xffff000050f133a4
   0xffff000050f13390: ldr      x0, [x19, #0x18]
   0xffff000050f13394: bl       #0xffff000050f8f040  ; call 0xffff000050f8f040
   0xffff000050f13398: cmp      w0, #1
   0xffff000050f1339c: b.lt     #0xffff000050f133a4
   0xffff000050f133a0: bl       #0xffff000050f89ffc  ; call 0xffff000050f89ffc

loc_ffff000050f133a4:
   0xffff000050f133a4: adrp     x0, #0xffff000050fd4000
   0xffff000050f133a8: adrp     x1, #0xffff000050ff8000
   0xffff000050f133ac: add      x0, x0, #0xdba
   0xffff000050f133b0: add      x1, x1, #0x773
   0xffff000050f133b4: b        #0xffff000050f133c8

loc_ffff000050f133b8:
   0xffff000050f133b8: adrp     x0, #0xffff000050ffa000
   0xffff000050f133bc: adrp     x1, #0xffff000050fdd000
   0xffff000050f133c0: add      x0, x0, #0x223
   0xffff000050f133c4: add      x1, x1, #0xfa7

loc_ffff000050f133c8:
   0xffff000050f133c8: bl       #0xffff000050f07b68  ; call 0xffff000050f07b68
   0xffff000050f133cc: mov      x0, x19
   0xffff000050f133d0: ldp      x20, x19, [sp, #0x10]
   0xffff000050f133d4: ldp      x29, x30, [sp], #0x20
   0xffff000050f133d8: b        #0xffff000050f89538

loc_ffff000050f133dc:
   0xffff000050f133dc: ldp      x20, x19, [sp, #0x10]
   0xffff000050f133e0: adrp     x0, #0xffff000050ffa000
   0xffff000050f133e4: adrp     x1, #0xffff000050ffd000
   0xffff000050f133e8: add      x0, x0, #0x223
   0xffff000050f133ec: add      x1, x1, #0xa7d
   0xffff000050f133f0: ldp      x29, x30, [sp], #0x20
   0xffff000050f133f4: b        #0xffff000050f07b68
   0xffff000050f133f8: ldr      w8, [x0]
   0xffff000050f133fc: mov      w9, #0xff3a
   0xffff000050f13400: movk     w9, #0xed26, lsl #16
   0xffff000050f13404: cmp      w8, w9
   0xffff000050f13408: cset     w0, eq
   0xffff000050f1340c: ret      
