; candidate function around xref 0xffff000050f9ea80 to 'Code validation failure'
; estimated range 0xffff000050f9e82c-0xffff000050f9ec58

   0xffff000050f9e82c: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f9e830: str      x21, [sp, #0x10]
   0xffff000050f9e834: mov      x29, sp
   0xffff000050f9e838: stp      x20, x19, [sp, #0x20]
   0xffff000050f9e83c: adrp     x20, #0xffff000051106000
   0xffff000050f9e840: mov      x19, x0
   0xffff000050f9e844: mov      w9, #0x77ed
   0xffff000050f9e848: ldr      w8, [x20, #0xa14]
   0xffff000050f9e84c: cmp      w8, w9
   0xffff000050f9e850: b.gt     #0xffff000050f9e878
   0xffff000050f9e854: cbz      w8, #0xffff000050f9e8a4
   0xffff000050f9e858: mov      w9, #0x7070
   0xffff000050f9e85c: cmp      w8, w9
   0xffff000050f9e860: b.ne     #0xffff000050f9e94c
   0xffff000050f9e864: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e868: adrp     x1, #0xffff000050ff6000
   0xffff000050f9e86c: add      x0, x0, #0x53d
   0xffff000050f9e870: add      x1, x1, #0xc8d
   0xffff000050f9e874: b        #0xffff000050f9e95c
   0xffff000050f9e878: mov      w9, #0x88ff
   0xffff000050f9e87c: cmp      w8, w9
   0xffff000050f9e880: b.eq     #0xffff000050f9e8a4
   0xffff000050f9e884: mov      w9, #0x77ee
   0xffff000050f9e888: cmp      w8, w9
   0xffff000050f9e88c: b.ne     #0xffff000050f9e94c
   0xffff000050f9e890: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e894: adrp     x1, #0xffff000050fd9000
   0xffff000050f9e898: add      x0, x0, #0x53d
   0xffff000050f9e89c: add      x1, x1, #0xc
   0xffff000050f9e8a0: b        #0xffff000050f9e95c
   0xffff000050f9e8a4: bl       #0xffff000050f9ffc0
   0xffff000050f9e8a8: adrp     x21, #0xffff000051106000
   0xffff000050f9e8ac: tbz      w0, #0, #0xffff000050f9e900
   0xffff000050f9e8b0: mov      w0, wzr
   0xffff000050f9e8b4: bl       #0xffff000050f903ec
   0xffff000050f9e8b8: cmp      w0, #0xff
   0xffff000050f9e8bc: b.eq     #0xffff000050f9e900
   0xffff000050f9e8c0: adrp     x8, #0xffff000051106000
   0xffff000050f9e8c4: ldrb     w8, [x8, #0xa10]
   0xffff000050f9e8c8: tbnz     w8, #0, #0xffff000050f9e900
   0xffff000050f9e8cc: ldr      w8, [x20, #0xa14]
   0xffff000050f9e8d0: mov      w9, #0x7070
   0xffff000050f9e8d4: cmp      w8, w9
   0xffff000050f9e8d8: b.eq     #0xffff000050f9e900
   0xffff000050f9e8dc: ldr      w8, [x21, #0xa18]
   0xffff000050f9e8e0: mov      w9, #0x66cc
   0xffff000050f9e8e4: cmp      w8, w9
   0xffff000050f9e8e8: b.eq     #0xffff000050f9e900
   0xffff000050f9e8ec: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e8f0: adrp     x1, #0xffff000050fd6000
   0xffff000050f9e8f4: add      x0, x0, #0x53d
   0xffff000050f9e8f8: add      x1, x1, #0x125
   0xffff000050f9e8fc: b        #0xffff000050f9e95c
   0xffff000050f9e900: ldr      w8, [x20, #0xa14]
   0xffff000050f9e904: mov      w9, #0x7070
   0xffff000050f9e908: cmp      w8, w9
   0xffff000050f9e90c: b.eq     #0xffff000050f9e978
   0xffff000050f9e910: ldr      w8, [x21, #0xa18]
   0xffff000050f9e914: mov      w9, #0x66cc
   0xffff000050f9e918: cmp      w8, w9
   0xffff000050f9e91c: b.eq     #0xffff000050f9e978
   0xffff000050f9e920: cbz      x19, #0xffff000050f9e938
   0xffff000050f9e924: mov      x0, x19
   0xffff000050f9e928: mov      w1, #0x15
   0xffff000050f9e92c: bl       #0xffff000050f8e7d4
   0xffff000050f9e930: cmp      x0, #0x15
   0xffff000050f9e934: b.lo     #0xffff000050f9e96c
   0xffff000050f9e938: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e93c: adrp     x1, #0xffff000050fd3000
   0xffff000050f9e940: add      x0, x0, #0x53d
   0xffff000050f9e944: add      x1, x1, #0xc2
   0xffff000050f9e948: b        #0xffff000050f9e95c
   0xffff000050f9e94c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e950: adrp     x1, #0xffff000050fe0000
   0xffff000050f9e954: add      x0, x0, #0x53d
   0xffff000050f9e958: add      x1, x1, #0xb1c
   0xffff000050f9e95c: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9e960: ldr      x21, [sp, #0x10]
   0xffff000050f9e964: ldp      x29, x30, [sp], #0x30
   0xffff000050f9e968: b        #0xffff000050f07c4c
   0xffff000050f9e96c: mov      x0, x19
   0xffff000050f9e970: bl       #0xffff000050f9014c
   0xffff000050f9e974: tbz      w0, #0, #0xffff000050f9ea74
   0xffff000050f9e978: bl       #0xffff000050f21804
   0xffff000050f9e97c: tbz      w0, #0, #0xffff000050f9ea64
   0xffff000050f9e980: adrp     x0, #0xffff000050ff7000
   0xffff000050f9e984: add      x0, x0, #0x689
   0xffff000050f9e988: bl       #0xffff000050f25598
   0xffff000050f9e98c: cmn      w0, #1
   0xffff000050f9e990: b.eq     #0xffff000050f9e9a4
   0xffff000050f9e994: adrp     x0, #0xffff000050ff7000
   0xffff000050f9e998: add      x0, x0, #0x689
   0xffff000050f9e99c: bl       #0xffff000050faf874
   0xffff000050f9e9a0: tbnz     x0, #0x3f, #0xffff000050f9ea88
   0xffff000050f9e9a4: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e9a8: add      x0, x0, #0x574
   0xffff000050f9e9ac: bl       #0xffff000050f25598
   0xffff000050f9e9b0: cmn      w0, #1
   0xffff000050f9e9b4: b.eq     #0xffff000050f9e9c8
   0xffff000050f9e9b8: adrp     x0, #0xffff000050fd9000
   0xffff000050f9e9bc: add      x0, x0, #0x574
   0xffff000050f9e9c0: bl       #0xffff000050faf874
   0xffff000050f9e9c4: tbnz     x0, #0x3f, #0xffff000050f9ea9c
   0xffff000050f9e9c8: adrp     x0, #0xffff000050fe5000
   0xffff000050f9e9cc: add      x0, x0, #0xdd6
   0xffff000050f9e9d0: bl       #0xffff000050f25598
   0xffff000050f9e9d4: cmn      w0, #1
   0xffff000050f9e9d8: b.eq     #0xffff000050f9e9ec
   0xffff000050f9e9dc: adrp     x0, #0xffff000050fe5000
   0xffff000050f9e9e0: add      x0, x0, #0xdd6
   0xffff000050f9e9e4: bl       #0xffff000050faf874
   0xffff000050f9e9e8: tbnz     x0, #0x3f, #0xffff000050f9eac4
   0xffff000050f9e9ec: adrp     x0, #0xffff000050fd7000
   0xffff000050f9e9f0: add      x0, x0, #0x899
   0xffff000050f9e9f4: bl       #0xffff000050f25598
   0xffff000050f9e9f8: cmn      w0, #1
   0xffff000050f9e9fc: b.eq     #0xffff000050f9ea10
   0xffff000050f9ea00: adrp     x0, #0xffff000050fd7000
   0xffff000050f9ea04: add      x0, x0, #0x899
   0xffff000050f9ea08: bl       #0xffff000050faf874
   0xffff000050f9ea0c: tbnz     x0, #0x3f, #0xffff000050f9ead8
   0xffff000050f9ea10: bl       #0xffff000050fa0880
   0xffff000050f9ea14: tbz      w0, #0, #0xffff000050f9eab0
   0xffff000050f9ea18: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ea1c: adrp     x1, #0xffff000050fd9000
   0xffff000050f9ea20: add      x0, x0, #0x53d
   0xffff000050f9ea24: add      x1, x1, #0x1d
   0xffff000050f9ea28: bl       #0xffff000050f07c4c
   0xffff000050f9ea2c: mov      w0, wzr
   0xffff000050f9ea30: bl       #0xffff000050f9fd20
   0xffff000050f9ea34: mov      w0, #1
   0xffff000050f9ea38: bl       #0xffff000050f9fdbc
   0xffff000050f9ea3c: adrp     x0, #0xffff000050fd4000
   0xffff000050f9ea40: adrp     x1, #0xffff000050ff8000
   0xffff000050f9ea44: add      x0, x0, #0xdba
   0xffff000050f9ea48: add      x1, x1, #0x773
   0xffff000050f9ea4c: bl       #0xffff000050f07b68
   0xffff000050f9ea50: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9ea54: mov      w0, #1
   0xffff000050f9ea58: ldr      x21, [sp, #0x10]
   0xffff000050f9ea5c: ldp      x29, x30, [sp], #0x30
   0xffff000050f9ea60: b        #0xffff000050f03174
   0xffff000050f9ea64: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9ea68: ldr      x21, [sp, #0x10]
   0xffff000050f9ea6c: ldp      x29, x30, [sp], #0x30
   0xffff000050f9ea70: ret      
   0xffff000050f9ea74: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ea78: adrp     x1, #0xffff000050fd7000
   0xffff000050f9ea7c: add      x0, x0, #0x53d
>> 0xffff000050f9ea80: add      x1, x1, #0x87f
   0xffff000050f9ea84: b        #0xffff000050f9e95c
   0xffff000050f9ea88: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ea8c: adrp     x1, #0xffff000050fd6000
   0xffff000050f9ea90: add      x0, x0, #0x53d
   0xffff000050f9ea94: add      x1, x1, #0x166
   0xffff000050f9ea98: b        #0xffff000050f9e95c
   0xffff000050f9ea9c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eaa0: adrp     x1, #0xffff000050fda000
   0xffff000050f9eaa4: add      x0, x0, #0x53d
   0xffff000050f9eaa8: add      x1, x1, #0x3e5
   0xffff000050f9eaac: b        #0xffff000050f9e95c
   0xffff000050f9eab0: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eab4: adrp     x1, #0xffff000050feb000
   0xffff000050f9eab8: add      x0, x0, #0x53d
   0xffff000050f9eabc: add      x1, x1, #0xd52
   0xffff000050f9eac0: b        #0xffff000050f9e95c
   0xffff000050f9eac4: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eac8: adrp     x1, #0xffff000050fdd000
   0xffff000050f9eacc: add      x0, x0, #0x53d
   0xffff000050f9ead0: add      x1, x1, #0x6b3
   0xffff000050f9ead4: b        #0xffff000050f9e95c
   0xffff000050f9ead8: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eadc: adrp     x1, #0xffff000050fdf000
   0xffff000050f9eae0: add      x0, x0, #0x53d
   0xffff000050f9eae4: add      x1, x1, #0x312
   0xffff000050f9eae8: b        #0xffff000050f9e95c
   0xffff000050f9eaec: stp      x29, x30, [sp, #-0x10]!
   0xffff000050f9eaf0: mov      x29, sp
   0xffff000050f9eaf4: adrp     x8, #0xffff000051106000
   0xffff000050f9eaf8: mov      w9, #0x77ed
   0xffff000050f9eafc: ldr      w8, [x8, #0xa14]
   0xffff000050f9eb00: cmp      w8, w9
   0xffff000050f9eb04: b.gt     #0xffff000050f9eb30
   0xffff000050f9eb08: cbz      w8, #0xffff000050f9eb48
   0xffff000050f9eb0c: mov      w9, #0x7070
   0xffff000050f9eb10: cmp      w8, w9
   0xffff000050f9eb14: b.ne     #0xffff000050f9ec3c
   0xffff000050f9eb18: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eb1c: adrp     x1, #0xffff000050ff6000
   0xffff000050f9eb20: add      x0, x0, #0x53d
   0xffff000050f9eb24: add      x1, x1, #0xc8d
   0xffff000050f9eb28: ldp      x29, x30, [sp], #0x10
   0xffff000050f9eb2c: b        #0xffff000050f07c4c
   0xffff000050f9eb30: mov      w9, #0x77ee
   0xffff000050f9eb34: cmp      w8, w9
   0xffff000050f9eb38: b.eq     #0xffff000050f9eb60
   0xffff000050f9eb3c: mov      w9, #0x88ff
   0xffff000050f9eb40: cmp      w8, w9
   0xffff000050f9eb44: b.ne     #0xffff000050f9ec3c
   0xffff000050f9eb48: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eb4c: adrp     x1, #0xffff000050ffb000
   0xffff000050f9eb50: add      x0, x0, #0x53d
   0xffff000050f9eb54: add      x1, x1, #0x511
   0xffff000050f9eb58: ldp      x29, x30, [sp], #0x10
   0xffff000050f9eb5c: b        #0xffff000050f07c4c
   0xffff000050f9eb60: bl       #0xffff000050f21888
   0xffff000050f9eb64: tbz      w0, #0, #0xffff000050f9ec54
   0xffff000050f9eb68: adrp     x0, #0xffff000050ff7000
   0xffff000050f9eb6c: add      x0, x0, #0x689
   0xffff000050f9eb70: bl       #0xffff000050f25598
   0xffff000050f9eb74: cmn      w0, #1
   0xffff000050f9eb78: b.eq     #0xffff000050f9eb8c
   0xffff000050f9eb7c: adrp     x0, #0xffff000050ff7000
   0xffff000050f9eb80: add      x0, x0, #0x689
   0xffff000050f9eb84: bl       #0xffff000050faf874
   0xffff000050f9eb88: tbnz     x0, #0x3f, #0xffff000050f9ec5c
   0xffff000050f9eb8c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eb90: add      x0, x0, #0x574
   0xffff000050f9eb94: bl       #0xffff000050f25598
   0xffff000050f9eb98: cmn      w0, #1
   0xffff000050f9eb9c: b.eq     #0xffff000050f9ebb0
   0xffff000050f9eba0: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eba4: add      x0, x0, #0x574
   0xffff000050f9eba8: bl       #0xffff000050faf874
   0xffff000050f9ebac: tbnz     x0, #0x3f, #0xffff000050f9ec74
   0xffff000050f9ebb0: adrp     x0, #0xffff000050fe5000
   0xffff000050f9ebb4: add      x0, x0, #0xdd6
   0xffff000050f9ebb8: bl       #0xffff000050f25598
   0xffff000050f9ebbc: cmn      w0, #1
   0xffff000050f9ebc0: b.eq     #0xffff000050f9ebd4
   0xffff000050f9ebc4: adrp     x0, #0xffff000050fe5000
   0xffff000050f9ebc8: add      x0, x0, #0xdd6
   0xffff000050f9ebcc: bl       #0xffff000050faf874
   0xffff000050f9ebd0: tbnz     x0, #0x3f, #0xffff000050f9ec8c
   0xffff000050f9ebd4: adrp     x0, #0xffff000050fd7000
   0xffff000050f9ebd8: add      x0, x0, #0x899
   0xffff000050f9ebdc: bl       #0xffff000050f25598
   0xffff000050f9ebe0: cmn      w0, #1
   0xffff000050f9ebe4: b.eq     #0xffff000050f9ebf8
   0xffff000050f9ebe8: adrp     x0, #0xffff000050fd7000
   0xffff000050f9ebec: add      x0, x0, #0x899
   0xffff000050f9ebf0: bl       #0xffff000050faf874
   0xffff000050f9ebf4: tbnz     x0, #0x3f, #0xffff000050f9eca4
   0xffff000050f9ebf8: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ebfc: adrp     x1, #0xffff000050ff1000
   0xffff000050f9ec00: add      x0, x0, #0x53d
   0xffff000050f9ec04: add      x1, x1, #0xfc1
   0xffff000050f9ec08: bl       #0xffff000050f07c4c
   0xffff000050f9ec0c: mov      w0, #1
   0xffff000050f9ec10: bl       #0xffff000050f9fd20
   0xffff000050f9ec14: mov      w0, wzr
   0xffff000050f9ec18: bl       #0xffff000050f9fdbc
   0xffff000050f9ec1c: adrp     x0, #0xffff000050fd4000
   0xffff000050f9ec20: adrp     x1, #0xffff000050ff8000
   0xffff000050f9ec24: add      x0, x0, #0xdba
   0xffff000050f9ec28: add      x1, x1, #0x773
   0xffff000050f9ec2c: bl       #0xffff000050f07b68
   0xffff000050f9ec30: mov      w0, #1
   0xffff000050f9ec34: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec38: b        #0xffff000050f03174
   0xffff000050f9ec3c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ec40: adrp     x1, #0xffff000050ffe000
   0xffff000050f9ec44: add      x0, x0, #0x53d
   0xffff000050f9ec48: add      x1, x1, #0x9e7
   0xffff000050f9ec4c: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec50: b        #0xffff000050f07c4c
   0xffff000050f9ec54: ldp      x29, x30, [sp], #0x10
   0xffff000050f9ec58: ret      
