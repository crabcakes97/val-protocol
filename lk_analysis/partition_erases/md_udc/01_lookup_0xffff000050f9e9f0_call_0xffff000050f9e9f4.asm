; partition: md_udc
; operation: lookup
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050fd7899 off=0xd7899 HxD=000D7899
; string text: 'md_udc'
; reference mode: direct_string
; xref: 0xffff000050f9e9f0 off=0x9e9f0 HxD=0009E9F0
; xref instruction: add x0, x0, #0x899
; xref via: adrp/add x0
; call site: 0xffff000050f9e9f4 off=0x9e9f4 HxD=0009E9F4
; call target: 0xffff000050f25598 off=0x25598 HxD=00025598
; result check: 0xffff000050f9e9f8 off=0x9e9f8 HxD=0009E9F8

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
>> 0xffff000050f9e9f0: add      x0, x0, #0x899 ; XREF
>> 0xffff000050f9e9f4: bl       #0xffff000050f25598 ; CALL
>> 0xffff000050f9e9f8: cmn      w0, #1 ; CHECK
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
