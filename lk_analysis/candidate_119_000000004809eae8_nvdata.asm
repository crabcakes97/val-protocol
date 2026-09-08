; candidate function around xref 0x000000004809eb8a to 'nvdata'
; estimated range 0x000000004809eae8-0x000000004809eba4

   0x000000004809eae8: push.w   {r4, r5, r6, r7, r8, sb, sl, fp, lr}
   0x000000004809eaea: ldr      r7, [pc, #0x3c0]
   0x000000004809eaec: sub      sp, #0x5c
   0x000000004809eaee: mov.w    fp, #0x100
   0x000000004809eaf0: ldrb     r0, [r0, #0xe]
   0x000000004809eaf2: add      r6, sp, #0x14
   0x000000004809eaf4: mov      sl, r2
   0x000000004809eaf6: mov      r4, r3
   0x000000004809eaf8: str      r2, [sp, #4]
   0x000000004809eafa: mov      r7, r1
   0x000000004809eafc: ldr.w    ip, [r0, #0xc]
   0x000000004809eafe: stm      r0!, {r2, r3}
   0x000000004809eb00: mov      r1, r3
   0x000000004809eb02: str.w    fp, [sp]
   0x000000004809eb04: add      sp, #0
   0x000000004809eb06: movs     r2, #0
   0x000000004809eb08: str      r6, [sp, #8]
   0x000000004809eb0a: movs     r3, #0
   0x000000004809eb0c: mov      r5, r0
   0x000000004809eb0e: blx      ip
   0x000000004809eb10: cmp      r0, #3
   0x000000004809eb12: itt      ne
   0x000000004809eb14: mov.w    r8, #0
   0x000000004809eb16: lsrs     r0, r0, #0x20
   0x000000004809eb18: mov.w    sb, #0
   0x000000004809eb1a: lsrs     r0, r0, #4
   0x000000004809eb1c: beq      #0x4809eb32
   0x000000004809eb1e: cbnz     r0, #0x4809eb76
   0x000000004809eb20: ldr      r3, [sp, #0x80]
   0x000000004809eb22: cmp      r3, #0
   0x000000004809eb24: beq      #0x4809eba8
   0x000000004809eb26: movs     r0, #1
   0x000000004809eb28: strd     r8, sb, [r3]
   0x000000004809eb2a: ldrh     r0, [r0, #8]
   0x000000004809eb2c: add      sp, #0x5c
   0x000000004809eb2e: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
   0x000000004809eb30: ldrh     r0, [r6, #0x3e]
   0x000000004809eb32: mov      r0, r7
   0x000000004809eb34: bl       #0x4809da54
   0x000000004809eb38: ldr      r2, [pc, #0x11c]
   0x000000004809eb3a: movs     r1, #0x20
   0x000000004809eb3c: str      r7, [sp]
   0x000000004809eb3e: movs     r3, #4
   0x000000004809eb40: str      r0, [sp, #4]
   0x000000004809eb42: mov      r0, r4
   0x000000004809eb44: add      r2, pc
   0x000000004809eb46: bl       #0x4809de84
   0x000000004809eb48: ldrsb.w  r4, [sp, #0x607]
   0x000000004809eb4a: mov      r7, r0
   0x000000004809eb4c: cbnz     r0, #0x4809ebac
   0x000000004809eb4e: ldr      r0, [pc, #0x10c]
   0x000000004809eb50: add      r0, pc
   0x000000004809eb52: bl       #0x4809ddb0
   0x000000004809eb56: ldr      r3, [pc, #0x108]
   0x000000004809eb58: ldr      r1, [pc, #0x108]
   0x000000004809eb5a: ldr      r2, [pc, #0x10c]
   0x000000004809eb5c: add      r3, pc
   0x000000004809eb5e: str      r7, [sp, #4]
   0x000000004809eb60: str      r3, [sp]
   0x000000004809eb62: add      r1, pc
   0x000000004809eb64: ldr      r3, [pc, #0x104]
   0x000000004809eb66: add      r2, pc
   0x000000004809eb68: add      r3, pc
   0x000000004809eb6a: bl       #0x4809daa0
   0x000000004809eb6c: vaddl.u16 q1, d9, d0
   0x000000004809eb6e: movs     r0, #0
   0x000000004809eb70: add      sp, #0x5c
   0x000000004809eb72: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
   0x000000004809eb74: ldrh     r0, [r6, #0x3e]
   0x000000004809eb76: ldr      r0, [pc, #0xf8]
   0x000000004809eb78: movs     r5, #0
   0x000000004809eb7a: add      r0, pc
   0x000000004809eb7c: bl       #0x4809ddb0
   0x000000004809eb80: ldr      r2, [pc, #0xf0]
   0x000000004809eb82: ldr      r3, [pc, #0xf4]
   0x000000004809eb84: ldr      r1, [pc, #0xf4]
   0x000000004809eb86: add      r2, pc
   0x000000004809eb88: str      r5, [sp, #0xc]
>> 0x000000004809eb8a: add      r3, pc
   0x000000004809eb8c: stm.w    sp, {r2, r4}
   0x000000004809eb8e: movs     r4, r2
   0x000000004809eb90: str      r3, [sp, #8]
   0x000000004809eb92: add      r1, pc
   0x000000004809eb94: ldr      r2, [pc, #0xe8]
   0x000000004809eb96: ldr      r3, [pc, #0xec]
   0x000000004809eb98: add      r2, pc
   0x000000004809eb9a: add      r3, pc
   0x000000004809eb9c: bl       #0x4809daa0
   0x000000004809eb9e: vrsubhn.i16 d4, q0, q12
   0x000000004809eba0: mov      r0, r5
   0x000000004809eba2: add      sp, #0x5c
   0x000000004809eba4: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
