; flow candidate 0xffff000050f09f38-0xffff000050f0a060
; score: 30
; matched targets: avb_custom_key, cache, debug_token, userdata
; calls: 0xffff000050f8e3ec, 0xffff000050f29978, 0xffff000050f0a500, 0xffff000050f8b044, 0xffff000050f07c4c, 0xffff000050f9ceac, 0xffff000050f9f0f8, 0xffff000050f13348

   0xffff000050f09f38: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f09f3c: stp      x22, x21, [sp, #0x10]
   0xffff000050f09f40: mov      x29, sp
   0xffff000050f09f44: stp      x20, x19, [sp, #0x20]
   0xffff000050f09f48: ldr      x8, [x0, #0x10]
   0xffff000050f09f4c: adrp     x1, #0xffff000050fd3000
   0xffff000050f09f50: mov      x21, x0
   0xffff000050f09f54: ldr      x20, [x0]
   0xffff000050f09f58: ldr      w19, [x0, #0xc]
; XREF string 0xffff000050fd35ba: 'avb_custom_key' -> 'avb_custom_key'
>> 0xffff000050f09f5c: add      x1, x1, #0x5ba
   0xffff000050f09f60: add      x22, x8, #1
   0xffff000050f09f64: mov      x0, x22
   0xffff000050f09f68: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f09f6c: cbz      w0, #0xffff000050f09ff4
   0xffff000050f09f70: adrp     x1, #0xffff000050ffb000
   0xffff000050f09f74: mov      x0, x22
; XREF string 0xffff000050ffbc48: 'debug_token' -> 'debug_token'
>> 0xffff000050f09f78: add      x1, x1, #0xc48
   0xffff000050f09f7c: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f09f80: cbz      w0, #0xffff000050f0a010
   0xffff000050f09f84: adrp     x1, #0xffff000050fe5000
   0xffff000050f09f88: mov      x0, x22
; XREF string 0xffff000050fe5b62: 'cache' -> 'cache'
>> 0xffff000050f09f8c: add      x1, x1, #0xb62
   0xffff000050f09f90: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f09f94: cbz      w0, #0xffff000050f0a020
   0xffff000050f09f98: adrp     x1, #0xffff000050fd9000
   0xffff000050f09f9c: mov      x0, x22
; XREF string 0xffff000050fd9574: 'userdata' -> 'userdata'
>> 0xffff000050f09fa0: add      x1, x1, #0x574
   0xffff000050f09fa4: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f09fa8: cbnz     w0, #0xffff000050f09fc8
   0xffff000050f09fac: adrp     x1, #0xffff000050fda000
   0xffff000050f09fb0: mov      w0, #1
; XREF string 0xffff000050fda9a1: 'userdata' -> 'clear ship_dirty flag during erasing userdata partition\n'
>> 0xffff000050f09fb4: add      x1, x1, #0x9a1
   0xffff000050f09fb8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f09fbc: adrp     x0, #0xffff000050ffd000
   0xffff000050f09fc0: add      x0, x0, #0x800
   0xffff000050f09fc4: bl       #0xffff000050f0a500  ; call 0xffff000050f0a500

loc_ffff000050f09fc8:
   0xffff000050f09fc8: mov      x0, x22
   0xffff000050f09fcc: bl       #0xffff000050f8b044  ; call 0xffff000050f8b044
   0xffff000050f09fd0: cmn      w0, #1
   0xffff000050f09fd4: b.eq     #0xffff000050f0a038
   0xffff000050f09fd8: adrp     x0, #0xffff000050fd9000
   0xffff000050f09fdc: adrp     x1, #0xffff000050fd3000
   0xffff000050f09fe0: add      x0, x0, #0x53d
   0xffff000050f09fe4: add      x1, x1, #0x5c9
   0xffff000050f09fe8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f09fec: mov      w19, #3
   0xffff000050f09ff0: b        #0xffff000050f0a050

loc_ffff000050f09ff4:
   0xffff000050f09ff4: mov      x0, x20
   0xffff000050f09ff8: mov      w1, w19
   0xffff000050f09ffc: bl       #0xffff000050f9ceac  ; call 0xffff000050f9ceac
   0xffff000050f0a000: mov      w8, #3
   0xffff000050f0a004: tst      w0, #1
   0xffff000050f0a008: csinc    w19, w8, wzr, eq
   0xffff000050f0a00c: b        #0xffff000050f0a050

loc_ffff000050f0a010:
   0xffff000050f0a010: mov      x0, xzr
   0xffff000050f0a014: mov      w1, wzr
   0xffff000050f0a018: bl       #0xffff000050f9f0f8  ; call 0xffff000050f9f0f8
   0xffff000050f0a01c: b        #0xffff000050f0a04c

loc_ffff000050f0a020:
   0xffff000050f0a020: adrp     x1, #0xffff000050fed000
   0xffff000050f0a024: mov      w0, #1
   0xffff000050f0a028: add      x1, x1, #0xc61
   0xffff000050f0a02c: mov      w19, #1
   0xffff000050f0a030: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f0a034: b        #0xffff000050f0a050

loc_ffff000050f0a038:
   0xffff000050f0a038: ldr      x8, [x21, #0x10]
   0xffff000050f0a03c: mov      x1, x20
   0xffff000050f0a040: mov      w2, w19
   0xffff000050f0a044: add      x0, x8, #1
   0xffff000050f0a048: bl       #0xffff000050f13348  ; call 0xffff000050f13348

loc_ffff000050f0a04c:
   0xffff000050f0a04c: mov      w19, #1

loc_ffff000050f0a050:
   0xffff000050f0a050: mov      w0, w19
   0xffff000050f0a054: ldp      x20, x19, [sp, #0x20]
   0xffff000050f0a058: ldp      x22, x21, [sp, #0x10]
   0xffff000050f0a05c: ldp      x29, x30, [sp], #0x30
   0xffff000050f0a060: ret      
