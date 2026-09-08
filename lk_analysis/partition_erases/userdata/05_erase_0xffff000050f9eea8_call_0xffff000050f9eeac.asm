; partition: userdata
; operation: erase
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050fd9574 off=0xd9574 HxD=000D9574
; string text: 'userdata'
; reference mode: direct_string
; xref: 0xffff000050f9eea8 off=0x9eea8 HxD=0009EEA8
; xref instruction: add x0, x0, #0x574
; xref via: adrp/add x0
; call site: 0xffff000050f9eeac off=0x9eeac HxD=0009EEAC
; call target: 0xffff000050faf874 off=0xaf874 HxD=000AF874
; result check: 0xffff000050f9eeb0 off=0x9eeb0 HxD=0009EEB0
; failure target: 0xffff000050f9ef44 off=0x9ef44 HxD=0009EF44
; failure message: 0xffff000050fd0122 'Failed to erase userdata.'

   0xffff000050f9ee4c: adrp     x8, #0xffff000051106000
   0xffff000050f9ee50: mov      w9, #0x66cc
   0xffff000050f9ee54: ldr      w8, [x8, #0xa18]
   0xffff000050f9ee58: cmp      w8, w9
   0xffff000050f9ee5c: b.eq     #0xffff000050f9ee94
   0xffff000050f9ee60: adrp     x0, #0xffff000050fd9000
   0xffff000050f9ee64: adrp     x1, #0xffff000050ffb000
   0xffff000050f9ee68: add      x0, x0, #0x53d
   0xffff000050f9ee6c: add      x1, x1, #0x520
   0xffff000050f9ee70: b        #0xffff000050f9ee7c
   0xffff000050f9ee74: adrp     x1, #0xffff000050fe6000
   0xffff000050f9ee78: add      x1, x1, #0xd14
   0xffff000050f9ee7c: ldr      x19, [sp, #0x10]
   0xffff000050f9ee80: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ee84: b        #0xffff000050f07c4c
   0xffff000050f9ee88: ldr      x19, [sp, #0x10]
   0xffff000050f9ee8c: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ee90: ret      
   0xffff000050f9ee94: adrp     x0, #0xffff000050ff7000
   0xffff000050f9ee98: add      x0, x0, #0x689
   0xffff000050f9ee9c: bl       #0xffff000050faf874
   0xffff000050f9eea0: tbnz     x0, #0x3f, #0xffff000050f9ef30
   0xffff000050f9eea4: adrp     x0, #0xffff000050fd9000
>> 0xffff000050f9eea8: add      x0, x0, #0x574 ; XREF
>> 0xffff000050f9eeac: bl       #0xffff000050faf874 ; CALL
>> 0xffff000050f9eeb0: tbnz     x0, #0x3f, #0xffff000050f9ef44 ; CHECK
   0xffff000050f9eeb4: adrp     x0, #0xffff000050fe5000
   0xffff000050f9eeb8: add      x0, x0, #0xdd6
   0xffff000050f9eebc: bl       #0xffff000050faf874
   0xffff000050f9eec0: tbnz     x0, #0x3f, #0xffff000050f9ef58
   0xffff000050f9eec4: adrp     x0, #0xffff000050fd7000
   0xffff000050f9eec8: add      x0, x0, #0x899
   0xffff000050f9eecc: bl       #0xffff000050f25598
   0xffff000050f9eed0: cmn      w0, #1
   0xffff000050f9eed4: b.eq     #0xffff000050f9eee8
   0xffff000050f9eed8: adrp     x0, #0xffff000050fd7000
   0xffff000050f9eedc: add      x0, x0, #0x899
   0xffff000050f9eee0: bl       #0xffff000050faf874
   0xffff000050f9eee4: tbnz     x0, #0x3f, #0xffff000050f9ef6c
   0xffff000050f9eee8: mov      w0, wzr
   0xffff000050f9eeec: bl       #0xffff000050f9fd20
   0xffff000050f9eef0: mov      w0, #1
   0xffff000050f9eef4: bl       #0xffff000050f9fdbc
   0xffff000050f9eef8: adrp     x0, #0xffff000050fd9000
   0xffff000050f9eefc: adrp     x1, #0xffff000050fe3000
   0xffff000050f9ef00: add      x0, x0, #0x53d
   0xffff000050f9ef04: add      x1, x1, #0xf19
   0xffff000050f9ef08: bl       #0xffff000050f07c4c
   0xffff000050f9ef0c: adrp     x0, #0xffff000050fd4000
