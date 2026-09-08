; flow candidate 0x00000000480784d8-0x000000004807850c
; score: 10
; matched targets: cache, metadata, userdata
; calls: 0x0000000048078490, 0x0000000048037fa4

   0x00000000480784d8: push     {r4, lr}
   0x00000000480784da: bl       #0x48078490  ; call 0x0000000048078490
   0x00000000480784de: mov      r4, r0
   0x00000000480784e0: ldr      r1, [pc, #0x2c]
; XREF string 0x0000000048106d80: 'userdata' -> 'userdata'
>> 0x00000000480784e2: add      r1, pc
   0x00000000480784e4: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x00000000480784e6: ldc2l    p9, c11, [lr, #-0x20]
   0x00000000480784e8: cbnz     r0, #0x480784ee

loc_00000000480784ea:
   0x00000000480784ea: movs     r0, #1
   0x00000000480784ec: pop      {r4, pc}

loc_00000000480784ee:
   0x00000000480784ee: ldr      r1, [pc, #0x24]
   0x00000000480784f0: mov      r0, r4
; XREF string 0x00000000481036a8: 'cache' -> 'cache'
>> 0x00000000480784f2: add      r1, pc
   0x00000000480784f4: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x00000000480784f6: ldc2l    p8, c2, [r6, #-0]
   0x00000000480784f8: cmp      r0, #0
   0x00000000480784fa: beq      #0x480784ea
   0x00000000480784fc: ldr      r1, [pc, #0x18]
   0x00000000480784fe: mov      r0, r4
; XREF string 0x00000000480f47c0: 'metadata' -> 'metadata'
>> 0x0000000048078500: add      r1, pc
   0x0000000048078502: bl       #0x48037fa4  ; call 0x0000000048037fa4
   0x0000000048078504: stc2l    p10, c15, [pc, #-0x2c0]
   0x0000000048078506: clz      r0, r0
   0x0000000048078508: eor      sb, r0, #0x40
   0x000000004807850a: lsrs     r0, r0, #5
   0x000000004807850c: pop      {r4, pc}
