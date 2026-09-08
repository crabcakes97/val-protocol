; flow candidate 0x0000000048082bee-0x0000000048082f1e
; score: 80
; matched targets: A unlock code may be required, Already unlocked, Check 'Allow OEM Unlock', Now unlocked for flashing, This command requires you to first unlock the bootloader, md_udc, metadata, userdata
; calls: 0x00000000480336d8, 0x000000004805bd88, 0x0000000048052000, 0x000000004805b64c, 0x000000004808363c, 0x00000000480836dc, 0x000000004805b0f8, 0x000000004808380c, 0x0000000048033694, 0x0000000048037fa4

   0x0000000048082bee: push     {r4, lr}
   0x0000000048082bf0: bl       #0x480336d8  ; call 0x00000000480336d8
   0x0000000048082bf2: ldc2l    p9, c11, [r2, #-0]!
   0x0000000048082bf4: cbnz     r0, #0x48082bf8
   0x0000000048082bf6: pop      {r4, pc}

loc_0000000048082bf8:
   0x0000000048082bf8: ldr      r0, [pc, #0xa0]
; XREF string 0x00000000480f47c0: 'metadata' -> 'metadata'
>> 0x0000000048082bfa: add      r0, pc
   0x0000000048082bfc: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x0000000048082bfe: str.w    fp, [r4, #0xb08]
   0x0000000048082c00: cbnz     r0, #0x48082c46
   0x0000000048082c02: ldr      r0, [pc, #0x9c]
; XREF string 0x00000000480f47cc: 'md_udc' -> 'md_udc'
; XREF string 0x0000000048106d80: 'userdata' -> 'userdata'
>> 0x0000000048082c04: add      r0, pc
   0x0000000048082c06: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x0000000048082c08: ldrh.w   fp, [pc, #0xb20]
   0x0000000048082c0a: cbnz     r0, #0x48082c56
   0x0000000048082c0c: ldr      r4, [pc, #0x94]
; XREF string 0x00000000480f47cc: 'md_udc' -> 'md_udc'
>> 0x0000000048082c0e: add      r4, pc
   0x0000000048082c10: mov      r0, r4
   0x0000000048082c12: bl       #0x48052000  ; call 0x0000000048052000
   0x0000000048082c16: cbz      r0, #0x48082c66

loc_0000000048082c18:
   0x0000000048082c18: ldr      r0, [pc, #0x8c]
   0x0000000048082c1a: ldr      r1, [pc, #0x90]
   0x0000000048082c1c: add      r0, pc
   0x0000000048082c1e: add      r1, pc
   0x0000000048082c20: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082c22: ldc2     p0, c2, [r4, #-4]
   0x0000000048082c24: movs     r0, #1
   0x0000000048082c26: bl       #0x4808363c  ; call 0x000000004808363c
   0x0000000048082c28: stc2     p0, c2, [sb, #-0]
   0x0000000048082c2a: movs     r0, #0
   0x0000000048082c2c: bl       #0x480836dc  ; call 0x00000000480836dc
   0x0000000048082c2e: ldc2l    p8, c4, [r6, #-0x7c]
   0x0000000048082c30: ldr      r0, [pc, #0x7c]
   0x0000000048082c32: ldr      r1, [pc, #0x80]
   0x0000000048082c34: add      r0, pc
   0x0000000048082c36: add      r1, pc
   0x0000000048082c38: bl       #0x4805b0f8  ; call 0x000000004805b0f8
   0x0000000048082c3c: movs     r0, #2
   0x0000000048082c3e: pop.w    {r4, lr}
   0x0000000048082c40: ands     r0, r2
   0x0000000048082c42: b.w      #0x4801a504
   0x0000000048082c44: pop      {r0, r1, r2, r3, r4, r6}

loc_0000000048082c46:
   0x0000000048082c46: ldr      r0, [pc, #0x70]
   0x0000000048082c48: ldr      r1, [pc, #0x70]
   0x0000000048082c4a: pop.w    {r4, lr}
   0x0000000048082c4c: ands     r0, r2
   0x0000000048082c4e: add      r0, pc
; XREF string 0x0000000048106d54: 'metadata' -> 'Failed to erase metadata.'
>> 0x0000000048082c50: add      r1, pc
   0x0000000048082c52: b.w      #0x4805b64c
   0x0000000048082c54: pop      {r0, r1, r3, r4, r5, r6, r7}

loc_0000000048082c56:
   0x0000000048082c56: ldr      r0, [pc, #0x68]
   0x0000000048082c58: ldr      r1, [pc, #0x68]
   0x0000000048082c5a: pop.w    {r4, lr}
   0x0000000048082c5c: ands     r0, r2
   0x0000000048082c5e: add      r0, pc
; XREF string 0x0000000048106d64: 'metadata' -> 'metadata.'
; XREF string 0x0000000048106d70: 'userdata' -> 'Failed to erase userdata'
>> 0x0000000048082c60: add      r1, pc
   0x0000000048082c62: b.w      #0x4805b64c
   0x0000000048082c64: pop      {r0, r1, r4, r5, r6, r7}

loc_0000000048082c66:
   0x0000000048082c66: mov      r0, r4
   0x0000000048082c68: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x0000000048082c6a: strb.w   r2, [lr, #0x800]
   0x0000000048082c6c: cmp      r0, #0
   0x0000000048082c6e: beq      #0x48082c18
   0x0000000048082c70: ldr      r0, [pc, #0x54]
   0x0000000048082c72: ldr      r1, [pc, #0x58]
   0x0000000048082c74: add      r0, pc
; XREF string 0x0000000048106da4: 'md_udc' -> 'Failed to erase md_udc.\n'
>> 0x0000000048082c76: add      r1, pc
   0x0000000048082c78: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082c7a: stc2l    p7, c14, [r8], #0x330
   0x0000000048082c7c: b        #0x48082c18
   0x0000000048082c7e: nop      
   0x0000000048082c80: ldr      r7, [pc, #0x158]
   0x0000000048082c82: movs     r6, r2
   0x0000000048082c84: asrs     r2, r2, #0x18
   0x0000000048082c86: movs     r7, r0
   0x0000000048082c88: tst      r0, r5
   0x0000000048082c8a: movs     r0, r1
   0x0000000048082c8c: asrs     r6, r0, #0x18
   0x0000000048082c8e: movs     r7, r0
   0x0000000048082c90: lsls     r0, r5
   0x0000000048082c92: movs     r0, r1
   0x0000000048082c94: asrs     r2, r7, #0x17
   0x0000000048082c96: movs     r7, r0
   0x0000000048082c98: tst      r0, r0
   0x0000000048082c9a: movs     r0, r1
   0x0000000048082c9c: subs     r2, r0, r7
   0x0000000048082c9e: movs     r7, r0
   0x0000000048082ca0: adcs     r0, r7
   0x0000000048082ca2: movs     r0, r1
   0x0000000048082ca4: subs     r2, r7, r6
   0x0000000048082ca6: movs     r7, r0
   0x0000000048082ca8: asrs     r4, r0, #0x17
   0x0000000048082caa: movs     r7, r0
   0x0000000048082cac: rors     r2, r7
   0x0000000048082cae: movs     r0, r1
   0x0000000048082cb0: asrs     r4, r5, #0x10
   0x0000000048082cb2: movs     r7, r0
   0x0000000048082cb4: ldrsh    r2, [r1, r6]
   0x0000000048082cb6: movs     r0, r1
   0x0000000048082cb8: asrs     r2, r2, #0x16
   0x0000000048082cba: movs     r7, r0
   0x0000000048082cbc: asrs     r0, r0
   0x0000000048082cbe: movs     r0, r1
   0x0000000048082cc0: asrs     r2, r0, #0x16
   0x0000000048082cc2: movs     r7, r0
   0x0000000048082cc4: asrs     r4, r1
   0x0000000048082cc6: movs     r0, r1
   0x0000000048082cc8: asrs     r4, r5, #0x15
   0x0000000048082cca: movs     r7, r0
   0x0000000048082ccc: asrs     r2, r5
   0x0000000048082cce: movs     r0, r1
   0x0000000048082cd0: push     {r4, r5, r6, lr}
   0x0000000048082cd2: movw     r5, #0x88ff
   0x0000000048082cd4: lsls     r7, r7, #0x17
   0x0000000048082cd6: ldr      r4, [pc, #0x84]
   0x0000000048082cd8: add      r4, pc
   0x0000000048082cda: ldr      r3, [r4]
   0x0000000048082cdc: cmp      r3, r5
   0x0000000048082cde: beq      #0x48082d4c
   0x0000000048082ce0: movw     r2, #0x77ee
   0x0000000048082ce2: strb     r6, [r5, #0xb]
   0x0000000048082ce4: cmp      r3, r2
   0x0000000048082ce6: beq      #0x48082cf8
   0x0000000048082ce8: ldr      r0, [pc, #0x74]
   0x0000000048082cea: ldr      r1, [pc, #0x78]
   0x0000000048082cec: pop.w    {r4, r5, r6, lr}
   0x0000000048082cee: eors     r0, r6
   0x0000000048082cf0: add      r0, pc
   0x0000000048082cf2: add      r1, pc
   0x0000000048082cf4: b.w      #0x4805b64c
   0x0000000048082cf6: pop      {r1, r3, r5, r7}

loc_0000000048082cf8:
   0x0000000048082cf8: bl       #0x4808380c  ; call 0x000000004808380c
   0x0000000048082cfa: stc2     p6, c4, [r8, #0x18]
   0x0000000048082cfc: mov      r6, r0
   0x0000000048082cfe: cbnz     r0, #0x48082d30
   0x0000000048082d00: movs     r0, #1
   0x0000000048082d02: bl       #0x4808363c  ; call 0x000000004808363c
   0x0000000048082d04: ldc2     p6, c4, [fp], {0x30}
   0x0000000048082d06: mov      r0, r6
   0x0000000048082d08: bl       #0x480836dc  ; call 0x00000000480836dc
   0x0000000048082d0a: stc2l    p8, c4, [r8], #0x58
   0x0000000048082d0c: ldr      r0, [pc, #0x58]
   0x0000000048082d0e: ldr      r1, [pc, #0x5c]
   0x0000000048082d10: str      r5, [r4]
   0x0000000048082d12: add      r0, pc
   0x0000000048082d14: add      r1, pc
   0x0000000048082d16: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082d18: ldc2     p8, c4, [sb], {0x15}
   0x0000000048082d1a: ldr      r0, [pc, #0x54]
   0x0000000048082d1c: ldr      r1, [pc, #0x54]
   0x0000000048082d1e: add      r0, pc
   0x0000000048082d20: add      r1, pc
   0x0000000048082d22: bl       #0x4805b0f8  ; call 0x000000004805b0f8
   0x0000000048082d24: vld1.8   {d18[1]}, [sb], r0
   0x0000000048082d26: movs     r0, #0x20
   0x0000000048082d28: pop.w    {r4, r5, r6, lr}
   0x0000000048082d2a: eors     r0, r6
   0x0000000048082d2c: b.w      #0x4801a504
   0x0000000048082d2e: cbnz     r2, #0x48082dac

loc_0000000048082d30:
   0x0000000048082d30: ldr      r4, [pc, #0x44]
   0x0000000048082d32: ldr      r1, [pc, #0x48]
   0x0000000048082d34: add      r4, pc
   0x0000000048082d36: mov      r0, r4
; XREF string 0x0000000048106e74: "Check 'Allow OEM Unlock'" -> "Check 'Allow OEM Unlock' in Android Settings > Developer Options."
>> 0x0000000048082d38: add      r1, pc
   0x0000000048082d3a: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082d3c: stc2     p9, c4, [r7], {0x10}
   0x0000000048082d3e: ldr      r1, [pc, #0x40]
   0x0000000048082d40: mov      r0, r4
   0x0000000048082d42: pop.w    {r4, r5, r6, lr}
   0x0000000048082d44: eors     r0, r6
; XREF string 0x0000000048106e74: "Check 'Allow OEM Unlock'" -> "Check 'Allow OEM Unlock' in Android Settings > Developer Options."
>> 0x0000000048082d46: add      r1, pc
   0x0000000048082d48: b.w      #0x4805b64c
   0x0000000048082d4a: pop      {r7}

loc_0000000048082d4c:
   0x0000000048082d4c: ldr      r0, [pc, #0x34]
   0x0000000048082d4e: ldr      r1, [pc, #0x38]
   0x0000000048082d50: pop.w    {r4, r5, r6, lr}
   0x0000000048082d52: eors     r0, r6
   0x0000000048082d54: add      r0, pc
   0x0000000048082d56: add      r1, pc
   0x0000000048082d58: b.w      #0x4805b64c
   0x0000000048082d5a: pop      {r3, r4, r5, r6}
   0x0000000048082d5c: ldr      r6, [pc, #0xb0]
   0x0000000048082d5e: movs     r6, r2
   0x0000000048082d60: asrs     r0, r6, #0x13
   0x0000000048082d62: movs     r7, r0
   0x0000000048082d64: adcs     r6, r5
   0x0000000048082d66: movs     r0, r1
   0x0000000048082d68: asrs     r6, r1, #0x13
   0x0000000048082d6a: movs     r7, r0
   0x0000000048082d6c: rors     r4, r3
   0x0000000048082d6e: movs     r0, r1
   0x0000000048082d70: asrs     r2, r0, #0xd
   0x0000000048082d72: movs     r7, r0
   0x0000000048082d74: ldrsh    r0, [r4, r2]
   0x0000000048082d76: movs     r0, r1
   0x0000000048082d78: asrs     r4, r5, #0x12
   0x0000000048082d7a: movs     r7, r0
   0x0000000048082d7c: asrs     r0, r7
   0x0000000048082d7e: movs     r0, r1
   0x0000000048082d80: adcs     r6, r5
   0x0000000048082d82: movs     r0, r1
   0x0000000048082d84: asrs     r4, r1, #0x12
   0x0000000048082d86: movs     r7, r0
   0x0000000048082d88: lsrs     r6, r5
   0x0000000048082d8a: movs     r0, r1
   0x0000000048082d8c: push     {r3, lr}
   0x0000000048082d8e: movw     r2, #0x77ee
   0x0000000048082d90: strb     r6, [r5, #0xb]
   0x0000000048082d92: ldr      r3, [pc, #0xb0]
   0x0000000048082d94: add      r3, pc
   0x0000000048082d96: ldr      r3, [r3]
   0x0000000048082d98: cmp      r3, r2
   0x0000000048082d9a: beq      #0x48082e02
   0x0000000048082d9c: movw     r2, #0x88ff
   0x0000000048082d9e: lsls     r7, r7, #0xb
   0x0000000048082da0: cmp      r3, r2
   0x0000000048082da2: beq      #0x48082db4
   0x0000000048082da4: ldr      r0, [pc, #0xa0]
   0x0000000048082da6: ldr      r1, [pc, #0xa4]
   0x0000000048082da8: pop.w    {r3, lr}
   0x0000000048082daa: ands     r0, r1

loc_0000000048082dac:
   0x0000000048082dac: add      r0, pc
   0x0000000048082dae: add      r1, pc
   0x0000000048082db0: b.w      #0x4805b64c
   0x0000000048082db2: pop      {r2, r3, r6}

loc_0000000048082db4:
   0x0000000048082db4: bl       #0x48033694  ; call 0x0000000048033694
   0x0000000048082db6: stc2l    p9, c11, [lr], #-0
   0x0000000048082db8: cbnz     r0, #0x48082dbc
   0x0000000048082dba: pop      {r3, pc}

loc_0000000048082dbc:
   0x0000000048082dbc: bl       #0x4808380c  ; call 0x000000004808380c
   0x0000000048082dbe: stc2     p11, c11, [r6, #-0xe0]!
   0x0000000048082dc0: cbnz     r0, #0x48082e12
   0x0000000048082dc2: ldr      r0, [pc, #0x8c]
; XREF string 0x00000000480f47c0: 'metadata' -> 'metadata'
>> 0x0000000048082dc4: add      r0, pc
   0x0000000048082dc6: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x0000000048082dca: cbnz     r0, #0x48082e22
   0x0000000048082dcc: ldr      r0, [pc, #0x84]
; XREF string 0x00000000480f47cc: 'md_udc' -> 'md_udc'
; XREF string 0x0000000048106d80: 'userdata' -> 'userdata'
>> 0x0000000048082dce: add      r0, pc
   0x0000000048082dd0: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x0000000048082dd4: cbnz     r0, #0x48082e32
   0x0000000048082dd6: bl       #0x4808363c  ; call 0x000000004808363c
   0x0000000048082dd8: ldc2     p0, c2, [r1], #-4
   0x0000000048082dda: movs     r0, #1
   0x0000000048082ddc: bl       #0x480836dc  ; call 0x00000000480836dc
   0x0000000048082dde: ldc2l    p8, c4, [lr], #-0x74
   0x0000000048082de0: ldr      r0, [pc, #0x74]
   0x0000000048082de2: ldr      r1, [pc, #0x78]
   0x0000000048082de4: add      r0, pc
; XREF string 0x0000000048106f54: 'Now unlocked for flashing' -> 'Now unlocked for flashing. Rebooting phone.'
>> 0x0000000048082de6: add      r1, pc
   0x0000000048082de8: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082dea: ldc2     p8, c4, [r0], #-0x70
   0x0000000048082dec: ldr      r0, [pc, #0x70]
   0x0000000048082dee: ldr      r1, [pc, #0x74]
   0x0000000048082df0: add      r0, pc
; XREF string 0x0000000048106f54: 'Now unlocked for flashing' -> 'Now unlocked for flashing. Rebooting phone.'
>> 0x0000000048082df2: add      r1, pc
   0x0000000048082df4: bl       #0x4805b0f8  ; call 0x000000004805b0f8
   0x0000000048082df6: vst1.8   {d2[0]}, [r0], r2
   0x0000000048082df8: movs     r0, #2
   0x0000000048082dfa: pop.w    {r3, lr}
   0x0000000048082dfc: ands     r0, r1
   0x0000000048082dfe: b.w      #0x4801a504
   0x0000000048082e00: cbnz     r1, #0x48082e64

loc_0000000048082e02:
   0x0000000048082e02: ldr      r0, [pc, #0x64]
   0x0000000048082e04: ldr      r1, [pc, #0x64]
   0x0000000048082e06: pop.w    {r3, lr}
   0x0000000048082e08: ands     r0, r1
   0x0000000048082e0a: add      r0, pc
; XREF string 0x0000000048106f18: 'Already unlocked' -> 'Already unlocked for flashing.'
>> 0x0000000048082e0c: add      r1, pc
   0x0000000048082e0e: b.w      #0x4805b64c
   0x0000000048082e10: pop      {r0, r2, r3, r4}

loc_0000000048082e12:
   0x0000000048082e12: ldr      r0, [pc, #0x5c]
   0x0000000048082e14: ldr      r1, [pc, #0x5c]
   0x0000000048082e16: pop.w    {r3, lr}
   0x0000000048082e18: ands     r0, r1
   0x0000000048082e1a: add      r0, pc
; XREF string 0x0000000048106e74: "Check 'Allow OEM Unlock'" -> "Check 'Allow OEM Unlock' in Android Settings > Developer Options."
; XREF string 0x0000000048106f18: 'Already unlocked' -> 'Already unlocked for flashing.'
>> 0x0000000048082e1c: add      r1, pc
   0x0000000048082e1e: b.w      #0x4805b64c
   0x0000000048082e20: pop      {r0, r2, r4}

loc_0000000048082e22:
   0x0000000048082e22: ldr      r0, [pc, #0x54]
   0x0000000048082e24: ldr      r1, [pc, #0x54]
   0x0000000048082e26: pop.w    {r3, lr}
   0x0000000048082e28: ands     r0, r1
   0x0000000048082e2a: add      r0, pc
; XREF string 0x0000000048106d54: 'metadata' -> 'Failed to erase metadata.'
; XREF string 0x0000000048106e74: "Check 'Allow OEM Unlock'" -> "Check 'Allow OEM Unlock' in Android Settings > Developer Options."
>> 0x0000000048082e2c: add      r1, pc
   0x0000000048082e2e: b.w      #0x4805b64c
   0x0000000048082e30: pop      {r0, r2, r3}

loc_0000000048082e32:
   0x0000000048082e32: ldr      r0, [pc, #0x4c]
   0x0000000048082e34: ldr      r1, [pc, #0x4c]
   0x0000000048082e36: pop.w    {r3, lr}
   0x0000000048082e38: ands     r0, r1
   0x0000000048082e3a: add      r0, pc
; XREF string 0x0000000048106d64: 'metadata' -> 'metadata.'
; XREF string 0x0000000048106f38: 'userdata' -> 'Failed to erase userdata.'
>> 0x0000000048082e3c: add      r1, pc
   0x0000000048082e3e: b.w      #0x4805b64c
   0x0000000048082e40: pop      {r0, r2}
   0x0000000048082e42: nop      
   0x0000000048082e44: ldr      r5, [pc, #0x1c0]
   0x0000000048082e46: movs     r6, r2
   0x0000000048082e48: asrs     r4, r6, #0x10
   0x0000000048082e4a: movs     r7, r0
   0x0000000048082e4c: lsls     r2, r6
   0x0000000048082e4e: movs     r0, r1
   0x0000000048082e50: adds     r0, r7, r7
   0x0000000048082e52: movs     r7, r0
   0x0000000048082e54: subs     r7, #0xae
   0x0000000048082e56: movs     r0, r1
   0x0000000048082e58: asrs     r4, r7, #0xf
   0x0000000048082e5a: movs     r7, r0
   0x0000000048082e5c: adcs     r2, r5
   0x0000000048082e5e: movs     r0, r1
   0x0000000048082e60: asrs     r0, r6, #9
   0x0000000048082e62: movs     r7, r0

loc_0000000048082e64:
   0x0000000048082e64: ldrb     r6, [r1, r7]
   0x0000000048082e66: movs     r0, r1
   0x0000000048082e68: asrs     r6, r2, #0xf
   0x0000000048082e6a: movs     r7, r0
   0x0000000048082e6c: asrs     r0, r1
   0x0000000048082e6e: movs     r0, r1
   0x0000000048082e70: asrs     r6, r0, #0xf
   0x0000000048082e72: movs     r7, r0
   0x0000000048082e74: eors     r4, r2
   0x0000000048082e76: movs     r0, r1
   0x0000000048082e78: asrs     r6, r6, #0xe
   0x0000000048082e7a: movs     r7, r0
   0x0000000048082e7c: subs     r7, #0x24
   0x0000000048082e7e: movs     r0, r1
   0x0000000048082e80: asrs     r6, r4, #0xe
   0x0000000048082e82: movs     r7, r0
   0x0000000048082e84: lsrs     r0, r7
   0x0000000048082e86: movs     r0, r1
   0x0000000048082e88: push     {r3, r4, r5, lr}
   0x0000000048082e8a: ldr      r4, [r0, #0xc]
   0x0000000048082e8c: ldrb     r3, [r4, #1]
   0x0000000048082e8e: adds     r4, #1
   0x0000000048082e90: cmp      r3, #0x20
   0x0000000048082e92: bne      #0x48082e9c

loc_0000000048082e94:
   0x0000000048082e94: ldrb     r3, [r4, #1]!
   0x0000000048082e96: subs     r7, #1
   0x0000000048082e98: cmp      r3, #0x20
   0x0000000048082e9a: beq      #0x48082e94

loc_0000000048082e9c:
   0x0000000048082e9c: ldr      r3, [pc, #0xe8]
   0x0000000048082e9e: movw     r2, #0x7070
   0x0000000048082ea0: lsls     r0, r6, #9
   0x0000000048082ea2: add      r3, pc
   0x0000000048082ea4: ldr      r5, [r3]
   0x0000000048082ea6: cmp      r5, r2
   0x0000000048082ea8: beq      #0x48082f10
   0x0000000048082eaa: cbz      r5, #0x48082ef4
   0x0000000048082eac: ldr      r1, [pc, #0xdc]
   0x0000000048082eae: mov      r0, r4
   0x0000000048082eb0: add      r1, pc
   0x0000000048082eb2: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x0000000048082eb6: cmp      r0, #0
   0x0000000048082eb8: beq      #0x48082f48
   0x0000000048082eba: ldr      r1, [pc, #0xd4]
   0x0000000048082ebc: mov      r0, r4
   0x0000000048082ebe: add      r1, pc
   0x0000000048082ec0: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x0000000048082ec4: cmp      r0, #0
   0x0000000048082ec6: beq      #0x48082f50
   0x0000000048082ec8: ldr      r1, [pc, #0xc8]
   0x0000000048082eca: mov      r0, r4
   0x0000000048082ecc: add      r1, pc
   0x0000000048082ece: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x0000000048082ed2: cbnz     r0, #0x48082f20
   0x0000000048082ed4: movw     r3, #0x88ff
   0x0000000048082ed6: lsls     r7, r7, #0xf
   0x0000000048082ed8: cmp      r5, r3
   0x0000000048082eda: beq      #0x48082f78
   0x0000000048082edc: movw     r3, #0x77ee
   0x0000000048082ede: strb     r6, [r5, #0xf]
   0x0000000048082ee0: cmp      r5, r3
   0x0000000048082ee2: beq      #0x48082f68
   0x0000000048082ee4: ldr      r0, [pc, #0xb0]
   0x0000000048082ee6: ldr      r1, [pc, #0xb4]
   0x0000000048082ee8: add      r0, pc
   0x0000000048082eea: add      r1, pc
   0x0000000048082eec: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082eee: umull    r2, r0, lr, r1
   0x0000000048082ef0: movs     r0, #1
   0x0000000048082ef2: pop      {r3, r4, r5, pc}

loc_0000000048082ef4:
   0x0000000048082ef4: ldr      r4, [pc, #0xa8]
   0x0000000048082ef6: ldr      r1, [pc, #0xac]
   0x0000000048082ef8: add      r4, pc
   0x0000000048082efa: mov      r0, r4
; XREF string 0x0000000048106fa0: 'This command requires you to first unlock the bootloader' -> 'This command requires you to first unlock the bootloader.'
>> 0x0000000048082efc: add      r1, pc
   0x0000000048082efe: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082f02: ldr      r1, [pc, #0xa4]
   0x0000000048082f04: mov      r0, r4
; XREF string 0x0000000048106fa0: 'This command requires you to first unlock the bootloader' -> 'This command requires you to first unlock the bootloader.'
; XREF string 0x0000000048106fdc: 'A unlock code may be required' -> 'A unlock code may be required.'
>> 0x0000000048082f06: add      r1, pc
   0x0000000048082f08: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082f0a: umull    r2, r0, r0, r3
   0x0000000048082f0c: movs     r0, #3
   0x0000000048082f0e: pop      {r3, r4, r5, pc}

loc_0000000048082f10:
   0x0000000048082f10: ldr      r0, [pc, #0x98]
   0x0000000048082f12: ldr      r1, [pc, #0x9c]
   0x0000000048082f14: add      r0, pc
; XREF string 0x0000000048106fdc: 'A unlock code may be required' -> 'A unlock code may be required.'
>> 0x0000000048082f16: add      r1, pc
   0x0000000048082f18: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x0000000048082f1c: movs     r0, #3
   0x0000000048082f1e: pop      {r3, r4, r5, pc}
