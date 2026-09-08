; candidate function around xref 0xffff000050f18094 to 'battid'
; estimated range 0xffff000050f17c94-0xffff000050f18364

   0xffff000050f17c94: add      x1, x1, #0xbfb
   0xffff000050f17c98: b        #0xffff000050f17d9c
   0xffff000050f17c9c: add      x0, sp, #0x20
   0xffff000050f17ca0: mov      w1, #8
   0xffff000050f17ca4: bl       #0xffff000050fa1e80
   0xffff000050f17ca8: cbz      w0, #0xffff000050f17cc0
   0xffff000050f17cac: add      x0, sp, #0x20
   0xffff000050f17cb0: bl       #0xffff000050f0302c
   0xffff000050f17cb4: tbnz     w0, #0x1f, #0xffff000050f17d50
   0xffff000050f17cb8: ldp      w2, w3, [sp, #0x20]
   0xffff000050f17cbc: b        #0xffff000050f17cd0
   0xffff000050f17cc0: ldp      w8, w9, [sp, #0x20]
   0xffff000050f17cc4: rev      w2, w8
   0xffff000050f17cc8: rev      w3, w9
   0xffff000050f17ccc: stp      w2, w3, [sp, #0x20]
   0xffff000050f17cd0: adrp     x1, #0xffff000050fd3000
   0xffff000050f17cd4: mov      w0, #2
   0xffff000050f17cd8: add      x1, x1, #0x878
   0xffff000050f17cdc: bl       #0xffff000050f29978
   0xffff000050f17ce0: ldr      w8, [sp, #0x24]
   0xffff000050f17ce4: adrp     x2, #0xffff000050ff7000
   0xffff000050f17ce8: add      x2, x2, #0x417
   0xffff000050f17cec: add      x3, sp, #0x10
   0xffff000050f17cf0: mov      x0, x19
   0xffff000050f17cf4: mov      w1, w20
   0xffff000050f17cf8: rev      w8, w8
   0xffff000050f17cfc: mov      w4, #4
   0xffff000050f17d00: str      w8, [sp, #0x10]
   0xffff000050f17d04: bl       #0xffff000050f7c87c
   0xffff000050f17d08: cbz      w0, #0xffff000050f17d18
   0xffff000050f17d0c: adrp     x1, #0xffff000050fd0000
   0xffff000050f17d10: add      x1, x1, #0x77e
   0xffff000050f17d14: b        #0xffff000050f17d9c
   0xffff000050f17d18: ldr      w8, [sp, #0x20]
   0xffff000050f17d1c: adrp     x2, #0xffff000050fe1000
   0xffff000050f17d20: add      x2, x2, #0x5a6
   0xffff000050f17d24: add      x3, sp, #0x10
   0xffff000050f17d28: mov      x0, x19
   0xffff000050f17d2c: mov      w1, w20
   0xffff000050f17d30: rev      w8, w8
   0xffff000050f17d34: mov      w4, #4
   0xffff000050f17d38: str      w8, [sp, #0x10]
   0xffff000050f17d3c: bl       #0xffff000050f7c87c
   0xffff000050f17d40: cbz      w0, #0xffff000050f17d68
   0xffff000050f17d44: adrp     x1, #0xffff000050fef000
   0xffff000050f17d48: add      x1, x1, #0x7b6
   0xffff000050f17d4c: b        #0xffff000050f17d9c
   0xffff000050f17d50: adrp     x1, #0xffff000050fde000
   0xffff000050f17d54: mov      w2, w0
   0xffff000050f17d58: add      x1, x1, #0x36
   0xffff000050f17d5c: mov      w0, #-1
   0xffff000050f17d60: bl       #0xffff000050f29978
   0xffff000050f17d64: b        #0xffff000050f17da4
   0xffff000050f17d68: and      w8, w21, #0xff
   0xffff000050f17d6c: adrp     x2, #0xffff000050fde000
   0xffff000050f17d70: lsl      w8, w8, #0x18
   0xffff000050f17d74: add      x2, x2, #0x5f
   0xffff000050f17d78: add      x3, sp, #0x10
   0xffff000050f17d7c: mov      x0, x19
   0xffff000050f17d80: mov      w1, w20
   0xffff000050f17d84: mov      w4, #4
   0xffff000050f17d88: str      w8, [sp, #0x10]
   0xffff000050f17d8c: bl       #0xffff000050f7c87c
   0xffff000050f17d90: cbz      w0, #0xffff000050f17ec4
   0xffff000050f17d94: adrp     x1, #0xffff000050ff7000
   0xffff000050f17d98: add      x1, x1, #0x427
   0xffff000050f17d9c: mov      w0, #-1
   0xffff000050f17da0: bl       #0xffff000050f29978
   0xffff000050f17da4: adrp     x8, #0xffff000051001000
   0xffff000050f17da8: sub      x0, x29, #0x20
   0xffff000050f17dac: add      x8, x8, #0x1e8
   0xffff000050f17db0: mov      w1, #0x3a
   0xffff000050f17db4: sturb    wzr, [x29, #-1]
   0xffff000050f17db8: ldp      x9, x8, [x8]
   0xffff000050f17dbc: stur     x9, [x29, #-0x20]
   0xffff000050f17dc0: stp      x8, xzr, [x29, #-0x18]
   0xffff000050f17dc4: stur     xzr, [x29, #-9]
   0xffff000050f17dc8: bl       #0xffff000050f8e848
   0xffff000050f17dcc: cmp      x0, #0
   0xffff000050f17dd0: csinc    x0, xzr, x0, eq
   0xffff000050f17dd4: bl       #0xffff000050f16814
   0xffff000050f17dd8: cbz      w0, #0xffff000050f17e00
   0xffff000050f17ddc: cmp      w0, #0xff
   0xffff000050f17de0: b.ne     #0xffff000050f17e48
   0xffff000050f17de4: adrp     x1, #0xffff000050fec000
   0xffff000050f17de8: adrp     x2, #0xffff000050fe5000
   0xffff000050f17dec: add      x1, x1, #0x38b
   0xffff000050f17df0: add      x2, x2, #0xabc
   0xffff000050f17df4: mov      w0, #-1
   0xffff000050f17df8: bl       #0xffff000050f29978
   0xffff000050f17dfc: b        #0xffff000050f17e9c
   0xffff000050f17e00: adrp     x1, #0xffff000050ffd000
   0xffff000050f17e04: sub      x0, x29, #0x20
   0xffff000050f17e08: add      x1, x1, #0x6de
   0xffff000050f17e0c: mov      w2, #0x1f
   0xffff000050f17e10: bl       #0xffff000050f8e528
   0xffff000050f17e14: adrp     x1, #0xffff000050fea000
   0xffff000050f17e18: sub      x0, x29, #0x20
   0xffff000050f17e1c: add      x1, x1, #0x913
   0xffff000050f17e20: mov      w2, #0x1f
   0xffff000050f17e24: bl       #0xffff000050f8e528
   0xffff000050f17e28: sub      x0, x29, #0x20
   0xffff000050f17e2c: mov      w1, #0x3a
   0xffff000050f17e30: bl       #0xffff000050f8e848
   0xffff000050f17e34: cmp      x0, #0
   0xffff000050f17e38: csinc    x0, xzr, x0, eq
   0xffff000050f17e3c: bl       #0xffff000050f16814
   0xffff000050f17e40: cmp      w0, #0xff
   0xffff000050f17e44: b.eq     #0xffff000050f17de4
   0xffff000050f17e48: adrp     x0, #0xffff000051052000
   0xffff000050f17e4c: mov      w1, #0x400
   0xffff000050f17e50: add      x0, x0, #0x7d1
   0xffff000050f17e54: bl       #0xffff000050f8e7d4
   0xffff000050f17e58: cmp      x0, #0x400
   0xffff000050f17e5c: b.ne     #0xffff000050f17e74
   0xffff000050f17e60: adrp     x1, #0xffff000050fd3000
   0xffff000050f17e64: mov      w0, #-1
   0xffff000050f17e68: add      x1, x1, #0x4f5
   0xffff000050f17e6c: bl       #0xffff000050f29978
   0xffff000050f17e70: b        #0xffff000050f17e9c
   0xffff000050f17e74: adrp     x2, #0xffff000051052000
   0xffff000050f17e78: add      x3, x0, #1
   0xffff000050f17e7c: add      x2, x2, #0x7d1
   0xffff000050f17e80: sub      x1, x29, #0x20
   0xffff000050f17e84: mov      w0, wzr
   0xffff000050f17e88: bl       #0xffff000050f35fe8
   0xffff000050f17e8c: cbz      x0, #0xffff000050f17e9c
   0xffff000050f17e90: mov      w0, wzr
   0xffff000050f17e94: bl       #0xffff000050f36c5c
   0xffff000050f17e98: b        #0xffff000050f17eac
   0xffff000050f17e9c: adrp     x1, #0xffff000050fef000
   0xffff000050f17ea0: mov      w0, #-1
   0xffff000050f17ea4: add      x1, x1, #0x78b
   0xffff000050f17ea8: bl       #0xffff000050f29978
   0xffff000050f17eac: ldp      x20, x19, [sp, #0x90]
   0xffff000050f17eb0: ldp      x22, x21, [sp, #0x80]
   0xffff000050f17eb4: ldp      x29, x30, [sp, #0x60]
   0xffff000050f17eb8: ldr      x23, [sp, #0x70]
   0xffff000050f17ebc: add      sp, sp, #0xa0
   0xffff000050f17ec0: ret      
   0xffff000050f17ec4: bl       #0xffff000050f15c18
   0xffff000050f17ec8: cmp      w0, #2
   0xffff000050f17ecc: b.ne     #0xffff000050f17f04
   0xffff000050f17ed0: adrp     x2, #0xffff000050fe7000
   0xffff000050f17ed4: mov      w8, #0x1000000
   0xffff000050f17ed8: add      x2, x2, #0x853
   0xffff000050f17edc: add      x3, sp, #0x10
   0xffff000050f17ee0: mov      x0, x19
   0xffff000050f17ee4: mov      w1, w20
   0xffff000050f17ee8: mov      w4, wzr
   0xffff000050f17eec: str      w8, [sp, #0x10]
   0xffff000050f17ef0: bl       #0xffff000050f7c87c
   0xffff000050f17ef4: cbz      w0, #0xffff000050f17f04
   0xffff000050f17ef8: adrp     x1, #0xffff000050fec000
   0xffff000050f17efc: add      x1, x1, #0x73d
   0xffff000050f17f00: b        #0xffff000050f17d9c
   0xffff000050f17f04: adrp     x1, #0xffff000050ff2000
   0xffff000050f17f08: mov      w0, wzr
   0xffff000050f17f0c: add      x1, x1, #0xaf6
   0xffff000050f17f10: strb     wzr, [sp, #0x10]
   0xffff000050f17f14: bl       #0xffff000050f36658
   0xffff000050f17f18: cmp      x0, #1
   0xffff000050f17f1c: b.ne     #0xffff000050f17f88
   0xffff000050f17f20: adrp     x1, #0xffff000050ff2000
   0xffff000050f17f24: add      x2, sp, #0x10
   0xffff000050f17f28: add      x1, x1, #0xaf6
   0xffff000050f17f2c: mov      w0, wzr
   0xffff000050f17f30: mov      w3, #1
   0xffff000050f17f34: bl       #0xffff000050f3659c
   0xffff000050f17f38: cbz      x0, #0xffff000050f17f88
   0xffff000050f17f3c: ldrb     w8, [sp, #0x10]
   0xffff000050f17f40: cbz      w8, #0xffff000050f17f88
   0xffff000050f17f44: adrp     x2, #0xffff000050fea000
   0xffff000050f17f48: mov      w8, #0x1000000
   0xffff000050f17f4c: add      x2, x2, #0xc77
   0xffff000050f17f50: add      x3, sp, #0x10
   0xffff000050f17f54: mov      x0, x19
   0xffff000050f17f58: mov      w1, w20
   0xffff000050f17f5c: mov      w4, wzr
   0xffff000050f17f60: str      w8, [sp, #0x10]
   0xffff000050f17f64: bl       #0xffff000050f7c87c
   0xffff000050f17f68: cbz      w0, #0xffff000050f17f78
   0xffff000050f17f6c: adrp     x1, #0xffff000050fd9000
   0xffff000050f17f70: add      x1, x1, #0x807
   0xffff000050f17f74: b        #0xffff000050f17d9c
   0xffff000050f17f78: adrp     x1, #0xffff000050fd9000
   0xffff000050f17f7c: mov      w0, #1
   0xffff000050f17f80: add      x1, x1, #0x82e
   0xffff000050f17f84: bl       #0xffff000050f29978
   0xffff000050f17f88: adrp     x1, #0xffff000050fd3000
   0xffff000050f17f8c: mov      w0, wzr
   0xffff000050f17f90: add      x1, x1, #0x88a
   0xffff000050f17f94: bl       #0xffff000050f36658
   0xffff000050f17f98: cmp      x0, #1
   0xffff000050f17f9c: b.ne     #0xffff000050f18004
   0xffff000050f17fa0: adrp     x1, #0xffff000050fd3000
   0xffff000050f17fa4: add      x2, x29, #0x1c
   0xffff000050f17fa8: add      x1, x1, #0x88a
   0xffff000050f17fac: mov      w0, wzr
   0xffff000050f17fb0: mov      w3, #1
   0xffff000050f17fb4: bl       #0xffff000050f3659c
   0xffff000050f17fb8: cbz      x0, #0xffff000050f18004
   0xffff000050f17fbc: ldrb     w8, [x29, #0x1c]
   0xffff000050f17fc0: cbnz     w8, #0xffff000050f18004
   0xffff000050f17fc4: adrp     x2, #0xffff000050fde000
   0xffff000050f17fc8: add      x3, sp, #0x10
   0xffff000050f17fcc: add      x2, x2, #0x6b
   0xffff000050f17fd0: mov      x0, x19
   0xffff000050f17fd4: mov      w1, w20
   0xffff000050f17fd8: mov      w4, #4
   0xffff000050f17fdc: str      wzr, [sp, #0x10]
   0xffff000050f17fe0: bl       #0xffff000050f7c87c
   0xffff000050f17fe4: cbz      w0, #0xffff000050f17ff4
   0xffff000050f17fe8: adrp     x1, #0xffff000050fed000
   0xffff000050f17fec: add      x1, x1, #0xf79
   0xffff000050f17ff0: b        #0xffff000050f17d9c
   0xffff000050f17ff4: adrp     x1, #0xffff000050fef000
   0xffff000050f17ff8: mov      w0, #1
   0xffff000050f17ffc: add      x1, x1, #0x7eb
   0xffff000050f18000: bl       #0xffff000050f29978
   0xffff000050f18004: adrp     x1, #0xffff000050fdd000
   0xffff000050f18008: sub      x2, x29, #0x20
   0xffff000050f1800c: add      x1, x1, #0xfb4
   0xffff000050f18010: mov      w0, wzr
   0xffff000050f18014: mov      w3, #0x11
   0xffff000050f18018: bl       #0xffff000050f38024
   0xffff000050f1801c: cbz      x0, #0xffff000050f18068
   0xffff000050f18020: sub      x0, x29, #0x20
   0xffff000050f18024: bl       #0xffff000050f8e61c
   0xffff000050f18028: adrp     x2, #0xffff000050fd0000
   0xffff000050f1802c: add      w4, w0, #1
   0xffff000050f18030: add      x2, x2, #0x7b2
   0xffff000050f18034: sub      x3, x29, #0x20
   0xffff000050f18038: mov      x0, x19
   0xffff000050f1803c: mov      w1, w20
   0xffff000050f18040: bl       #0xffff000050f7c87c
   0xffff000050f18044: cbz      w0, #0xffff000050f18054
   0xffff000050f18048: adrp     x1, #0xffff000050ff5000
   0xffff000050f1804c: add      x1, x1, #0xd90
   0xffff000050f18050: b        #0xffff000050f17d9c
   0xffff000050f18054: adrp     x1, #0xffff000050fec000
   0xffff000050f18058: sub      x2, x29, #0x20
   0xffff000050f1805c: add      x1, x1, #0x767
   0xffff000050f18060: mov      w0, #2
   0xffff000050f18064: bl       #0xffff000050f29978
   0xffff000050f18068: adrp     x1, #0xffff000050fe7000
   0xffff000050f1806c: add      x2, sp, #0x28
   0xffff000050f18070: add      x1, x1, #0x6ee
   0xffff000050f18074: mov      w0, wzr
   0xffff000050f18078: mov      w3, #0x11
   0xffff000050f1807c: bl       #0xffff000050f38024
   0xffff000050f18080: cbz      x0, #0xffff000050f180cc
   0xffff000050f18084: add      x0, sp, #0x28
   0xffff000050f18088: bl       #0xffff000050f8e61c
   0xffff000050f1808c: adrp     x2, #0xffff000050fdf000
   0xffff000050f18090: add      w4, w0, #1
>> 0xffff000050f18094: add      x2, x2, #0xba1
   0xffff000050f18098: add      x3, sp, #0x28
   0xffff000050f1809c: mov      x0, x19
   0xffff000050f180a0: mov      w1, w20
   0xffff000050f180a4: bl       #0xffff000050f7c87c
   0xffff000050f180a8: cbz      w0, #0xffff000050f180b8
   0xffff000050f180ac: adrp     x1, #0xffff000050fd0000
   0xffff000050f180b0: add      x1, x1, #0x7be
   0xffff000050f180b4: b        #0xffff000050f17d9c
   0xffff000050f180b8: adrp     x1, #0xffff000050fdc000
   0xffff000050f180bc: add      x2, sp, #0x28
   0xffff000050f180c0: add      x1, x1, #0x565
   0xffff000050f180c4: mov      w0, #2
   0xffff000050f180c8: bl       #0xffff000050f29978
   0xffff000050f180cc: bl       #0xffff000050f73590
   0xffff000050f180d0: adrp     x2, #0xffff000050fd3000
   0xffff000050f180d4: mov      x22, x0
   0xffff000050f180d8: add      x2, x2, #0x88e
   0xffff000050f180dc: mov      x0, x19
   0xffff000050f180e0: mov      w1, w20
   0xffff000050f180e4: bl       #0xffff000050f7cc14
   0xffff000050f180e8: mov      w21, w0
   0xffff000050f180ec: adrp     x2, #0xffff000050fe9000
   0xffff000050f180f0: add      x2, x2, #0x135
   0xffff000050f180f4: add      x4, sp, #0x10
   0xffff000050f180f8: mov      x0, x19
   0xffff000050f180fc: mov      w1, w21
   0xffff000050f18100: mov      w3, #0x100
   0xffff000050f18104: bl       #0xffff000050f7c4cc
   0xffff000050f18108: cbnz     w0, #0xffff000050f18234
   0xffff000050f1810c: adrp     x2, #0xffff000050ffa000
   0xffff000050f18110: mov      w8, #0x6000000
   0xffff000050f18114: add      x2, x2, #0x5da
   0xffff000050f18118: add      x3, sp, #8
   0xffff000050f1811c: mov      x0, x19
   0xffff000050f18120: mov      w1, w21
   0xffff000050f18124: mov      w4, #4
   0xffff000050f18128: str      w8, [sp, #8]
   0xffff000050f1812c: bl       #0xffff000050f7c87c
   0xffff000050f18130: ldr      w8, [x22, #0x10]
   0xffff000050f18134: adrp     x2, #0xffff000050ff7000
   0xffff000050f18138: add      x2, x2, #0x457
   0xffff000050f1813c: add      x3, sp, #8
   0xffff000050f18140: mov      x0, x19
   0xffff000050f18144: mov      w1, w21
   0xffff000050f18148: rev      w8, w8
   0xffff000050f1814c: mov      w4, #4
   0xffff000050f18150: str      w8, [sp, #8]
   0xffff000050f18154: bl       #0xffff000050f7c87c
   0xffff000050f18158: ldr      w8, [x22]
   0xffff000050f1815c: adrp     x2, #0xffff000050fe7000
   0xffff000050f18160: add      x2, x2, #0x865
   0xffff000050f18164: add      x3, sp, #8
   0xffff000050f18168: mov      x0, x19
   0xffff000050f1816c: mov      w1, w21
   0xffff000050f18170: rev      w8, w8
   0xffff000050f18174: mov      w4, #4
   0xffff000050f18178: str      w8, [sp, #8]
   0xffff000050f1817c: bl       #0xffff000050f7c87c
   0xffff000050f18180: ldr      w8, [x22, #4]
   0xffff000050f18184: adrp     x2, #0xffff000050fe7000
   0xffff000050f18188: add      x2, x2, #0x869
   0xffff000050f1818c: add      x3, sp, #8
   0xffff000050f18190: mov      x0, x19
   0xffff000050f18194: mov      w1, w21
   0xffff000050f18198: rev      w8, w8
   0xffff000050f1819c: mov      w4, #4
   0xffff000050f181a0: str      w8, [sp, #8]
   0xffff000050f181a4: bl       #0xffff000050f7c87c
   0xffff000050f181a8: ldr      w8, [x22, #8]
   0xffff000050f181ac: adrp     x2, #0xffff000050ff2000
   0xffff000050f181b0: add      x2, x2, #0xb01
   0xffff000050f181b4: add      x3, sp, #8
   0xffff000050f181b8: mov      x0, x19
   0xffff000050f181bc: mov      w1, w21
   0xffff000050f181c0: rev      w8, w8
   0xffff000050f181c4: mov      w4, #4
   0xffff000050f181c8: str      w8, [sp, #8]
   0xffff000050f181cc: bl       #0xffff000050f7c87c
   0xffff000050f181d0: ldr      w8, [x22, #0xc]
   0xffff000050f181d4: adrp     x2, #0xffff000050fd9000
   0xffff000050f181d8: add      x2, x2, #0x849
   0xffff000050f181dc: add      x3, sp, #8
   0xffff000050f181e0: mov      x0, x19
   0xffff000050f181e4: mov      w1, w21
   0xffff000050f181e8: rev      w8, w8
   0xffff000050f181ec: mov      w4, #4
   0xffff000050f181f0: str      w8, [sp, #8]
   0xffff000050f181f4: bl       #0xffff000050f7c87c
   0xffff000050f181f8: adrp     x2, #0xffff000050fd6000
   0xffff000050f181fc: mov      x0, x19
   0xffff000050f18200: add      x2, x2, #0xa9d
   0xffff000050f18204: mov      w1, w20
   0xffff000050f18208: stp      xzr, xzr, [sp, #0x10]
   0xffff000050f1820c: bl       #0xffff000050f7cc14
   0xffff000050f18210: mov      w21, w0
   0xffff000050f18214: adrp     x2, #0xffff000050fe9000
   0xffff000050f18218: add      x2, x2, #0x135
   0xffff000050f1821c: add      x4, sp, #8
   0xffff000050f18220: mov      x0, x19
   0xffff000050f18224: mov      w1, w21
   0xffff000050f18228: mov      w3, #0x100
   0xffff000050f1822c: bl       #0xffff000050f7c4cc
   0xffff000050f18230: cbz      w0, #0xffff000050f18240
   0xffff000050f18234: adrp     x1, #0xffff000050fd5000
   0xffff000050f18238: add      x1, x1, #0x182
   0xffff000050f1823c: b        #0xffff000050f17d9c
   0xffff000050f18240: bl       #0xffff000050f030dc
   0xffff000050f18244: mov      x22, x0
   0xffff000050f18248: bl       #0xffff000050f030dc
   0xffff000050f1824c: bl       #0xffff000050f8e61c
   0xffff000050f18250: adrp     x2, #0xffff000050ffa000
   0xffff000050f18254: add      w4, w0, #1
   0xffff000050f18258: add      x2, x2, #0x5da
   0xffff000050f1825c: mov      x0, x19
   0xffff000050f18260: mov      w1, w21
   0xffff000050f18264: mov      x3, x22
   0xffff000050f18268: bl       #0xffff000050f7c87c
   0xffff000050f1826c: bl       #0xffff000050f030fc
   0xffff000050f18270: adrp     x2, #0xffff000050fec000
   0xffff000050f18274: mov      w3, w0
   0xffff000050f18278: add      x2, x2, #0x780
   0xffff000050f1827c: add      x0, sp, #0x10
   0xffff000050f18280: mov      w1, #0x10
   0xffff000050f18284: bl       #0xffff000050f8c89c
   0xffff000050f18288: add      x0, sp, #0x10
   0xffff000050f1828c: bl       #0xffff000050f8e61c
   0xffff000050f18290: adrp     x2, #0xffff000050fe4000
   0xffff000050f18294: add      w4, w0, #1
   0xffff000050f18298: add      x2, x2, #0x74e
   0xffff000050f1829c: add      x3, sp, #0x10
   0xffff000050f182a0: mov      x0, x19
   0xffff000050f182a4: mov      w1, w21
   0xffff000050f182a8: bl       #0xffff000050f7c87c
   0xffff000050f182ac: bl       #0xffff000050f03148
   0xffff000050f182b0: mov      x22, x0
   0xffff000050f182b4: bl       #0xffff000050f03148
   0xffff000050f182b8: bl       #0xffff000050f8e61c
   0xffff000050f182bc: adrp     x2, #0xffff000050ffd000
   0xffff000050f182c0: add      w4, w0, #1
   0xffff000050f182c4: add      x2, x2, #0xb8d
   0xffff000050f182c8: mov      x0, x19
   0xffff000050f182cc: mov      w1, w21
   0xffff000050f182d0: mov      x3, x22
   0xffff000050f182d4: bl       #0xffff000050f7c87c
   0xffff000050f182d8: bl       #0xffff000050f03128
   0xffff000050f182dc: mov      x22, x0
   0xffff000050f182e0: bl       #0xffff000050f03128
   0xffff000050f182e4: bl       #0xffff000050f8e61c
   0xffff000050f182e8: adrp     x2, #0xffff000050fdd000
   0xffff000050f182ec: add      w4, w0, #1
   0xffff000050f182f0: add      x2, x2, #0xc2d
   0xffff000050f182f4: mov      x0, x19
   0xffff000050f182f8: mov      w1, w21
   0xffff000050f182fc: mov      x3, x22
   0xffff000050f18300: bl       #0xffff000050f7c87c
   0xffff000050f18304: bl       #0xffff000050f03108
   0xffff000050f18308: mov      x22, x0
   0xffff000050f1830c: bl       #0xffff000050f03108
   0xffff000050f18310: bl       #0xffff000050f8e61c
   0xffff000050f18314: adrp     x2, #0xffff000050fdf000
   0xffff000050f18318: add      w4, w0, #1
   0xffff000050f1831c: add      x2, x2, #0xbac
   0xffff000050f18320: mov      x0, x19
   0xffff000050f18324: mov      w1, w21
   0xffff000050f18328: mov      x3, x22
   0xffff000050f1832c: bl       #0xffff000050f7c87c
   0xffff000050f18330: mov      w0, #1
   0xffff000050f18334: mov      x1, x19
   0xffff000050f18338: mov      w2, w20
   0xffff000050f1833c: bl       #0xffff000050f27504
   0xffff000050f18340: b        #0xffff000050f17da4
   0xffff000050f18344: adrp     x8, #0xffff000050ffa000
   0xffff000050f18348: cmp      w0, #0
   0xffff000050f1834c: add      x8, x8, #0x2ad
   0xffff000050f18350: adrp     x9, #0xffff000050fcf000
   0xffff000050f18354: add      x9, x9, #0x23b
   0xffff000050f18358: csel     x8, x8, xzr, eq
   0xffff000050f1835c: cmp      w0, #1
   0xffff000050f18360: csel     x0, x9, x8, eq
   0xffff000050f18364: ret      
