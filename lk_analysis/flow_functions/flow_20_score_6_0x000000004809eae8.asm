; flow candidate 0x000000004809eae8-0x000000004809ed28
; score: 6
; matched targets: nvdata
; calls: 0x000000004809da54, 0x000000004809de84, 0x000000004809ddb0, 0x000000004809daa0, 0x000000004809da40, 0x000000004809dbe4, 0x000000004809eae8, 0x000000004809dbc8

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

loc_000000004809eb1e:
   0x000000004809eb1e: cbnz     r0, #0x4809eb76
   0x000000004809eb20: ldr      r3, [sp, #0x80]
   0x000000004809eb22: cmp      r3, #0
   0x000000004809eb24: beq      #0x4809eba8
   0x000000004809eb26: movs     r0, #1
   0x000000004809eb28: strd     r8, sb, [r3]
   0x000000004809eb2a: ldrh     r0, [r0, #8]

loc_000000004809eb2c:
   0x000000004809eb2c: add      sp, #0x5c
   0x000000004809eb2e: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
   0x000000004809eb30: ldrh     r0, [r6, #0x3e]

loc_000000004809eb32:
   0x000000004809eb32: mov      r0, r7
   0x000000004809eb34: bl       #0x4809da54  ; call 0x000000004809da54
   0x000000004809eb38: ldr      r2, [pc, #0x11c]
   0x000000004809eb3a: movs     r1, #0x20
   0x000000004809eb3c: str      r7, [sp]
   0x000000004809eb3e: movs     r3, #4
   0x000000004809eb40: str      r0, [sp, #4]
   0x000000004809eb42: mov      r0, r4
   0x000000004809eb44: add      r2, pc
   0x000000004809eb46: bl       #0x4809de84  ; call 0x000000004809de84
   0x000000004809eb48: ldrsb.w  r4, [sp, #0x607]
   0x000000004809eb4a: mov      r7, r0
   0x000000004809eb4c: cbnz     r0, #0x4809ebac
   0x000000004809eb4e: ldr      r0, [pc, #0x10c]
   0x000000004809eb50: add      r0, pc
   0x000000004809eb52: bl       #0x4809ddb0  ; call 0x000000004809ddb0
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
   0x000000004809eb6a: bl       #0x4809daa0  ; call 0x000000004809daa0
   0x000000004809eb6c: vaddl.u16 q1, d9, d0

loc_000000004809eb6e:
   0x000000004809eb6e: movs     r0, #0
   0x000000004809eb70: add      sp, #0x5c
   0x000000004809eb72: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
   0x000000004809eb74: ldrh     r0, [r6, #0x3e]

loc_000000004809eb76:
   0x000000004809eb76: ldr      r0, [pc, #0xf8]
   0x000000004809eb78: movs     r5, #0
   0x000000004809eb7a: add      r0, pc
   0x000000004809eb7c: bl       #0x4809ddb0  ; call 0x000000004809ddb0
   0x000000004809eb80: ldr      r2, [pc, #0xf0]
   0x000000004809eb82: ldr      r3, [pc, #0xf4]
   0x000000004809eb84: ldr      r1, [pc, #0xf4]
   0x000000004809eb86: add      r2, pc
   0x000000004809eb88: str      r5, [sp, #0xc]
; XREF string 0x00000000481077a0: 'nvdata' -> "mot_sec: Invalid partition name when clear 'nvdata-erase'\n"
>> 0x000000004809eb8a: add      r3, pc
   0x000000004809eb8c: stm.w    sp, {r2, r4}
   0x000000004809eb8e: movs     r4, r2
   0x000000004809eb90: str      r3, [sp, #8]
   0x000000004809eb92: add      r1, pc
   0x000000004809eb94: ldr      r2, [pc, #0xe8]
   0x000000004809eb96: ldr      r3, [pc, #0xec]
   0x000000004809eb98: add      r2, pc
; XREF string 0x00000000481077dc: 'nvdata' -> "mot_sec: Failed to clear 'nvdata-erase' command in: %s!\n"
>> 0x000000004809eb9a: add      r3, pc
   0x000000004809eb9c: bl       #0x4809daa0  ; call 0x000000004809daa0
   0x000000004809eb9e: vrsubhn.i16 d4, q0, q12
   0x000000004809eba0: mov      r0, r5
   0x000000004809eba2: add      sp, #0x5c
   0x000000004809eba4: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
   0x000000004809eba6: ldrh     r0, [r6, #0x3e]

loc_000000004809eba8:
   0x000000004809eba8: movs     r0, #1
   0x000000004809ebaa: b        #0x4809eb2c

loc_000000004809ebac:
   0x000000004809ebac: movs     r3, #0x40
   0x000000004809ebae: add.w    r8, sp, #0x18
   0x000000004809ebb0: lsrs     r0, r3, #0x20
   0x000000004809ebb2: str      r3, [sp]
   0x000000004809ebb4: mov      r0, r5
   0x000000004809ebb6: str      r6, [sp, #8]
   0x000000004809ebb8: mov      r1, r4
   0x000000004809ebba: str.w    r8, [sp, #4]
   0x000000004809ebbc: strh     r4, [r0]
   0x000000004809ebbe: mvn      r2, #0x3f
   0x000000004809ebc0: lsls     r7, r7, #8
   0x000000004809ebc2: ldr      r7, [r5, #0xc]
   0x000000004809ebc4: mov.w    r3, #-1
   0x000000004809ebc6: adds     r3, #0xff
   0x000000004809ebc8: blx      r7
   0x000000004809ebca: mov      r7, r0
   0x000000004809ebcc: cbnz     r0, #0x4809ec06
   0x000000004809ebce: ldr      r1, [pc, #0xb8]
   0x000000004809ebd0: mov      r0, r8
   0x000000004809ebd2: movs     r2, #4
   0x000000004809ebd4: add      r1, pc
   0x000000004809ebd6: bl       #0x4809da40  ; call 0x000000004809da40
   0x000000004809ebda: cbz      r0, #0x4809ec32
   0x000000004809ebdc: ldr      r0, [pc, #0xac]
   0x000000004809ebde: add      r0, pc
   0x000000004809ebe0: bl       #0x4809ddb0  ; call 0x000000004809ddb0
   0x000000004809ebe4: ldr      r2, [pc, #0xa8]
   0x000000004809ebe6: ldr      r3, [pc, #0xac]
   0x000000004809ebe8: ldr      r1, [pc, #0xac]
   0x000000004809ebea: add      r2, pc
   0x000000004809ebec: str      r4, [sp, #4]
   0x000000004809ebee: add      r3, pc
   0x000000004809ebf0: str      r2, [sp]
   0x000000004809ebf2: str      r3, [sp, #8]
   0x000000004809ebf4: add      r1, pc
   0x000000004809ebf6: ldr      r2, [pc, #0xa4]
   0x000000004809ebf8: ldr      r3, [pc, #0xa4]
   0x000000004809ebfa: str      r7, [sp, #0xc]
   0x000000004809ebfc: add      r2, pc
   0x000000004809ebfe: add      r3, pc
   0x000000004809ec00: bl       #0x4809daa0  ; call 0x000000004809daa0
   0x000000004809ec02: vaba.u8  d30, d30, d19
   0x000000004809ec04: b        #0x4809eb6e

loc_000000004809ec06:
   0x000000004809ec06: ldr      r0, [pc, #0x9c]
   0x000000004809ec08: add      r0, pc
   0x000000004809ec0a: bl       #0x4809ddb0  ; call 0x000000004809ddb0
   0x000000004809ec0c: ldr.w    r4, [r1, #0xa26]
   0x000000004809ec0e: ldr      r2, [pc, #0x98]
   0x000000004809ec10: movs     r1, #0
   0x000000004809ec12: ldr      r3, [pc, #0x98]
   0x000000004809ec14: str      r1, [sp, #0xc]
   0x000000004809ec16: add      r2, pc
   0x000000004809ec18: ldr      r1, [pc, #0x94]
; XREF string 0x00000000481077a0: 'nvdata' -> "mot_sec: Invalid partition name when clear 'nvdata-erase'\n"
>> 0x000000004809ec1a: add      r3, pc
   0x000000004809ec1c: stm.w    sp, {r2, r4}
   0x000000004809ec1e: movs     r4, r2
   0x000000004809ec20: str      r3, [sp, #8]
   0x000000004809ec22: ldr      r2, [pc, #0x90]
   0x000000004809ec24: add      r1, pc
   0x000000004809ec26: ldr      r3, [pc, #0x90]
   0x000000004809ec28: add      r2, pc
; XREF string 0x00000000481077dc: 'nvdata' -> "mot_sec: Failed to clear 'nvdata-erase' command in: %s!\n"
>> 0x000000004809ec2a: add      r3, pc
   0x000000004809ec2c: bl       #0x4809daa0  ; call 0x000000004809daa0
   0x000000004809ec30: b        #0x4809eb6e

loc_000000004809ec32:
   0x000000004809ec32: ldr      r0, [sp, #0x2c]
   0x000000004809ec34: ldr      r1, [sp, #0x30]
   0x000000004809ec36: bl       #0x4809dbe4  ; call 0x000000004809dbe4
   0x000000004809ec3a: mov      r8, r0
   0x000000004809ec3c: mov      sb, r1
   0x000000004809ec3e: str.w    fp, [sp]
   0x000000004809ec40: add      sp, #0
   0x000000004809ec42: mov      r3, r1
   0x000000004809ec44: str.w    sl, [sp, #4]
   0x000000004809ec46: adr      r0, #0x10
   0x000000004809ec48: mov      r0, r5
   0x000000004809ec4a: str      r6, [sp, #8]
   0x000000004809ec4c: mov      r2, r8
   0x000000004809ec4e: mov      r1, r4
   0x000000004809ec50: ldr      r5, [r5, #0xc]
   0x000000004809ec52: blx      r5
   0x000000004809ec54: b        #0x4809eb1e
   0x000000004809ec56: nop      
   0x000000004809ec58: bvc      #0x4809ece4
   0x000000004809ec5a: movs     r2, r0
   0x000000004809ec5c: strh     r4, [r5, #0x3e]
   0x000000004809ec5e: movs     r7, r0
   0x000000004809ec60: ldr      r4, [r6, #4]
   0x000000004809ec62: movs     r7, r0
   0x000000004809ec64: ldr      r2, [r4, #0x4c]
   0x000000004809ec66: movs     r5, r0
   0x000000004809ec68: ldrh     r6, [r1]
   0x000000004809ec6a: movs     r7, r0
   0x000000004809ec6c: strb     r0, [r0, #2]
   0x000000004809ec6e: movs     r6, r0
   0x000000004809ec70: strh     r2, [r0, #0x3e]
   0x000000004809ec72: movs     r7, r0
   0x000000004809ec74: ldrh     r2, [r3, #2]
   0x000000004809ec76: movs     r7, r0
   0x000000004809ec78: ldrh     r2, [r1, #0x22]
   0x000000004809ec7a: movs     r6, r0
   0x000000004809ec7c: ldr      r2, [r6, #0x48]
   0x000000004809ec7e: movs     r5, r0
   0x000000004809ec80: ldrh     r4, [r0, #2]
   0x000000004809ec82: movs     r7, r0
   0x000000004809ec84: strb     r6, [r1, #1]
   0x000000004809ec86: movs     r6, r0
   0x000000004809ec88: ldr      r0, [r1, #0x4c]
   0x000000004809ec8a: movs     r7, r0
   0x000000004809ec8c: strh     r6, [r3, #0x3a]
   0x000000004809ec8e: movs     r7, r0
   0x000000004809ec90: strh     r6, [r7, #0x3c]
   0x000000004809ec92: movs     r7, r0
   0x000000004809ec94: strh     r6, [r0, #0x3e]
   0x000000004809ec96: movs     r7, r0
   0x000000004809ec98: ldr      r0, [r2, #0x44]
   0x000000004809ec9a: movs     r5, r0
   0x000000004809ec9c: strh     r0, [r5, #0x3c]
   0x000000004809ec9e: movs     r7, r0
   0x000000004809eca0: ldr      r2, [r5, #0x7c]
   0x000000004809eca2: movs     r6, r0
   0x000000004809eca4: strh     r4, [r6, #0x38]
   0x000000004809eca6: movs     r7, r0
   0x000000004809eca8: strh     r6, [r4, #0x3a]
   0x000000004809ecaa: movs     r7, r0
   0x000000004809ecac: ldrh     r2, [r7, #0x1c]
   0x000000004809ecae: movs     r6, r0
   0x000000004809ecb0: ldr      r0, [r4, #0x40]
   0x000000004809ecb2: movs     r5, r0
   0x000000004809ecb4: strh     r0, [r2, #0x3a]
   0x000000004809ecb6: movs     r7, r0
   0x000000004809ecb8: ldr      r6, [r7, #0x78]
   0x000000004809ecba: movs     r6, r0
   0x000000004809ecbc: push.w   {r4, r5, r6, r7, r8, sb, lr}
   0x000000004809ecbe: mvns     r0, r6
   0x000000004809ecc0: mov      r7, r0
   0x000000004809ecc2: sub      sp, #0x134
   0x000000004809ecc4: mov      r0, r1
   0x000000004809ecc6: mov      r5, r1
   0x000000004809ecc8: mov      r8, r2
   0x000000004809ecca: bl       #0x4809da54  ; call 0x000000004809da54
   0x000000004809eccc: vmaxnm.f32 s9, s6, s31
   0x000000004809ecce: ldr      r2, [pc, #0xbc]
   0x000000004809ecd0: add      r6, sp, #0x10
   0x000000004809ecd2: str      r0, [sp, #4]
   0x000000004809ecd4: movs     r1, #0x20
   0x000000004809ecd6: str      r5, [sp]
   0x000000004809ecd8: movs     r3, #6
   0x000000004809ecda: mov      r0, r6
   0x000000004809ecdc: add      r2, pc
   0x000000004809ecde: bl       #0x4809de84  ; call 0x000000004809de84
   0x000000004809ece0: ldr.w    r4, [r1, #0x604]
   0x000000004809ece2: mov      r4, r0

loc_000000004809ece4:
   0x000000004809ece4: cbz      r0, #0x4809ed2c
   0x000000004809ece6: add      r4, sp, #0x30
   0x000000004809ece8: mov.w    sb, #0
   0x000000004809ecea: lsrs     r0, r0, #4
   0x000000004809ecec: mov      r0, r7
   0x000000004809ecee: mov      r1, r5
   0x000000004809ecf0: mov      r2, r4
   0x000000004809ecf2: str.w    sb, [sp]
   0x000000004809ecf4: str      r0, [sp]
   0x000000004809ecf6: mov      r3, r6
   0x000000004809ecf8: bl       #0x4809eae8  ; call 0x000000004809eae8
   0x000000004809ecfa: mrc2     p1, #7, fp, c6, c8, #4
   0x000000004809ecfc: cbz      r0, #0x4809ed26
   0x000000004809ecfe: ldr      r1, [pc, #0x90]
   0x000000004809ed00: mov      r0, r4
   0x000000004809ed02: movs     r2, #4
   0x000000004809ed04: add      r1, pc
   0x000000004809ed06: bl       #0x4809da40  ; call 0x000000004809da40
   0x000000004809ed0a: cbnz     r0, #0x4809ed54
   0x000000004809ed0c: ldr      r0, [r4, #0x78]
   0x000000004809ed0e: bl       #0x4809dbc8  ; call 0x000000004809dbc8
   0x000000004809ed10: vbsl     d31, d27, d24
   0x000000004809ed12: cmp.w    r8, #0
   0x000000004809ed14: lsrs     r0, r0, #0x1c
   0x000000004809ed16: beq      #0x4809ed86
   0x000000004809ed18: eor      r3, r0, #2
   0x000000004809ed1a: lsls     r2, r0, #0xc
   0x000000004809ed1c: movs     r0, #1
   0x000000004809ed1e: ubfx     r3, r3, #1, #1
   0x000000004809ed20: lsls     r0, r0, #0xd
   0x000000004809ed22: str.w    r3, [r8]
   0x000000004809ed24: adds     r0, #0

loc_000000004809ed26:
   0x000000004809ed26: add      sp, #0x134
   0x000000004809ed28: pop.w    {r4, r5, r6, r7, r8, sb, pc}
