; partition: userdata
; operation: erase
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050fd9574 off=0xd9574 HxD=000D9574
; string text: 'userdata'
; reference mode: direct_string
; xref: 0xffff000050f9e9bc off=0x9e9bc HxD=0009E9BC
; xref instruction: add x0, x0, #0x574
; xref via: adrp/add x0
; call site: 0xffff000050f9e9c0 off=0x9e9c0 HxD=0009E9C0
; call target: 0xffff000050faf874 off=0xaf874 HxD=000AF874
; result check: 0xffff000050f9e9c4 off=0x9e9c4 HxD=0009E9C4
; failure target: 0xffff000050f9ea9c off=0x9ea9c HxD=0009EA9C
; failure message: 0xffff000050fda3e5 'Failed to erase userdata'

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
>> 0xffff000050f9e9bc: add      x0, x0, #0x574 ; XREF
>> 0xffff000050f9e9c0: bl       #0xffff000050faf874 ; CALL
>> 0xffff000050f9e9c4: tbnz     x0, #0x3f, #0xffff000050f9ea9c ; CHECK
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
