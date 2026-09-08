; candidate function around xref 0x0000000048067daa to 'fboot_cmd_erase_permission_validate'
; estimated range 0x0000000048067da2-0x0000000048067e32

   0x0000000048067da2: push     {r3, r4, r5, r6, r7, lr}
   0x0000000048067da4: mov      r4, r0
   0x0000000048067da6: mov.w    r0, #-1
   0x0000000048067da8: adds     r0, #0xff
>> 0x0000000048067daa: add      r1, pc
   0x0000000048067dac: bl       #0x4806ff38
   0x0000000048067dae: str.w    r6, [r4, #0x8e4]
   0x0000000048067db0: ldr      r4, [r4, #0xc]
   0x0000000048067db2: movs     r2, #0x48
   0x0000000048067db4: ldr      r1, [pc, #0xd8]
   0x0000000048067db6: adds     r4, #1
   0x0000000048067db8: add      r1, pc
   0x0000000048067dba: mov      r0, r4
   0x0000000048067dbc: bl       #0x4803816c
   0x0000000048067dc0: cmp      r0, #0
   0x0000000048067dc2: beq      #0x48067e34
   0x0000000048067dc4: ldr      r1, [pc, #0xcc]
   0x0000000048067dc6: mov      r0, r4
   0x0000000048067dc8: movs     r2, #0x48
   0x0000000048067dca: add      r1, pc
   0x0000000048067dcc: bl       #0x4803816c
   0x0000000048067dce: vst4.8   {d27[4], d28[4], d29[4], d30[4]}, [lr:0x20], r8
   0x0000000048067dd0: cbz      r0, #0x48067e3a
   0x0000000048067dd2: ldr      r1, [pc, #0xc4]
   0x0000000048067dd4: mov      r0, r4
   0x0000000048067dd6: add      r1, pc
   0x0000000048067dd8: bl       #0x48037fa4
   0x0000000048067ddc: cmp      r0, #0
   0x0000000048067dde: bne      #0x48067e5c
   0x0000000048067de0: ldr      r5, [pc, #0xb8]
   0x0000000048067de2: mov      r4, r0
   0x0000000048067de4: ldr      r6, [pc, #0xb8]
   0x0000000048067de6: ldr      r7, [pc, #0xbc]
   0x0000000048067de8: add      r5, pc
   0x0000000048067dea: ldr      r5, [r5]
   0x0000000048067dec: add      r6, pc
   0x0000000048067dee: adds     r5, #0x20
   0x0000000048067df0: add      r7, pc
   0x0000000048067df2: b        #0x48067df6
   0x0000000048067df4: adds     r5, #0x5c
   0x0000000048067df6: bl       #0x4806ca94
   0x0000000048067df8: cdp2     p2, #4, c4, c13, c4, #4
   0x0000000048067dfa: cmp      r4, r0
   0x0000000048067dfc: mov      r0, r4
   0x0000000048067dfe: add.w    r4, r4, #1
   0x0000000048067e00: lsls     r1, r0, #0x10
   0x0000000048067e02: bhs      #0x48067e3e
   0x0000000048067e04: bl       #0x4806cc04
   0x0000000048067e06: mrc2     p0, #7, apsr_nzcv, c14, c10, #0
   0x0000000048067e08: bl       #0x4808288c
   0x0000000048067e0a: stc2l    p8, c2, [r0, #-0]
   0x0000000048067e0c: cmp      r0, #0
   0x0000000048067e0e: beq      #0x48067df4
   0x0000000048067e10: mov      r0, r6
   0x0000000048067e12: mov      r1, r7
   0x0000000048067e14: mov      r2, r5
   0x0000000048067e16: bl       #0x4805b64c
   0x0000000048067e1a: mov      r0, r5
   0x0000000048067e1c: bl       #0x4805bd88
   0x0000000048067e1e: vrev64.16 d3, d1
   0x0000000048067e20: adds     r0, #1
   0x0000000048067e22: bne      #0x48067df4
   0x0000000048067e24: ldr      r1, [pc, #0x80]
   0x0000000048067e26: mov      r0, r6
   0x0000000048067e28: mov      r2, r5
   0x0000000048067e2a: add      r1, pc
   0x0000000048067e2c: bl       #0x4805b64c
   0x0000000048067e30: movs     r0, #0
   0x0000000048067e32: pop      {r3, r4, r5, r6, r7, pc}
