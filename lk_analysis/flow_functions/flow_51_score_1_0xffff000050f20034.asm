; flow candidate 0xffff000050f20034-0xffff000050f20260
; score: 1
; matched targets: barcode
; calls: 0xffff000050fc91b0, 0xffff000050f02cc0, 0xffff000050fc91cc, 0xffff000050f140ac, 0xffff000050f76588, 0xffff000050f89344, 0xffff000050f89374, 0xffff000050f893ac, 0xffff000050f76700, 0xffff000050f89398, 0xffff000050f893c4, 0xffff000050f893bc

   0xffff000050f20034: stp      x29, x30, [sp, #-0x50]!
   0xffff000050f20038: stp      x26, x25, [sp, #0x10]
   0xffff000050f2003c: mov      x29, sp
   0xffff000050f20040: stp      x24, x23, [sp, #0x20]
   0xffff000050f20044: stp      x22, x21, [sp, #0x30]
   0xffff000050f20048: stp      x20, x19, [sp, #0x40]
   0xffff000050f2004c: cbz      x1, #0xffff000050f2024c
   0xffff000050f20050: mov      x23, x1
   0xffff000050f20054: ldrb     w8, [x1]
   0xffff000050f20058: cbz      w8, #0xffff000050f2024c
   0xffff000050f2005c: mov      w20, w0
   0xffff000050f20060: bl       #0xffff000050fc91b0  ; call 0xffff000050fc91b0
   0xffff000050f20064: mov      w21, w0
   0xffff000050f20068: bl       #0xffff000050f02cc0  ; call 0xffff000050f02cc0
   0xffff000050f2006c: ldr      w25, [x0, #0x38]
   0xffff000050f20070: bl       #0xffff000050fc91cc  ; call 0xffff000050fc91cc
   0xffff000050f20074: mov      w19, w0
   0xffff000050f20078: bl       #0xffff000050f140ac  ; call 0xffff000050f140ac
   0xffff000050f2007c: mov      w22, w0
   0xffff000050f20080: bl       #0xffff000050f76588  ; call 0xffff000050f76588
   0xffff000050f20084: mov      x1, x23
   0xffff000050f20088: bl       #0xffff000050f89344  ; call 0xffff000050f89344
   0xffff000050f2008c: mov      w24, w0
   0xffff000050f20090: bl       #0xffff000050f76588  ; call 0xffff000050f76588
   0xffff000050f20094: cmp      w24, w0
   0xffff000050f20098: b.ls     #0xffff000050f200c0
   0xffff000050f2009c: ldp      x20, x19, [sp, #0x40]
   0xffff000050f200a0: adrp     x1, #0xffff000050fe5000
   0xffff000050f200a4: mov      w0, #1
   0xffff000050f200a8: ldp      x22, x21, [sp, #0x30]
; XREF string 0xffff000050fe5fb1: 'barcode' -> 'Barcode is too long for the display\n'
>> 0xffff000050f200ac: add      x1, x1, #0xfb1
   0xffff000050f200b0: ldp      x24, x23, [sp, #0x20]
   0xffff000050f200b4: ldp      x26, x25, [sp, #0x10]
   0xffff000050f200b8: ldp      x29, x30, [sp], #0x50
   0xffff000050f200bc: b        #0xffff000050f29978

loc_ffff000050f200c0:
   0xffff000050f200c0: mul      w19, w22, w19
   0xffff000050f200c4: add      w20, w25, w20
   0xffff000050f200c8: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f200cc: mov      w8, #0xb
   0xffff000050f200d0: madd     w22, w0, w8, w21
   0xffff000050f200d4: bl       #0xffff000050f89374  ; call 0xffff000050f89374
   0xffff000050f200d8: mov      w21, w0
   0xffff000050f200dc: mov      w0, #0x68
   0xffff000050f200e0: bl       #0xffff000050f893ac  ; call 0xffff000050f893ac
   0xffff000050f200e4: mov      w24, #0xc
   0xffff000050f200e8: and      w25, w0, #0xffff
   0xffff000050f200ec: b        #0xffff000050f20100

loc_ffff000050f200f0:
   0xffff000050f200f0: add      w22, w22, w21
   0xffff000050f200f4: sub      w24, w24, #1
   0xffff000050f200f8: cmp      w24, #1
   0xffff000050f200fc: b.ls     #0xffff000050f20128

loc_ffff000050f20100:
   0xffff000050f20100: sub      w8, w24, #2
   0xffff000050f20104: lsr      w8, w25, w8
   0xffff000050f20108: tbz      w8, #0, #0xffff000050f200f0
   0xffff000050f2010c: mov      w0, w22
   0xffff000050f20110: mov      w1, w20
   0xffff000050f20114: mov      w2, w19
   0xffff000050f20118: mov      w3, w21
   0xffff000050f2011c: mov      w4, #-0x1000000
   0xffff000050f20120: bl       #0xffff000050f76700  ; call 0xffff000050f76700
   0xffff000050f20124: b        #0xffff000050f200f0

loc_ffff000050f20128:
   0xffff000050f20128: ldrb     w0, [x23]
   0xffff000050f2012c: cbz      w0, #0xffff000050f2018c
   0xffff000050f20130: mov      x24, xzr
   0xffff000050f20134: b        #0xffff000050f20144

loc_ffff000050f20138:
   0xffff000050f20138: add      x24, x24, #1
   0xffff000050f2013c: ldrb     w0, [x23, x24]
   0xffff000050f20140: cbz      w0, #0xffff000050f2018c

loc_ffff000050f20144:
   0xffff000050f20144: bl       #0xffff000050f89398  ; call 0xffff000050f89398
   0xffff000050f20148: mov      w25, #0xc
   0xffff000050f2014c: and      w26, w0, #0xffff
   0xffff000050f20150: b        #0xffff000050f20164

loc_ffff000050f20154:
   0xffff000050f20154: add      w22, w22, w21
   0xffff000050f20158: sub      w25, w25, #1
   0xffff000050f2015c: cmp      w25, #1
   0xffff000050f20160: b.ls     #0xffff000050f20138

loc_ffff000050f20164:
   0xffff000050f20164: sub      w8, w25, #2
   0xffff000050f20168: lsr      w8, w26, w8
   0xffff000050f2016c: tbz      w8, #0, #0xffff000050f20154
   0xffff000050f20170: mov      w0, w22
   0xffff000050f20174: mov      w1, w20
   0xffff000050f20178: mov      w2, w19
   0xffff000050f2017c: mov      w3, w21
   0xffff000050f20180: mov      w4, #-0x1000000
   0xffff000050f20184: bl       #0xffff000050f76700  ; call 0xffff000050f76700
   0xffff000050f20188: b        #0xffff000050f20154

loc_ffff000050f2018c:
   0xffff000050f2018c: mov      x0, x23
   0xffff000050f20190: bl       #0xffff000050f893c4  ; call 0xffff000050f893c4
   0xffff000050f20194: mov      w23, #0xc
   0xffff000050f20198: and      w24, w0, #0xffff
   0xffff000050f2019c: b        #0xffff000050f201b0

loc_ffff000050f201a0:
   0xffff000050f201a0: add      w22, w22, w21
   0xffff000050f201a4: sub      w23, w23, #1
   0xffff000050f201a8: cmp      w23, #1
   0xffff000050f201ac: b.ls     #0xffff000050f201d8

loc_ffff000050f201b0:
   0xffff000050f201b0: sub      w8, w23, #2
   0xffff000050f201b4: lsr      w8, w24, w8
   0xffff000050f201b8: tbz      w8, #0, #0xffff000050f201a0
   0xffff000050f201bc: mov      w0, w22
   0xffff000050f201c0: mov      w1, w20
   0xffff000050f201c4: mov      w2, w19
   0xffff000050f201c8: mov      w3, w21
   0xffff000050f201cc: mov      w4, #-0x1000000
   0xffff000050f201d0: bl       #0xffff000050f76700  ; call 0xffff000050f76700
   0xffff000050f201d4: b        #0xffff000050f201a0

loc_ffff000050f201d8:
   0xffff000050f201d8: mov      w0, #0x6a
   0xffff000050f201dc: bl       #0xffff000050f893ac  ; call 0xffff000050f893ac
   0xffff000050f201e0: mov      w23, #0xc
   0xffff000050f201e4: and      w24, w0, #0xffff
   0xffff000050f201e8: b        #0xffff000050f201fc

loc_ffff000050f201ec:
   0xffff000050f201ec: add      w22, w22, w21
   0xffff000050f201f0: sub      w23, w23, #1
   0xffff000050f201f4: cmp      w23, #1
   0xffff000050f201f8: b.ls     #0xffff000050f20224

loc_ffff000050f201fc:
   0xffff000050f201fc: sub      w8, w23, #2
   0xffff000050f20200: lsr      w8, w24, w8
   0xffff000050f20204: tbz      w8, #0, #0xffff000050f201ec
   0xffff000050f20208: mov      w0, w22
   0xffff000050f2020c: mov      w1, w20
   0xffff000050f20210: mov      w2, w19
   0xffff000050f20214: mov      w3, w21
   0xffff000050f20218: mov      w4, #-0x1000000
   0xffff000050f2021c: bl       #0xffff000050f76700  ; call 0xffff000050f76700
   0xffff000050f20220: b        #0xffff000050f201ec

loc_ffff000050f20224:
   0xffff000050f20224: bl       #0xffff000050f893bc  ; call 0xffff000050f893bc
   0xffff000050f20228: and      w23, w0, #0xffff
   0xffff000050f2022c: tbz      w0, #1, #0xffff000050f20248
   0xffff000050f20230: mov      w0, w22
   0xffff000050f20234: mov      w1, w20
   0xffff000050f20238: mov      w2, w19
   0xffff000050f2023c: mov      w3, w21
   0xffff000050f20240: mov      w4, #-0x1000000
   0xffff000050f20244: bl       #0xffff000050f76700  ; call 0xffff000050f76700

loc_ffff000050f20248:
   0xffff000050f20248: tbnz     w23, #0, #0xffff000050f20264

loc_ffff000050f2024c:
   0xffff000050f2024c: ldp      x20, x19, [sp, #0x40]
   0xffff000050f20250: ldp      x22, x21, [sp, #0x30]
   0xffff000050f20254: ldp      x24, x23, [sp, #0x20]
   0xffff000050f20258: ldp      x26, x25, [sp, #0x10]
   0xffff000050f2025c: ldp      x29, x30, [sp], #0x50
   0xffff000050f20260: ret      
