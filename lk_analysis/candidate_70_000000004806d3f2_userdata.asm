; candidate function around xref 0x000000004806d404 to 'userdata'
; estimated range 0x000000004806d3f2-0x000000004806d53c

   0x000000004806d3f2: push.w   {r4, r5, r6, r7, r8, sb, sl, fp, lr}
   0x000000004806d3f4: ldr      r7, [pc, #0x3c0]
   0x000000004806d3f6: mov      fp, r0
   0x000000004806d3f8: ldr      r3, [pc, #0x3f4]
   0x000000004806d3fa: sub      sp, #0x64
   0x000000004806d3fc: add      r2, pc
   0x000000004806d3fe: add      r5, sp, #0x2c
   0x000000004806d400: ldm      r2, {r0, r1, r2}
   0x000000004806d402: mov      r6, r5
>> 0x000000004806d404: add      r3, pc
   0x000000004806d406: add      r7, sp, #0x20
   0x000000004806d408: ldr.w    lr, [pc, #0x3e8]
   0x000000004806d40a: b        #0x4806dbde
   0x000000004806d40c: movs     r4, #0
   0x000000004806d40e: mov      sl, r7
   0x000000004806d410: movt     ip, #0x70
   0x000000004806d412: lsrs     r0, r6, #0x11
   0x000000004806d414: stm      r6!, {r0, r1}
   0x000000004806d416: add      lr, pc
   0x000000004806d418: strh     r2, [r6]
   0x000000004806d41a: ldm.w    r3, {r0, r1, r2}
   0x000000004806d41c: movs     r7, r0
   0x000000004806d41e: ldr.w    lr, [lr]
   0x000000004806d420: b        #0x4806d424
   0x000000004806d422: str.w    ip, [sp, #0x1c]
   0x000000004806d424: stm      r0!, {r2, r3, r4}
   0x000000004806d426: stm.w    sl!, {r0, r1}
   0x000000004806d428: movs     r3, r0
   0x000000004806d42a: str      r4, [sp, #0x38]
   0x000000004806d42c: str      r4, [sp, #0x3c]
   0x000000004806d42e: str      r4, [sp, #0x40]
   0x000000004806d430: strb.w   r2, [sl]
   0x000000004806d432: movs     r0, #0
   0x000000004806d434: str      r4, [sp, #0x44]
   0x000000004806d436: str      r4, [sp, #0x48]
   0x000000004806d438: str      r4, [sp, #0x4c]
   0x000000004806d43a: str      r4, [sp, #0x50]
   0x000000004806d43c: str      r4, [sp, #0x54]
   0x000000004806d43e: str      r4, [sp, #0x58]
   0x000000004806d440: strb.w   r4, [sp, #0x5c]
   0x000000004806d442: eors     r4, r3
   0x000000004806d444: cmp.w    lr, #0
   0x000000004806d446: lsrs     r0, r0, #0x1c
   0x000000004806d448: beq.w    #0x4806d7c6
   0x000000004806d44a: strh     r5, [r7, #0xc]
   0x000000004806d44c: cmp.w    fp, #0
   0x000000004806d44e: lsrs     r0, r0, #0x1c
   0x000000004806d450: beq.w    #0x4806d7d6
   0x000000004806d452: strh     r1, [r0, #0xe]
   0x000000004806d454: ldr      r3, [pc, #0x3a0]
   0x000000004806d456: add      r3, pc
   0x000000004806d458: ldr      r6, [r3, #4]
   0x000000004806d45a: cmp      r6, r3
   0x000000004806d45c: beq      #0x4806d482
   0x000000004806d45e: ldr.w    sb, [pc, #0x39c]
   0x000000004806d460: str      r3, [sp, #0x270]
   0x000000004806d462: add      sb, pc
   0x000000004806d464: b        #0x4806d46c
   0x000000004806d466: ldr      r6, [r6, #4]
   0x000000004806d468: cmp      r6, sb
   0x000000004806d46a: beq      #0x4806d482
   0x000000004806d46c: ldrb     r4, [r6, #8]
   0x000000004806d46e: bl       #0x480a0640
   0x000000004806d472: cmp      r4, r0
   0x000000004806d474: bne      #0x4806d466
   0x000000004806d476: ldr      r1, [r6, #0x10]
   0x000000004806d478: mov      r0, fp
   0x000000004806d47a: mov.w    r2, #0x8000
   0x000000004806d47c: tst      r0, r0
   0x000000004806d47e: blx      #0x48037d14
   0x000000004806d482: ldr      r3, [pc, #0x37c]
   0x000000004806d484: mov.w    sb, #0
   0x000000004806d486: lsrs     r0, r0, #4
   0x000000004806d488: add      r3, pc
   0x000000004806d48a: ldr      r6, [r3]
   0x000000004806d48c: add      fp, r6
   0x000000004806d48e: ldr.w    r3, [fp, #0x2c]
   0x000000004806d490: adds     r0, #0x2c
   0x000000004806d492: add      r6, fp
   0x000000004806d494: ldr.w    r2, [fp, #0x28]
   0x000000004806d496: movs     r0, #0x28
   0x000000004806d498: ldr.w    r4, [fp, #0x50]
   0x000000004806d49a: eors     r0, r2
   0x000000004806d49c: cmp      r3, #0
   0x000000004806d49e: strb.w   sb, [fp, #0x10]
   0x000000004806d4a0: str      r0, [sp, #0x40]
   0x000000004806d4a2: it       eq
   0x000000004806d4a4: cmp      r2, #0x40
   0x000000004806d4a6: strb.w   sb, [fp, #0x11]
   0x000000004806d4a8: str      r0, [sp, #0x44]
   0x000000004806d4aa: ittte    ne
   0x000000004806d4ac: movs     r2, #8
   0x000000004806d4ae: movs     r3, #0
   0x000000004806d4b0: mov.w    r8, #0
   0x000000004806d4b2: lsrs     r0, r0, #0x20
   0x000000004806d4b4: mov.w    r8, #1
   0x000000004806d4b6: lsrs     r1, r0, #0x20
   0x000000004806d4b8: subs     r4, #1
   0x000000004806d4ba: str.w    r2, [fp, #0x20]
   0x000000004806d4bc: movs     r0, #0x20
   0x000000004806d4be: str.w    r3, [fp, #0x24]
   0x000000004806d4c0: adds     r0, #0x24
   0x000000004806d4c2: strb.w   sb, [fp, #0x12]
   0x000000004806d4c4: str      r0, [sp, #0x48]
   0x000000004806d4c6: strb.w   sb, [fp, #0x13]
   0x000000004806d4c8: str      r0, [sp, #0x4c]
   0x000000004806d4ca: strb.w   sb, [fp, #0x30]
   0x000000004806d4cc: str      r0, [sp, #0xc0]
   0x000000004806d4ce: strb.w   sb, [fp, #0x31]
   0x000000004806d4d0: str      r0, [sp, #0xc4]
   0x000000004806d4d2: strb.w   sb, [fp, #0x32]
   0x000000004806d4d4: str      r0, [sp, #0xc8]
   0x000000004806d4d6: strb.w   sb, [fp, #0x33]
   0x000000004806d4d8: str      r0, [sp, #0xcc]
   0x000000004806d4da: strb.w   sb, [fp, #0x34]
   0x000000004806d4dc: str      r0, [sp, #0xd0]
   0x000000004806d4de: strb.w   sb, [fp, #0x35]
   0x000000004806d4e0: str      r0, [sp, #0xd4]
   0x000000004806d4e2: strb.w   sb, [fp, #0x36]
   0x000000004806d4e4: str      r0, [sp, #0xd8]
   0x000000004806d4e6: strb.w   sb, [fp, #0x37]
   0x000000004806d4e8: str      r0, [sp, #0xdc]
   0x000000004806d4ea: strb.w   sb, [fp, #0x58]
   0x000000004806d4ec: str      r0, [sp, #0x160]
   0x000000004806d4ee: strb.w   sb, [fp, #0x59]
   0x000000004806d4f0: str      r0, [sp, #0x164]
   0x000000004806d4f2: strb.w   sb, [fp, #0x5a]
   0x000000004806d4f4: str      r0, [sp, #0x168]
   0x000000004806d4f6: strb.w   sb, [fp, #0x5b]
   0x000000004806d4f8: str      r0, [sp, #0x16c]
   0x000000004806d4fa: bmi      #0x4806d540
   0x000000004806d4fc: lsl.w    sl, r4, #7
   0x000000004806d4fe: subs     r4, r0, r3
   0x000000004806d500: add.w    sb, r6, sl
   0x000000004806d502: lsrs     r2, r1, #4
   0x000000004806d504: ldrb.w   r3, [sb, #0x37]
   0x000000004806d506: adds     r0, #0x37
   0x000000004806d508: lsls     r3, r3, #0x1a
   0x000000004806d50a: bpl      #0x4806d540
   0x000000004806d50c: rsb      sl, sb, sl
   0x000000004806d50e: lsrs     r2, r1, #8
   0x000000004806d510: sub.w    sl, sl, #0x80
   0x000000004806d512: lsrs     r0, r0, #0xa
   0x000000004806d514: b        #0x4806d51e
   0x000000004806d516: ldrb.w   r3, [sb, #0x37]
   0x000000004806d518: adds     r0, #0x37
   0x000000004806d51a: lsls     r0, r3, #0x1a
   0x000000004806d51c: bpl      #0x4806d540
   0x000000004806d51e: mov      r0, sb
   0x000000004806d520: movs     r1, #0
   0x000000004806d522: subs     r4, #1
   0x000000004806d524: movs     r2, #0x80
   0x000000004806d526: blx      #0x48037e4c
   0x000000004806d528: ldc      p12, c1, [r2], {0x61}
   0x000000004806d52a: adds     r1, r4, #1
   0x000000004806d52c: add      sb, sl
   0x000000004806d52e: add      sb, r6
   0x000000004806d530: bne      #0x4806d516
   0x000000004806d532: movs     r3, #0
   0x000000004806d534: str.w    r3, [fp, #0x50]
   0x000000004806d536: adds     r0, #0x50
   0x000000004806d538: movs     r0, #0
   0x000000004806d53a: add      sp, #0x64
   0x000000004806d53c: pop.w    {r4, r5, r6, r7, r8, sb, sl, fp, pc}
