; partition: nvdata
; operation: erase
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050fe5dd6 off=0xe5dd6 HxD=000E5DD6
; string text: 'nvdata'
; reference mode: direct_string
; xref: 0xffff000050f9ebc8 off=0x9ebc8 HxD=0009EBC8
; xref instruction: add x0, x0, #0xdd6
; xref via: adrp/add x0
; call site: 0xffff000050f9ebcc off=0x9ebcc HxD=0009EBCC
; call target: 0xffff000050faf874 off=0xaf874 HxD=000AF874
; result check: 0xffff000050f9ebd0 off=0x9ebd0 HxD=0009EBD0
; failure target: 0xffff000050f9ec8c off=0x9ec8c HxD=0009EC8C
; failure message: 0xffff000050fdd6b3 'Failed to erase nvdata'

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
>> 0xffff000050f9ebc8: add      x0, x0, #0xdd6 ; XREF
>> 0xffff000050f9ebcc: bl       #0xffff000050faf874 ; CALL
>> 0xffff000050f9ebd0: tbnz     x0, #0x3f, #0xffff000050f9ec8c ; CHECK
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
