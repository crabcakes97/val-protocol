; partition: md_udc
; operation: lookup
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050fd7899 off=0xd7899 HxD=000D7899
; string text: 'md_udc'
; reference mode: direct_string
; xref: 0xffff000050f9ebd8 off=0x9ebd8 HxD=0009EBD8
; xref instruction: add x0, x0, #0x899
; xref via: adrp/add x0
; call site: 0xffff000050f9ebdc off=0x9ebdc HxD=0009EBDC
; call target: 0xffff000050f25598 off=0x25598 HxD=00025598
; result check: 0xffff000050f9ebe0 off=0x9ebe0 HxD=0009EBE0

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
>> 0xffff000050f9ebd8: add      x0, x0, #0x899 ; XREF
>> 0xffff000050f9ebdc: bl       #0xffff000050f25598 ; CALL
>> 0xffff000050f9ebe0: cmn      w0, #1 ; CHECK
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
