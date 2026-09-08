; flow candidate 0x00000000480641b0-0x00000000480641d2
; score: 2
; matched targets: sku
; calls: 0x00000000480982e0

   0x00000000480641b0: push     {r4, lr}
   0x00000000480641b2: mov      r4, r0
   0x00000000480641b4: movs     r0, #0
   0x00000000480641b6: mov      r2, r4
; XREF string 0x00000000480f2e48: 'sku' -> 'sku'
>> 0x00000000480641b8: add      r1, pc
   0x00000000480641ba: strb     r0, [r4]
   0x00000000480641bc: bl       #0x480982e0  ; call 0x00000000480982e0
   0x00000000480641be: ldrb.w   fp, [r0, #0x138]
   0x00000000480641c0: cbz      r0, #0x480641d2
   0x00000000480641c2: ldr      r1, [pc, #0x14]
   0x00000000480641c4: mov      r2, r4
   0x00000000480641c6: movs     r0, #1
   0x00000000480641c8: pop.w    {r4, lr}
   0x00000000480641ca: ands     r0, r2
; XREF string 0x00000000480f8340: 'sku' -> 'SKU: %s\n'
>> 0x00000000480641cc: add      r1, pc
   0x00000000480641ce: b.w      #0x4806ff38
   0x00000000480641d0: bkpt     #0xb3

loc_00000000480641d2:
   0x00000000480641d2: pop      {r4, pc}
