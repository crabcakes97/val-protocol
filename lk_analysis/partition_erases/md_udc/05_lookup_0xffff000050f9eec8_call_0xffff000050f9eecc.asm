; partition: md_udc
; operation: lookup
; flow start: 0xffff000050f9e82c off=0x9e82c HxD=0009E82C
; string VA: 0xffff000050fd7899 off=0xd7899 HxD=000D7899
; string text: 'md_udc'
; reference mode: direct_string
; xref: 0xffff000050f9eec8 off=0x9eec8 HxD=0009EEC8
; xref instruction: add x0, x0, #0x899
; xref via: adrp/add x0
; call site: 0xffff000050f9eecc off=0x9eecc HxD=0009EECC
; call target: 0xffff000050f25598 off=0x25598 HxD=00025598
; result check: 0xffff000050f9eed0 off=0x9eed0 HxD=0009EED0

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
   0xffff000050f9eea8: add      x0, x0, #0x574
   0xffff000050f9eeac: bl       #0xffff000050faf874
   0xffff000050f9eeb0: tbnz     x0, #0x3f, #0xffff000050f9ef44
   0xffff000050f9eeb4: adrp     x0, #0xffff000050fe5000
   0xffff000050f9eeb8: add      x0, x0, #0xdd6
   0xffff000050f9eebc: bl       #0xffff000050faf874
   0xffff000050f9eec0: tbnz     x0, #0x3f, #0xffff000050f9ef58
   0xffff000050f9eec4: adrp     x0, #0xffff000050fd7000
>> 0xffff000050f9eec8: add      x0, x0, #0x899 ; XREF
>> 0xffff000050f9eecc: bl       #0xffff000050f25598 ; CALL
>> 0xffff000050f9eed0: cmn      w0, #1 ; CHECK
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
   0xffff000050f9ef10: adrp     x1, #0xffff000050ff8000
   0xffff000050f9ef14: add      x0, x0, #0xdba
   0xffff000050f9ef18: add      x1, x1, #0x773
   0xffff000050f9ef1c: bl       #0xffff000050f07b68
   0xffff000050f9ef20: ldr      x19, [sp, #0x10]
   0xffff000050f9ef24: mov      w0, #1
   0xffff000050f9ef28: ldp      x29, x30, [sp], #0x20
   0xffff000050f9ef2c: b        #0xffff000050f03174
