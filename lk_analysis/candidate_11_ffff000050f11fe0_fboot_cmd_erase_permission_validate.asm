; candidate function around xref 0xffff000050f11ff8 to 'fboot_cmd_erase_permission_validate'
; estimated range 0xffff000050f11fe0-0xffff000050f121b4

   0xffff000050f11fe0: stp      x29, x30, [sp, #-0x30]!
   0xffff000050f11fe4: str      x21, [sp, #0x10]
   0xffff000050f11fe8: mov      x29, sp
   0xffff000050f11fec: stp      x20, x19, [sp, #0x20]
   0xffff000050f11ff0: adrp     x1, #0xffff000050fd9000
   0xffff000050f11ff4: mov      x19, x0
>> 0xffff000050f11ff8: add      x1, x1, #0x6f8
   0xffff000050f11ffc: mov      w0, #-1
   0xffff000050f12000: bl       #0xffff000050f29978
   0xffff000050f12004: ldr      x8, [x19, #0x10]
   0xffff000050f12008: adrp     x1, #0xffff000050fd3000
   0xffff000050f1200c: add      x1, x1, #0x5ba
   0xffff000050f12010: mov      w2, #0x48
   0xffff000050f12014: add      x19, x8, #1
   0xffff000050f12018: mov      x0, x19
   0xffff000050f1201c: bl       #0xffff000050f8e6fc
   0xffff000050f12020: cbz      w0, #0xffff000050f120a4
   0xffff000050f12024: adrp     x1, #0xffff000050ffb000
   0xffff000050f12028: mov      x0, x19
   0xffff000050f1202c: add      x1, x1, #0xc48
   0xffff000050f12030: mov      w2, #0x48
   0xffff000050f12034: bl       #0xffff000050f8e6fc
   0xffff000050f12038: cbz      w0, #0xffff000050f120b4
   0xffff000050f1203c: adrp     x1, #0xffff000050fe5000
   0xffff000050f12040: mov      x0, x19
   0xffff000050f12044: add      x1, x1, #0xb62
   0xffff000050f12048: mov      w2, #0x48
   0xffff000050f1204c: bl       #0xffff000050f8e6fc
   0xffff000050f12050: cbz      w0, #0xffff000050f120b4
   0xffff000050f12054: adrp     x1, #0xffff000050fdf000
   0xffff000050f12058: mov      x0, x19
   0xffff000050f1205c: add      x1, x1, #0x975
   0xffff000050f12060: bl       #0xffff000050f8e3ec
   0xffff000050f12064: cbz      w0, #0xffff000050f120bc
   0xffff000050f12068: mov      x0, x19
   0xffff000050f1206c: bl       #0xffff000050f25598
   0xffff000050f12070: mov      w21, w0
   0xffff000050f12074: mov      x0, x19
   0xffff000050f12078: bl       #0xffff000050f25510
   0xffff000050f1207c: bl       #0xffff000050f9e530
   0xffff000050f12080: tbz      w0, #0, #0xffff000050f12160
   0xffff000050f12084: mov      w20, #1
   0xffff000050f12088: cmn      w21, #1
   0xffff000050f1208c: b.eq     #0xffff000050f12180
   0xffff000050f12090: mov      x0, x19
   0xffff000050f12094: mov      w1, wzr
   0xffff000050f12098: bl       #0xffff000050f386b0
   0xffff000050f1209c: tbz      w0, #0, #0xffff000050f12198
   0xffff000050f120a0: b        #0xffff000050f121a4
   0xffff000050f120a4: bl       #0xffff000050f9d910
   0xffff000050f120a8: tbnz     w0, #0, #0xffff000050f120b4
   0xffff000050f120ac: bl       #0xffff000050f9d99c
   0xffff000050f120b0: tbz      w0, #0, #0xffff000050f1214c
   0xffff000050f120b4: mov      w20, #1
   0xffff000050f120b8: b        #0xffff000050f121a4
   0xffff000050f120bc: bl       #0xffff000050f24d58
   0xffff000050f120c0: cbz      w0, #0xffff000050f121a0
   0xffff000050f120c4: adrp     x20, #0xffff000050fd9000
   0xffff000050f120c8: adrp     x21, #0xffff000050fcf000
   0xffff000050f120cc: mov      w19, wzr
   0xffff000050f120d0: add      x20, x20, #0x53d
   0xffff000050f120d4: add      x21, x21, #0x1e1
   0xffff000050f120d8: b        #0xffff000050f120ec
   0xffff000050f120dc: add      w19, w19, #1
   0xffff000050f120e0: bl       #0xffff000050f24d58
   0xffff000050f120e4: cmp      w19, w0
   0xffff000050f120e8: b.hs     #0xffff000050f121a0
   0xffff000050f120ec: mov      w0, w19
   0xffff000050f120f0: bl       #0xffff000050f24f38
   0xffff000050f120f4: bl       #0xffff000050f9e530
   0xffff000050f120f8: tbz      w0, #0, #0xffff000050f120dc
   0xffff000050f120fc: mov      w0, w19
   0xffff000050f12100: bl       #0xffff000050f24d8c
   0xffff000050f12104: mov      x2, x0
   0xffff000050f12108: mov      x0, x20
   0xffff000050f1210c: mov      x1, x21
   0xffff000050f12110: bl       #0xffff000050f07c4c
   0xffff000050f12114: mov      w0, w19
   0xffff000050f12118: bl       #0xffff000050f24d8c
   0xffff000050f1211c: bl       #0xffff000050faf874
   0xffff000050f12120: tbz      x0, #0x3f, #0xffff000050f120dc
   0xffff000050f12124: mov      w0, w19
   0xffff000050f12128: bl       #0xffff000050f24d8c
   0xffff000050f1212c: mov      x2, x0
   0xffff000050f12130: adrp     x0, #0xffff000050fd9000
   0xffff000050f12134: adrp     x1, #0xffff000050fda000
   0xffff000050f12138: add      x0, x0, #0x53d
   0xffff000050f1213c: add      x1, x1, #0xadf
   0xffff000050f12140: bl       #0xffff000050f07c4c
   0xffff000050f12144: mov      w20, wzr
   0xffff000050f12148: b        #0xffff000050f121a4
   0xffff000050f1214c: adrp     x0, #0xffff000050fd9000
   0xffff000050f12150: adrp     x1, #0xffff000050fcf000
   0xffff000050f12154: add      x0, x0, #0x53d
   0xffff000050f12158: add      x1, x1, #0x1ad
   0xffff000050f1215c: b        #0xffff000050f12190
   0xffff000050f12160: adrp     x0, #0xffff000050fd9000
   0xffff000050f12164: adrp     x1, #0xffff000050fd3000
   0xffff000050f12168: add      x0, x0, #0x53d
   0xffff000050f1216c: add      x1, x1, #0x77c
   0xffff000050f12170: bl       #0xffff000050f07c4c
   0xffff000050f12174: mov      w20, #3
   0xffff000050f12178: cmn      w21, #1
   0xffff000050f1217c: b.ne     #0xffff000050f12090
   0xffff000050f12180: adrp     x0, #0xffff000050fd9000
   0xffff000050f12184: adrp     x1, #0xffff000050fe8000
   0xffff000050f12188: add      x0, x0, #0x53d
   0xffff000050f1218c: add      x1, x1, #0xff4
   0xffff000050f12190: mov      x2, x19
   0xffff000050f12194: bl       #0xffff000050f07c4c
   0xffff000050f12198: mov      w20, #3
   0xffff000050f1219c: b        #0xffff000050f121a4
   0xffff000050f121a0: mov      w20, wzr
   0xffff000050f121a4: mov      w0, w20
   0xffff000050f121a8: ldr      x21, [sp, #0x10]
   0xffff000050f121ac: ldp      x20, x19, [sp, #0x20]
   0xffff000050f121b0: ldp      x29, x30, [sp], #0x30
   0xffff000050f121b4: ret      
