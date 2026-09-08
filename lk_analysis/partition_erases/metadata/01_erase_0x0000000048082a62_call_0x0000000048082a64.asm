; partition: metadata
; operation: erase
; flow start: 0x0000000048082974 off=0x82974 HxD=00082974
; string VA: 0x00000000480f47c0 off=0xf47c0 HxD=000F47C0
; string text: 'metadata'
; reference mode: direct_string
; xref: 0x0000000048082a62 off=0x82a62 HxD=00082A62
; xref instruction: add r0, pc
; xref via: thumb ldr/add-pc r0
; call site: 0x0000000048082a64 off=0x82a64 HxD=00082A64
; call target: 0x000000004805bd88 off=0x5bd88 HxD=0005BD88
; result check: 0x0000000048082a68 off=0x82a68 HxD=00082A68
; failure target: 0x0000000048082af0 off=0x82af0 HxD=00082AF0
; failure message: 0x0000000048106d54 'Failed to erase metadata.'

   0x0000000048082a2c: bl       #0x48081f0c
   0x0000000048082a30: cbnz     r0, #0x48082a42
   0x0000000048082a32: cmp      r4, #0
   0x0000000048082a34: beq      #0x48082ae0
   0x0000000048082a36: mov      r0, r4
   0x0000000048082a38: movs     r1, #0x15
   0x0000000048082a3a: bl       #0x4803820c
   0x0000000048082a3e: cmp      r0, #0x14
   0x0000000048082a40: bhi      #0x48082ae0
   0x0000000048082a42: bl       #0x48081f0c
   0x0000000048082a46: cbnz     r0, #0x48082a60
   0x0000000048082a48: mov      r0, r4
   0x0000000048082a4a: bl       #0x48077fe0
   0x0000000048082a4e: cbnz     r0, #0x48082a60
   0x0000000048082a50: ldr      r0, [pc, #0xf8]
   0x0000000048082a52: ldr      r1, [pc, #0xfc]
   0x0000000048082a54: pop.w    {r4, lr}
   0x0000000048082a56: ands     r0, r2
   0x0000000048082a58: add      r0, pc
   0x0000000048082a5a: add      r1, pc
   0x0000000048082a5c: b.w      #0x4805b64c
   0x0000000048082a5e: pop      {r1, r2, r4, r5, r6, r7, pc}
   0x0000000048082a60: ldr      r0, [pc, #0xf0]
>> 0x0000000048082a62: add      r0, pc ; XREF
>> 0x0000000048082a64: bl       #0x4805bd88 ; CALL
   0x0000000048082a66: ldrsb.w  r2, [r0, #0x800]
>> 0x0000000048082a68: cmp      r0, #0 ; CHECK
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
   0x0000000048082a82: add      r4, pc
   0x0000000048082a84: mov      r0, r4
   0x0000000048082a86: bl       #0x48052000
   0x0000000048082a8a: cmp      r0, #0
   0x0000000048082a8c: beq      #0x48082b20
   0x0000000048082a8e: ldr      r0, [pc, #0xd0]
   0x0000000048082a90: ldr      r1, [pc, #0xd0]
   0x0000000048082a92: add      r0, pc
   0x0000000048082a94: add      r1, pc
   0x0000000048082a96: bl       #0x4805b64c
   0x0000000048082a98: ldc2l    p0, c2, [sb]
