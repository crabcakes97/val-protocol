; flow candidate 0x000000004801c4ea-0x000000004801c612
; score: 4
; matched targets: imei
; calls: 0x000000004804b5a4, 0x000000004801c400, 0x000000004801c440, 0x0000000048038f00

   0x000000004801c4ea: push.w   {r4, r5, r6, r7, r8, sb, sl, fp, lr}
   0x000000004801c4ec: ldr      r7, [pc, #0x3c0]
   0x000000004801c4ee: movs     r4, #0
   0x000000004801c4f0: ldr.w    r8, [pc, #0x18c]
   0x000000004801c4f2: strh     r4, [r1, #0xc]
   0x000000004801c4f4: sub      sp, #0x3c
   0x000000004801c4f6: add      r3, pc
   0x000000004801c4f8: ldr      r3, [r3]
   0x000000004801c4fa: add      r8, pc
   0x000000004801c4fc: str      r4, [sp, #0x24]
   0x000000004801c4fe: str      r4, [sp, #0x28]
   0x000000004801c500: cmp      r3, #1
   0x000000004801c502: str      r4, [sp, #0x2c]
   0x000000004801c504: str      r4, [sp, #0x30]
   0x000000004801c506: str      r4, [sp, #0x34]
   0x000000004801c508: beq.w    #0x4801c670
   0x000000004801c50a: strh     r2, [r6, #4]
   0x000000004801c50c: ldr      r0, [pc, #0x174]
   0x000000004801c50e: ldr      r3, [pc, #0x178]
   0x000000004801c510: ldr      r1, [pc, #0x178]
   0x000000004801c512: ldr.w    r0, [r8, r0]
   0x000000004801c514: movs     r0, r0
   0x000000004801c516: ldr      r2, [pc, #0x178]
   0x000000004801c518: ldr.w    fp, [pc, #0x178]
   0x000000004801c51a: cbz      r0, #0x4801c53c
   0x000000004801c51c: str      r0, [sp, #0x18]
   0x000000004801c51e: ldr.w    sb, [r8, r3]
   0x000000004801c520: str      r0, [sp, #0xc]
   0x000000004801c522: ldr      r3, [pc, #0x174]
   0x000000004801c524: add      fp, pc
   0x000000004801c526: ldr.w    r7, [r8, r1]
   0x000000004801c528: strb     r1, [r0]
   0x000000004801c52a: ldr.w    r6, [r8, r2]
   0x000000004801c52c: str      r2, [r0]
   0x000000004801c52e: add      r3, pc
   0x000000004801c530: str      r3, [sp, #8]
   0x000000004801c532: ldr      r3, [pc, #0x168]
; XREF string 0x0000000048104bb0: 'imei' -> 'Checking SigRsp IMEI - comparing serial number data data'
>> 0x000000004801c534: add      r3, pc
   0x000000004801c536: str      r3, [sp, #0xc]
   0x000000004801c538: ldr      r3, [pc, #0x164]
; XREF string 0x0000000048104bec: 'imei' -> 'FIX ME ! Ignoring IMEI check error'
>> 0x000000004801c53a: add      r3, pc

loc_000000004801c53c:
   0x000000004801c53c: str      r3, [sp, #0x10]
   0x000000004801c53e: ldr      r3, [pc, #0x164]
; XREF string 0x0000000048104bec: 'imei' -> 'FIX ME ! Ignoring IMEI check error'
>> 0x000000004801c540: add      r3, pc
   0x000000004801c542: str      r3, [sp, #0x14]
   0x000000004801c544: ldr      r3, [pc, #0x160]
; XREF string 0x0000000048104bec: 'imei' -> 'FIX ME ! Ignoring IMEI check error'
>> 0x000000004801c546: add      r3, pc
   0x000000004801c548: str      r3, [sp, #0x1c]
   0x000000004801c54a: mov      r3, r8
   0x000000004801c54c: mov      sl, r3
   0x000000004801c54e: mov      r8, r0
   0x000000004801c550: b        #0x4801c5ca

loc_000000004801c552:
   0x000000004801c552: movs     r3, #1
   0x000000004801c554: str.w    r3, [fp]
   0x000000004801c556: adds     r0, #0
   0x000000004801c558: bl       #0x4804b5a4  ; call 0x000000004804b5a4
   0x000000004801c55c: mov      r1, r5
   0x000000004801c55e: ldr      r2, [sp, #8]
   0x000000004801c560: bl       #0x4801c400  ; call 0x000000004801c400
   0x000000004801c564: str.w    r0, [r8, #4]
   0x000000004801c566: movs     r4, r0
   0x000000004801c568: bl       #0x4804b5a4  ; call 0x000000004804b5a4
   0x000000004801c56c: mov      r1, r5
   0x000000004801c56e: ldr      r2, [sp, #0xc]
   0x000000004801c570: bl       #0x4801c400  ; call 0x000000004801c400
   0x000000004801c574: str.w    r0, [r8, #8]
   0x000000004801c576: movs     r0, r1
   0x000000004801c578: bl       #0x4804b5a4  ; call 0x000000004804b5a4
   0x000000004801c57c: mov      r1, r5
   0x000000004801c57e: ldr      r2, [sp, #0x10]
   0x000000004801c580: add      r3, sp, #0x24
   0x000000004801c582: bl       #0x4801c440  ; call 0x000000004801c440
   0x000000004801c584: vsub.i16 d26, d13, d9
   0x000000004801c586: add      r0, sp, #0x24
   0x000000004801c588: ldr.w    r3, [r8, #4]
   0x000000004801c58a: adds     r0, #4
   0x000000004801c58c: ldm      r0, {r0, r1, r2}
   0x000000004801c58e: cmp      r3, #4
   0x000000004801c590: str.w    r2, [r8, #0x14]
   0x000000004801c592: movs     r0, #0x14
   0x000000004801c594: ldr      r2, [sp, #0x30]
   0x000000004801c596: str.w    r0, [r8, #0xc]
   0x000000004801c598: movs     r4, r1
   0x000000004801c59a: str.w    r1, [r8, #0x10]
   0x000000004801c59c: asrs     r0, r2, #0x20
   0x000000004801c59e: str.w    r2, [r8, #0x18]
   0x000000004801c5a0: movs     r0, #0x18
   0x000000004801c5a2: ldrb.w   r2, [sp, #0x34]
   0x000000004801c5a4: movs     r0, #0x34
   0x000000004801c5a6: strb.w   r2, [r8, #0x1c]
   0x000000004801c5a8: movs     r0, #0x1c
   0x000000004801c5aa: beq      #0x4801c644
   0x000000004801c5ac: cmp      r3, #5
   0x000000004801c5ae: bne      #0x4801c622
   0x000000004801c5b0: ldr      r3, [pc, #0xf8]
   0x000000004801c5b2: ldr.w    r2, [sb]
   0x000000004801c5b4: movs     r0, #0
   0x000000004801c5b6: ldr.w    r3, [sl, r3]
   0x000000004801c5b8: adds     r0, #3
   0x000000004801c5ba: str.w    r3, [r8, #8]
   0x000000004801c5bc: adds     r0, #8
   0x000000004801c5be: cbnz     r2, #0x4801c616
   0x000000004801c5c0: adds     r4, #1
   0x000000004801c5c2: add.w    r8, r8, #0x20
   0x000000004801c5c4: lsrs     r0, r4, #0x20
   0x000000004801c5c6: cmp      r4, #7
   0x000000004801c5c8: beq      #0x4801c602

loc_000000004801c5ca:
   0x000000004801c5ca: ldr      r3, [r7], #4
   0x000000004801c5cc: subs     r3, #4
   0x000000004801c5ce: str.w    r3, [r8]
   0x000000004801c5d0: adds     r0, #0
   0x000000004801c5d2: bl       #0x4804b5a4  ; call 0x000000004804b5a4
   0x000000004801c5d4: vqrshrun.s64 d31, q3, #0x19
   0x000000004801c5d6: ldr      r1, [r6], #4
   0x000000004801c5d8: subs     r4, r0, r4
   0x000000004801c5da: bl       #0x48038f00  ; call 0x0000000048038f00
   0x000000004801c5dc: ldc2     p14, c1, [r1], {5}
   0x000000004801c5de: subs     r5, r0, #0
   0x000000004801c5e0: bge      #0x4801c552
   0x000000004801c5e2: ldr.w    r3, [sb]
   0x000000004801c5e4: adds     r0, #0
   0x000000004801c5e6: cmp      r3, #0
   0x000000004801c5e8: bne      #0x4801c662
   0x000000004801c5ea: adds     r4, #1
   0x000000004801c5ec: movs     r2, #0
   0x000000004801c5ee: cmp      r4, #7
   0x000000004801c5f0: mov.w    r3, #-1
   0x000000004801c5f2: adds     r3, #0xff
   0x000000004801c5f4: str.w    r2, [r8, #4]
   0x000000004801c5f6: movs     r0, #4
   0x000000004801c5f8: add.w    r8, r8, #0x20
   0x000000004801c5fa: lsrs     r0, r4, #0x20
   0x000000004801c5fc: str      r3, [r8, #-0x18]
   0x000000004801c5fe: subs     r4, #0x18
   0x000000004801c600: bne      #0x4801c5ca

loc_000000004801c602:
   0x000000004801c602: ldr      r3, [pc, #0xac]
   0x000000004801c604: ldr      r0, [sp, #0x18]
   0x000000004801c606: add      r3, pc
   0x000000004801c608: ldr      r3, [r3]
   0x000000004801c60a: cmp      r3, #0
   0x000000004801c60c: it       eq
   0x000000004801c60e: movs     r0, #0
   0x000000004801c610: add      sp, #0x3c
   0x000000004801c612: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
