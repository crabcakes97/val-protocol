; flow candidate 0x0000000048023d20-0x0000000048023d94
; score: 2
; matched targets: serialno
; calls: 0x00000000480382ec, 0x000000004801edd0, 0x00000000480380fc

   0x0000000048023d20: push     {r3, r4, r5, r6, r7, lr}
   0x0000000048023d22: ldr      r5, [pc, #0x9c]
   0x0000000048023d24: ldr      r7, [pc, #0x9c]
   0x0000000048023d26: add      r5, pc
   0x0000000048023d28: mov      r0, r5
; XREF string 0x00000000480cdd40: 'serialno' -> 'androidboot.serialno='
>> 0x0000000048023d2a: add      r7, pc
   0x0000000048023d2c: mov      r1, r7
   0x0000000048023d2e: bl       #0x480382ec  ; call 0x00000000480382ec
   0x0000000048023d30: ssub16   r5, sp, r5
   0x0000000048023d32: add.w    r1, r5, #0x800
   0x0000000048023d34: str      r0, [r0, #0x10]
   0x0000000048023d36: mov      r6, r0
   0x0000000048023d38: cmp      r0, r1
   0x0000000048023d3a: ite      ls
   0x0000000048023d3c: movs     r3, #0
   0x0000000048023d3e: movs     r3, #1
   0x0000000048023d40: cmp      r0, #0
   0x0000000048023d42: ite      ne
   0x0000000048023d44: mov      r4, r3
   0x0000000048023d46: orr      r4, r3, #1
   0x0000000048023d48: lsls     r1, r0, #0x10
   0x0000000048023d4a: cbnz     r4, #0x48023da6
   0x0000000048023d4c: ldrb     r2, [r0]
   0x0000000048023d4e: cmp      r2, #0x20
   0x0000000048023d50: it       ne
   0x0000000048023d52: cmp      r0, r1
   0x0000000048023d54: itet     hs
   0x0000000048023d56: movs     r2, #0
   0x0000000048023d58: movs     r2, #1
   0x0000000048023d5a: mov      r4, r2
   0x0000000048023d5c: bhs      #0x48023d6e
   0x0000000048023d5e: mov      r3, r0

loc_0000000048023d60:
   0x0000000048023d60: ldrb     r2, [r3, #1]!
   0x0000000048023d62: cmp      r7, #1
   0x0000000048023d64: adds     r4, #1
   0x0000000048023d66: cmp      r2, #0x20
   0x0000000048023d68: it       ne
   0x0000000048023d6a: cmp      r1, r3
   0x0000000048023d6c: bhi      #0x48023d60

loc_0000000048023d6e:
   0x0000000048023d6e: bl       #0x4801edd0  ; call 0x000000004801edd0
   0x0000000048023d72: cbnz     r0, #0x48023d96
   0x0000000048023d74: ldr      r5, [pc, #0x50]
   0x0000000048023d76: mov      r2, r4
   0x0000000048023d78: movs     r1, #0x78
   0x0000000048023d7a: mov      r0, r6
   0x0000000048023d7c: blx      #0x48037e4c
   0x0000000048023d7e: strd     r4, r4, [r6], #-0x1f4
; XREF string 0x00000000480cdd40: 'serialno' -> 'androidboot.serialno='
>> 0x0000000048023d80: add      r5, pc
   0x0000000048023d82: mov      r0, r5
   0x0000000048023d84: bl       #0x480380fc  ; call 0x00000000480380fc
   0x0000000048023d86: ldrsh.w  r4, [sl, #0x629]
   0x0000000048023d88: mov      r1, r5
   0x0000000048023d8a: mov      r2, r0
   0x0000000048023d8c: mov      r0, r6
   0x0000000048023d8e: blx      #0x48037d14
   0x0000000048023d90: vaddl.s8 q9, d2, d1
   0x0000000048023d92: movs     r0, #1
   0x0000000048023d94: pop      {r3, r4, r5, r6, r7, pc}
