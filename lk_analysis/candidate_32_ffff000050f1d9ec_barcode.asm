; candidate function around xref 0xffff000050f1ddec to 'barcode'
; estimated range 0xffff000050f1d9ec-0xffff000050f1df34

   0xffff000050f1d9ec: bl       #0xffff000050f75e50
   0xffff000050f1d9f0: adrp     x8, #0xffff000051055000
   0xffff000050f1d9f4: ldrb     w8, [x8, #0xc20]
   0xffff000050f1d9f8: tbz      w8, #0, #0xffff000050f1db64
   0xffff000050f1d9fc: tbz      w23, #0xe, #0xffff000050f1dad8
   0xffff000050f1da00: str      wzr, [sp, #0x80]
   0xffff000050f1da04: stp      xzr, xzr, [sp, #0x70]
   0xffff000050f1da08: stp      xzr, xzr, [sp, #0x60]
   0xffff000050f1da0c: stp      xzr, xzr, [sp, #0x50]
   0xffff000050f1da10: stp      xzr, xzr, [sp, #0x40]
   0xffff000050f1da14: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f1da18: stp      xzr, xzr, [sp, #0x20]
   0xffff000050f1da1c: bl       #0xffff000050f76a04
   0xffff000050f1da20: sub      w22, w0, #0x1b
   0xffff000050f1da24: bl       #0xffff000050f76588
   0xffff000050f1da28: mov      w19, w0
   0xffff000050f1da2c: bl       #0xffff000050fc91b0
   0xffff000050f1da30: mov      w8, #-0x2e
   0xffff000050f1da34: lsl      w9, w0, #1
   0xffff000050f1da38: madd     w8, w0, w8, w19
   0xffff000050f1da3c: sub      w8, w8, #0x5a
   0xffff000050f1da40: sdiv     w8, w8, w9
   0xffff000050f1da44: mov      w9, #0x35
   0xffff000050f1da48: cmp      w8, #0x35
   0xffff000050f1da4c: csel     w9, w8, w9, lt
   0xffff000050f1da50: cmp      w8, #0
   0xffff000050f1da54: csel     w19, w9, wzr, gt
   0xffff000050f1da58: cmp      w8, #1
   0xffff000050f1da5c: b.lt     #0xffff000050f1da74
   0xffff000050f1da60: cmp      w19, #1
   0xffff000050f1da64: add      x0, sp, #0x20
   0xffff000050f1da68: csinc    w2, w19, wzr, gt
   0xffff000050f1da6c: mov      w1, #0x20
   0xffff000050f1da70: bl       #0xffff000050f8e214
   0xffff000050f1da74: add      x8, sp, #0x20
   0xffff000050f1da78: adrp     x26, #0xffff000051011000
   0xffff000050f1da7c: adrp     x20, #0xffff000050fd6000
   0xffff000050f1da80: mov      x25, xzr
   0xffff000050f1da84: add      x19, x8, w19, uxtw
   0xffff000050f1da88: add      x26, x26, #0x970
   0xffff000050f1da8c: add      x20, x20, #0x768
   0xffff000050f1da90: add      w21, w22, w25
   0xffff000050f1da94: mov      w1, #1
   0xffff000050f1da98: mov      w0, w21
   0xffff000050f1da9c: mov      w2, #1
   0xffff000050f1daa0: bl       #0xffff000050f763c8
   0xffff000050f1daa4: ldr      x3, [x26, x25, lsl #3]
   0xffff000050f1daa8: mov      x0, x19
   0xffff000050f1daac: mov      w1, #0x63
   0xffff000050f1dab0: mov      x2, x20
   0xffff000050f1dab4: bl       #0xffff000050f8c89c
   0xffff000050f1dab8: add      x0, sp, #0x20
   0xffff000050f1dabc: mov      w1, w21
   0xffff000050f1dac0: mov      w2, wzr
   0xffff000050f1dac4: mov      w3, #-0x10000
   0xffff000050f1dac8: bl       #0xffff000050f75e50
   0xffff000050f1dacc: add      x25, x25, #1
   0xffff000050f1dad0: cmp      x25, #0xa
   0xffff000050f1dad4: b.ne     #0xffff000050f1da90
   0xffff000050f1dad8: tbz      w23, #0xa, #0xffff000050f1dbf0
   0xffff000050f1dadc: bl       #0xffff000050f76a04
   0xffff000050f1dae0: mov      w20, w0
   0xffff000050f1dae4: mov      w0, #2
   0xffff000050f1dae8: bl       #0xffff000050f29944
   0xffff000050f1daec: cbz      x0, #0xffff000050f1dbf0
   0xffff000050f1daf0: ldr      x8, [x0, #0x10]
   0xffff000050f1daf4: mov      x19, x0
   0xffff000050f1daf8: blr      x8
   0xffff000050f1dafc: cbz      x0, #0xffff000050f1dbf0
   0xffff000050f1db00: adrp     x22, #0xffff000051001000
   0xffff000050f1db04: mov      x21, x0
   0xffff000050f1db08: sub      w20, w20, #0xe
   0xffff000050f1db0c: add      x22, x22, #0x1a8
   0xffff000050f1db10: b        #0xffff000050f1db28
   0xffff000050f1db14: ldr      x8, [x19, #0x18]
   0xffff000050f1db18: add      w20, w20, #1
   0xffff000050f1db1c: blr      x8
   0xffff000050f1db20: mov      x21, x0
   0xffff000050f1db24: cbz      x0, #0xffff000050f1dbf0
   0xffff000050f1db28: bl       #0xffff000050f76a04
   0xffff000050f1db2c: cmp      w20, w0
   0xffff000050f1db30: b.ge     #0xffff000050f1dbf0
   0xffff000050f1db34: mov      w0, w20
   0xffff000050f1db38: mov      w1, #1
   0xffff000050f1db3c: mov      w2, #1
   0xffff000050f1db40: bl       #0xffff000050f763c8
   0xffff000050f1db44: ldr      x0, [x21, #8]
   0xffff000050f1db48: cbz      x0, #0xffff000050f1db14
   0xffff000050f1db4c: ldrsw    x8, [x21]
   0xffff000050f1db50: mov      w1, w20
   0xffff000050f1db54: mov      w2, wzr
   0xffff000050f1db58: ldr      w3, [x22, x8, lsl #2]
   0xffff000050f1db5c: bl       #0xffff000050f75e50
   0xffff000050f1db60: b        #0xffff000050f1db14
   0xffff000050f1db64: tbnz     w23, #1, #0xffff000050f1df38
   0xffff000050f1db68: tbnz     w23, #2, #0xffff000050f1e164
   0xffff000050f1db6c: tbnz     w23, #3, #0xffff000050f1e1c0
   0xffff000050f1db70: tbnz     w23, #4, #0xffff000050f1e228
   0xffff000050f1db74: tbnz     w23, #5, #0xffff000050f1e284
   0xffff000050f1db78: tbnz     w23, #7, #0xffff000050f1e2bc
   0xffff000050f1db7c: tbnz     w23, #8, #0xffff000050f1e358
   0xffff000050f1db80: tbnz     w23, #9, #0xffff000050f1e3b8
   0xffff000050f1db84: tbnz     w23, #0x10, #0xffff000050f1e474
   0xffff000050f1db88: tbz      w23, #0x11, #0xffff000050f1dbf0
   0xffff000050f1db8c: stp      xzr, xzr, [sp, #0x50]
   0xffff000050f1db90: stp      xzr, xzr, [sp, #0x40]
   0xffff000050f1db94: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f1db98: stp      xzr, xzr, [sp, #0x20]
   0xffff000050f1db9c: bl       #0xffff000050f70188
   0xffff000050f1dba0: mov      w19, w0
   0xffff000050f1dba4: bl       #0xffff000050f7018c
   0xffff000050f1dba8: adrp     x2, #0xffff000050ff4000
   0xffff000050f1dbac: mov      x4, x0
   0xffff000050f1dbb0: add      x2, x2, #0x346
   0xffff000050f1dbb4: add      x0, sp, #0x20
   0xffff000050f1dbb8: mov      w1, #0x40
   0xffff000050f1dbbc: mov      w3, w19
   0xffff000050f1dbc0: bl       #0xffff000050f8c89c
   0xffff000050f1dbc4: bl       #0xffff000050f76a04
   0xffff000050f1dbc8: sub      w0, w0, #2
   0xffff000050f1dbcc: mov      w1, #1
   0xffff000050f1dbd0: mov      w2, #1
   0xffff000050f1dbd4: bl       #0xffff000050f763c8
   0xffff000050f1dbd8: bl       #0xffff000050f76a04
   0xffff000050f1dbdc: sub      w1, w0, #2
   0xffff000050f1dbe0: add      x0, sp, #0x20
   0xffff000050f1dbe4: mov      w2, wzr
   0xffff000050f1dbe8: mov      w3, #-1
   0xffff000050f1dbec: bl       #0xffff000050f75e50
   0xffff000050f1dbf0: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dbf4: tbz      w23, #0x10, #0xffff000050f1dc1c
   0xffff000050f1dbf8: cbz      w8, #0xffff000050f1dc1c
   0xffff000050f1dbfc: adrp     x8, #0xffff000051055000
   0xffff000050f1dc00: adrp     x0, #0xffff000050fdc000
   0xffff000050f1dc04: add      x8, x8, #0x5c4
   0xffff000050f1dc08: add      x0, x0, #0x6b2
   0xffff000050f1dc0c: mov      w3, wzr
   0xffff000050f1dc10: ldp      w1, w2, [x8]
   0xffff000050f1dc14: bl       #0xffff000050f21048
   0xffff000050f1dc18: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dc1c: tbz      w23, #0x11, #0xffff000050f1dc44
   0xffff000050f1dc20: cbz      w8, #0xffff000050f1dc44
   0xffff000050f1dc24: adrp     x8, #0xffff000051055000
   0xffff000050f1dc28: adrp     x0, #0xffff000050ff1000
   0xffff000050f1dc2c: add      x8, x8, #0x5d8
   0xffff000050f1dc30: add      x0, x0, #0x197
   0xffff000050f1dc34: mov      w3, wzr
   0xffff000050f1dc38: ldp      w1, w2, [x8]
   0xffff000050f1dc3c: bl       #0xffff000050f21048
   0xffff000050f1dc40: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dc44: adrp     x19, #0xffff000051055000
   0xffff000050f1dc48: add      x19, x19, #0x5cc
   0xffff000050f1dc4c: tbz      w23, #0x12, #0xffff000050f1dc88
   0xffff000050f1dc50: cbz      w8, #0xffff000050f1dc88
   0xffff000050f1dc54: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1dc58: mov      w2, #1
   0xffff000050f1dc5c: bl       #0xffff000050f763c8
   0xffff000050f1dc60: ldp      w1, w2, [x19]
   0xffff000050f1dc64: adrp     x0, #0xffff000050fff000
   0xffff000050f1dc68: mov      w3, #2
   0xffff000050f1dc6c: add      x0, x0, #0x5e8
   0xffff000050f1dc70: bl       #0xffff000050f21048
   0xffff000050f1dc74: tbnz     w0, #0, #0xffff000050f1dc88
   0xffff000050f1dc78: adrp     x0, #0xffff000050fd6000
   0xffff000050f1dc7c: mov      w1, #-0xff0100
   0xffff000050f1dc80: add      x0, x0, #0xae4
   0xffff000050f1dc84: bl       #0xffff000050f21458
   0xffff000050f1dc88: tbz      w23, #0x13, #0xffff000050f1dcc8
   0xffff000050f1dc8c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dc90: cbz      w8, #0xffff000050f1dcc8
   0xffff000050f1dc94: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1dc98: mov      w2, #1
   0xffff000050f1dc9c: bl       #0xffff000050f763c8
   0xffff000050f1dca0: ldp      w1, w2, [x19]
   0xffff000050f1dca4: adrp     x0, #0xffff000050ffd000
   0xffff000050f1dca8: mov      w3, #2
   0xffff000050f1dcac: add      x0, x0, #0xc14
   0xffff000050f1dcb0: bl       #0xffff000050f21048
   0xffff000050f1dcb4: tbnz     w0, #0, #0xffff000050f1dcc8
   0xffff000050f1dcb8: adrp     x0, #0xffff000050fd8000
   0xffff000050f1dcbc: mov      w1, #-0x10000
   0xffff000050f1dcc0: add      x0, x0, #0xd2
   0xffff000050f1dcc4: bl       #0xffff000050f21458
   0xffff000050f1dcc8: tbz      w23, #0x14, #0xffff000050f1dd08
   0xffff000050f1dccc: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dcd0: cbz      w8, #0xffff000050f1dd08
   0xffff000050f1dcd4: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1dcd8: mov      w2, #1
   0xffff000050f1dcdc: bl       #0xffff000050f763c8
   0xffff000050f1dce0: ldp      w1, w2, [x19]
   0xffff000050f1dce4: adrp     x0, #0xffff000050ff8000
   0xffff000050f1dce8: mov      w3, #2
   0xffff000050f1dcec: add      x0, x0, #0xba4
   0xffff000050f1dcf0: bl       #0xffff000050f21048
   0xffff000050f1dcf4: tbnz     w0, #0, #0xffff000050f1dd08
   0xffff000050f1dcf8: adrp     x0, #0xffff000050ffa000
   0xffff000050f1dcfc: mov      w1, #-0x10000
   0xffff000050f1dd00: add      x0, x0, #0x753
   0xffff000050f1dd04: bl       #0xffff000050f21458
   0xffff000050f1dd08: tbz      w23, #0x15, #0xffff000050f1dd48
   0xffff000050f1dd0c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dd10: cbz      w8, #0xffff000050f1dd48
   0xffff000050f1dd14: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1dd18: mov      w2, #1
   0xffff000050f1dd1c: bl       #0xffff000050f763c8
   0xffff000050f1dd20: ldp      w1, w2, [x19]
   0xffff000050f1dd24: adrp     x0, #0xffff000050fe1000
   0xffff000050f1dd28: mov      w3, #2
   0xffff000050f1dd2c: add      x0, x0, #0x6eb
   0xffff000050f1dd30: bl       #0xffff000050f21048
   0xffff000050f1dd34: tbnz     w0, #0, #0xffff000050f1dd48
   0xffff000050f1dd38: adrp     x0, #0xffff000050ffc000
   0xffff000050f1dd3c: mov      w1, #-1
   0xffff000050f1dd40: add      x0, x0, #0x2a5
   0xffff000050f1dd44: bl       #0xffff000050f21458
   0xffff000050f1dd48: tbz      w23, #0x17, #0xffff000050f1dd88
   0xffff000050f1dd4c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dd50: cbz      w8, #0xffff000050f1dd88
   0xffff000050f1dd54: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1dd58: mov      w2, #1
   0xffff000050f1dd5c: bl       #0xffff000050f763c8
   0xffff000050f1dd60: ldp      w1, w2, [x19]
   0xffff000050f1dd64: adrp     x0, #0xffff000050fe9000
   0xffff000050f1dd68: mov      w3, #2
   0xffff000050f1dd6c: add      x0, x0, #0xb3
   0xffff000050f1dd70: bl       #0xffff000050f21048
   0xffff000050f1dd74: tbnz     w0, #0, #0xffff000050f1dd88
   0xffff000050f1dd78: adrp     x0, #0xffff000050fe1000
   0xffff000050f1dd7c: mov      w1, #-0x10000
   0xffff000050f1dd80: add      x0, x0, #0x6f4
   0xffff000050f1dd84: bl       #0xffff000050f21458
   0xffff000050f1dd88: tbz      w23, #0x18, #0xffff000050f1ddc8
   0xffff000050f1dd8c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1dd90: cbz      w8, #0xffff000050f1ddc8
   0xffff000050f1dd94: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1dd98: mov      w2, #1
   0xffff000050f1dd9c: bl       #0xffff000050f763c8
   0xffff000050f1dda0: ldp      w1, w2, [x19]
   0xffff000050f1dda4: adrp     x0, #0xffff000050ffa000
   0xffff000050f1dda8: mov      w3, #2
   0xffff000050f1ddac: add      x0, x0, #0x761
   0xffff000050f1ddb0: bl       #0xffff000050f21048
   0xffff000050f1ddb4: tbnz     w0, #0, #0xffff000050f1ddc8
   0xffff000050f1ddb8: adrp     x0, #0xffff000050fef000
   0xffff000050f1ddbc: mov      w1, #-1
   0xffff000050f1ddc0: add      x0, x0, #0x8e5
   0xffff000050f1ddc4: bl       #0xffff000050f21458
   0xffff000050f1ddc8: tbz      w23, #0x19, #0xffff000050f1de08
   0xffff000050f1ddcc: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1ddd0: cbz      w8, #0xffff000050f1de08
   0xffff000050f1ddd4: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1ddd8: mov      w2, #1
   0xffff000050f1dddc: bl       #0xffff000050f763c8
   0xffff000050f1dde0: ldp      w1, w2, [x19]
   0xffff000050f1dde4: adrp     x0, #0xffff000050fd8000
   0xffff000050f1dde8: mov      w3, #2
>> 0xffff000050f1ddec: add      x0, x0, #0xe5
   0xffff000050f1ddf0: bl       #0xffff000050f21048
   0xffff000050f1ddf4: tbnz     w0, #0, #0xffff000050f1de08
   0xffff000050f1ddf8: adrp     x0, #0xffff000050fe1000
   0xffff000050f1ddfc: mov      w1, #-1
   0xffff000050f1de00: add      x0, x0, #0x6fc
   0xffff000050f1de04: bl       #0xffff000050f21458
   0xffff000050f1de08: tbz      w23, #0x1d, #0xffff000050f1de48
   0xffff000050f1de0c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1de10: cbz      w8, #0xffff000050f1de48
   0xffff000050f1de14: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1de18: mov      w2, #1
   0xffff000050f1de1c: bl       #0xffff000050f763c8
   0xffff000050f1de20: ldp      w1, w2, [x19]
   0xffff000050f1de24: adrp     x0, #0xffff000050ffd000
   0xffff000050f1de28: mov      w3, #2
   0xffff000050f1de2c: add      x0, x0, #0xc26
   0xffff000050f1de30: bl       #0xffff000050f21048
   0xffff000050f1de34: tbnz     w0, #0, #0xffff000050f1de48
   0xffff000050f1de38: adrp     x0, #0xffff000050fd5000
   0xffff000050f1de3c: mov      w1, #-1
   0xffff000050f1de40: add      x0, x0, #0x354
   0xffff000050f1de44: bl       #0xffff000050f21458
   0xffff000050f1de48: tbz      w23, #0x1a, #0xffff000050f1de88
   0xffff000050f1de4c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1de50: cbz      w8, #0xffff000050f1de88
   0xffff000050f1de54: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1de58: mov      w2, #1
   0xffff000050f1de5c: bl       #0xffff000050f763c8
   0xffff000050f1de60: ldp      w1, w2, [x19]
   0xffff000050f1de64: adrp     x0, #0xffff000050fda000
   0xffff000050f1de68: mov      w3, #2
   0xffff000050f1de6c: add      x0, x0, #0xda0
   0xffff000050f1de70: bl       #0xffff000050f21048
   0xffff000050f1de74: tbnz     w0, #0, #0xffff000050f1de88
   0xffff000050f1de78: adrp     x0, #0xffff000050fd0000
   0xffff000050f1de7c: mov      w1, #-0x10000
   0xffff000050f1de80: add      x0, x0, #0x8d7
   0xffff000050f1de84: bl       #0xffff000050f21458
   0xffff000050f1de88: tbz      w23, #0x1b, #0xffff000050f1dec8
   0xffff000050f1de8c: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1de90: cbz      w8, #0xffff000050f1dec8
   0xffff000050f1de94: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1de98: mov      w2, #1
   0xffff000050f1de9c: bl       #0xffff000050f763c8
   0xffff000050f1dea0: ldp      w1, w2, [x19]
   0xffff000050f1dea4: adrp     x0, #0xffff000050fd5000
   0xffff000050f1dea8: mov      w3, #2
   0xffff000050f1deac: add      x0, x0, #0x366
   0xffff000050f1deb0: bl       #0xffff000050f21048
   0xffff000050f1deb4: tbnz     w0, #0, #0xffff000050f1dec8
   0xffff000050f1deb8: adrp     x0, #0xffff000050fe9000
   0xffff000050f1debc: mov      w1, #-0x10000
   0xffff000050f1dec0: add      x0, x0, #0x257
   0xffff000050f1dec4: bl       #0xffff000050f21458
   0xffff000050f1dec8: tbz      w23, #0x1c, #0xffff000050f1df08
   0xffff000050f1decc: ldrb     w8, [x24, #0x5bc]
   0xffff000050f1ded0: cbz      w8, #0xffff000050f1df08
   0xffff000050f1ded4: ldp      w0, w1, [x19, #0x14]
   0xffff000050f1ded8: mov      w2, #1
   0xffff000050f1dedc: bl       #0xffff000050f763c8
   0xffff000050f1dee0: ldp      w1, w2, [x19]
   0xffff000050f1dee4: adrp     x0, #0xffff000050ffa000
   0xffff000050f1dee8: mov      w3, #2
   0xffff000050f1deec: add      x0, x0, #0x76f
   0xffff000050f1def0: bl       #0xffff000050f21048
   0xffff000050f1def4: tbnz     w0, #0, #0xffff000050f1df08
   0xffff000050f1def8: adrp     x0, #0xffff000050fe4000
   0xffff000050f1defc: mov      w1, #-1
   0xffff000050f1df00: add      x0, x0, #0x83c
   0xffff000050f1df04: bl       #0xffff000050f21458
   0xffff000050f1df08: mov      x0, xzr
   0xffff000050f1df0c: mov      w1, wzr
   0xffff000050f1df10: mov      w2, #1
   0xffff000050f1df14: bl       #0xffff000050f75df4
   0xffff000050f1df18: add      sp, sp, #0x1c0
   0xffff000050f1df1c: ldp      x20, x19, [sp, #0x50]
   0xffff000050f1df20: ldp      x22, x21, [sp, #0x40]
   0xffff000050f1df24: ldp      x24, x23, [sp, #0x30]
   0xffff000050f1df28: ldp      x26, x25, [sp, #0x20]
   0xffff000050f1df2c: ldr      x28, [sp, #0x10]
   0xffff000050f1df30: ldp      x29, x30, [sp], #0x60
   0xffff000050f1df34: ret      
