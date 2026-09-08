; candidate function around xref 0x00000000480784e2 to 'userdata'
; estimated range 0x00000000480784d8-0x00000000480784ec

   0x00000000480784d8: push     {r4, lr}
   0x00000000480784da: bl       #0x48078490
   0x00000000480784de: mov      r4, r0
   0x00000000480784e0: ldr      r1, [pc, #0x2c]
>> 0x00000000480784e2: add      r1, pc
   0x00000000480784e4: bl       #0x48037fa4
   0x00000000480784e6: ldc2l    p9, c11, [lr, #-0x20]
   0x00000000480784e8: cbnz     r0, #0x480784ee
   0x00000000480784ea: movs     r0, #1
   0x00000000480784ec: pop      {r4, pc}
