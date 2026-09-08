; flow candidate 0x00000000480835ac-0x00000000480835e4
; score: 5
; matched targets: nvdata
; calls: 0x000000004808570c, 0x000000004806ff38, 0x0000000048038150

   0x00000000480835ac: push     {r4, r5, r6, lr}
   0x00000000480835ae: mov      r5, r0
   0x00000000480835b0: cbz      r0, #0x480835e6
   0x00000000480835b2: ldr      r6, [pc, #0x44]
   0x00000000480835b4: add      r6, pc
   0x00000000480835b6: mov      r0, r6
   0x00000000480835b8: bl       #0x4808570c  ; call 0x000000004808570c
   0x00000000480835ba: strh.w   r4, [r8, #0x604]
   0x00000000480835bc: mov      r4, r0
   0x00000000480835be: mov.w    r0, #-1
   0x00000000480835c0: adds     r0, #0xff
   0x00000000480835c2: cbnz     r4, #0x480835d0
   0x00000000480835c4: ldr      r1, [pc, #0x34]
; XREF string 0x000000004810776c: 'nvdata' -> 'mot_sec: No place is found to decide erase nvdata\n'
>> 0x00000000480835c6: add      r1, pc
   0x00000000480835c8: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x00000000480835ca: ldc2     p6, c4, [r6], #0x80
   0x00000000480835cc: mov      r0, r4
   0x00000000480835ce: pop      {r4, r5, r6, pc}

loc_00000000480835d0:
   0x00000000480835d0: ldr      r1, [pc, #0x2c]
; XREF string 0x0000000048107730: 'nvdata' -> "mot_sec: Locate 'nvdata-erase' cmd string in sec partition\n"
; XREF string 0x000000004810776c: 'nvdata' -> 'mot_sec: No place is found to decide erase nvdata\n'
>> 0x00000000480835d2: add      r1, pc
   0x00000000480835d4: bl       #0x4806ff38  ; call 0x000000004806ff38
   0x00000000480835d6: ldc2     p6, c4, [r0], #0xa0
   0x00000000480835d8: mov      r0, r5
   0x00000000480835da: mov      r1, r6
   0x00000000480835dc: movs     r2, #5
   0x00000000480835de: bl       #0x48038150  ; call 0x0000000048038150
   0x00000000480835e0: ldc2     p0, c2, [r7, #4]!
   0x00000000480835e2: movs     r0, #1
   0x00000000480835e4: pop      {r4, r5, r6, pc}
