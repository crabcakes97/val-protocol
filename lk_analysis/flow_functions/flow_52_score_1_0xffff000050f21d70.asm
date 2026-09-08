; flow candidate 0xffff000050f21d70-0xffff000050f21eac
; score: 1
; matched targets: meid
; calls: 0xffff000050f8d50c, 0xffff000050f29978, 0xffff000050f06238

   0xffff000050f21d70: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f21d74: str      x21, [sp, #0x10]
   0xffff000050f21d78: mov      x29, sp
   0xffff000050f21d7c: stp      x20, x19, [sp, #0x20]
   0xffff000050f21d80: mrs      x20, icc_iar1_el1
   0xffff000050f21d84: and      w21, w20, #0x3ff
   0xffff000050f21d88: cmp      w21, #0x3fd
   0xffff000050f21d8c: b.ls     #0xffff000050f21d98
   0xffff000050f21d90: mov      w0, wzr
   0xffff000050f21d94: b        #0xffff000050f21ea0

loc_ffff000050f21d98:
   0xffff000050f21d98: cmp      w21, #0x207
   0xffff000050f21d9c: b.ne     #0xffff000050f21e60
   0xffff000050f21da0: mov      x19, x0
   0xffff000050f21da4: adrp     x0, #0xffff000050ffb000
   0xffff000050f21da8: add      x0, x0, #0xb99
   0xffff000050f21dac: mov      x1, x19
   0xffff000050f21db0: bl       #0xffff000050f8d50c  ; call 0xffff000050f8d50c
   0xffff000050f21db4: ldp      x2, x3, [x19]
   0xffff000050f21db8: adrp     x1, #0xffff000050fec000
   0xffff000050f21dbc: mov      w0, #-1
   0xffff000050f21dc0: ldp      x4, x5, [x19, #0x10]
   0xffff000050f21dc4: add      x1, x1, #0x3a9
   0xffff000050f21dc8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21dcc: ldp      x2, x3, [x19, #0x20]
   0xffff000050f21dd0: adrp     x1, #0xffff000050fe8000
   0xffff000050f21dd4: mov      w0, #-1
   0xffff000050f21dd8: ldp      x4, x5, [x19, #0x30]
   0xffff000050f21ddc: add      x1, x1, #0xd15
   0xffff000050f21de0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21de4: ldp      x2, x3, [x19, #0x40]
   0xffff000050f21de8: adrp     x1, #0xffff000050fff000
   0xffff000050f21dec: mov      w0, #-1
   0xffff000050f21df0: ldp      x4, x5, [x19, #0x50]
   0xffff000050f21df4: add      x1, x1, #0x1e7
   0xffff000050f21df8: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21dfc: ldp      x2, x3, [x19, #0x60]
   0xffff000050f21e00: adrp     x1, #0xffff000050fdf000
   0xffff000050f21e04: mov      w0, #-1
   0xffff000050f21e08: ldp      x4, x5, [x19, #0x70]
   0xffff000050f21e0c: add      x1, x1, #0x90a
   0xffff000050f21e10: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21e14: ldp      x2, x3, [x19, #0x80]
   0xffff000050f21e18: adrp     x1, #0xffff000050ff8000
   0xffff000050f21e1c: mov      w0, #-1
   0xffff000050f21e20: ldp      x4, x5, [x19, #0x90]
   0xffff000050f21e24: add      x1, x1, #0xc22
   0xffff000050f21e28: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21e2c: adrp     x1, #0xffff000050ff0000
   0xffff000050f21e30: ldr      x2, [x19, #0xa0]
   0xffff000050f21e34: add      x1, x1, #0xd66
   0xffff000050f21e38: mov      w0, #-1
   0xffff000050f21e3c: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21e40: adrp     x1, #0xffff000050fff000
   0xffff000050f21e44: ldr      x2, [x19, #0xa8]
; XREF string 0xffff000050ff021c: 'meid' -> 'meid_hook'
>> 0xffff000050f21e48: add      x1, x1, #0x21c
   0xffff000050f21e4c: mov      w0, #-1
   0xffff000050f21e50: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f21e54: ldr      x0, [x29]
   0xffff000050f21e58: ldr      x1, [x19, #0x90]
   0xffff000050f21e5c: bl       #0xffff000050f06238  ; call 0xffff000050f06238

loc_ffff000050f21e60:
   0xffff000050f21e60: adrp     x8, #0xffff000051055000
   0xffff000050f21e64: subs     w9, w21, #0x20
   0xffff000050f21e68: adrp     x10, #0xffff000051055000
   0xffff000050f21e6c: add      x8, x8, #0xdc8
   0xffff000050f21e70: add      x10, x10, #0xfc8
   0xffff000050f21e74: add      x8, x8, w21, uxtw #4
   0xffff000050f21e78: add      x9, x10, w9, uxtw #4
   0xffff000050f21e7c: csel     x9, x8, x9, lo
   0xffff000050f21e80: ldr      x8, [x9]
   0xffff000050f21e84: cbz      x8, #0xffff000050f21e94
   0xffff000050f21e88: ldr      x0, [x9, #8]
   0xffff000050f21e8c: blr      x8
   0xffff000050f21e90: b        #0xffff000050f21e98

loc_ffff000050f21e94:
   0xffff000050f21e94: mov      w0, wzr

loc_ffff000050f21e98:
   0xffff000050f21e98: and      x8, x20, #0xffffffff
   0xffff000050f21e9c: msr      icc_eoir1_el1, x8

loc_ffff000050f21ea0:
   0xffff000050f21ea0: ldp      x20, x19, [sp, #0x20]
   0xffff000050f21ea4: ldr      x21, [sp, #0x10]
   0xffff000050f21ea8: ldp      x29, x30, [sp], #0x30
   0xffff000050f21eac: ret      
