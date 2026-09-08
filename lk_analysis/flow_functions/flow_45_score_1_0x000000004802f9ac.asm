; flow candidate 0x000000004802f9ac-0x000000004802fb12
; score: 1
; matched targets: barcode
; calls: 0x000000004806ff38, 0x00000000480651c0, 0x000000004802f7c8

   0x000000004802f9ac: push     {r4, r5, r6, lr}
   0x000000004802f9ae: cbz      r1, #0x4802f9da
   0x000000004802f9b0: ldr      r3, [pc, #0x10c]
   0x000000004802f9b2: add      r3, pc
   0x000000004802f9b4: ldr      r3, [r3]
   0x000000004802f9b6: ldr      r3, [r3, #8]
   0x000000004802f9b8: cbz      r3, #0x4802f9be
   0x000000004802f9ba: ldr      r3, [r3, #0x2c]
   0x000000004802f9bc: cbz      r3, #0x4802f9da

loc_000000004802f9be:
   0x000000004802f9be: ldr      r3, [pc, #0x104]
   0x000000004802f9c0: add      r3, pc
   0x000000004802f9c2: ldr      r1, [r3]
   0x000000004802f9c4: cbnz     r1, #0x4802f9da
   0x000000004802f9c6: cmp.w    r0, #0x116
   0x000000004802f9c8: ldrb     r3, [r1, #0x1e]
   0x000000004802f9ca: beq      #0x4802f9dc
   0x000000004802f9cc: cmp.w    r0, #0x1fe
   0x000000004802f9ce: ldrb     r7, [r7, #0x1f]
   0x000000004802f9d0: beq      #0x4802fa7e
   0x000000004802f9d2: movw     r3, #0x115
   0x000000004802f9d4: asrs     r5, r2, #0xc
   0x000000004802f9d6: cmp      r0, r3
   0x000000004802f9d8: beq      #0x4802fa34

loc_000000004802f9da:
   0x000000004802f9da: pop      {r4, r5, r6, pc}

loc_000000004802f9dc:
   0x000000004802f9dc: ldr      r3, [pc, #0xe8]
   0x000000004802f9de: add      r3, pc
   0x000000004802f9e0: ldr      r0, [r3]
   0x000000004802f9e2: cmp      r0, #0
   0x000000004802f9e4: beq      #0x4802faa6
   0x000000004802f9e6: ldr      r4, [pc, #0xe4]
   0x000000004802f9e8: ldr      r5, [pc, #0xe4]
   0x000000004802f9ea: ldr      r6, [pc, #0xe8]
   0x000000004802f9ec: ldr      r3, [pc, #0xe8]
   0x000000004802f9ee: add      r4, pc
   0x000000004802f9f0: add      r5, pc
   0x000000004802f9f2: add      r6, pc
   0x000000004802f9f4: add      r3, pc
   0x000000004802f9f6: str      r0, [r3]

loc_000000004802f9f8:
   0x000000004802f9f8: ldr      r3, [r0, #4]
   0x000000004802f9fa: cmp      r3, r4
   0x000000004802f9fc: it       ne
   0x000000004802f9fe: cmp      r3, #0
   0x000000004802fa00: mov      r0, r3
   0x000000004802fa02: itet     ne
   0x000000004802fa04: movs     r2, #1
   0x000000004802fa06: movs     r2, #0
   0x000000004802fa08: str      r3, [r5]
   0x000000004802fa0a: beq      #0x4802fa70

loc_000000004802fa0c:
   0x000000004802fa0c: ldr      r3, [r0, #0x48]
   0x000000004802fa0e: cmp      r3, #2
   0x000000004802fa10: bls      #0x4802f9f8
   0x000000004802fa12: ldr      r3, [pc, #0xc8]
   0x000000004802fa14: add.w    r2, r0, #8
   0x000000004802fa16: lsls     r0, r1, #8
   0x000000004802fa18: add      r3, pc
   0x000000004802fa1a: ldr      r3, [r3]
   0x000000004802fa1c: cmp      r3, #0
   0x000000004802fa1e: beq      #0x4802fa98
   0x000000004802fa20: adds     r3, #8

loc_000000004802fa22:
   0x000000004802fa22: ldr      r1, [pc, #0xbc]
   0x000000004802fa24: movs     r0, #1
   0x000000004802fa26: add      r1, pc
   0x000000004802fa28: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004802fa2c: pop.w    {r4, r5, r6, lr}
   0x000000004802fa2e: eors     r0, r6
   0x000000004802fa30: b.w      #0x4802f57c
   0x000000004802fa32: pop      {r2, r5, r7, pc}

loc_000000004802fa34:
   0x000000004802fa34: ldr      r4, [pc, #0xac]
   0x000000004802fa36: add      r4, pc
   0x000000004802fa38: ldr      r0, [r4]
   0x000000004802fa3a: cmp      r0, #0
   0x000000004802fa3c: beq      #0x4802fab4
   0x000000004802fa3e: ldr      r3, [r0, #0x48]
   0x000000004802fa40: cmp      r3, #4
   0x000000004802fa42: beq      #0x4802fa9e
   0x000000004802fa44: cmp      r3, #5
   0x000000004802fa46: beq      #0x4802fa86
   0x000000004802fa48: bl       #0x480651c0  ; call 0x00000000480651c0
   0x000000004802fa4c: ldr      r2, [r4]
   0x000000004802fa4e: movs     r0, #2
   0x000000004802fa50: ldr      r1, [pc, #0x94]
   0x000000004802fa52: adds     r2, #8
   0x000000004802fa54: add      r1, pc
   0x000000004802fa56: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004802fa5a: ldr      r2, [pc, #0x90]
   0x000000004802fa5c: ldr      r3, [pc, #0x90]
   0x000000004802fa5e: pop.w    {r4, r5, r6, lr}
   0x000000004802fa60: eors     r0, r6
   0x000000004802fa62: add      r2, pc
   0x000000004802fa64: ldr      r2, [r2]
   0x000000004802fa66: add      r3, pc
   0x000000004802fa68: ldr.w    r0, [r3, r2, lsl #2]
   0x000000004802fa6a: movs     r2, r4
   0x000000004802fa6c: b.w      #0x48064314
   0x000000004802fa6e: pop      {r1, r4, r6}

loc_000000004802fa70:
   0x000000004802fa70: mov      r1, r2
   0x000000004802fa72: mov      r0, r4
   0x000000004802fa74: str      r2, [r6]
   0x000000004802fa76: bl       #0x4802f7c8  ; call 0x000000004802f7c8
   0x000000004802fa78: mcr2     p0, #5, r6, c7, c0, #1
   0x000000004802fa7a: str      r0, [r6]
   0x000000004802fa7c: b        #0x4802fa0c

loc_000000004802fa7e:
   0x000000004802fa7e: pop.w    {r4, r5, r6, lr}
   0x000000004802fa80: eors     r0, r6
   0x000000004802fa82: b.w      #0x4801f8c8
   0x000000004802fa84: itttt    hs

loc_000000004802fa86:
   0x000000004802fa86: ldr      r3, [pc, #0x6c]
   0x000000004802fa88: ldr      r0, [pc, #0x6c]
   0x000000004802fa8a: pop.w    {r4, r5, r6, lr}
   0x000000004802fa8c: eors     r0, r6
   0x000000004802fa8e: add      r3, pc
   0x000000004802fa90: ldr      r3, [r3]
; XREF string 0x00000000480d2dac: 'barcode' -> 'barcode_screen'
>> 0x000000004802fa92: add      r0, pc
   0x000000004802fa94: ldr      r3, [r3, #4]
   0x000000004802fa96: bx       r3

loc_000000004802fa98:
   0x000000004802fa98: ldr      r3, [pc, #0x60]
   0x000000004802fa9a: add      r3, pc
   0x000000004802fa9c: b        #0x4802fa22

loc_000000004802fa9e:
   0x000000004802fa9e: pop.w    {r4, r5, r6, lr}
   0x000000004802faa0: eors     r0, r6
   0x000000004802faa2: b.w      #0x4802f964
   0x000000004802faa4: itttt    pl

loc_000000004802faa6:
   0x000000004802faa6: ldr      r1, [pc, #0x58]
   0x000000004802faa8: movs     r0, #1
   0x000000004802faaa: pop.w    {r4, r5, r6, lr}
   0x000000004802faac: eors     r0, r6
   0x000000004802faae: add      r1, pc
   0x000000004802fab0: b.w      #0x4806ff38
   0x000000004802fab2: rev16    r2, r0

loc_000000004802fab4:
   0x000000004802fab4: ldr      r0, [pc, #0x4c]
   0x000000004802fab6: pop.w    {r4, r5, r6, lr}
   0x000000004802fab8: eors     r0, r6
   0x000000004802faba: add      r0, pc
   0x000000004802fabc: b.w      #0x480651c0
   0x000000004802fabe: cbnz     r0, #0x4802fb22
   0x000000004802fac0: str      r0, [sp, #0x18]
   0x000000004802fac2: movs     r1, r2
   0x000000004802fac4: add      sp, #0x140
   0x000000004802fac6: movs     r2, r2
   0x000000004802fac8: add      sp, #0x198
   0x000000004802faca: movs     r2, r2
   0x000000004802facc: add      sp, #0x98
   0x000000004802face: movs     r2, r2
   0x000000004802fad0: add      sp, #0x150
   0x000000004802fad2: movs     r2, r2
   0x000000004802fad4: add      sp, #0x148
   0x000000004802fad6: movs     r2, r2
   0x000000004802fad8: add      sp, #0xd0
   0x000000004802fada: movs     r2, r2
   0x000000004802fadc: add      sp, #0x40
   0x000000004802fade: movs     r2, r2
   0x000000004802fae0: adds     r3, #0xca
   0x000000004802fae2: movs     r2, r1
   0x000000004802fae4: add      sp, #0x38
   0x000000004802fae6: movs     r2, r2
   0x000000004802fae8: adds     r3, #0x64
   0x000000004802faea: movs     r2, r1
   0x000000004802faec: cmp      r6, #0x16
   0x000000004802faee: movs     r7, r1
   0x000000004802faf0: add      r7, sp, #0x348
   0x000000004802faf2: movs     r2, r2
   0x000000004802faf4: ldrh     r2, [r7, #0xa]
   0x000000004802faf6: movs     r1, r2
   0x000000004802faf8: adds     r3, #0x16
   0x000000004802fafa: movs     r2, r1
   0x000000004802fafc: ldrh     r2, [r2, #0x1c]
   0x000000004802fafe: movs     r4, r1
   0x000000004802fb00: adds     r3, #0x26
   0x000000004802fb02: movs     r2, r1
   0x000000004802fb04: cmp      r3, #0xaa
   0x000000004802fb06: movs     r7, r1
   0x000000004802fb08: ldr      r3, [pc, #8]
   0x000000004802fb0a: movs     r2, #0
   0x000000004802fb0c: add      r3, pc
   0x000000004802fb0e: ldr      r3, [r3]
   0x000000004802fb10: str      r2, [r3, #0x2c]
   0x000000004802fb12: bx       lr
