; candidate function around xref 0xffff000050f09e08 to 'debug_token'
; estimated range 0xffff000050f09dc8-0xffff000050f09f34

   0xffff000050f09dc8: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f09dcc: stp      x22, x21, [sp, #0x10]
   0xffff000050f09dd0: mov      x29, sp
   0xffff000050f09dd4: stp      x20, x19, [sp, #0x20]
   0xffff000050f09dd8: ldr      x8, [x0, #0x10]
   0xffff000050f09ddc: adrp     x1, #0xffff000050fd4000
   0xffff000050f09de0: mov      x21, x0
   0xffff000050f09de4: ldr      x20, [x0]
   0xffff000050f09de8: ldr      w19, [x0, #0xc]
   0xffff000050f09dec: add      x1, x1, #0xe2b
   0xffff000050f09df0: add      x22, x8, #1
   0xffff000050f09df4: mov      x0, x22
   0xffff000050f09df8: bl       #0xffff000050f8e3ec
   0xffff000050f09dfc: cbz      w0, #0xffff000050f09e84
   0xffff000050f09e00: adrp     x1, #0xffff000050ffb000
   0xffff000050f09e04: mov      x0, x22
>> 0xffff000050f09e08: add      x1, x1, #0xc48
   0xffff000050f09e0c: bl       #0xffff000050f8e3ec
   0xffff000050f09e10: cbz      w0, #0xffff000050f09e98
   0xffff000050f09e14: adrp     x1, #0xffff000050fd4000
   0xffff000050f09e18: mov      x0, x22
   0xffff000050f09e1c: add      x1, x1, #0xe34
   0xffff000050f09e20: bl       #0xffff000050f8e3ec
   0xffff000050f09e24: cbnz     w0, #0xffff000050f09e30
   0xffff000050f09e28: bl       #0xffff000050f9db90
   0xffff000050f09e2c: tbz      w0, #0, #0xffff000050f09ec8
   0xffff000050f09e30: adrp     x1, #0xffff000050fd0000
   0xffff000050f09e34: mov      x0, x22
   0xffff000050f09e38: add      x1, x1, #0x588
   0xffff000050f09e3c: bl       #0xffff000050f8e3ec
   0xffff000050f09e40: cbz      w0, #0xffff000050f09eb0
   0xffff000050f09e44: adrp     x1, #0xffff000050fd3000
   0xffff000050f09e48: mov      x0, x22
   0xffff000050f09e4c: add      x1, x1, #0x5ba
   0xffff000050f09e50: bl       #0xffff000050f8e3ec
   0xffff000050f09e54: cbz      w0, #0xffff000050f09ef4
   0xffff000050f09e58: mov      x0, x22
   0xffff000050f09e5c: bl       #0xffff000050f8b044
   0xffff000050f09e60: cmn      w0, #1
   0xffff000050f09e64: b.eq     #0xffff000050f09f10
   0xffff000050f09e68: adrp     x0, #0xffff000050fd9000
   0xffff000050f09e6c: adrp     x1, #0xffff000050fd3000
   0xffff000050f09e70: add      x0, x0, #0x53d
   0xffff000050f09e74: add      x1, x1, #0x5c9
   0xffff000050f09e78: bl       #0xffff000050f07c4c
   0xffff000050f09e7c: mov      w0, #3
   0xffff000050f09e80: b        #0xffff000050f09f28
   0xffff000050f09e84: mov      x0, x20
   0xffff000050f09e88: mov      w1, w19
   0xffff000050f09e8c: bl       #0xffff000050f902fc
   0xffff000050f09e90: and      w0, w0, #1
   0xffff000050f09e94: b        #0xffff000050f09f28
   0xffff000050f09e98: mov      x0, x20
   0xffff000050f09e9c: mov      w1, w19
   0xffff000050f09ea0: ldp      x20, x19, [sp, #0x20]
   0xffff000050f09ea4: ldp      x22, x21, [sp, #0x10]
   0xffff000050f09ea8: ldp      x29, x30, [sp], #0x30
   0xffff000050f09eac: b        #0xffff000050f9f0f8
   0xffff000050f09eb0: adrp     x0, #0xffff000050fd9000
   0xffff000050f09eb4: adrp     x1, #0xffff000050fea000
   0xffff000050f09eb8: add      x0, x0, #0x53d
   0xffff000050f09ebc: add      x1, x1, #0x9e3
   0xffff000050f09ec0: bl       #0xffff000050f07c4c
   0xffff000050f09ec4: b        #0xffff000050f09f24
   0xffff000050f09ec8: adrp     x19, #0xffff000050fd9000
   0xffff000050f09ecc: adrp     x1, #0xffff000050ff0000
   0xffff000050f09ed0: add      x19, x19, #0x53d
   0xffff000050f09ed4: add      x1, x1, #0xdca
   0xffff000050f09ed8: mov      x0, x19
   0xffff000050f09edc: bl       #0xffff000050f07c4c
   0xffff000050f09ee0: adrp     x1, #0xffff000050ffd000
   0xffff000050f09ee4: mov      x0, x19
   0xffff000050f09ee8: add      x1, x1, #0x7c2
   0xffff000050f09eec: bl       #0xffff000050f07c4c
   0xffff000050f09ef0: b        #0xffff000050f09f24
   0xffff000050f09ef4: mov      x0, x20
   0xffff000050f09ef8: mov      w1, w19
   0xffff000050f09efc: bl       #0xffff000050f9ce08
   0xffff000050f09f00: mov      w8, #3
   0xffff000050f09f04: tst      w0, #1
   0xffff000050f09f08: csinc    w0, w8, wzr, eq
   0xffff000050f09f0c: b        #0xffff000050f09f28
   0xffff000050f09f10: ldr      x8, [x21, #0x10]
   0xffff000050f09f14: mov      x1, x20
   0xffff000050f09f18: mov      w2, w19
   0xffff000050f09f1c: add      x0, x8, #1
   0xffff000050f09f20: bl       #0xffff000050f13240
   0xffff000050f09f24: mov      w0, #1
   0xffff000050f09f28: ldp      x20, x19, [sp, #0x20]
   0xffff000050f09f2c: ldp      x22, x21, [sp, #0x10]
   0xffff000050f09f30: ldp      x29, x30, [sp], #0x30
   0xffff000050f09f34: ret      
