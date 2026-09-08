; flow candidate 0x000000004805be08-0x000000004805bfee
; score: 20
; matched targets: avb_custom_key, debug_token, md_udc, metadata
; calls: 0x000000004805bdf8, 0x0000000048037fa4, 0x000000004805bd88, 0x000000004806ff38, 0x000000004805b64c, 0x0000000048081750, 0x0000000048082fdc, 0x0000000048097c10, 0x0000000048052000, 0x00000000480380b4, 0x0000000048038388, 0x00000000480371c0, 0x000000004806d0a0, 0x0000000048051940, 0x00000000480518e8, 0x0000000048051864, 0x000000004801f910

   0x000000004805be08: push     {r3, r4, r5, r6, r7, lr}
   0x000000004805be0a: ldr      r4, [r0, #0xc]
   0x000000004805be0c: ldr      r7, [r0]
   0x000000004805be0e: adds     r4, #1
   0x000000004805be10: ldr      r6, [r0, #8]
   0x000000004805be12: mov      r0, r4
   0x000000004805be14: bl       #0x4805bdf8  ; call 0x000000004805bdf8
   0x000000004805be16: vpadal.s8 d20, d5
   0x000000004805be18: mov      r5, r0
   0x000000004805be1a: cbnz     r0, #0x4805be7a
   0x000000004805be1c: ldr      r1, [pc, #0xd0]
   0x000000004805be1e: mov      r0, r4
; XREF string 0x00000000480f4784: 'avb_custom_key' -> 'avb_custom_key'
>> 0x000000004805be20: add      r1, pc
   0x000000004805be22: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x000000004805be24: ldrh.w   fp, [pc, #0x380]
   0x000000004805be26: cbz      r0, #0x4805be8a
   0x000000004805be28: ldr      r1, [pc, #0xc8]
   0x000000004805be2a: mov      r0, r4
; XREF string 0x00000000480f4784: 'avb_custom_key' -> 'avb_custom_key'
; XREF string 0x00000000480f4794: 'debug_token' -> 'debug_token'
>> 0x000000004805be2c: add      r1, pc
   0x000000004805be2e: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x000000004805be30: ldrh.w   r4, [sb, #0x601]
   0x000000004805be32: mov      r1, r0
   0x000000004805be34: cmp      r0, #0
   0x000000004805be36: beq      #0x4805beac
   0x000000004805be38: mov      r0, r4
   0x000000004805be3a: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x000000004805be3e: adds     r0, #1
   0x000000004805be40: beq      #0x4805be9c
   0x000000004805be42: ldr      r1, [pc, #0xb4]
   0x000000004805be44: mov      r0, r4
; XREF string 0x00000000480f47c0: 'metadata' -> 'metadata'
>> 0x000000004805be46: add      r1, pc
   0x000000004805be48: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x000000004805be4a: strh.w   r2, [ip, #0x800]
   0x000000004805be4c: cmp      r0, #0
   0x000000004805be4e: beq      #0x4805becc

loc_000000004805be50:
   0x000000004805be50: ldr      r1, [pc, #0xa8]
   0x000000004805be52: mov      r0, r4
; XREF string 0x00000000480f47cc: 'md_udc' -> 'md_udc'
>> 0x000000004805be54: add      r1, pc
   0x000000004805be56: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x000000004805be58: strh.w   r4, [r5, #0x605]
   0x000000004805be5a: mov      r5, r0
   0x000000004805be5c: cbz      r0, #0x4805bebc

loc_000000004805be5e:
   0x000000004805be5e: ldr      r1, [pc, #0xa0]
   0x000000004805be60: mov      r0, r4
   0x000000004805be62: add      r1, pc
   0x000000004805be64: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x000000004805be66: ldrb.w   fp, [lr, #0x320]
   0x000000004805be68: cbz      r0, #0x4805beb4

loc_000000004805be6a:
   0x000000004805be6a: ldr      r1, [pc, #0x98]
   0x000000004805be6c: mov      r2, r4
   0x000000004805be6e: movs     r0, #1
   0x000000004805be70: add      r1, pc
   0x000000004805be72: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004805be76: movs     r0, #1
   0x000000004805be78: pop      {r3, r4, r5, r6, r7, pc}

loc_000000004805be7a:
   0x000000004805be7a: ldr      r0, [pc, #0x8c]
   0x000000004805be7c: ldr      r1, [pc, #0x8c]
   0x000000004805be7e: add      r0, pc
   0x000000004805be80: add      r1, pc
   0x000000004805be82: bl       #0x4805b64c  ; call 0x000000004805b64c
   0x000000004805be84: umlal    r2, r0, r3, r3
   0x000000004805be86: movs     r0, #3
   0x000000004805be88: pop      {r3, r4, r5, r6, r7, pc}

loc_000000004805be8a:
   0x000000004805be8a: mov      r0, r7
   0x000000004805be8c: mov      r1, r6
   0x000000004805be8e: bl       #0x48081750  ; call 0x0000000048081750
   0x000000004805be90: mrrc2    p8, #0, r2, pc, c0
   0x000000004805be92: cmp      r0, #0
   0x000000004805be94: ite      ne
   0x000000004805be96: movs     r0, #3
   0x000000004805be98: movs     r0, #1
   0x000000004805be9a: pop      {r3, r4, r5, r6, r7, pc}

loc_000000004805be9c:
   0x000000004805be9c: ldr      r1, [pc, #0x70]
   0x000000004805be9e: mov      r0, r5
   0x000000004805bea0: mov      r2, r4
   0x000000004805bea2: add      r1, pc
   0x000000004805bea4: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004805bea6: str.w    r2, [r8, r3]
   0x000000004805bea8: movs     r0, #3
   0x000000004805beaa: pop      {r3, r4, r5, r6, r7, pc}

loc_000000004805beac:
   0x000000004805beac: bl       #0x48082fdc  ; call 0x0000000048082fdc
   0x000000004805beae: ldrb.w   r2, [r6, #1]
   0x000000004805beb0: movs     r0, #1
   0x000000004805beb2: pop      {r3, r4, r5, r6, r7, pc}

loc_000000004805beb4:
   0x000000004805beb4: movs     r0, #1
   0x000000004805beb6: bl       #0x48097c10  ; call 0x0000000048097c10
   0x000000004805beb8: mcr2     p7, #5, lr, c11, c6, #6
   0x000000004805beba: b        #0x4805be6a

loc_000000004805bebc:
   0x000000004805bebc: ldr      r0, [pc, #0x54]
   0x000000004805bebe: add      r0, pc
   0x000000004805bec0: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x000000004805bec2: vmax.u32 d20, d2, d24
   0x000000004805bec4: mov      r0, r5
   0x000000004805bec6: bl       #0x48097c10  ; call 0x0000000048097c10
   0x000000004805bec8: cdp2     p7, #0xa, c14, c3, c8, #6
   0x000000004805beca: b        #0x4805be5e

loc_000000004805becc:
   0x000000004805becc: ldr      r5, [pc, #0x48]
; XREF string 0x00000000480f47cc: 'md_udc' -> 'md_udc'
>> 0x000000004805bece: add      r5, pc
   0x000000004805bed0: mov      r0, r5
   0x000000004805bed2: bl       #0x48052000  ; call 0x0000000048052000
   0x000000004805bed4: ldrb.w   r4, [r5, #0x606]
   0x000000004805bed6: mov      r6, r0
   0x000000004805bed8: cmp      r0, #0
   0x000000004805beda: bne      #0x4805be50
   0x000000004805bedc: mov      r0, r5
   0x000000004805bede: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x000000004805bee0: vmls.i16 d20, d3, d14
   0x000000004805bee2: ldr      r1, [pc, #0x38]
   0x000000004805bee4: mov      r0, r6
   0x000000004805bee6: mov      r2, r5
   0x000000004805bee8: add      r1, pc
   0x000000004805beea: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004805beee: b        #0x4805be50
   0x000000004805bef0: ldrh     r0, [r4, #0xa]
   0x000000004805bef2: movs     r1, r1
   0x000000004805bef4: ldrh     r4, [r4, #0xa]
   0x000000004805bef6: movs     r1, r1
   0x000000004805bef8: ldrh     r6, [r6, #0xa]
   0x000000004805befa: movs     r1, r1
   0x000000004805befc: push     {r4, r5, r6, r7, lr}
   0x000000004805befe: movs     r1, r1
   0x000000004805bf00: stm      r6!, {r1, r7}
   0x000000004805bf02: movs     r2, r1
   0x000000004805bf04: ldrh     r0, [r0, #0xc]
   0x000000004805bf06: movs     r1, r1
   0x000000004805bf08: strh     r2, [r4, #0x1a]
   0x000000004805bf0a: movs     r1, r1
   0x000000004805bf0c: ldrh     r0, [r6, #4]
   0x000000004805bf0e: movs     r1, r1
   0x000000004805bf10: ldrh     r2, [r7, #6]
   0x000000004805bf12: movs     r1, r1
   0x000000004805bf14: ldrh     r6, [r4, #8]
   0x000000004805bf16: movs     r1, r1
   0x000000004805bf18: ldrh     r2, [r7, #6]
   0x000000004805bf1a: movs     r1, r1
   0x000000004805bf1c: ldrh     r0, [r5, #6]
   0x000000004805bf1e: movs     r1, r1
   0x000000004805bf20: push.w   {r4, r5, r6, r7, r8, sb, sl, fp, lr}
   0x000000004805bf22: ldr      r7, [pc, #0x3c0]
   0x000000004805bf24: mov      r5, r1
   0x000000004805bf26: sub      sp, #0x6c
   0x000000004805bf28: cmp      r1, #0
   0x000000004805bf2a: beq.w    #0x4805c052
   0x000000004805bf2c: strh     r2, [r2, #4]
   0x000000004805bf2e: add      r4, sp, #0x20
   0x000000004805bf30: mov      r1, r0
   0x000000004805bf32: ldr.w    sb, [pc, #0x130]
   0x000000004805bf34: str      r1, [sp, #0xc0]
   0x000000004805bf36: add.w    r8, sp, #0x1c
   0x000000004805bf38: lsrs     r4, r3, #0x20
   0x000000004805bf3a: mov      r6, r2
   0x000000004805bf3c: mov      r0, r4
   0x000000004805bf3e: movs     r2, #0x48
   0x000000004805bf40: mov      r7, r3
   0x000000004805bf42: add      sb, pc
   0x000000004805bf44: bl       #0x480380b4  ; call 0x00000000480380b4
   0x000000004805bf46: ldrh.w   r4, [r6, #0x642]
   0x000000004805bf48: mov      r2, r8
   0x000000004805bf4a: mov      r1, sb
   0x000000004805bf4c: mov      r0, r4
   0x000000004805bf4e: bl       #0x48038388  ; call 0x0000000048038388
   0x000000004805bf52: mov      r2, r8
   0x000000004805bf54: mov      r1, sb
   0x000000004805bf56: movs     r0, #0
   0x000000004805bf58: bl       #0x48038388  ; call 0x0000000048038388
   0x000000004805bf5c: mov      r8, r0
   0x000000004805bf5e: cmp      r0, #0
   0x000000004805bf60: beq      #0x4805bff2
   0x000000004805bf62: bl       #0x480371c0  ; call 0x00000000480371c0
   0x000000004805bf64: vld2.8   {d2, d3, d4, d5}, [sp], r0
   0x000000004805bf66: movs     r3, #0
   0x000000004805bf68: uxtb     r1, r0
   0x000000004805bf6a: strb     r3, [r8, #-0x1]
   0x000000004805bf6c: subs     r4, #1
   0x000000004805bf6e: mov      r0, r4
   0x000000004805bf70: bl       #0x4806d0a0  ; call 0x000000004806d0a0
   0x000000004805bf72: ldrb.w   r4, [r6, #0x683]
   0x000000004805bf74: mov      fp, r0
   0x000000004805bf76: cmp.w    fp, #-1
   0x000000004805bf78: subs     r7, #0xff
   0x000000004805bf7a: beq      #0x4805c022
   0x000000004805bf7c: mov      r0, fp
   0x000000004805bf7e: bl       #0x48051940  ; call 0x0000000048051940
   0x000000004805bf80: ldc2l    p6, c4, [pc], {2}
   0x000000004805bf82: mov      r2, r0
   0x000000004805bf84: mov      r3, r1
   0x000000004805bf86: mov      r0, fp
   0x000000004805bf88: strd     r2, r3, [sp, #0x10]
   0x000000004805bf8a: movs     r3, #4
   0x000000004805bf8c: bl       #0x480518e8  ; call 0x00000000480518e8
   0x000000004805bf8e: stc2     p6, c4, [ip], #0x200
   0x000000004805bf90: mov      r8, r0
   0x000000004805bf92: mov      r0, fp
   0x000000004805bf94: mov      sb, r1
   0x000000004805bf96: bl       #0x48051864  ; call 0x0000000048051864
   0x000000004805bf98: stc2l    p9, c14, [r5], #-0x374
   0x000000004805bf9a: ldrd     r2, r3, [sp, #0x10]
   0x000000004805bf9c: movs     r3, #4
   0x000000004805bf9e: mov      sl, r0
   0x000000004805bfa0: cmp      r3, r7
   0x000000004805bfa2: it       eq
   0x000000004805bfa4: cmp      r2, r6
   0x000000004805bfa6: blo      #0x4805bffc
   0x000000004805bfa8: ldr      r1, [pc, #0xbc]
   0x000000004805bfaa: movs     r0, #1
   0x000000004805bfac: mov      r2, r4
   0x000000004805bfae: add      r1, pc
   0x000000004805bfb0: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004805bfb2: vrsubhn.i16 d20, q1, q8
   0x000000004805bfb4: mov      r0, r4
   0x000000004805bfb6: bl       #0x4805bd88  ; call 0x000000004805bd88
   0x000000004805bfb8: mcr2     p1, #7, pc, c7, c0, #5
   0x000000004805bfba: cmp.w    r0, #-1
   0x000000004805bfbc: subs     r7, #0xff
   0x000000004805bfbe: mov      fp, r0
   0x000000004805bfc0: beq      #0x4805c044
   0x000000004805bfc2: ldr      r1, [pc, #0xa8]
   0x000000004805bfc4: movs     r0, #2
   0x000000004805bfc6: mov      r2, r4
   0x000000004805bfc8: strd     r8, sb, [sp]
   0x000000004805bfca: ldrh     r0, [r0, #8]
   0x000000004805bfcc: strd     r6, r7, [sp, #8]
   0x000000004805bfce: str      r2, [r0, #0x70]
   0x000000004805bfd0: add      r1, pc
   0x000000004805bfd2: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x000000004805bfd4: vtbx.8   d14, {d17, d18}, d13
   0x000000004805bfd6: strd     r6, r7, [sp]
   0x000000004805bfd8: str      r0, [r0, #0x70]
   0x000000004805bfda: mov      r0, sl
   0x000000004805bfdc: str      r5, [sp, #8]
   0x000000004805bfde: mov      r2, r8
   0x000000004805bfe0: mov      r3, sb
   0x000000004805bfe2: bl       #0x4801f910  ; call 0x000000004801f910
   0x000000004805bfe4: ldc2     p6, c4, [r5], {0x83}
   0x000000004805bfe6: mov      fp, r0
   0x000000004805bfe8: cbnz     r0, #0x4805c030
   0x000000004805bfea: mov      r0, fp
   0x000000004805bfec: add      sp, #0x6c
   0x000000004805bfee: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
