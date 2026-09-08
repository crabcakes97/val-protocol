; candidate function around xref 0x0000000048082f16 to 'A unlock code may be required'
; estimated range 0x0000000048082e88-0x0000000048082f1e

   0x0000000048082e88: push     {r3, r4, r5, lr}
   0x0000000048082e8a: ldr      r4, [r0, #0xc]
   0x0000000048082e8c: ldrb     r3, [r4, #1]
   0x0000000048082e8e: adds     r4, #1
   0x0000000048082e90: cmp      r3, #0x20
   0x0000000048082e92: bne      #0x48082e9c
   0x0000000048082e94: ldrb     r3, [r4, #1]!
   0x0000000048082e96: subs     r7, #1
   0x0000000048082e98: cmp      r3, #0x20
   0x0000000048082e9a: beq      #0x48082e94
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
   0x0000000048082eb2: bl       #0x48037fa4
   0x0000000048082eb6: cmp      r0, #0
   0x0000000048082eb8: beq      #0x48082f48
   0x0000000048082eba: ldr      r1, [pc, #0xd4]
   0x0000000048082ebc: mov      r0, r4
   0x0000000048082ebe: add      r1, pc
   0x0000000048082ec0: bl       #0x48037fa4
   0x0000000048082ec4: cmp      r0, #0
   0x0000000048082ec6: beq      #0x48082f50
   0x0000000048082ec8: ldr      r1, [pc, #0xc8]
   0x0000000048082eca: mov      r0, r4
   0x0000000048082ecc: add      r1, pc
   0x0000000048082ece: bl       #0x48037fa4
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
   0x0000000048082eec: bl       #0x4805b64c
   0x0000000048082eee: umull    r2, r0, lr, r1
   0x0000000048082ef0: movs     r0, #1
   0x0000000048082ef2: pop      {r3, r4, r5, pc}
   0x0000000048082ef4: ldr      r4, [pc, #0xa8]
   0x0000000048082ef6: ldr      r1, [pc, #0xac]
   0x0000000048082ef8: add      r4, pc
   0x0000000048082efa: mov      r0, r4
   0x0000000048082efc: add      r1, pc
   0x0000000048082efe: bl       #0x4805b64c
   0x0000000048082f02: ldr      r1, [pc, #0xa4]
   0x0000000048082f04: mov      r0, r4
   0x0000000048082f06: add      r1, pc
   0x0000000048082f08: bl       #0x4805b64c
   0x0000000048082f0a: umull    r2, r0, r0, r3
   0x0000000048082f0c: movs     r0, #3
   0x0000000048082f0e: pop      {r3, r4, r5, pc}
   0x0000000048082f10: ldr      r0, [pc, #0x98]
   0x0000000048082f12: ldr      r1, [pc, #0x9c]
   0x0000000048082f14: add      r0, pc
>> 0x0000000048082f16: add      r1, pc
   0x0000000048082f18: bl       #0x4805b64c
   0x0000000048082f1c: movs     r0, #3
   0x0000000048082f1e: pop      {r3, r4, r5, pc}
