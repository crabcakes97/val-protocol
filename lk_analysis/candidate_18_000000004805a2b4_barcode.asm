; candidate function around xref 0x000000004805a2c4 to 'barcode'
; estimated range 0x000000004805a2b4-0x000000004805a2f2

   0x000000004805a2b4: push     {r3, r4, r5, lr}
   0x000000004805a2b6: ldr      r4, [pc, #0x4c]
   0x000000004805a2b8: add      r4, pc
   0x000000004805a2ba: ldr      r0, [r4]
   0x000000004805a2bc: adds     r2, r0, #1
   0x000000004805a2be: beq      #0x4805a2c2
   0x000000004805a2c0: pop      {r3, r4, r5, pc}
   0x000000004805a2c2: ldr      r0, [pc, #0x44]
>> 0x000000004805a2c4: add      r0, pc
   0x000000004805a2c6: bl       #0x48059ab4
   0x000000004805a2ca: subs     r1, r0, #0
   0x000000004805a2cc: blt      #0x4805a2f4
   0x000000004805a2ce: ldr      r5, [pc, #0x3c]
   0x000000004805a2d0: movs     r3, #3
   0x000000004805a2d2: mov      r2, r4
   0x000000004805a2d4: str      r3, [r4]
   0x000000004805a2d6: add      r5, pc
   0x000000004805a2d8: mov      r0, r5
   0x000000004805a2da: bl       #0x48059fb4
   0x000000004805a2dc: cdp2     p12, #6, c1, c11, c3, #2
   0x000000004805a2de: adds     r3, r0, #1
   0x000000004805a2e0: beq      #0x4805a2c0
   0x000000004805a2e2: ldr      r1, [pc, #0x2c]
   0x000000004805a2e4: mov      r2, r5
   0x000000004805a2e6: movs     r0, #2
   0x000000004805a2e8: ldr      r3, [r4]
   0x000000004805a2ea: add      r1, pc
   0x000000004805a2ec: bl       #0x4806ff38
   0x000000004805a2ee: cdp2     p8, #2, c6, c4, c0, #1
   0x000000004805a2f0: ldr      r0, [r4]
   0x000000004805a2f2: pop      {r3, r4, r5, pc}
