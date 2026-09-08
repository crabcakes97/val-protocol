; flow candidate 0xffff000050f9d010-0xffff000050f9d2a8
; score: 12
; matched targets: avb_custom_key, debug_token
; calls: 0xffff000050f9d984, 0xffff000050f8e3ec, 0xffff000050f8e6fc, 0xffff000050f9c068, 0xffff000050f9c2c8, 0xffff000050f9d6cc, 0xffff000050f9d910, 0xffff000050f9d99c, 0xffff000050f9c090, 0xffff000050f9c0b8, 0xffff000050f07c4c, 0xffff000050f9c004, 0xffff000050f9d3c0, 0xffff000050f133f8, 0xffff000050f25598, 0xffff000050f256e8

   0xffff000050f9d010: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f9d014: str      x21, [sp, #0x10]
   0xffff000050f9d018: mov      x29, sp
   0xffff000050f9d01c: stp      x20, x19, [sp, #0x20]
   0xffff000050f9d020: mov      w19, w2
   0xffff000050f9d024: mov      x20, x1
   0xffff000050f9d028: mov      x21, x0
   0xffff000050f9d02c: bl       #0xffff000050f9d984  ; call 0xffff000050f9d984
   0xffff000050f9d030: tbz      w0, #0, #0xffff000050f9d294
   0xffff000050f9d034: adrp     x1, #0xffff000050ff4000
   0xffff000050f9d038: mov      x0, x21
   0xffff000050f9d03c: add      x1, x1, #0x18
   0xffff000050f9d040: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9d044: cbz      w0, #0xffff000050f9d0ec
   0xffff000050f9d048: adrp     x1, #0xffff000050fd4000
   0xffff000050f9d04c: mov      x0, x21
   0xffff000050f9d050: add      x1, x1, #0xe2b
   0xffff000050f9d054: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9d058: cbz      w0, #0xffff000050f9d294
   0xffff000050f9d05c: adrp     x1, #0xffff000050fd4000
   0xffff000050f9d060: mov      x0, x21
   0xffff000050f9d064: add      x1, x1, #0xe34
   0xffff000050f9d068: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9d06c: cbz      w0, #0xffff000050f9d294
   0xffff000050f9d070: adrp     x1, #0xffff000050ffb000
   0xffff000050f9d074: mov      x0, x21
; XREF string 0xffff000050ffbc48: 'debug_token' -> 'debug_token'
>> 0xffff000050f9d078: add      x1, x1, #0xc48
   0xffff000050f9d07c: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9d080: cbz      w0, #0xffff000050f9d294
   0xffff000050f9d084: adrp     x1, #0xffff000050ff3000
   0xffff000050f9d088: mov      x0, x21
   0xffff000050f9d08c: add      x1, x1, #0x9ef
   0xffff000050f9d090: mov      w2, #7
   0xffff000050f9d094: bl       #0xffff000050f8e6fc  ; call 0xffff000050f8e6fc
   0xffff000050f9d098: cbz      w0, #0xffff000050f9d108
   0xffff000050f9d09c: adrp     x1, #0xffff000050ff5000
   0xffff000050f9d0a0: mov      x0, x21
   0xffff000050f9d0a4: add      x1, x1, #0xcdd
   0xffff000050f9d0a8: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9d0ac: cbz      w0, #0xffff000050f9d128
   0xffff000050f9d0b0: adrp     x1, #0xffff000050fd3000
   0xffff000050f9d0b4: mov      x0, x21
; XREF string 0xffff000050fd35ba: 'avb_custom_key' -> 'avb_custom_key'
>> 0xffff000050f9d0b8: add      x1, x1, #0x5ba
   0xffff000050f9d0bc: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f9d0c0: cbz      w0, #0xffff000050f9d140
   0xffff000050f9d0c4: mov      x0, x21
   0xffff000050f9d0c8: bl       #0xffff000050f9c068  ; call 0xffff000050f9c068
   0xffff000050f9d0cc: tbz      w0, #0, #0xffff000050f9d164
   0xffff000050f9d0d0: mov      x0, x20
   0xffff000050f9d0d4: mov      w1, w19
   0xffff000050f9d0d8: bl       #0xffff000050f9c2c8  ; call 0xffff000050f9c2c8
   0xffff000050f9d0dc: adrp     x8, #0xffff000051106000
   0xffff000050f9d0e0: and      w9, w0, #1
   0xffff000050f9d0e4: strb     w9, [x8, #0xa08]
   0xffff000050f9d0e8: b        #0xffff000050f9d298

loc_ffff000050f9d0ec:
   0xffff000050f9d0ec: mov      x0, x20
   0xffff000050f9d0f0: mov      w1, w19
   0xffff000050f9d0f4: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9d0f8: mov      w2, wzr
   0xffff000050f9d0fc: ldr      x21, [sp, #0x10]
   0xffff000050f9d100: ldp      x29, x30, [sp], #0x30
   0xffff000050f9d104: b        #0xffff000050f9bcc0

loc_ffff000050f9d108:
   0xffff000050f9d108: bl       #0xffff000050f9d6cc  ; call 0xffff000050f9d6cc
   0xffff000050f9d10c: tbnz     w0, #0, #0xffff000050f9d294
   0xffff000050f9d110: mov      x0, x20
   0xffff000050f9d114: mov      w1, w19
   0xffff000050f9d118: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9d11c: ldr      x21, [sp, #0x10]
   0xffff000050f9d120: ldp      x29, x30, [sp], #0x30
   0xffff000050f9d124: b        #0xffff000050f9bf30

loc_ffff000050f9d128:
   0xffff000050f9d128: mov      x0, x20
   0xffff000050f9d12c: mov      w1, w19
   0xffff000050f9d130: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9d134: ldr      x21, [sp, #0x10]
   0xffff000050f9d138: ldp      x29, x30, [sp], #0x30
   0xffff000050f9d13c: b        #0xffff000050f8f4e4

loc_ffff000050f9d140:
   0xffff000050f9d140: bl       #0xffff000050f9d910  ; call 0xffff000050f9d910
   0xffff000050f9d144: tbnz     w0, #0, #0xffff000050f9d294
   0xffff000050f9d148: bl       #0xffff000050f9d99c  ; call 0xffff000050f9d99c
   0xffff000050f9d14c: tbnz     w0, #0, #0xffff000050f9d294
   0xffff000050f9d150: adrp     x0, #0xffff000050fd9000
   0xffff000050f9d154: adrp     x1, #0xffff000050fdd000
   0xffff000050f9d158: add      x0, x0, #0x53d
   0xffff000050f9d15c: add      x1, x1, #0x5df
   0xffff000050f9d160: b        #0xffff000050f9d1f4

loc_ffff000050f9d164:
   0xffff000050f9d164: mov      x0, x21
   0xffff000050f9d168: bl       #0xffff000050f9c090  ; call 0xffff000050f9c090
   0xffff000050f9d16c: tbz      w0, #0, #0xffff000050f9d18c
   0xffff000050f9d170: mov      x0, x20
   0xffff000050f9d174: mov      w1, w19
   0xffff000050f9d178: bl       #0xffff000050f9c2c8  ; call 0xffff000050f9c2c8
   0xffff000050f9d17c: adrp     x8, #0xffff000051106000
   0xffff000050f9d180: and      w9, w0, #1
   0xffff000050f9d184: strb     w9, [x8, #0xa0c]
   0xffff000050f9d188: b        #0xffff000050f9d298

loc_ffff000050f9d18c:
   0xffff000050f9d18c: mov      x0, x21
   0xffff000050f9d190: bl       #0xffff000050f9c0b8  ; call 0xffff000050f9c0b8
   0xffff000050f9d194: tbz      w0, #0, #0xffff000050f9d200
   0xffff000050f9d198: adrp     x8, #0xffff000051106000
   0xffff000050f9d19c: ldrb     w8, [x8, #0xa08]
   0xffff000050f9d1a0: cbz      w8, #0xffff000050f9d1b0
   0xffff000050f9d1a4: adrp     x8, #0xffff000051106000
   0xffff000050f9d1a8: ldrb     w8, [x8, #0xa0c]
   0xffff000050f9d1ac: cbnz     w8, #0xffff000050f9d294

loc_ffff000050f9d1b0:
   0xffff000050f9d1b0: adrp     x19, #0xffff000050fd9000
   0xffff000050f9d1b4: adrp     x20, #0xffff000050fdb000
   0xffff000050f9d1b8: add      x19, x19, #0x53d
   0xffff000050f9d1bc: add      x20, x20, #0xc3d
   0xffff000050f9d1c0: mov      x0, x19
   0xffff000050f9d1c4: mov      x1, x20
   0xffff000050f9d1c8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9d1cc: adrp     x1, #0xffff000050fd0000
   0xffff000050f9d1d0: mov      x0, x19
   0xffff000050f9d1d4: add      x1, x1, #0xdd
   0xffff000050f9d1d8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9d1dc: adrp     x1, #0xffff000050fee000
   0xffff000050f9d1e0: mov      x0, x19
   0xffff000050f9d1e4: add      x1, x1, #0xeca
   0xffff000050f9d1e8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f9d1ec: mov      x0, x19
   0xffff000050f9d1f0: mov      x1, x20

loc_ffff000050f9d1f4:
   0xffff000050f9d1f4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c

loc_ffff000050f9d1f8:
   0xffff000050f9d1f8: mov      w0, wzr
   0xffff000050f9d1fc: b        #0xffff000050f9d298

loc_ffff000050f9d200:
   0xffff000050f9d200: mov      x0, x21
   0xffff000050f9d204: bl       #0xffff000050f9c004  ; call 0xffff000050f9c004
   0xffff000050f9d208: tbz      w0, #0, #0xffff000050f9d228
   0xffff000050f9d20c: mov      x1, x20
   0xffff000050f9d210: mov      w2, w19
   0xffff000050f9d214: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9d218: mov      x0, x21
   0xffff000050f9d21c: ldr      x21, [sp, #0x10]
   0xffff000050f9d220: ldp      x29, x30, [sp], #0x30
   0xffff000050f9d224: b        #0xffff000050f9c550

loc_ffff000050f9d228:
   0xffff000050f9d228: mov      x0, x21
   0xffff000050f9d22c: mov      x1, x20
   0xffff000050f9d230: mov      w2, w19
   0xffff000050f9d234: bl       #0xffff000050f9d3c0  ; call 0xffff000050f9d3c0
   0xffff000050f9d238: cbz      w0, #0xffff000050f9d294
   0xffff000050f9d23c: mov      x0, x20
   0xffff000050f9d240: bl       #0xffff000050f133f8  ; call 0xffff000050f133f8
   0xffff000050f9d244: tbz      w0, #0, #0xffff000050f9d1f8
   0xffff000050f9d248: mov      x0, x21
   0xffff000050f9d24c: bl       #0xffff000050f25598  ; call 0xffff000050f25598
   0xffff000050f9d250: mov      w20, w0
   0xffff000050f9d254: cmn      w0, #1
   0xffff000050f9d258: b.ne     #0xffff000050f9d270
   0xffff000050f9d25c: adrp     x0, #0xffff000050fd9000
   0xffff000050f9d260: adrp     x1, #0xffff000050fdb000
   0xffff000050f9d264: add      x0, x0, #0x53d
   0xffff000050f9d268: add      x1, x1, #0xc73
   0xffff000050f9d26c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c

loc_ffff000050f9d270:
   0xffff000050f9d270: mov      w0, w20
   0xffff000050f9d274: bl       #0xffff000050f256e8  ; call 0xffff000050f256e8
   0xffff000050f9d278: cmp      x0, w19, uxtw
   0xffff000050f9d27c: b.hs     #0xffff000050f9d294
   0xffff000050f9d280: adrp     x0, #0xffff000050fd9000
   0xffff000050f9d284: adrp     x1, #0xffff000050ff5000
   0xffff000050f9d288: add      x0, x0, #0x53d
   0xffff000050f9d28c: add      x1, x1, #0x542
   0xffff000050f9d290: b        #0xffff000050f9d1f4

loc_ffff000050f9d294:
   0xffff000050f9d294: mov      w0, #1

loc_ffff000050f9d298:
   0xffff000050f9d298: ldp      x20, x19, [sp, #0x20]
   0xffff000050f9d29c: and      w0, w0, #1
   0xffff000050f9d2a0: ldr      x21, [sp, #0x10]
   0xffff000050f9d2a4: ldp      x29, x30, [sp], #0x30
   0xffff000050f9d2a8: ret      
