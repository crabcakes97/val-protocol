; candidate function around xref 0x000000004805be20 to 'avb_custom_key'
; estimated range 0x000000004805be08-0x000000004805be78

   0x000000004805be08: push     {r3, r4, r5, r6, r7, lr}
   0x000000004805be0a: ldr      r4, [r0, #0xc]
   0x000000004805be0c: ldr      r7, [r0]
   0x000000004805be0e: adds     r4, #1
   0x000000004805be10: ldr      r6, [r0, #8]
   0x000000004805be12: mov      r0, r4
   0x000000004805be14: bl       #0x4805bdf8
   0x000000004805be16: vpadal.s8 d20, d5
   0x000000004805be18: mov      r5, r0
   0x000000004805be1a: cbnz     r0, #0x4805be7a
   0x000000004805be1c: ldr      r1, [pc, #0xd0]
   0x000000004805be1e: mov      r0, r4
>> 0x000000004805be20: add      r1, pc
   0x000000004805be22: bl       #0x48037fa4
   0x000000004805be24: ldrh.w   fp, [pc, #0x380]
   0x000000004805be26: cbz      r0, #0x4805be8a
   0x000000004805be28: ldr      r1, [pc, #0xc8]
   0x000000004805be2a: mov      r0, r4
   0x000000004805be2c: add      r1, pc
   0x000000004805be2e: bl       #0x48037fa4
   0x000000004805be30: ldrh.w   r4, [sb, #0x601]
   0x000000004805be32: mov      r1, r0
   0x000000004805be34: cmp      r0, #0
   0x000000004805be36: beq      #0x4805beac
   0x000000004805be38: mov      r0, r4
   0x000000004805be3a: bl       #0x4805bd88
   0x000000004805be3e: adds     r0, #1
   0x000000004805be40: beq      #0x4805be9c
   0x000000004805be42: ldr      r1, [pc, #0xb4]
   0x000000004805be44: mov      r0, r4
   0x000000004805be46: add      r1, pc
   0x000000004805be48: bl       #0x48037fa4
   0x000000004805be4a: strh.w   r2, [ip, #0x800]
   0x000000004805be4c: cmp      r0, #0
   0x000000004805be4e: beq      #0x4805becc
   0x000000004805be50: ldr      r1, [pc, #0xa8]
   0x000000004805be52: mov      r0, r4
   0x000000004805be54: add      r1, pc
   0x000000004805be56: bl       #0x48037fa4
   0x000000004805be58: strh.w   r4, [r5, #0x605]
   0x000000004805be5a: mov      r5, r0
   0x000000004805be5c: cbz      r0, #0x4805bebc
   0x000000004805be5e: ldr      r1, [pc, #0xa0]
   0x000000004805be60: mov      r0, r4
   0x000000004805be62: add      r1, pc
   0x000000004805be64: bl       #0x48037fa4
   0x000000004805be66: ldrb.w   fp, [lr, #0x320]
   0x000000004805be68: cbz      r0, #0x4805beb4
   0x000000004805be6a: ldr      r1, [pc, #0x98]
   0x000000004805be6c: mov      r2, r4
   0x000000004805be6e: movs     r0, #1
   0x000000004805be70: add      r1, pc
   0x000000004805be72: bl       #0x4806ff38
   0x000000004805be76: movs     r0, #1
   0x000000004805be78: pop      {r3, r4, r5, r6, r7, pc}
