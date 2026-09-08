; candidate function around xref 0xffff000050f07f24 to 'nvdata'
; estimated range 0xffff000050f07e8c-0xffff000050f0825c

   0xffff000050f07e8c: stp      x29, x30, [sp, #-0x40]!
   0xffff000050f07e90: str      x23, [sp, #0x10]
   0xffff000050f07e94: mov      x29, sp
   0xffff000050f07e98: stp      x22, x21, [sp, #0x20]
   0xffff000050f07e9c: stp      x20, x19, [sp, #0x30]
   0xffff000050f07ea0: adrp     x8, #0xffff000051023000
   0xffff000050f07ea4: mov      x21, x0
   0xffff000050f07ea8: adrp     x0, #0xffff000050fe5000
   0xffff000050f07eac: mov      x20, x1
   0xffff000050f07eb0: add      x0, x0, #0xb88
   0xffff000050f07eb4: mov      w1, wzr
   0xffff000050f07eb8: ldr      x8, [x8, #0x160]
   0xffff000050f07ebc: mov      w19, w2
   0xffff000050f07ec0: blr      x8
   0xffff000050f07ec4: mov      x8, x21
   0xffff000050f07ec8: ldrb     w9, [x8]
   0xffff000050f07ecc: cbz      w9, #0xffff000050f07ef4
   0xffff000050f07ed0: cmp      w9, #0x3a
   0xffff000050f07ed4: b.eq     #0xffff000050f07ef0
   0xffff000050f07ed8: cmp      w9, #0x20
   0xffff000050f07edc: b.eq     #0xffff000050f07ef0
   0xffff000050f07ee0: add      x8, x8, #1
   0xffff000050f07ee4: ldrb     w9, [x8]
   0xffff000050f07ee8: cbnz     w9, #0xffff000050f07ed0
   0xffff000050f07eec: b        #0xffff000050f07ef4
   0xffff000050f07ef0: strb     wzr, [x8]
   0xffff000050f07ef4: adrp     x1, #0xffff000050fdd000
   0xffff000050f07ef8: mov      x0, x21
   0xffff000050f07efc: add      x1, x1, #0xd49
   0xffff000050f07f00: bl       #0xffff000050f8e3ec
   0xffff000050f07f04: cbz      w0, #0xffff000050f08050
   0xffff000050f07f08: adrp     x1, #0xffff000050ff2000
   0xffff000050f07f0c: mov      x0, x21
   0xffff000050f07f10: add      x1, x1, #0x7c4
   0xffff000050f07f14: bl       #0xffff000050f8e3ec
   0xffff000050f07f18: cbz      w0, #0xffff000050f08058
   0xffff000050f07f1c: adrp     x1, #0xffff000050fe1000
   0xffff000050f07f20: mov      x0, x21
>> 0xffff000050f07f24: add      x1, x1, #0x1c0
   0xffff000050f07f28: bl       #0xffff000050f8e3ec
   0xffff000050f07f2c: cbz      w0, #0xffff000050f08060
   0xffff000050f07f30: adrp     x1, #0xffff000050fd7000
   0xffff000050f07f34: mov      x0, x21
   0xffff000050f07f38: add      x1, x1, #0xd51
   0xffff000050f07f3c: bl       #0xffff000050f8e3ec
   0xffff000050f07f40: cbz      w0, #0xffff000050f08068
   0xffff000050f07f44: adrp     x1, #0xffff000050ffa000
   0xffff000050f07f48: mov      x0, x21
   0xffff000050f07f4c: add      x1, x1, #0x2ad
   0xffff000050f07f50: bl       #0xffff000050f8e3ec
   0xffff000050f07f54: cbz      w0, #0xffff000050f08070
   0xffff000050f07f58: adrp     x1, #0xffff000050fef000
   0xffff000050f07f5c: mov      x0, x21
   0xffff000050f07f60: add      x1, x1, #0x4de
   0xffff000050f07f64: bl       #0xffff000050f8e3ec
   0xffff000050f07f68: cbz      w0, #0xffff000050f08078
   0xffff000050f07f6c: adrp     x1, #0xffff000050fe4000
   0xffff000050f07f70: mov      x0, x21
   0xffff000050f07f74: add      x1, x1, #0x526
   0xffff000050f07f78: bl       #0xffff000050f8e3ec
   0xffff000050f07f7c: cbz      w0, #0xffff000050f08080
   0xffff000050f07f80: adrp     x1, #0xffff000050fdf000
   0xffff000050f07f84: mov      x0, x21
   0xffff000050f07f88: add      x1, x1, #0x9fa
   0xffff000050f07f8c: bl       #0xffff000050f8e3ec
   0xffff000050f07f90: cbz      w0, #0xffff000050f08088
   0xffff000050f07f94: adrp     x1, #0xffff000050fef000
   0xffff000050f07f98: mov      x0, x21
   0xffff000050f07f9c: add      x1, x1, #0x4e5
   0xffff000050f07fa0: bl       #0xffff000050f8e3ec
   0xffff000050f07fa4: cbz      w0, #0xffff000050f08090
   0xffff000050f07fa8: adrp     x1, #0xffff000050ffd000
   0xffff000050f07fac: mov      x0, x21
   0xffff000050f07fb0: add      x1, x1, #0x831
   0xffff000050f07fb4: bl       #0xffff000050f8e3ec
   0xffff000050f07fb8: cbz      w0, #0xffff000050f08098
   0xffff000050f07fbc: adrp     x1, #0xffff000050fe7000
   0xffff000050f07fc0: mov      x0, x21
   0xffff000050f07fc4: add      x1, x1, #0x4e8
   0xffff000050f07fc8: bl       #0xffff000050f8e3ec
   0xffff000050f07fcc: cbz      w0, #0xffff000050f080a0
   0xffff000050f07fd0: adrp     x1, #0xffff000050fe2000
   0xffff000050f07fd4: mov      x0, x21
   0xffff000050f07fd8: add      x1, x1, #0xadc
   0xffff000050f07fdc: bl       #0xffff000050f8e3ec
   0xffff000050f07fe0: cbz      w0, #0xffff000050f080a8
   0xffff000050f07fe4: adrp     x1, #0xffff000050fea000
   0xffff000050f07fe8: mov      x0, x21
   0xffff000050f07fec: add      x1, x1, #0xa4a
   0xffff000050f07ff0: bl       #0xffff000050f8e3ec
   0xffff000050f07ff4: cbz      w0, #0xffff000050f080b0
   0xffff000050f07ff8: adrp     x1, #0xffff000050fe7000
   0xffff000050f07ffc: mov      x0, x21
   0xffff000050f08000: add      x1, x1, #0x4f3
   0xffff000050f08004: bl       #0xffff000050f8e3ec
   0xffff000050f08008: cbz      w0, #0xffff000050f080b8
   0xffff000050f0800c: adrp     x1, #0xffff000050ff2000
   0xffff000050f08010: mov      x0, x21
   0xffff000050f08014: add      x1, x1, #0x7ca
   0xffff000050f08018: bl       #0xffff000050f8e3ec
   0xffff000050f0801c: cbz      w0, #0xffff000050f080c0
   0xffff000050f08020: adrp     x1, #0xffff000050ffb000
   0xffff000050f08024: mov      x0, x21
   0xffff000050f08028: add      x1, x1, #0xc54
   0xffff000050f0802c: bl       #0xffff000050f8e3ec
   0xffff000050f08030: cbz      w0, #0xffff000050f080c8
   0xffff000050f08034: adrp     x1, #0xffff000050ffd000
   0xffff000050f08038: mov      x0, x21
   0xffff000050f0803c: add      x1, x1, #0x83a
   0xffff000050f08040: bl       #0xffff000050f8e3ec
   0xffff000050f08044: cbz      w0, #0xffff000050f080d0
   0xffff000050f08048: mov      w0, #-1
   0xffff000050f0804c: b        #0xffff000050f0824c
   0xffff000050f08050: mov      w8, wzr
   0xffff000050f08054: b        #0xffff000050f080d4
   0xffff000050f08058: mov      w8, #1
   0xffff000050f0805c: b        #0xffff000050f080d4
   0xffff000050f08060: mov      w8, #2
   0xffff000050f08064: b        #0xffff000050f080d4
   0xffff000050f08068: mov      w8, #3
   0xffff000050f0806c: b        #0xffff000050f080d4
   0xffff000050f08070: mov      w8, #4
   0xffff000050f08074: b        #0xffff000050f080d4
   0xffff000050f08078: mov      w8, #5
   0xffff000050f0807c: b        #0xffff000050f080d4
   0xffff000050f08080: mov      w8, #6
   0xffff000050f08084: b        #0xffff000050f080d4
   0xffff000050f08088: mov      w8, #7
   0xffff000050f0808c: b        #0xffff000050f080d4
   0xffff000050f08090: mov      w8, #8
   0xffff000050f08094: b        #0xffff000050f080d4
   0xffff000050f08098: mov      w8, #9
   0xffff000050f0809c: b        #0xffff000050f080d4
   0xffff000050f080a0: mov      w8, #0xa
   0xffff000050f080a4: b        #0xffff000050f080d4
   0xffff000050f080a8: mov      w8, #0xb
   0xffff000050f080ac: b        #0xffff000050f080d4
   0xffff000050f080b0: mov      w8, #0xc
   0xffff000050f080b4: b        #0xffff000050f080d4
   0xffff000050f080b8: mov      w8, #0xd
   0xffff000050f080bc: b        #0xffff000050f080d4
   0xffff000050f080c0: mov      w8, #0xe
   0xffff000050f080c4: b        #0xffff000050f080d4
   0xffff000050f080c8: mov      w8, #0xf
   0xffff000050f080cc: b        #0xffff000050f080d4
   0xffff000050f080d0: mov      w8, #0x10
   0xffff000050f080d4: mov      w22, w8
   0xffff000050f080d8: adrp     x23, #0xffff000051001000
   0xffff000050f080dc: lsl      x8, x22, #4
   0xffff000050f080e0: add      x23, x23, #0x6c0
   0xffff000050f080e4: ldr      x0, [x23, x8]
   0xffff000050f080e8: bl       #0xffff000050f8e61c
   0xffff000050f080ec: adrp     x8, #0xffff000051052000
   0xffff000050f080f0: adrp     x10, #0xffff000051052000
   0xffff000050f080f4: add      x9, x21, x0
   0xffff000050f080f8: add      x10, x10, #0x398
   0xffff000050f080fc: mov      w0, #1
   0xffff000050f08100: ldr      w8, [x8, #0x290]
   0xffff000050f08104: str      x9, [x10, #0x10]
   0xffff000050f08108: str      x20, [x10]
   0xffff000050f0810c: stp      w8, w19, [x10, #8]
   0xffff000050f08110: bl       #0xffff000050f078d8
   0xffff000050f08114: adrp     x8, #0xffff000051023000
   0xffff000050f08118: ldr      x8, [x8, #0x178]
   0xffff000050f0811c: blr      x8
   0xffff000050f08120: adrp     x20, #0xffff000051052000
   0xffff000050f08124: add      x20, x20, #0x3b0
   0xffff000050f08128: ldr      x21, [x20, #8]
   0xffff000050f0812c: cmp      x21, x20
   0xffff000050f08130: b.eq     #0xffff000050f08178
   0xffff000050f08134: adrp     x19, #0xffff000051052000
   0xffff000050f08138: add      x19, x19, #0x398
   0xffff000050f0813c: b        #0xffff000050f0814c
   0xffff000050f08140: ldr      x21, [x21, #8]
   0xffff000050f08144: cmp      x21, x20
   0xffff000050f08148: b.eq     #0xffff000050f08178
   0xffff000050f0814c: ldr      w8, [x21, #0x10]
   0xffff000050f08150: cmp      w8, w22
   0xffff000050f08154: b.ne     #0xffff000050f08140
   0xffff000050f08158: ldr      x8, [x21, #0x18]
   0xffff000050f0815c: cbz      x8, #0xffff000050f08140
   0xffff000050f08160: mov      x0, x19
   0xffff000050f08164: blr      x8
   0xffff000050f08168: cbz      w0, #0xffff000050f08208
   0xffff000050f0816c: cmp      w0, #3
   0xffff000050f08170: b.ne     #0xffff000050f08140
   0xffff000050f08174: b        #0xffff000050f081f4
   0xffff000050f08178: add      x8, x23, x22, lsl #4
   0xffff000050f0817c: adrp     x0, #0xffff000051052000
   0xffff000050f08180: add      x0, x0, #0x398
   0xffff000050f08184: ldr      x8, [x8, #8]
   0xffff000050f08188: blr      x8
   0xffff000050f0818c: cbz      w0, #0xffff000050f08208
   0xffff000050f08190: cmp      w0, #3
   0xffff000050f08194: b.eq     #0xffff000050f081f4
   0xffff000050f08198: cmp      w0, #5
   0xffff000050f0819c: b.eq     #0xffff000050f0821c
   0xffff000050f081a0: adrp     x20, #0xffff000051052000
   0xffff000050f081a4: add      x20, x20, #0x3c0
   0xffff000050f081a8: ldr      x21, [x20, #8]
   0xffff000050f081ac: cmp      x21, x20
   0xffff000050f081b0: b.eq     #0xffff000050f08200
   0xffff000050f081b4: adrp     x19, #0xffff000051052000
   0xffff000050f081b8: add      x19, x19, #0x398
   0xffff000050f081bc: b        #0xffff000050f081cc
   0xffff000050f081c0: ldr      x21, [x21, #8]
   0xffff000050f081c4: cmp      x21, x20
   0xffff000050f081c8: b.eq     #0xffff000050f08200
   0xffff000050f081cc: ldr      w8, [x21, #0x10]
   0xffff000050f081d0: cmp      w8, w22
   0xffff000050f081d4: b.ne     #0xffff000050f081c0
   0xffff000050f081d8: ldr      x8, [x21, #0x18]
   0xffff000050f081dc: cbz      x8, #0xffff000050f081c0
   0xffff000050f081e0: mov      x0, x19
   0xffff000050f081e4: blr      x8
   0xffff000050f081e8: cbz      w0, #0xffff000050f08208
   0xffff000050f081ec: cmp      w0, #3
   0xffff000050f081f0: b.ne     #0xffff000050f081c0
   0xffff000050f081f4: adrp     x0, #0xffff000050ffa000
   0xffff000050f081f8: add      x0, x0, #0x223
   0xffff000050f081fc: b        #0xffff000050f08210
   0xffff000050f08200: cmp      w0, #2
   0xffff000050f08204: b.eq     #0xffff000050f0821c
   0xffff000050f08208: adrp     x0, #0xffff000050fd4000
   0xffff000050f0820c: add      x0, x0, #0xdba
   0xffff000050f08210: adrp     x1, #0xffff000050ff8000
   0xffff000050f08214: add      x1, x1, #0x773
   0xffff000050f08218: bl       #0xffff000050f07b68
   0xffff000050f0821c: adrp     x8, #0xffff000051023000
   0xffff000050f08220: ldr      x8, [x8, #0x180]
   0xffff000050f08224: blr      x8
   0xffff000050f08228: bl       #0xffff000050f078cc
   0xffff000050f0822c: cmp      w0, #1
   0xffff000050f08230: b.ne     #0xffff000050f08248
   0xffff000050f08234: adrp     x0, #0xffff000050ffa000
   0xffff000050f08238: adrp     x1, #0xffff000050ff5000
   0xffff000050f0823c: add      x0, x0, #0x223
   0xffff000050f08240: add      x1, x1, #0xb34
   0xffff000050f08244: bl       #0xffff000050f07b68
   0xffff000050f08248: mov      w0, wzr
   0xffff000050f0824c: ldp      x20, x19, [sp, #0x30]
   0xffff000050f08250: ldp      x22, x21, [sp, #0x20]
   0xffff000050f08254: ldr      x23, [sp, #0x10]
   0xffff000050f08258: ldp      x29, x30, [sp], #0x40
   0xffff000050f0825c: ret      
