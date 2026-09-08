; flow candidate 0xffff000050f73864-0xffff000050f73b14
; score: 3
; matched targets: barcode, serialno
; calls: 0xffff000050f38024, 0xffff000050f24858, 0xffff000050f0300c, 0xffff000050f8e668, 0xffff000050f24a38, 0xffff000050f24be8, 0xffff000050f29978, 0xffff000050f24c60, 0xffff000050f031e8, 0xffff000050f73590, 0xffff000050f8c89c, 0xffff000050f45d08, 0xffff000050f295c8, 0xffff000050f42948, 0xffff000050f13bd0, 0xffff000050f46ab8, 0xffff000050f9be44, 0xffff000050f24a50, 0xffff000050f9dc18, 0xffff000050f27bd4

   0xffff000050f73864: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f73868: str      x19, [sp, #0x10]
   0xffff000050f7386c: mov      x29, sp
   0xffff000050f73870: mov      x19, x0
   0xffff000050f73874: adrp     x1, #0xffff000050ffd000
; XREF string 0xffff000050ffd758: 'serialno' -> 'serialno'
>> 0xffff000050f73878: add      x1, x1, #0x758
   0xffff000050f7387c: mov      w0, wzr
   0xffff000050f73880: mov      x2, x19
   0xffff000050f73884: mov      w3, #0x11
   0xffff000050f73888: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f7388c: cbnz     x0, #0xffff000050f738a8
   0xffff000050f73890: adrp     x1, #0xffff000050fdb000
   0xffff000050f73894: mov      x2, x19
; XREF string 0xffff000050fdb165: 'barcode' -> 'barcode'
>> 0xffff000050f73898: add      x1, x1, #0x165
   0xffff000050f7389c: mov      w3, #0x11
   0xffff000050f738a0: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f738a4: cbz      x0, #0xffff000050f738b4

loc_ffff000050f738a8:
   0xffff000050f738a8: ldr      x19, [sp, #0x10]
   0xffff000050f738ac: ldp      x29, x30, [sp], #0x20
   0xffff000050f738b0: ret      

loc_ffff000050f738b4:
   0xffff000050f738b4: bl       #0xffff000050f24858  ; call 0xffff000050f24858
   0xffff000050f738b8: cbz      x0, #0xffff000050f738d4
   0xffff000050f738bc: mov      x1, x0
   0xffff000050f738c0: mov      x0, x19
   0xffff000050f738c4: ldr      x19, [sp, #0x10]
   0xffff000050f738c8: mov      w2, #0x11
   0xffff000050f738cc: ldp      x29, x30, [sp], #0x20
   0xffff000050f738d0: b        #0xffff000050f8e668

loc_ffff000050f738d4:
   0xffff000050f738d4: bl       #0xffff000050f0300c  ; call 0xffff000050f0300c
   0xffff000050f738d8: cbz      x0, #0xffff000050f738ec
   0xffff000050f738dc: mov      x1, x0
   0xffff000050f738e0: mov      x0, x19
   0xffff000050f738e4: mov      w2, #0x11
   0xffff000050f738e8: bl       #0xffff000050f8e668  ; call 0xffff000050f8e668

loc_ffff000050f738ec:
   0xffff000050f738ec: ldr      x19, [sp, #0x10]
   0xffff000050f738f0: adrp     x1, #0xffff000050fd1000
; XREF string 0xffff000050fd16c5: 'serialno' -> 'use default target serialno\n'
>> 0xffff000050f738f4: add      x1, x1, #0x6c5
   0xffff000050f738f8: mov      w0, #-1
   0xffff000050f738fc: ldp      x29, x30, [sp], #0x20
   0xffff000050f73900: b        #0xffff000050f29978
   0xffff000050f73904: sub      sp, sp, #0x50
   0xffff000050f73908: stp      x29, x30, [sp, #0x20]
   0xffff000050f7390c: add      x29, sp, #0x20
   0xffff000050f73910: stp      x22, x21, [sp, #0x30]
   0xffff000050f73914: stp      x20, x19, [sp, #0x40]
   0xffff000050f73918: bl       #0xffff000050f24a38  ; call 0xffff000050f24a38
   0xffff000050f7391c: tbnz     w0, #0, #0xffff000050f7393c
   0xffff000050f73920: bl       #0xffff000050f24be8  ; call 0xffff000050f24be8
   0xffff000050f73924: cbz      w0, #0xffff000050f7393c
   0xffff000050f73928: adrp     x1, #0xffff000050fe9000
   0xffff000050f7392c: mov      w0, #-1
   0xffff000050f73930: add      x1, x1, #0xee6
   0xffff000050f73934: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f73938: bl       #0xffff000050f24c60  ; call 0xffff000050f24c60

loc_ffff000050f7393c:
   0xffff000050f7393c: bl       #0xffff000050f031e8  ; call 0xffff000050f031e8
   0xffff000050f73940: mov      w21, w0
   0xffff000050f73944: bl       #0xffff000050f73590  ; call 0xffff000050f73590
   0xffff000050f73948: cbz      x0, #0xffff000050f7398c
   0xffff000050f7394c: ldrb     w5, [x0]
   0xffff000050f73950: mov      x19, x0
   0xffff000050f73954: cmp      w5, #0xe
   0xffff000050f73958: b.hi     #0xffff000050f739a8
   0xffff000050f7395c: adrp     x8, #0xffff000051016000
   0xffff000050f73960: add      x8, x8, #0x118
   0xffff000050f73964: ldr      x20, [x8, x5, lsl #3]

loc_ffff000050f73968:
   0xffff000050f73968: ldr      w8, [x19, #0xc]
   0xffff000050f7396c: cmp      w21, #6
   0xffff000050f73970: and      x9, x8, #3
   0xffff000050f73974: b.ne     #0xffff000050f739d4
   0xffff000050f73978: cmp      w9, #3
   0xffff000050f7397c: b.ne     #0xffff000050f739f8
   0xffff000050f73980: adrp     x21, #0xffff000050fe4000
   0xffff000050f73984: add      x21, x21, #0x6a3
   0xffff000050f73988: b        #0xffff000050f73a04

loc_ffff000050f7398c:
   0xffff000050f7398c: mov      x9, #0x6e55
   0xffff000050f73990: adrp     x8, #0xffff000051105000
   0xffff000050f73994: movk     x9, #0x6e6b, lsl #16
   0xffff000050f73998: movk     x9, #0x776f, lsl #32
   0xffff000050f7399c: movk     x9, #0x6e, lsl #48
   0xffff000050f739a0: str      x9, [x8, #0x338]
   0xffff000050f739a4: b        #0xffff000050f73aa0

loc_ffff000050f739a8:
   0xffff000050f739a8: cmp      w5, #0xc1
   0xffff000050f739ac: b.gt     #0xffff000050f73b18
   0xffff000050f739b0: cmp      w5, #0x12
   0xffff000050f739b4: b.eq     #0xffff000050f73b3c
   0xffff000050f739b8: cmp      w5, #0x1b
   0xffff000050f739bc: b.eq     #0xffff000050f73b48
   0xffff000050f739c0: cmp      w5, #0x1c
   0xffff000050f739c4: b.ne     #0xffff000050f73b6c
   0xffff000050f739c8: adrp     x20, #0xffff000050fd2000
   0xffff000050f739cc: add      x20, x20, #0xe9d
   0xffff000050f739d0: b        #0xffff000050f73968

loc_ffff000050f739d4:
   0xffff000050f739d4: adrp     x10, #0xffff000051016000
   0xffff000050f739d8: add      x10, x10, #0x190
   0xffff000050f739dc: ldr      x21, [x10, w9, uxtw #3]
   0xffff000050f739e0: ubfx     x9, x8, #2, #4
   0xffff000050f739e4: cmp      w9, #0xf
   0xffff000050f739e8: b.eq     #0xffff000050f73a24
   0xffff000050f739ec: adrp     x10, #0xffff000051016000
   0xffff000050f739f0: add      x10, x10, #0x1c8
   0xffff000050f739f4: b        #0xffff000050f73a18

loc_ffff000050f739f8:
   0xffff000050f739f8: adrp     x10, #0xffff000051016000
   0xffff000050f739fc: add      x10, x10, #0x1b0
   0xffff000050f73a00: ldr      x21, [x10, x9, lsl #3]

loc_ffff000050f73a04:
   0xffff000050f73a04: ubfx     x9, x8, #2, #4
   0xffff000050f73a08: cmp      w9, #6
   0xffff000050f73a0c: b.hi     #0xffff000050f73a24
   0xffff000050f73a10: adrp     x10, #0xffff000051016000
   0xffff000050f73a14: add      x10, x10, #0x240

loc_ffff000050f73a18:
   0xffff000050f73a18: add      x9, x10, x9, lsl #3
   0xffff000050f73a1c: ldr      x22, [x9]
   0xffff000050f73a20: b        #0xffff000050f73a2c

loc_ffff000050f73a24:
   0xffff000050f73a24: adrp     x22, #0xffff000050fdd000
   0xffff000050f73a28: add      x22, x22, #0x3ca

loc_ffff000050f73a2c:
   0xffff000050f73a2c: adrp     x1, #0xffff000050fe0000
   0xffff000050f73a30: ldr      w4, [x19, #0x10]
   0xffff000050f73a34: ldrb     w6, [x19, #4]
   0xffff000050f73a38: and      w8, w8, #0xff
   0xffff000050f73a3c: ldrb     w7, [x19, #8]
   0xffff000050f73a40: add      x1, x1, #0x7ea
   0xffff000050f73a44: mov      w0, #1
   0xffff000050f73a48: mov      x2, x20
   0xffff000050f73a4c: mov      x3, x21
   0xffff000050f73a50: str      w8, [sp]
   0xffff000050f73a54: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f73a58: ldr      w8, [x19, #0x10]
   0xffff000050f73a5c: adrp     x0, #0xffff000051105000
   0xffff000050f73a60: adrp     x2, #0xffff000050fee000
   0xffff000050f73a64: ldrb     w7, [x19]
   0xffff000050f73a68: ldrb     w9, [x19, #4]
   0xffff000050f73a6c: add      x0, x0, #0x338
   0xffff000050f73a70: ldrb     w10, [x19, #8]
   0xffff000050f73a74: lsr      w3, w8, #0xa
   0xffff000050f73a78: ldrb     w8, [x19, #0xc]
   0xffff000050f73a7c: add      x2, x2, #0xb67
   0xffff000050f73a80: mov      w1, #0x40
   0xffff000050f73a84: mov      x4, x20
   0xffff000050f73a88: mov      x5, x21
   0xffff000050f73a8c: mov      x6, x22
   0xffff000050f73a90: str      w8, [sp, #0x10]
   0xffff000050f73a94: str      w10, [sp, #8]
   0xffff000050f73a98: str      w9, [sp]
   0xffff000050f73a9c: bl       #0xffff000050f8c89c  ; call 0xffff000050f8c89c

loc_ffff000050f73aa0:
   0xffff000050f73aa0: bl       #0xffff000050f45d08  ; call 0xffff000050f45d08
   0xffff000050f73aa4: bl       #0xffff000050f295c8  ; call 0xffff000050f295c8
   0xffff000050f73aa8: bl       #0xffff000050f42948  ; call 0xffff000050f42948
   0xffff000050f73aac: adrp     x1, #0xffff000050ff7000
   0xffff000050f73ab0: adrp     x2, #0xffff000050fed000
   0xffff000050f73ab4: add      x1, x1, #0xef7
   0xffff000050f73ab8: add      x2, x2, #0x3f2
   0xffff000050f73abc: mov      w0, #1
   0xffff000050f73ac0: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f73ac4: bl       #0xffff000050f13bd0  ; call 0xffff000050f13bd0
   0xffff000050f73ac8: bl       #0xffff000050f46ab8  ; call 0xffff000050f46ab8
   0xffff000050f73acc: bl       #0xffff000050f9be44  ; call 0xffff000050f9be44
   0xffff000050f73ad0: mov      w19, w0
   0xffff000050f73ad4: cbz      w0, #0xffff000050f73aec
   0xffff000050f73ad8: adrp     x1, #0xffff000050fd7000
   0xffff000050f73adc: mov      w0, wzr
   0xffff000050f73ae0: add      x1, x1, #0x5d0
   0xffff000050f73ae4: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f73ae8: bl       #0xffff000050f24c60  ; call 0xffff000050f24c60

loc_ffff000050f73aec:
   0xffff000050f73aec: cmp      w19, #0
   0xffff000050f73af0: cset     w0, eq
   0xffff000050f73af4: bl       #0xffff000050f24a50  ; call 0xffff000050f24a50
   0xffff000050f73af8: bl       #0xffff000050f9dc18  ; call 0xffff000050f9dc18
   0xffff000050f73afc: bl       #0xffff000050f27bd4  ; call 0xffff000050f27bd4
   0xffff000050f73b00: ldp      x20, x19, [sp, #0x40]
   0xffff000050f73b04: mov      w0, wzr
   0xffff000050f73b08: ldp      x22, x21, [sp, #0x30]
   0xffff000050f73b0c: ldp      x29, x30, [sp, #0x20]
   0xffff000050f73b10: add      sp, sp, #0x50
   0xffff000050f73b14: ret      
