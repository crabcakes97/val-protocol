; candidate function around xref 0x0000000048083d94 to 'flashing_unlocked'
; estimated range 0x0000000048083d7c-0x0000000048083dc6

   0x0000000048083d7c: push     {r3, lr}
   0x0000000048083d7e: bl       #0x48081f60
   0x0000000048083d82: cbz      r0, #0x48083db4
   0x0000000048083d84: movs     r0, #0
   0x0000000048083d86: bl       #0x48083738
   0x0000000048083d88: ldc2l    p1, c11, [r7], {0xe8}
   0x0000000048083d8a: cbz      r0, #0x48083dc8
   0x0000000048083d8c: ldr      r0, [pc, #0x78]
   0x0000000048083d8e: movs     r2, #0x40
   0x0000000048083d90: ldr      r1, [pc, #0x78]
   0x0000000048083d92: add      r0, pc
>> 0x0000000048083d94: add      r1, pc
   0x0000000048083d96: bl       #0x480380b4
   0x0000000048083d98: vst3.8   {d15[2], d16[2], d17[2]}, [sp], r6
   0x0000000048083d9a: movw     r0, #0x66cc
   0x0000000048083d9c: str      r4, [r1, #0xc]
   0x0000000048083d9e: bl       #0x480820d0
   0x0000000048083da0: ldrsb.w  fp, [r7, #0x170]
   0x0000000048083da2: cbz      r0, #0x48083dc2
   0x0000000048083da4: ldr      r0, [pc, #0x68]
   0x0000000048083da6: movs     r2, #0x40
   0x0000000048083da8: ldr      r1, [pc, #0x68]
   0x0000000048083daa: add      r0, pc
   0x0000000048083dac: add      r1, pc
   0x0000000048083dae: bl       #0x48038048
   0x0000000048083db0: vst4.8   {d30, d31, d0, d1}, [fp], r6
   0x0000000048083db2: b        #0x48083dc2
   0x0000000048083db4: ldr      r0, [pc, #0x60]
   0x0000000048083db6: movs     r2, #0x40
   0x0000000048083db8: ldr      r1, [pc, #0x60]
   0x0000000048083dba: add      r0, pc
   0x0000000048083dbc: add      r1, pc
   0x0000000048083dbe: bl       #0x480380b4
   0x0000000048083dc2: ldr      r0, [pc, #0x5c]
   0x0000000048083dc4: add      r0, pc
   0x0000000048083dc6: pop      {r3, pc}
