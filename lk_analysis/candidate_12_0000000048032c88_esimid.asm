; candidate function around xref 0x0000000048032cb8 to 'esimid'
; estimated range 0x0000000048032c88-0x0000000048032d12

   0x0000000048032c88: push     {r4, r5, r6, r7, lr}
   0x0000000048032c8a: sub      sp, #0x94
   0x0000000048032c8c: movs     r1, #0
   0x0000000048032c8e: add      r5, sp, #0xc
   0x0000000048032c90: mov      r6, r1
   0x0000000048032c92: movs     r2, #0x40
   0x0000000048032c94: mov      r0, r5
   0x0000000048032c96: add      r4, sp, #0x4c
   0x0000000048032c98: blx      #0x48037e4c
   0x0000000048032c9c: mov      r1, r6
   0x0000000048032c9e: movs     r2, #0x3d
   0x0000000048032ca0: add      r0, sp, #0x50
   0x0000000048032ca2: str      r6, [sp, #0x4c]
   0x0000000048032ca4: blx      #0x48037e4c
   0x0000000048032ca8: movs     r0, #4
   0x0000000048032caa: bl       #0x480324f8
   0x0000000048032cac: stc2     p9, c4, [r5], #-0x64
   0x0000000048032cae: ldr      r1, [pc, #0x64]
   0x0000000048032cb0: mov      r7, r0
   0x0000000048032cb2: mov      r2, r4
   0x0000000048032cb4: mov      r0, r6
   0x0000000048032cb6: movs     r3, #0x41
>> 0x0000000048032cb8: add      r1, pc
   0x0000000048032cba: bl       #0x480982e0
   0x0000000048032cbc: smlatb   r6, r1, r0, r4
   0x0000000048032cbe: mov      r0, r4
   0x0000000048032cc0: bl       #0x480380fc
   0x0000000048032cc4: cbz      r0, #0x48032cce
   0x0000000048032cc6: mov      r0, r7
   0x0000000048032cc8: mov      r1, r4
   0x0000000048032cca: bl       #0x48032560
   0x0000000048032cce: ldr      r2, [pc, #0x48]
   0x0000000048032cd0: movs     r1, #0x40
   0x0000000048032cd2: mov      r3, r4
   0x0000000048032cd4: mov      r0, r5
   0x0000000048032cd6: add      r2, pc
   0x0000000048032cd8: bl       #0x48037b10
   0x0000000048032cda: vqadd.u16 d15, d10, d25
   0x0000000048032cdc: bl       #0x4806bfe4
   0x0000000048032cde: vst3.16  {d4[0], d5[0], d6[0]}, [r2], r6
   0x0000000048032ce0: mov      r6, r0
   0x0000000048032ce2: bl       #0x4806a968
   0x0000000048032ce4: cdp2     p1, #4, c0, c1, c3, #0
   0x0000000048032ce6: lsls     r3, r0, #4
   0x0000000048032ce8: sub.w    r3, r3, r0, lsl #2
   0x0000000048032cea: lsls     r0, r0, #0xe
   0x0000000048032cec: subs     r0, r3, r0
   0x0000000048032cee: add      r6, r0
   0x0000000048032cf0: bl       #0x4806bff4
   0x0000000048032cf2: vst3.16  {d4[0], d5[0], d6[0]}, [r0], r4
   0x0000000048032cf4: mov      r4, r0
   0x0000000048032cf6: bl       #0x4805a250
   0x0000000048032cf8: sasx     fp, fp, r4
   0x0000000048032cfa: mla      r2, r4, r0, r7
   0x0000000048032cfc: strb     r0, [r0, #8]
   0x0000000048032cfe: movs     r3, #0xff
   0x0000000048032d00: movt     r3, #0xff00
   0x0000000048032d02: strb     r0, [r0, #0xc]
   0x0000000048032d04: mov      r1, r6
   0x0000000048032d06: str      r3, [sp]
   0x0000000048032d08: mov      r0, r5
   0x0000000048032d0a: movs     r3, #0
   0x0000000048032d0c: bl       #0x4806a0d8
   0x0000000048032d0e: vld1.8   {d27[1]}, [r4], r5
   0x0000000048032d10: add      sp, #0x94
   0x0000000048032d12: pop      {r4, r5, r6, r7, pc}
