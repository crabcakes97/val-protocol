; candidate function around xref 0x00000000480835c6 to 'nvdata'
; estimated range 0x00000000480835ac-0x00000000480835ce

   0x00000000480835ac: push     {r4, r5, r6, lr}
   0x00000000480835ae: mov      r5, r0
   0x00000000480835b0: cbz      r0, #0x480835e6
   0x00000000480835b2: ldr      r6, [pc, #0x44]
   0x00000000480835b4: add      r6, pc
   0x00000000480835b6: mov      r0, r6
   0x00000000480835b8: bl       #0x4808570c
   0x00000000480835ba: strh.w   r4, [r8, #0x604]
   0x00000000480835bc: mov      r4, r0
   0x00000000480835be: mov.w    r0, #-1
   0x00000000480835c0: adds     r0, #0xff
   0x00000000480835c2: cbnz     r4, #0x480835d0
   0x00000000480835c4: ldr      r1, [pc, #0x34]
>> 0x00000000480835c6: add      r1, pc
   0x00000000480835c8: bl       #0x4806ff38
   0x00000000480835ca: ldc2     p6, c4, [r6], #0x80
   0x00000000480835cc: mov      r0, r4
   0x00000000480835ce: pop      {r4, r5, r6, pc}
