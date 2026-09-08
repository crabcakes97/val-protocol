; flow candidate 0xffff000050fc7fcc-0xffff000050fc86d0
; score: 3
; matched targets: metadata
; calls: 0xffff000050fc71cc, 0xffff000050fc707c, 0xffff000050fc6f18, 0xffff000050fc858c, 0xffff000050fc711c, 0xffff000050fc7224, 0xffff000050fc2844, 0xffff000050fcd3c0, 0xffff000050fcd3f0, 0xffff000050fcd42c, 0xffff000050fc4744, 0xffff000050fc4774, 0xffff000050fc4a10, 0xffff000050fc3fc8, 0xffff000050fc6f04, 0xffff000050fc7064, 0xffff000050fc706c

   0xffff000050fc7fcc: sub      sp, sp, #0x2b0
   0xffff000050fc7fd0: mov      x19, x3
   0xffff000050fc7fd4: mov      x20, x2
   0xffff000050fc7fd8: mov      x22, x1
   0xffff000050fc7fdc: mov      x21, x0
   0xffff000050fc7fe0: cbz      x2, #0xffff000050fc7fe8
   0xffff000050fc7fe4: str      xzr, [x20]

loc_ffff000050fc7fe8:
   0xffff000050fc7fe8: cbz      x19, #0xffff000050fc7ff0
   0xffff000050fc7fec: str      xzr, [x19]

loc_ffff000050fc7ff0:
   0xffff000050fc7ff0: cmp      x22, #0xff
   0xffff000050fc7ff4: b.hi     #0xffff000050fc8028
   0xffff000050fc7ff8: adrp     x0, #0xffff000050ff5000
   0xffff000050fc7ffc: add      x0, x0, #0x927
   0xffff000050fc8000: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc8004: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8008: adrp     x2, #0xffff000050fed000
   0xffff000050fc800c: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8010: adrp     x4, #0xffff000050fd4000
   0xffff000050fc8014: add      x1, x1, #0x6de
   0xffff000050fc8018: add      x2, x2, #0xa58
   0xffff000050fc801c: add      x3, x3, #0xad
   0xffff000050fc8020: add      x4, x4, #0xc92
   0xffff000050fc8024: b        #0xffff000050fc806c

loc_ffff000050fc8028:
   0xffff000050fc8028: adrp     x1, #0xffff000050ffb000
   0xffff000050fc802c: mov      x0, x21
   0xffff000050fc8030: add      x1, x1, #0xa6a
   0xffff000050fc8034: mov      w2, #4
   0xffff000050fc8038: bl       #0xffff000050fc707c  ; call 0xffff000050fc707c
   0xffff000050fc803c: cbz      w0, #0xffff000050fc8094
   0xffff000050fc8040: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8044: add      x0, x0, #0x927
   0xffff000050fc8048: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc804c: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8050: adrp     x2, #0xffff000050fdf000
   0xffff000050fc8054: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8058: adrp     x4, #0xffff000050fe0000
   0xffff000050fc805c: add      x1, x1, #0x6de
   0xffff000050fc8060: add      x2, x2, #0x79a
   0xffff000050fc8064: add      x3, x3, #0xad
   0xffff000050fc8068: add      x4, x4, #0xf1b

loc_ffff000050fc806c:
   0xffff000050fc806c: mov      x5, xzr
   0xffff000050fc8070: bl       #0xffff000050fc6f18  ; call 0xffff000050fc6f18
   0xffff000050fc8074: mov      w0, #2

loc_ffff000050fc8078:
   0xffff000050fc8078: add      sp, sp, #0x2b0
   0xffff000050fc807c: ldp      x20, x19, [sp, #0x40]
   0xffff000050fc8080: ldp      x22, x21, [sp, #0x30]
   0xffff000050fc8084: ldp      x24, x23, [sp, #0x20]
   0xffff000050fc8088: ldp      x28, x25, [sp, #0x10]
   0xffff000050fc808c: ldp      x29, x30, [sp], #0x50
   0xffff000050fc8090: ret      

loc_ffff000050fc8094:
   0xffff000050fc8094: sub      x1, x29, #0x100
   0xffff000050fc8098: mov      x0, x21
   0xffff000050fc809c: bl       #0xffff000050fc858c  ; call 0xffff000050fc858c
   0xffff000050fc80a0: ldur     w8, [x29, #-0xfc]
   0xffff000050fc80a4: cmp      w8, #1
   0xffff000050fc80a8: b.ne     #0xffff000050fc80f0
   0xffff000050fc80ac: ldur     w8, [x29, #-0xf8]
   0xffff000050fc80b0: cmp      w8, #3
   0xffff000050fc80b4: b.hs     #0xffff000050fc80f0
   0xffff000050fc80b8: ldurb    w8, [x29, #-0x51]
   0xffff000050fc80bc: cbz      w8, #0xffff000050fc812c
   0xffff000050fc80c0: adrp     x0, #0xffff000050ff5000
   0xffff000050fc80c4: add      x0, x0, #0x927
   0xffff000050fc80c8: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc80cc: adrp     x1, #0xffff000050ffd000
   0xffff000050fc80d0: adrp     x2, #0xffff000050ff8000
   0xffff000050fc80d4: adrp     x3, #0xffff000050fd0000
   0xffff000050fc80d8: adrp     x4, #0xffff000050fda000
   0xffff000050fc80dc: add      x1, x1, #0x6de
   0xffff000050fc80e0: add      x2, x2, #0x55b
   0xffff000050fc80e4: add      x3, x3, #0xad
   0xffff000050fc80e8: add      x4, x4, #0x80c
   0xffff000050fc80ec: b        #0xffff000050fc806c

loc_ffff000050fc80f0:
   0xffff000050fc80f0: adrp     x0, #0xffff000050ff5000
   0xffff000050fc80f4: add      x0, x0, #0x927
   0xffff000050fc80f8: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc80fc: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8100: adrp     x2, #0xffff000050fda000
   0xffff000050fc8104: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8108: adrp     x4, #0xffff000050fd7000
   0xffff000050fc810c: add      x1, x1, #0x6de
   0xffff000050fc8110: add      x2, x2, #0x809
   0xffff000050fc8114: add      x3, x3, #0xad
   0xffff000050fc8118: add      x4, x4, #0xbed
   0xffff000050fc811c: mov      x5, xzr
   0xffff000050fc8120: bl       #0xffff000050fc6f18  ; call 0xffff000050fc6f18
   0xffff000050fc8124: mov      w0, #3
   0xffff000050fc8128: b        #0xffff000050fc8078

loc_ffff000050fc812c:
   0xffff000050fc812c: sub      x23, x29, #0x100
   0xffff000050fc8130: ldur     x1, [x23, #0xc]
   0xffff000050fc8134: tst      x1, #0x3f
   0xffff000050fc8138: b.ne     #0xffff000050fc8148
   0xffff000050fc813c: ldurb    w8, [x29, #-0xec]
   0xffff000050fc8140: tst      w8, #0x3f
   0xffff000050fc8144: b.eq     #0xffff000050fc8178

loc_ffff000050fc8148:
   0xffff000050fc8148: adrp     x0, #0xffff000050ff5000
   0xffff000050fc814c: add      x0, x0, #0x927
   0xffff000050fc8150: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc8154: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8158: adrp     x2, #0xffff000050ff7000
   0xffff000050fc815c: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8160: adrp     x4, #0xffff000050fdc000
   0xffff000050fc8164: add      x1, x1, #0x6de
   0xffff000050fc8168: add      x2, x2, #0x4c
   0xffff000050fc816c: add      x3, x3, #0xad
   0xffff000050fc8170: add      x4, x4, #0x64
   0xffff000050fc8174: b        #0xffff000050fc806c

loc_ffff000050fc8178:
   0xffff000050fc8178: mov      w8, #0x100
   0xffff000050fc817c: add      x0, sp, #0x18
   0xffff000050fc8180: str      x8, [sp, #0x18]
   0xffff000050fc8184: bl       #0xffff000050fc711c  ; call 0xffff000050fc711c
   0xffff000050fc8188: tbz      w0, #0, #0xffff000050fc81d8
   0xffff000050fc818c: ldur     x1, [x23, #0x14]
   0xffff000050fc8190: add      x0, sp, #0x18
   0xffff000050fc8194: bl       #0xffff000050fc711c  ; call 0xffff000050fc711c
   0xffff000050fc8198: tbz      w0, #0, #0xffff000050fc81d8
   0xffff000050fc819c: ldr      x8, [sp, #0x18]
   0xffff000050fc81a0: cmp      x8, x22
   0xffff000050fc81a4: b.ls     #0xffff000050fc8208
   0xffff000050fc81a8: adrp     x0, #0xffff000050ff5000
   0xffff000050fc81ac: add      x0, x0, #0x927
   0xffff000050fc81b0: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc81b4: adrp     x1, #0xffff000050ffd000
   0xffff000050fc81b8: adrp     x2, #0xffff000050fe7000
   0xffff000050fc81bc: adrp     x3, #0xffff000050fd0000
   0xffff000050fc81c0: adrp     x4, #0xffff000051000000
   0xffff000050fc81c4: add      x1, x1, #0x6de
   0xffff000050fc81c8: add      x2, x2, #0x333
   0xffff000050fc81cc: add      x3, x3, #0xad
   0xffff000050fc81d0: add      x4, x4, #0x951
   0xffff000050fc81d4: b        #0xffff000050fc806c

loc_ffff000050fc81d8:
   0xffff000050fc81d8: adrp     x0, #0xffff000050ff5000
   0xffff000050fc81dc: add      x0, x0, #0x927
   0xffff000050fc81e0: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc81e4: adrp     x1, #0xffff000050ffd000
   0xffff000050fc81e8: adrp     x2, #0xffff000050fdf000
   0xffff000050fc81ec: adrp     x3, #0xffff000050fd0000
   0xffff000050fc81f0: adrp     x4, #0xffff000050fd6000
   0xffff000050fc81f4: add      x1, x1, #0x6de
   0xffff000050fc81f8: add      x2, x2, #0x79d
   0xffff000050fc81fc: add      x3, x3, #0xad
   0xffff000050fc8200: add      x4, x4, #0x66e
   0xffff000050fc8204: b        #0xffff000050fc806c

loc_ffff000050fc8208:
   0xffff000050fc8208: mov      x0, xzr
   0xffff000050fc820c: mov      x1, x21
   0xffff000050fc8210: mov      x2, x22
   0xffff000050fc8214: bl       #0xffff000050fc7224  ; call 0xffff000050fc7224
   0xffff000050fc8218: tbz      w0, #0, #0xffff000050fc826c
   0xffff000050fc821c: ldp      x1, x2, [x29, #-0xe0]
   0xffff000050fc8220: add      x0, sp, #0x10
   0xffff000050fc8224: bl       #0xffff000050fc7224  ; call 0xffff000050fc7224
   0xffff000050fc8228: tbz      w0, #0, #0xffff000050fc823c
   0xffff000050fc822c: ldr      x8, [sp, #0x10]
   0xffff000050fc8230: ldur     x9, [x23, #0xc]
   0xffff000050fc8234: cmp      x8, x9
   0xffff000050fc8238: b.ls     #0xffff000050fc829c

loc_ffff000050fc823c:
   0xffff000050fc823c: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8240: add      x0, x0, #0x927
   0xffff000050fc8244: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc8248: adrp     x1, #0xffff000050ffd000
   0xffff000050fc824c: adrp     x2, #0xffff000050fe8000
   0xffff000050fc8250: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8254: adrp     x4, #0xffff000050fea000
   0xffff000050fc8258: add      x1, x1, #0x6de
   0xffff000050fc825c: add      x2, x2, #0xbe4
   0xffff000050fc8260: add      x3, x3, #0xad
   0xffff000050fc8264: add      x4, x4, #0x854
   0xffff000050fc8268: b        #0xffff000050fc806c

loc_ffff000050fc826c:
   0xffff000050fc826c: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8270: add      x0, x0, #0x927
   0xffff000050fc8274: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc8278: adrp     x1, #0xffff000050ffd000
   0xffff000050fc827c: adrp     x2, #0xffff000050fd7000
   0xffff000050fc8280: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8284: adrp     x4, #0xffff000050ff3000
   0xffff000050fc8288: add      x1, x1, #0x6de
   0xffff000050fc828c: add      x2, x2, #0xb8e
   0xffff000050fc8290: add      x3, x3, #0xad
   0xffff000050fc8294: add      x4, x4, #0xec4
   0xffff000050fc8298: b        #0xffff000050fc806c

loc_ffff000050fc829c:
   0xffff000050fc829c: ldp      x1, x2, [x29, #-0xd0]
   0xffff000050fc82a0: add      x0, sp, #8
   0xffff000050fc82a4: bl       #0xffff000050fc7224  ; call 0xffff000050fc7224
   0xffff000050fc82a8: tbz      w0, #0, #0xffff000050fc82bc
   0xffff000050fc82ac: ldr      x8, [sp, #8]
   0xffff000050fc82b0: ldur     x9, [x23, #0xc]
   0xffff000050fc82b4: cmp      x8, x9
   0xffff000050fc82b8: b.ls     #0xffff000050fc82ec

loc_ffff000050fc82bc:
   0xffff000050fc82bc: adrp     x0, #0xffff000050ff5000
   0xffff000050fc82c0: add      x0, x0, #0x927
   0xffff000050fc82c4: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc82c8: adrp     x1, #0xffff000050ffd000
   0xffff000050fc82cc: adrp     x2, #0xffff000051000000
   0xffff000050fc82d0: adrp     x3, #0xffff000050fd0000
   0xffff000050fc82d4: adrp     x4, #0xffff000050fdc000
   0xffff000050fc82d8: add      x1, x1, #0x6de
   0xffff000050fc82dc: add      x2, x2, #0x980
   0xffff000050fc82e0: add      x3, x3, #0xad
   0xffff000050fc82e4: add      x4, x4, #0x89
   0xffff000050fc82e8: b        #0xffff000050fc806c

loc_ffff000050fc82ec:
   0xffff000050fc82ec: ldp      x1, x2, [x29, #-0xc0]
   0xffff000050fc82f0: mov      x0, sp
   0xffff000050fc82f4: sub      x22, x29, #0x100
   0xffff000050fc82f8: bl       #0xffff000050fc7224  ; call 0xffff000050fc7224
   0xffff000050fc82fc: tbz      w0, #0, #0xffff000050fc8310
   0xffff000050fc8300: ldr      x8, [sp]
   0xffff000050fc8304: ldur     x9, [x22, #0x14]
   0xffff000050fc8308: cmp      x8, x9
   0xffff000050fc830c: b.ls     #0xffff000050fc8340

loc_ffff000050fc8310:
   0xffff000050fc8310: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8314: add      x0, x0, #0x927
   0xffff000050fc8318: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc831c: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8320: adrp     x2, #0xffff000050ff2000
   0xffff000050fc8324: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8328: adrp     x4, #0xffff000050fd1000
   0xffff000050fc832c: add      x1, x1, #0x6de
   0xffff000050fc8330: add      x2, x2, #0x662
   0xffff000050fc8334: add      x3, x3, #0xad
   0xffff000050fc8338: add      x4, x4, #0xfe3
   0xffff000050fc833c: b        #0xffff000050fc806c

loc_ffff000050fc8340:
   0xffff000050fc8340: ldur     x2, [x29, #-0xa8]
   0xffff000050fc8344: cbz      x2, #0xffff000050fc8398
   0xffff000050fc8348: ldur     x1, [x29, #-0xb0]
   0xffff000050fc834c: add      x0, sp, #0x20
   0xffff000050fc8350: bl       #0xffff000050fc7224  ; call 0xffff000050fc7224
   0xffff000050fc8354: tbz      w0, #0, #0xffff000050fc8368
   0xffff000050fc8358: ldr      x8, [sp, #0x20]
   0xffff000050fc835c: ldur     x9, [x22, #0x14]
   0xffff000050fc8360: cmp      x8, x9
   0xffff000050fc8364: b.ls     #0xffff000050fc8398

loc_ffff000050fc8368:
   0xffff000050fc8368: adrp     x0, #0xffff000050ff5000
   0xffff000050fc836c: add      x0, x0, #0x927
   0xffff000050fc8370: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc8374: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8378: adrp     x2, #0xffff000050fe8000
   0xffff000050fc837c: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8380: adrp     x4, #0xffff000050fe7000
   0xffff000050fc8384: add      x1, x1, #0x6de
   0xffff000050fc8388: add      x2, x2, #0xbe8
   0xffff000050fc838c: add      x3, x3, #0xad
; XREF string 0xffff000050fe7337: 'metadata' -> 'Public key metadata is not entirely in its block.\n'
>> 0xffff000050fc8390: add      x4, x4, #0x337
   0xffff000050fc8394: b        #0xffff000050fc806c

loc_ffff000050fc8398:
   0xffff000050fc8398: ldur     w0, [x29, #-0xe4]
   0xffff000050fc839c: cbz      w0, #0xffff000050fc8418
   0xffff000050fc83a0: bl       #0xffff000050fc2844  ; call 0xffff000050fc2844
   0xffff000050fc83a4: cbz      x0, #0xffff000050fc8420
   0xffff000050fc83a8: ldur     x8, [x29, #-0xd8]
   0xffff000050fc83ac: mov      x23, x0
   0xffff000050fc83b0: ldr      x9, [x0, #0x10]
   0xffff000050fc83b4: cmp      x8, x9
   0xffff000050fc83b8: b.ne     #0xffff000050fc8450
   0xffff000050fc83bc: ldur     x9, [x22, #0xc]
   0xffff000050fc83c0: add      x25, x21, #0x100
   0xffff000050fc83c4: ldur     w8, [x29, #-0xe4]
   0xffff000050fc83c8: add      x24, x25, x9
   0xffff000050fc83cc: sub      w9, w8, #4
   0xffff000050fc83d0: cmp      w9, #3
   0xffff000050fc83d4: b.lo     #0xffff000050fc8480
   0xffff000050fc83d8: sub      w8, w8, #1
   0xffff000050fc83dc: cmp      w8, #2
   0xffff000050fc83e0: b.hi     #0xffff000050fc8554
   0xffff000050fc83e4: add      x0, sp, #0x20
   0xffff000050fc83e8: bl       #0xffff000050fcd3c0  ; call 0xffff000050fcd3c0
   0xffff000050fc83ec: add      x0, sp, #0x20
   0xffff000050fc83f0: mov      x1, x21
   0xffff000050fc83f4: mov      w2, #0x100
   0xffff000050fc83f8: bl       #0xffff000050fcd3f0  ; call 0xffff000050fcd3f0
   0xffff000050fc83fc: ldur     x2, [x22, #0x14]
   0xffff000050fc8400: add      x0, sp, #0x20
   0xffff000050fc8404: mov      x1, x24
   0xffff000050fc8408: bl       #0xffff000050fcd3f0  ; call 0xffff000050fcd3f0
   0xffff000050fc840c: add      x0, sp, #0x20
   0xffff000050fc8410: bl       #0xffff000050fcd42c  ; call 0xffff000050fcd42c
   0xffff000050fc8414: b        #0xffff000050fc84b0

loc_ffff000050fc8418:
   0xffff000050fc8418: mov      w0, #1
   0xffff000050fc841c: b        #0xffff000050fc8078

loc_ffff000050fc8420:
   0xffff000050fc8420: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8424: add      x0, x0, #0x927
   0xffff000050fc8428: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc842c: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8430: adrp     x2, #0xffff000050fd0000
   0xffff000050fc8434: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8438: adrp     x4, #0xffff000050fda000
   0xffff000050fc843c: add      x1, x1, #0x6de
   0xffff000050fc8440: add      x2, x2, #0x4de
   0xffff000050fc8444: add      x3, x3, #0xad
   0xffff000050fc8448: add      x4, x4, #0x83a
   0xffff000050fc844c: b        #0xffff000050fc806c

loc_ffff000050fc8450:
   0xffff000050fc8450: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8454: add      x0, x0, #0x927
   0xffff000050fc8458: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc845c: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8460: adrp     x2, #0xffff000050fd6000
   0xffff000050fc8464: adrp     x3, #0xffff000050fd0000
   0xffff000050fc8468: adrp     x4, #0xffff000051000000
   0xffff000050fc846c: add      x1, x1, #0x6de
   0xffff000050fc8470: add      x2, x2, #0x69c
   0xffff000050fc8474: add      x3, x3, #0xad
   0xffff000050fc8478: add      x4, x4, #0x984
   0xffff000050fc847c: b        #0xffff000050fc806c

loc_ffff000050fc8480:
   0xffff000050fc8480: add      x0, sp, #0x20
   0xffff000050fc8484: bl       #0xffff000050fc4744  ; call 0xffff000050fc4744
   0xffff000050fc8488: add      x0, sp, #0x20
   0xffff000050fc848c: mov      x1, x21
   0xffff000050fc8490: mov      w2, #0x100
   0xffff000050fc8494: bl       #0xffff000050fc4774  ; call 0xffff000050fc4774
   0xffff000050fc8498: ldur     x2, [x22, #0x14]
   0xffff000050fc849c: add      x0, sp, #0x20
   0xffff000050fc84a0: mov      x1, x24
   0xffff000050fc84a4: bl       #0xffff000050fc4774  ; call 0xffff000050fc4774
   0xffff000050fc84a8: add      x0, sp, #0x20
   0xffff000050fc84ac: bl       #0xffff000050fc4a10  ; call 0xffff000050fc4a10

loc_ffff000050fc84b0:
   0xffff000050fc84b0: ldp      x8, x2, [x29, #-0xe0]
   0xffff000050fc84b4: mov      x1, x0
   0xffff000050fc84b8: add      x0, x25, x8
   0xffff000050fc84bc: bl       #0xffff000050fc707c  ; call 0xffff000050fc707c
   0xffff000050fc84c0: cbz      w0, #0xffff000050fc8500
   0xffff000050fc84c4: adrp     x0, #0xffff000050ff5000
   0xffff000050fc84c8: add      x0, x0, #0x927
   0xffff000050fc84cc: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc84d0: adrp     x1, #0xffff000050ffd000
   0xffff000050fc84d4: adrp     x2, #0xffff000050fe8000
   0xffff000050fc84d8: adrp     x3, #0xffff000050fd0000
   0xffff000050fc84dc: adrp     x4, #0xffff000050fea000
   0xffff000050fc84e0: add      x1, x1, #0x6de
   0xffff000050fc84e4: add      x2, x2, #0xbec
   0xffff000050fc84e8: add      x3, x3, #0xad
   0xffff000050fc84ec: add      x4, x4, #0x878
   0xffff000050fc84f0: mov      x5, xzr
   0xffff000050fc84f4: bl       #0xffff000050fc6f18  ; call 0xffff000050fc6f18
   0xffff000050fc84f8: mov      w0, #4
   0xffff000050fc84fc: b        #0xffff000050fc8078

loc_ffff000050fc8500:
   0xffff000050fc8500: ldp      x8, x1, [x29, #-0xc0]
   0xffff000050fc8504: ldp      x9, x3, [x29, #-0xd0]
   0xffff000050fc8508: ldp      x10, x5, [x29, #-0xe0]
   0xffff000050fc850c: add      x0, x24, x8
   0xffff000050fc8510: ldp      x6, x7, [x23]
   0xffff000050fc8514: add      x2, x25, x9
   0xffff000050fc8518: add      x4, x25, x10
   0xffff000050fc851c: bl       #0xffff000050fc3fc8  ; call 0xffff000050fc3fc8
   0xffff000050fc8520: tbz      w0, #0, #0xffff000050fc854c
   0xffff000050fc8524: ldur     x8, [x29, #-0xb8]
   0xffff000050fc8528: cbz      x8, #0xffff000050fc8584
   0xffff000050fc852c: cbz      x20, #0xffff000050fc853c
   0xffff000050fc8530: ldur     x9, [x29, #-0xc0]
   0xffff000050fc8534: add      x9, x24, x9
   0xffff000050fc8538: str      x9, [x20]

loc_ffff000050fc853c:
   0xffff000050fc853c: mov      w0, wzr
   0xffff000050fc8540: cbz      x19, #0xffff000050fc8078
   0xffff000050fc8544: str      x8, [x19]
   0xffff000050fc8548: b        #0xffff000050fc8078

loc_ffff000050fc854c:
   0xffff000050fc854c: mov      w0, #5
   0xffff000050fc8550: b        #0xffff000050fc8078

loc_ffff000050fc8554:
   0xffff000050fc8554: adrp     x0, #0xffff000050ff5000
   0xffff000050fc8558: add      x0, x0, #0x927
   0xffff000050fc855c: bl       #0xffff000050fc71cc  ; call 0xffff000050fc71cc
   0xffff000050fc8560: adrp     x1, #0xffff000050ffd000
   0xffff000050fc8564: adrp     x2, #0xffff000050ff3000
   0xffff000050fc8568: adrp     x3, #0xffff000050fd0000
   0xffff000050fc856c: adrp     x4, #0xffff000050ff2000
   0xffff000050fc8570: add      x1, x1, #0x6de
   0xffff000050fc8574: add      x2, x2, #0xeee
   0xffff000050fc8578: add      x3, x3, #0xad
   0xffff000050fc857c: add      x4, x4, #0x666
   0xffff000050fc8580: b        #0xffff000050fc806c

loc_ffff000050fc8584:
   0xffff000050fc8584: mov      w0, wzr
   0xffff000050fc8588: b        #0xffff000050fc8078
   0xffff000050fc858c: stp      x29, x30, [sp, #-0x20]!
   0xffff000050fc8590: str      x19, [sp, #0x10]
   0xffff000050fc8594: mov      x29, sp
   0xffff000050fc8598: mov      x19, x1
   0xffff000050fc859c: mov      x1, x0
   0xffff000050fc85a0: mov      x0, x19
   0xffff000050fc85a4: mov      w2, #0x100
   0xffff000050fc85a8: bl       #0xffff000050fc6f04  ; call 0xffff000050fc6f04
   0xffff000050fc85ac: ldr      w0, [x19, #4]
   0xffff000050fc85b0: bl       #0xffff000050fc7064  ; call 0xffff000050fc7064
   0xffff000050fc85b4: ldr      w8, [x19, #8]
   0xffff000050fc85b8: str      w0, [x19, #4]
   0xffff000050fc85bc: mov      w0, w8
   0xffff000050fc85c0: bl       #0xffff000050fc7064  ; call 0xffff000050fc7064
   0xffff000050fc85c4: ldur     x8, [x19, #0xc]
   0xffff000050fc85c8: str      w0, [x19, #8]
   0xffff000050fc85cc: mov      x0, x8
   0xffff000050fc85d0: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc85d4: ldur     x8, [x19, #0x14]
   0xffff000050fc85d8: stur     x0, [x19, #0xc]
   0xffff000050fc85dc: mov      x0, x8
   0xffff000050fc85e0: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc85e4: ldr      w8, [x19, #0x1c]
   0xffff000050fc85e8: stur     x0, [x19, #0x14]
   0xffff000050fc85ec: mov      w0, w8
   0xffff000050fc85f0: bl       #0xffff000050fc7064  ; call 0xffff000050fc7064
   0xffff000050fc85f4: ldr      x8, [x19, #0x20]
   0xffff000050fc85f8: str      w0, [x19, #0x1c]
   0xffff000050fc85fc: mov      x0, x8
   0xffff000050fc8600: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8604: ldr      x8, [x19, #0x28]
   0xffff000050fc8608: str      x0, [x19, #0x20]
   0xffff000050fc860c: mov      x0, x8
   0xffff000050fc8610: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8614: ldr      x8, [x19, #0x30]
   0xffff000050fc8618: str      x0, [x19, #0x28]
   0xffff000050fc861c: mov      x0, x8
   0xffff000050fc8620: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8624: ldr      x8, [x19, #0x38]
   0xffff000050fc8628: str      x0, [x19, #0x30]
   0xffff000050fc862c: mov      x0, x8
   0xffff000050fc8630: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8634: ldr      x8, [x19, #0x40]
   0xffff000050fc8638: str      x0, [x19, #0x38]
   0xffff000050fc863c: mov      x0, x8
   0xffff000050fc8640: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8644: ldr      x8, [x19, #0x48]
   0xffff000050fc8648: str      x0, [x19, #0x40]
   0xffff000050fc864c: mov      x0, x8
   0xffff000050fc8650: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8654: ldr      x8, [x19, #0x50]
   0xffff000050fc8658: str      x0, [x19, #0x48]
   0xffff000050fc865c: mov      x0, x8
   0xffff000050fc8660: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8664: ldr      x8, [x19, #0x58]
   0xffff000050fc8668: str      x0, [x19, #0x50]
   0xffff000050fc866c: mov      x0, x8
   0xffff000050fc8670: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8674: ldr      x8, [x19, #0x60]
   0xffff000050fc8678: str      x0, [x19, #0x58]
   0xffff000050fc867c: mov      x0, x8
   0xffff000050fc8680: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8684: ldr      x8, [x19, #0x68]
   0xffff000050fc8688: str      x0, [x19, #0x60]
   0xffff000050fc868c: mov      x0, x8
   0xffff000050fc8690: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc8694: ldr      x8, [x19, #0x70]
   0xffff000050fc8698: str      x0, [x19, #0x68]
   0xffff000050fc869c: mov      x0, x8
   0xffff000050fc86a0: bl       #0xffff000050fc706c  ; call 0xffff000050fc706c
   0xffff000050fc86a4: ldr      w8, [x19, #0x78]
   0xffff000050fc86a8: str      x0, [x19, #0x70]
   0xffff000050fc86ac: mov      w0, w8
   0xffff000050fc86b0: bl       #0xffff000050fc7064  ; call 0xffff000050fc7064
   0xffff000050fc86b4: ldr      w8, [x19, #0x7c]
   0xffff000050fc86b8: str      w0, [x19, #0x78]
   0xffff000050fc86bc: mov      w0, w8
   0xffff000050fc86c0: bl       #0xffff000050fc7064  ; call 0xffff000050fc7064
   0xffff000050fc86c4: str      w0, [x19, #0x7c]
   0xffff000050fc86c8: ldr      x19, [sp, #0x10]
   0xffff000050fc86cc: ldp      x29, x30, [sp], #0x20
   0xffff000050fc86d0: ret      
