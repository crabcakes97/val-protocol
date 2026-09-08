; flow candidate 0x0000000048078e60-0x0000000048078ea0
; score: 1
; matched targets: imei
; calls: 0x0000000048080998

   0x0000000048078e60: push     {r3, r4, r5, lr}
   0x0000000048078e62: ldr      r3, [pc, #0x40]
   0x0000000048078e64: add      r3, pc
   0x0000000048078e66: ldr      r3, [r3]
   0x0000000048078e68: cbz      r3, #0x48078e7c
   0x0000000048078e6a: cmp      r2, #0x33
   0x0000000048078e6c: it       ne
   0x0000000048078e6e: cmp      r2, #0xf
   0x0000000048078e70: bne      #0x48078e7c
   0x0000000048078e72: ldr      r3, [r1]
   0x0000000048078e74: cmp      r3, #0xf
   0x0000000048078e76: bhi      #0x48078e84
   0x0000000048078e78: movs     r0, #0x55
   0x0000000048078e7a: pop      {r3, r4, r5, pc}

loc_0000000048078e7c:
   0x0000000048078e7c: pop.w    {r3, r4, r5, lr}
   0x0000000048078e7e: ands     r0, r7
   0x0000000048078e80: b.w      #0x480807d0
   0x0000000048078e82: pop      {r1, r2, r5, r7}

loc_0000000048078e84:
   0x0000000048078e84: mov      r5, r0
   0x0000000048078e86: ldr      r0, [pc, #0x20]
   0x0000000048078e88: mov      r4, r1
; XREF string 0x000000004810488f: 'imei' -> '\x05\x82J¿\x95\x14z¸â®+±{8\x1b¶\x0c\x9b\x8eÒ\x92\r¾Õå·ïÜ|!ßÛ\x0bÔÒÓ\x86BâÔñø³Ýhn\x83Ú\x1fÍ\x16¾\x81[&¹öáw°owG·\x18æZ\x08\x88pj\x0fÿÊ;\x06f\\\x0b\x01\x11ÿ\x9ee\x8fi®bøÓÿkaEÏl\x16xâ\n\xa0îÒ\r×T\x83\x04NÂ³\x039a&g§÷\x16`ÐMGiIÛwn>JjÑ®ÜZÖÙf\x0bß@ð;Ø7S®¼©Å\x9e»Þ\x7fÏ²Géÿµ0\x1cò½½\x8aÂºÊ0\x93³S¦£´$\x056Ðº\x93\x06×Í)WÞT¿gÙ#.zf³¸JaÄ\x02\x1bh]\x94+o*7¾\x0b´¡\x8e\x0cÃ\x1bß\x05Z\x8dï\x02-Using ALT IMEI UID'
>> 0x0000000048078e8a: add      r0, pc
   0x0000000048078e8c: bl       #0x48080998  ; call 0x0000000048080998
   0x0000000048078e8e: stc2     p9, c4, [r4, #0x18]
   0x0000000048078e90: ldr      r1, [pc, #0x18]
   0x0000000048078e92: movs     r2, #0x10
   0x0000000048078e94: mov      r0, r5
   0x0000000048078e96: str      r2, [r4]
   0x0000000048078e98: add      r1, pc
   0x0000000048078e9a: blx      #0x48037d14
   0x0000000048078e9e: movs     r0, #0xf
   0x0000000048078ea0: pop      {r3, r4, r5, pc}
