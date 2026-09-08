; partition: md_udc
; operation: erase
; flow start: 0x0000000048082974 off=0x82974 HxD=00082974
; string VA: 0x00000000480f47cc off=0xf47cc HxD=000F47CC
; string text: 'md_udc'
; reference mode: direct_string
; xref: 0x0000000048082a82 off=0x82a82 HxD=00082A82
; xref instruction: add r4, pc
; xref via: thumb ldr/add-pc r4
; call site: 0x0000000048082a86 off=0x82a86 HxD=00082A86
; call target: 0x0000000048052000 off=0x52000 HxD=00052000
; result check: 0x0000000048082a8a off=0x82a8a HxD=00082A8A
; failure target: 0x0000000048082b20 off=0x82b20 HxD=00082B20
; failure message: 0x0000000048106da4 'Failed to erase md_udc.\n'

   0x0000000048082a54: pop.w    {r4, lr}
   0x0000000048082a56: ands     r0, r2
   0x0000000048082a58: add      r0, pc
   0x0000000048082a5a: add      r1, pc
   0x0000000048082a5c: b.w      #0x4805b64c
   0x0000000048082a5e: pop      {r1, r2, r4, r5, r6, r7, pc}
   0x0000000048082a60: ldr      r0, [pc, #0xf0]
   0x0000000048082a62: add      r0, pc
   0x0000000048082a64: bl       #0x4805bd88
   0x0000000048082a66: ldrsb.w  r2, [r0, #0x800]
   0x0000000048082a68: cmp      r0, #0
   0x0000000048082a6a: bne      #0x48082af0
   0x0000000048082a6c: ldr      r0, [pc, #0xe8]
   0x0000000048082a6e: add      r0, pc
   0x0000000048082a70: bl       #0x4805bd88
   0x0000000048082a72: vst1.32  {d2[0]}, [sl], r0
   0x0000000048082a74: cmp      r0, #0
   0x0000000048082a76: bne      #0x48082b00
   0x0000000048082a78: bl       #0x48083ea0
   0x0000000048082a7c: cmp      r0, #0
   0x0000000048082a7e: beq      #0x48082b10
   0x0000000048082a80: ldr      r4, [pc, #0xd8]
>> 0x0000000048082a82: add      r4, pc ; XREF
   0x0000000048082a84: mov      r0, r4
>> 0x0000000048082a86: bl       #0x48052000 ; CALL
>> 0x0000000048082a8a: cmp      r0, #0 ; CHECK
   0x0000000048082a8c: beq      #0x48082b20
   0x0000000048082a8e: ldr      r0, [pc, #0xd0]
   0x0000000048082a90: ldr      r1, [pc, #0xd0]
   0x0000000048082a92: add      r0, pc
   0x0000000048082a94: add      r1, pc
   0x0000000048082a96: bl       #0x4805b64c
   0x0000000048082a98: ldc2l    p0, c2, [sb]
   0x0000000048082a9a: movs     r0, #0
   0x0000000048082a9c: bl       #0x4808363c
   0x0000000048082a9e: stc2l    p0, c2, [lr, #4]
   0x0000000048082aa0: movs     r0, #1
   0x0000000048082aa2: bl       #0x480836dc
   0x0000000048082aa4: mrc2     p8, #0, r4, c11, c0, #1
   0x0000000048082aa6: ldr      r0, [pc, #0xc0]
   0x0000000048082aa8: ldr      r1, [pc, #0xc0]
   0x0000000048082aaa: add      r0, pc
   0x0000000048082aac: add      r1, pc
   0x0000000048082aae: bl       #0x4805b0f8
   0x0000000048082ab0: smlad    r0, r3, r2, r2
   0x0000000048082ab2: movs     r0, #2
   0x0000000048082ab4: pop.w    {r4, lr}
   0x0000000048082ab6: ands     r0, r2
   0x0000000048082ab8: b.w      #0x4801a504
