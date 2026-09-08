; partition: metadata
; operation: erase
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050ff7689 off=0xf7689 HxD=000F7689
; string text: 'metadata'
; reference mode: direct_string
; xref: 0xffff000050f9eb80 off=0x9eb80 HxD=0009EB80
; xref instruction: add x0, x0, #0x689
; xref via: adrp/add x0
; call site: 0xffff000050f9eb84 off=0x9eb84 HxD=0009EB84
; call target: 0xffff000050faf874 off=0xaf874 HxD=000AF874
; result check: 0xffff000050f9eb88 off=0x9eb88 HxD=0009EB88
; failure target: 0xffff000050f9ec5c off=0x9ec5c HxD=0009EC5C
; failure message: 0xffff000050fd6166 'Failed to erase metadata.'

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
>> 0xffff000050f9eb80: add      x0, x0, #0x689 ; XREF
>> 0xffff000050f9eb84: bl       #0xffff000050faf874 ; CALL
>> 0xffff000050f9eb88: tbnz     x0, #0x3f, #0xffff000050f9ec5c ; CHECK
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
