; candidate function around xref 0xffff000050f26cf0 to 'userdata'
; estimated range 0xffff000050f26aa4-0xffff000050f26d2c

   0xffff000050f26aa4: sub      sp, sp, #0x90
   0xffff000050f26aa8: stp      x29, x30, [sp, #0x30]
   0xffff000050f26aac: add      x29, sp, #0x30
   0xffff000050f26ab0: stp      x28, x27, [sp, #0x40]
   0xffff000050f26ab4: stp      x26, x25, [sp, #0x50]
   0xffff000050f26ab8: stp      x24, x23, [sp, #0x60]
   0xffff000050f26abc: stp      x22, x21, [sp, #0x70]
   0xffff000050f26ac0: stp      x20, x19, [sp, #0x80]
   0xffff000050f26ac4: adrp     x8, #0xffff000051058000
   0xffff000050f26ac8: stur     xzr, [sp, #0x25]
   0xffff000050f26acc: stp      xzr, xzr, [sp, #0x18]
   0xffff000050f26ad0: stp      xzr, xzr, [sp, #8]
   0xffff000050f26ad4: ldrb     w8, [x8, #0xa41]
   0xffff000050f26ad8: tbz      w8, #0, #0xffff000050f26b18
   0xffff000050f26adc: mov      x19, x0
   0xffff000050f26ae0: cbz      x0, #0xffff000050f26b30
   0xffff000050f26ae4: adrp     x21, #0xffff000051058000
   0xffff000050f26ae8: add      x21, x21, #0xa48
   0xffff000050f26aec: ldr      x20, [x21, #8]
   0xffff000050f26af0: cmp      x20, x21
   0xffff000050f26af4: b.eq     #0xffff000050f26b60
   0xffff000050f26af8: ldrb     w22, [x20, #0x10]
   0xffff000050f26afc: bl       #0xffff000050f26434
   0xffff000050f26b00: cmp      w22, w0, uxtb
   0xffff000050f26b04: b.eq     #0xffff000050f26b50
   0xffff000050f26b08: ldr      x20, [x20, #8]
   0xffff000050f26b0c: cmp      x20, x21
   0xffff000050f26b10: b.ne     #0xffff000050f26af8
   0xffff000050f26b14: b        #0xffff000050f26b60
   0xffff000050f26b18: adrp     x1, #0xffff000050fde000
   0xffff000050f26b1c: mov      w0, #-1
   0xffff000050f26b20: add      x1, x1, #0x1bb
   0xffff000050f26b24: mov      w19, #-1
   0xffff000050f26b28: bl       #0xffff000050f29978
   0xffff000050f26b2c: b        #0xffff000050f26d0c
   0xffff000050f26b30: adrp     x1, #0xffff000050ff4000
   0xffff000050f26b34: adrp     x2, #0xffff000050ffd000
   0xffff000050f26b38: add      x1, x1, #0x477
   0xffff000050f26b3c: add      x2, x2, #0xc88
   0xffff000050f26b40: mov      w0, #-1
   0xffff000050f26b44: mov      w19, #-1
   0xffff000050f26b48: bl       #0xffff000050f29978
   0xffff000050f26b4c: b        #0xffff000050f26d0c
   0xffff000050f26b50: ldr      x1, [x20, #0x18]
   0xffff000050f26b54: mov      x0, x19
   0xffff000050f26b58: mov      w2, #0x8000
   0xffff000050f26b5c: bl       #0xffff000050f8def4
   0xffff000050f26b60: adrp     x8, #0xffff000051058000
   0xffff000050f26b64: mov      w11, #8
   0xffff000050f26b68: ldr      w8, [x8, #0xa78]
   0xffff000050f26b6c: add      x10, x19, x8
   0xffff000050f26b70: lsl      w8, w8, #1
   0xffff000050f26b74: add      x22, x19, x8
   0xffff000050f26b78: ldr      w9, [x10, #0x50]
   0xffff000050f26b7c: str      x11, [x10, #0x20]
   0xffff000050f26b80: str      wzr, [x10, #0x10]
   0xffff000050f26b84: str      xzr, [x10, #0x30]
   0xffff000050f26b88: subs     w11, w9, #1
   0xffff000050f26b8c: str      wzr, [x10, #0x58]
   0xffff000050f26b90: b.mi     #0xffff000050f26c2c
   0xffff000050f26b94: add      x12, x22, x11, lsl #7
   0xffff000050f26b98: ldrb     w12, [x12, #0x37]
   0xffff000050f26b9c: tbz      w12, #5, #0xffff000050f26be0
   0xffff000050f26ba0: add      x12, x22, x11, lsl #7
   0xffff000050f26ba4: subs     w11, w9, #2
   0xffff000050f26ba8: stp      xzr, xzr, [x12, #0x70]
   0xffff000050f26bac: stp      xzr, xzr, [x12, #0x60]
   0xffff000050f26bb0: stp      xzr, xzr, [x12, #0x50]
   0xffff000050f26bb4: stp      xzr, xzr, [x12, #0x40]
   0xffff000050f26bb8: stp      xzr, xzr, [x12, #0x30]
   0xffff000050f26bbc: stp      xzr, xzr, [x12, #0x20]
   0xffff000050f26bc0: stp      xzr, xzr, [x12, #0x10]
   0xffff000050f26bc4: stp      xzr, xzr, [x12]
   0xffff000050f26bc8: b.mi     #0xffff000050f26c28
   0xffff000050f26bcc: add      x12, x22, x11, lsl #7
   0xffff000050f26bd0: sub      w9, w9, #1
   0xffff000050f26bd4: ldrb     w12, [x12, #0x37]
   0xffff000050f26bd8: tbnz     w12, #5, #0xffff000050f26ba0
   0xffff000050f26bdc: sub      w11, w9, #1
   0xffff000050f26be0: mov      w12, w11
   0xffff000050f26be4: str      w9, [x10, #0x50]
   0xffff000050f26be8: add      x11, x12, #1
   0xffff000050f26bec: add      x12, x8, x12, lsl #7
   0xffff000050f26bf0: add      x12, x12, x19
   0xffff000050f26bf4: add      x12, x12, #0x28
   0xffff000050f26bf8: b        #0xffff000050f26c0c
   0xffff000050f26bfc: sub      x11, x11, #1
   0xffff000050f26c00: sub      x12, x12, #0x80
   0xffff000050f26c04: cmp      x11, #0
   0xffff000050f26c08: b.le     #0xffff000050f26c30
   0xffff000050f26c0c: ldur     x10, [x12, #-8]
   0xffff000050f26c10: cbz      x10, #0xffff000050f26bfc
   0xffff000050f26c14: ldr      x13, [x12]
   0xffff000050f26c18: cmp      x13, x10
   0xffff000050f26c1c: b.ls     #0xffff000050f26bfc
   0xffff000050f26c20: str      x10, [x12]
   0xffff000050f26c24: b        #0xffff000050f26c30
   0xffff000050f26c28: mov      w9, wzr
   0xffff000050f26c2c: str      w9, [x10, #0x50]
   0xffff000050f26c30: subs     w9, w9, #1
   0xffff000050f26c34: b.mi     #0xffff000050f26d08
   0xffff000050f26c38: mov      x24, #0x6c66
   0xffff000050f26c3c: mov      x28, #0x7375
   0xffff000050f26c40: movk     x24, #0x7361, lsl #16
   0xffff000050f26c44: movk     x28, #0x7265, lsl #16
   0xffff000050f26c48: add      x8, x8, x19
   0xffff000050f26c4c: movk     x24, #0x6968, lsl #32
   0xffff000050f26c50: adrp     x19, #0xffff000050fe6000
   0xffff000050f26c54: movk     x28, #0x6164, lsl #32
   0xffff000050f26c58: adrp     x20, #0xffff000050ffd000
   0xffff000050f26c5c: add      x23, sp, #8
   0xffff000050f26c60: movk     x24, #0x666e, lsl #48
   0xffff000050f26c64: add      x25, x8, #0x38
   0xffff000050f26c68: mov      w26, #0x6f
   0xffff000050f26c6c: add      x19, x19, #0x19
   0xffff000050f26c70: mov      w27, #0x1000
   0xffff000050f26c74: movk     x28, #0x6174, lsl #48
   0xffff000050f26c78: add      x20, x20, #0xc88
   0xffff000050f26c7c: b        #0xffff000050f26ca4
   0xffff000050f26c80: mov      w0, #-1
   0xffff000050f26c84: mov      x1, x19
   0xffff000050f26c88: mov      x2, x20
   0xffff000050f26c8c: bl       #0xffff000050f29978
   0xffff000050f26c90: add      x8, x22, x21, lsl #7
   0xffff000050f26c94: str      x27, [x8, #0x28]
   0xffff000050f26c98: str      xzr, [x8, #0x20]
   0xffff000050f26c9c: subs     w9, w21, #1
   0xffff000050f26ca0: b.mi     #0xffff000050f26d08
   0xffff000050f26ca4: mov      w21, w9
   0xffff000050f26ca8: mov      x8, xzr
   0xffff000050f26cac: add      x9, x25, x21, lsl #7
   0xffff000050f26cb0: ldrb     w10, [x9], #2
   0xffff000050f26cb4: strb     w10, [x23, x8]
   0xffff000050f26cb8: add      x8, x8, #1
   0xffff000050f26cbc: cmp      x8, #0x24
   0xffff000050f26cc0: b.ne     #0xffff000050f26cb0
   0xffff000050f26cc4: ldr      x8, [sp, #8]
   0xffff000050f26cc8: ldrb     w9, [sp, #0x10]
   0xffff000050f26ccc: eor      x8, x8, x24
   0xffff000050f26cd0: eor      x9, x9, x26
   0xffff000050f26cd4: orr      x8, x8, x9
   0xffff000050f26cd8: cbz      x8, #0xffff000050f26c80
   0xffff000050f26cdc: ldr      x8, [sp, #8]
   0xffff000050f26ce0: cmp      x8, x28
   0xffff000050f26ce4: b.ne     #0xffff000050f26c9c
   0xffff000050f26ce8: adrp     x1, #0xffff000050fd3000
   0xffff000050f26cec: mov      w0, #-1
>> 0xffff000050f26cf0: add      x1, x1, #0x9ac
   0xffff000050f26cf4: mov      x2, x20
   0xffff000050f26cf8: bl       #0xffff000050f29978
   0xffff000050f26cfc: add      x8, x22, x21, lsl #7
   0xffff000050f26d00: str      xzr, [x8, #0x28]
   0xffff000050f26d04: b        #0xffff000050f26c98
   0xffff000050f26d08: mov      w19, wzr
   0xffff000050f26d0c: mov      w0, w19
   0xffff000050f26d10: ldp      x20, x19, [sp, #0x80]
   0xffff000050f26d14: ldp      x22, x21, [sp, #0x70]
   0xffff000050f26d18: ldp      x24, x23, [sp, #0x60]
   0xffff000050f26d1c: ldp      x26, x25, [sp, #0x50]
   0xffff000050f26d20: ldp      x28, x27, [sp, #0x40]
   0xffff000050f26d24: ldp      x29, x30, [sp, #0x30]
   0xffff000050f26d28: add      sp, sp, #0x90
   0xffff000050f26d2c: ret      
