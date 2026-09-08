; candidate function around xref 0xffff000050f9eb6c to 'metadata'
; estimated range 0xffff000050f9eaec-0xffff000050f9ec58

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
>> 0xffff000050f9eb6c: add      x0, x0, #0x689
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
