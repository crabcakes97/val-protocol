; flow candidate 0xffff000050f0ad18-0xffff000050f0b718
; score: 1
; matched targets: imei
; calls: 0xffff000050f8e3ec, 0xffff000050f0f898, 0xffff000050f8e5bc, 0xffff000050f37438, 0xffff000050f8e848, 0xffff000050f0f428, 0xffff000050f8e61c, 0xffff000050f07c4c, 0xffff000050f8de94, 0xffff000050f29978, 0xffff000050f38260, 0xffff000050f368b8, 0xffff000050f35c78

   0xffff000050f0ad18: cmp      w0, #0
   0xffff000050f0ad1c: csinc    w21, w8, wzr, ne
   0xffff000050f0ad20: b        #0xffff000050f0b728
   0xffff000050f0ad24: ldr      x21, [x19, #8]
   0xffff000050f0ad28: cmp      w23, #1
   0xffff000050f0ad2c: b.ne     #0xffff000050f0ad78
   0xffff000050f0ad30: adrp     x1, #0xffff000050ff5000
   0xffff000050f0ad34: mov      x0, x21
   0xffff000050f0ad38: add      x1, x1, #0xb83
   0xffff000050f0ad3c: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0ad40: cbz      w0, #0xffff000050f0aed4
   0xffff000050f0ad44: adrp     x1, #0xffff000050fd2000
   0xffff000050f0ad48: mov      x0, x21
   0xffff000050f0ad4c: add      x1, x1, #0xfd
   0xffff000050f0ad50: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0ad54: cbz      w0, #0xffff000050f0b6dc
   0xffff000050f0ad58: mov      x0, x21
   0xffff000050f0ad5c: add      sp, sp, #0x450
   0xffff000050f0ad60: ldp      x20, x19, [sp, #0x40]
   0xffff000050f0ad64: ldp      x22, x21, [sp, #0x30]
   0xffff000050f0ad68: ldp      x24, x23, [sp, #0x20]
   0xffff000050f0ad6c: ldp      x28, x25, [sp, #0x10]
   0xffff000050f0ad70: ldp      x29, x30, [sp], #0x50
   0xffff000050f0ad74: b        #0xffff000050f0f50c

loc_ffff000050f0ad78:
   0xffff000050f0ad78: ldr      x2, [x19, #0x10]
   0xffff000050f0ad7c: mov      w0, wzr
   0xffff000050f0ad80: mov      x1, x21
   0xffff000050f0ad84: bl       #0xffff000050f0f898  ; call 0xffff000050f0f898
   0xffff000050f0ad88: tbz      w0, #0, #0xffff000050f0aebc
   0xffff000050f0ad8c: ldr      x21, [x19, #8]
   0xffff000050f0ad90: adrp     x1, #0xffff000050fe5000
   0xffff000050f0ad94: add      x1, x1, #0xbc3
   0xffff000050f0ad98: mov      x0, x21
   0xffff000050f0ad9c: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0ada0: cbz      w0, #0xffff000050f0b748
   0xffff000050f0ada4: adrp     x1, #0xffff000050fcf000
   0xffff000050f0ada8: mov      x0, x21
   0xffff000050f0adac: add      x1, x1, #0x129
   0xffff000050f0adb0: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0adb4: cbz      w0, #0xffff000050f0b7b4
   0xffff000050f0adb8: adrp     x1, #0xffff000050fdc000
   0xffff000050f0adbc: mov      x0, x21
   0xffff000050f0adc0: add      x1, x1, #0x2dc
   0xffff000050f0adc4: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0adc8: cbz      w0, #0xffff000050f0b848
   0xffff000050f0adcc: adrp     x1, #0xffff000050fff000
   0xffff000050f0add0: mov      x0, x21
   0xffff000050f0add4: add      x1, x1, #0x34c
   0xffff000050f0add8: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0addc: cbz      w0, #0xffff000050f0b898
   0xffff000050f0ade0: adrp     x1, #0xffff000050ff7000
   0xffff000050f0ade4: mov      x0, x21
   0xffff000050f0ade8: add      x1, x1, #0x1a1
   0xffff000050f0adec: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0adf0: cbz      w0, #0xffff000050f0ba54
   0xffff000050f0adf4: ldr      x20, [x19, #0x10]
   0xffff000050f0adf8: cmp      w23, #2
   0xffff000050f0adfc: b.ne     #0xffff000050f0ae08
   0xffff000050f0ae00: ldrb     w8, [x20]
   0xffff000050f0ae04: cbz      w8, #0xffff000050f0bbf8

loc_ffff000050f0ae08:
   0xffff000050f0ae08: add      x0, sp, #0xc
   0xffff000050f0ae0c: mov      x1, x21
   0xffff000050f0ae10: mov      w2, #0x20
   0xffff000050f0ae14: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc
   0xffff000050f0ae18: add      x1, sp, #0xc
   0xffff000050f0ae1c: mov      w0, wzr
   0xffff000050f0ae20: bl       #0xffff000050f37438  ; call 0xffff000050f37438
   0xffff000050f0ae24: tbz      w0, #0, #0xffff000050f0bf38
   0xffff000050f0ae28: add      x0, sp, #0xc
   0xffff000050f0ae2c: mov      w1, #0x3a
   0xffff000050f0ae30: bl       #0xffff000050f8e848  ; call 0xffff000050f8e848
   0xffff000050f0ae34: cmp      x0, #0
   0xffff000050f0ae38: csinc    x0, xzr, x0, eq
   0xffff000050f0ae3c: bl       #0xffff000050f0f428  ; call 0xffff000050f0f428
   0xffff000050f0ae40: cbz      w0, #0xffff000050f0bcf8
   0xffff000050f0ae44: mov      w21, w0
   0xffff000050f0ae48: cmp      w0, #0xff
   0xffff000050f0ae4c: b.eq     #0xffff000050f0bbbc
   0xffff000050f0ae50: b        #0xffff000050f0bd60
   0xffff000050f0ae54: ldr      x22, [x19, #8]
   0xffff000050f0ae58: mov      x0, x22
   0xffff000050f0ae5c: bl       #0xffff000050f8e61c  ; call 0xffff000050f8e61c
   0xffff000050f0ae60: cmp      x0, #1
   0xffff000050f0ae64: b.ne     #0xffff000050f0aeb4
   0xffff000050f0ae68: ldrb     w8, [x22]
   0xffff000050f0ae6c: cmp      w8, #0x2f
   0xffff000050f0ae70: b.eq     #0xffff000050f0acd8
   0xffff000050f0ae74: b        #0xffff000050f0aeb4
   0xffff000050f0ae78: ldr      x22, [x19, #8]
   0xffff000050f0ae7c: cmp      w20, #3
   0xffff000050f0ae80: b.lt     #0xffff000050f0aeb4
   0xffff000050f0ae84: mov      x0, x22
   0xffff000050f0ae88: bl       #0xffff000050f8e61c  ; call 0xffff000050f8e61c
   0xffff000050f0ae8c: cmp      x0, #1
   0xffff000050f0ae90: b.ne     #0xffff000050f0afbc
   0xffff000050f0ae94: ldrb     w8, [x22]
   0xffff000050f0ae98: cmp      w8, #0x2f
   0xffff000050f0ae9c: b.ne     #0xffff000050f0afbc
   0xffff000050f0aea0: adrp     x0, #0xffff000050fd9000
   0xffff000050f0aea4: adrp     x1, #0xffff000050ff8000
   0xffff000050f0aea8: add      x0, x0, #0x53d
   0xffff000050f0aeac: add      x1, x1, #0x83e
   0xffff000050f0aeb0: b        #0xffff000050f0aecc

loc_ffff000050f0aeb4:
   0xffff000050f0aeb4: mov      w25, wzr
   0xffff000050f0aeb8: b        #0xffff000050f0afc0

loc_ffff000050f0aebc:
   0xffff000050f0aebc: adrp     x0, #0xffff000050fd9000
   0xffff000050f0aec0: adrp     x1, #0xffff000050ff2000
   0xffff000050f0aec4: add      x0, x0, #0x53d
   0xffff000050f0aec8: add      x1, x1, #0x809

loc_ffff000050f0aecc:
   0xffff000050f0aecc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0aed0: b        #0xffff000050f0b724

loc_ffff000050f0aed4:
   0xffff000050f0aed4: adrp     x19, #0xffff000050fd9000
   0xffff000050f0aed8: adrp     x1, #0xffff000050fd4000
   0xffff000050f0aedc: add      x19, x19, #0x53d
   0xffff000050f0aee0: add      x1, x1, #0xeeb
   0xffff000050f0aee4: mov      x0, x19
   0xffff000050f0aee8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0aeec: adrp     x20, #0xffff000050ff8000
   0xffff000050f0aef0: mov      x0, x19
   0xffff000050f0aef4: add      x20, x20, #0x773
   0xffff000050f0aef8: mov      x1, x20
   0xffff000050f0aefc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af00: adrp     x1, #0xffff000050fd9000
   0xffff000050f0af04: mov      x0, x19
   0xffff000050f0af08: add      x1, x1, #0x5e9
   0xffff000050f0af0c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af10: adrp     x1, #0xffff000050fea000
   0xffff000050f0af14: mov      x0, x19
   0xffff000050f0af18: add      x1, x1, #0xa5d
   0xffff000050f0af1c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af20: adrp     x1, #0xffff000050fd7000
   0xffff000050f0af24: mov      x0, x19
   0xffff000050f0af28: add      x1, x1, #0xd7f
   0xffff000050f0af2c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af30: adrp     x1, #0xffff000050ff5000
   0xffff000050f0af34: mov      x0, x19
   0xffff000050f0af38: add      x1, x1, #0xb88
   0xffff000050f0af3c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af40: adrp     x1, #0xffff000050fef000
   0xffff000050f0af44: mov      x0, x19
   0xffff000050f0af48: add      x1, x1, #0x515
   0xffff000050f0af4c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af50: adrp     x1, #0xffff000050fd3000
   0xffff000050f0af54: mov      x0, x19
   0xffff000050f0af58: add      x1, x1, #0x61f
   0xffff000050f0af5c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af60: adrp     x1, #0xffff000050fe5000
   0xffff000050f0af64: mov      x0, x19
   0xffff000050f0af68: add      x1, x1, #0xbc9
   0xffff000050f0af6c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af70: adrp     x1, #0xffff000050fd7000
   0xffff000050f0af74: mov      x0, x19
   0xffff000050f0af78: add      x1, x1, #0xdad
   0xffff000050f0af7c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af80: adrp     x1, #0xffff000050fe8000
   0xffff000050f0af84: mov      x0, x19
   0xffff000050f0af88: add      x1, x1, #0xe7f
   0xffff000050f0af8c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0af90: adrp     x1, #0xffff000050fe7000
   0xffff000050f0af94: mov      x0, x19
   0xffff000050f0af98: add      x1, x1, #0x52d
   0xffff000050f0af9c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0afa0: adrp     x1, #0xffff000050fd9000
   0xffff000050f0afa4: mov      x0, x19
   0xffff000050f0afa8: add      x1, x1, #0x5f2
   0xffff000050f0afac: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0afb0: adrp     x1, #0xffff000050ff0000
   0xffff000050f0afb4: add      x1, x1, #0xe04
   0xffff000050f0afb8: b        #0xffff000050f0b6c0

loc_ffff000050f0afbc:
   0xffff000050f0afbc: mov      w25, #1

loc_ffff000050f0afc0:
   0xffff000050f0afc0: adrp     x1, #0xffff000050fe5000
   0xffff000050f0afc4: mov      x0, x22
   0xffff000050f0afc8: add      x1, x1, #0xbc3
   0xffff000050f0afcc: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0afd0: cbz      w0, #0xffff000050f0b080
   0xffff000050f0afd4: adrp     x1, #0xffff000050ff5000
   0xffff000050f0afd8: mov      x0, x22
   0xffff000050f0afdc: add      x1, x1, #0xb83
   0xffff000050f0afe0: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0afe4: cbz      w0, #0xffff000050f0b0a4
   0xffff000050f0afe8: adrp     x1, #0xffff000050fed000
   0xffff000050f0afec: mov      x0, x22
   0xffff000050f0aff0: add      x1, x1, #0xcea
   0xffff000050f0aff4: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0aff8: cbz      w0, #0xffff000050f0b6f8
   0xffff000050f0affc: adrp     x1, #0xffff000050fff000
   0xffff000050f0b000: mov      x0, x22
   0xffff000050f0b004: add      x1, x1, #0x345
   0xffff000050f0b008: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0b00c: cbz      w0, #0xffff000050f0b764
   0xffff000050f0b010: adrp     x1, #0xffff000050fcf000
   0xffff000050f0b014: mov      x0, x22
   0xffff000050f0b018: add      x1, x1, #0x131
   0xffff000050f0b01c: bl       #0xffff000050f8e3ec  ; call 0xffff000050f8e3ec
   0xffff000050f0b020: cbz      w0, #0xffff000050f0b7c4
   0xffff000050f0b024: ldrb     w21, [x22]
   0xffff000050f0b028: adrp     x0, #0xffff000050fec000
   0xffff000050f0b02c: add      x0, x0, #0x51f
   0xffff000050f0b030: mov      w2, #4
   0xffff000050f0b034: mov      w1, w21
   0xffff000050f0b038: bl       #0xffff000050f8de94  ; call 0xffff000050f8de94
   0xffff000050f0b03c: cbz      x0, #0xffff000050f0b884
   0xffff000050f0b040: adrp     x1, #0xffff000050fef000
   0xffff000050f0b044: adrp     x2, #0xffff000050ffb000
   0xffff000050f0b048: add      x1, x1, #0x536
   0xffff000050f0b04c: add      x2, x2, #0xcb3
   0xffff000050f0b050: mov      w0, #2
   0xffff000050f0b054: mov      w3, w21
   0xffff000050f0b058: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f0b05c: ldr      x8, [x19, #8]
   0xffff000050f0b060: cmp      w21, #0x40
   0xffff000050f0b064: add      x8, x8, #1
   0xffff000050f0b068: b.ne     #0xffff000050f0b8b8
   0xffff000050f0b06c: add      x0, sp, #0xc
   0xffff000050f0b070: mov      x1, x8
   0xffff000050f0b074: mov      w2, #0x21
   0xffff000050f0b078: bl       #0xffff000050f8e5bc  ; call 0xffff000050f8e5bc
   0xffff000050f0b07c: b        #0xffff000050f0b8c4

loc_ffff000050f0b080:
   0xffff000050f0b080: mov      w0, #1
   0xffff000050f0b084: bl       #0xffff000050f38260  ; call 0xffff000050f38260
   0xffff000050f0b088: cbnz     w0, #0xffff000050f0b704
   0xffff000050f0b08c: mov      w0, #1
   0xffff000050f0b090: bl       #0xffff000050f368b8  ; call 0xffff000050f368b8
   0xffff000050f0b094: mov      w21, #3
   0xffff000050f0b098: cbnz     w0, #0xffff000050f0b728
   0xffff000050f0b09c: mov      w0, #1
   0xffff000050f0b0a0: b        #0xffff000050f0b754

loc_ffff000050f0b0a4:
   0xffff000050f0b0a4: adrp     x19, #0xffff000050fd9000
   0xffff000050f0b0a8: adrp     x1, #0xffff000050fe7000
   0xffff000050f0b0ac: add      x19, x19, #0x53d
   0xffff000050f0b0b0: add      x1, x1, #0x583
   0xffff000050f0b0b4: mov      x0, x19
   0xffff000050f0b0b8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b0bc: adrp     x20, #0xffff000050ff8000
   0xffff000050f0b0c0: mov      x0, x19
   0xffff000050f0b0c4: add      x20, x20, #0x773
   0xffff000050f0b0c8: mov      x1, x20
   0xffff000050f0b0cc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b0d0: adrp     x1, #0xffff000050fd9000
   0xffff000050f0b0d4: mov      x0, x19
   0xffff000050f0b0d8: add      x1, x1, #0x5e9
   0xffff000050f0b0dc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b0e0: adrp     x1, #0xffff000050ff2000
   0xffff000050f0b0e4: mov      x0, x19
   0xffff000050f0b0e8: add      x1, x1, #0x81d
   0xffff000050f0b0ec: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b0f0: adrp     x1, #0xffff000050fed000
   0xffff000050f0b0f4: mov      x0, x19
   0xffff000050f0b0f8: add      x1, x1, #0xd0c
   0xffff000050f0b0fc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b100: adrp     x1, #0xffff000050fdc000
   0xffff000050f0b104: mov      x0, x19
   0xffff000050f0b108: add      x1, x1, #0x314
   0xffff000050f0b10c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b110: adrp     x1, #0xffff000050fef000
   0xffff000050f0b114: mov      x0, x19
; XREF string 0xffff000050fed546: 'imei' -> 'IMEI - Success'
>> 0xffff000050f0b118: add      x1, x1, #0x546
   0xffff000050f0b11c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b120: adrp     x1, #0xffff000050fef000
   0xffff000050f0b124: mov      x0, x19
   0xffff000050f0b128: add      x1, x1, #0x566
   0xffff000050f0b12c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b130: adrp     x1, #0xffff000050ff4000
   0xffff000050f0b134: mov      x0, x19
   0xffff000050f0b138: add      x1, x1, #0x3a
   0xffff000050f0b13c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b140: adrp     x1, #0xffff000050fed000
   0xffff000050f0b144: mov      x0, x19
   0xffff000050f0b148: add      x1, x1, #0xd38
   0xffff000050f0b14c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b150: adrp     x1, #0xffff000050fdc000
   0xffff000050f0b154: mov      x0, x19
   0xffff000050f0b158: add      x1, x1, #0x33a
   0xffff000050f0b15c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b160: adrp     x1, #0xffff000050ff5000
   0xffff000050f0b164: mov      x0, x19
   0xffff000050f0b168: add      x1, x1, #0xb88
   0xffff000050f0b16c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b170: adrp     x1, #0xffff000050fd2000
   0xffff000050f0b174: mov      x0, x19
   0xffff000050f0b178: add      x1, x1, #0x102
   0xffff000050f0b17c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b180: adrp     x1, #0xffff000050fe5000
   0xffff000050f0b184: mov      x0, x19
   0xffff000050f0b188: add      x1, x1, #0xc0b
   0xffff000050f0b18c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b190: adrp     x1, #0xffff000050fef000
   0xffff000050f0b194: mov      x0, x19
   0xffff000050f0b198: add      x1, x1, #0x515
   0xffff000050f0b19c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b1a0: adrp     x1, #0xffff000050ff8000
   0xffff000050f0b1a4: mov      x0, x19
   0xffff000050f0b1a8: add      x1, x1, #0x84b
   0xffff000050f0b1ac: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b1b0: adrp     x1, #0xffff000050fd7000
   0xffff000050f0b1b4: mov      x0, x19
   0xffff000050f0b1b8: add      x1, x1, #0xdad
   0xffff000050f0b1bc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b1c0: adrp     x1, #0xffff000050fe2000
   0xffff000050f0b1c4: mov      x0, x19
   0xffff000050f0b1c8: add      x1, x1, #0xb2d
   0xffff000050f0b1cc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b1d0: adrp     x1, #0xffff000050ffa000
   0xffff000050f0b1d4: mov      x0, x19
   0xffff000050f0b1d8: add      x1, x1, #0x360
   0xffff000050f0b1dc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b1e0: adrp     x1, #0xffff000050fe7000
   0xffff000050f0b1e4: mov      x0, x19
   0xffff000050f0b1e8: add      x1, x1, #0x5a4
   0xffff000050f0b1ec: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b1f0: adrp     x1, #0xffff000050ff0000
   0xffff000050f0b1f4: mov      x0, x19
   0xffff000050f0b1f8: add      x1, x1, #0xe04
   0xffff000050f0b1fc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b200: adrp     x1, #0xffff000050fe1000
   0xffff000050f0b204: mov      x0, x19
   0xffff000050f0b208: add      x1, x1, #0x1fa
   0xffff000050f0b20c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b210: adrp     x1, #0xffff000050fff000
   0xffff000050f0b214: mov      x0, x19
   0xffff000050f0b218: add      x1, x1, #0x352
   0xffff000050f0b21c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b220: adrp     x1, #0xffff000050fed000
   0xffff000050f0b224: mov      x0, x19
   0xffff000050f0b228: add      x1, x1, #0xd5e
   0xffff000050f0b22c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b230: adrp     x1, #0xffff000050fe1000
   0xffff000050f0b234: mov      x0, x19
   0xffff000050f0b238: add      x1, x1, #0x209
   0xffff000050f0b23c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b240: adrp     x1, #0xffff000050fda000
   0xffff000050f0b244: mov      x0, x19
   0xffff000050f0b248: add      x1, x1, #0xa38
   0xffff000050f0b24c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b250: adrp     x1, #0xffff000050fd7000
   0xffff000050f0b254: mov      x0, x19
   0xffff000050f0b258: add      x1, x1, #0xdea
   0xffff000050f0b25c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b260: adrp     x1, #0xffff000050fda000
   0xffff000050f0b264: mov      x0, x19
   0xffff000050f0b268: add      x1, x1, #0xa4a
   0xffff000050f0b26c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b270: adrp     x1, #0xffff000050fe4000
   0xffff000050f0b274: mov      x0, x19
   0xffff000050f0b278: add      x1, x1, #0x575
   0xffff000050f0b27c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b280: adrp     x1, #0xffff000050ffd000
   0xffff000050f0b284: mov      x0, x19
   0xffff000050f0b288: add      x1, x1, #0x8a1
   0xffff000050f0b28c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b290: adrp     x1, #0xffff000050fd4000
   0xffff000050f0b294: mov      x0, x19
   0xffff000050f0b298: add      x1, x1, #0xf13
   0xffff000050f0b29c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b2a0: adrp     x21, #0xffff000050ff4000
   0xffff000050f0b2a4: mov      x0, x19
   0xffff000050f0b2a8: add      x21, x21, #0x5f
   0xffff000050f0b2ac: mov      x1, x21
   0xffff000050f0b2b0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b2b4: adrp     x1, #0xffff000050ff0000
   0xffff000050f0b2b8: mov      x0, x19
   0xffff000050f0b2bc: add      x1, x1, #0xe39
   0xffff000050f0b2c0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b2c4: adrp     x1, #0xffff000050fdc000
   0xffff000050f0b2c8: mov      x0, x19
   0xffff000050f0b2cc: add      x1, x1, #0x361
   0xffff000050f0b2d0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b2d4: mov      x0, x19
   0xffff000050f0b2d8: mov      x1, x21
   0xffff000050f0b2dc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b2e0: adrp     x1, #0xffff000050ff7000
   0xffff000050f0b2e4: mov      x0, x19
   0xffff000050f0b2e8: add      x1, x1, #0x1c2
   0xffff000050f0b2ec: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b2f0: adrp     x1, #0xffff000050fe5000
   0xffff000050f0b2f4: mov      x0, x19
   0xffff000050f0b2f8: add      x1, x1, #0xc2a
   0xffff000050f0b2fc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b300: mov      x0, x19
   0xffff000050f0b304: mov      x1, x21
   0xffff000050f0b308: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b30c: adrp     x1, #0xffff000050fd6000
   0xffff000050f0b310: mov      x0, x19
   0xffff000050f0b314: add      x1, x1, #0x83c
   0xffff000050f0b318: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b31c: adrp     x1, #0xffff000050ffd000
   0xffff000050f0b320: mov      x0, x19
   0xffff000050f0b324: add      x1, x1, #0x8d1
   0xffff000050f0b328: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b32c: adrp     x1, #0xffff000050fd6000
   0xffff000050f0b330: mov      x0, x19
   0xffff000050f0b334: add      x1, x1, #0x866
   0xffff000050f0b338: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b33c: adrp     x1, #0xffff000050fd2000
   0xffff000050f0b340: mov      x0, x19
   0xffff000050f0b344: add      x1, x1, #0x12e
   0xffff000050f0b348: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b34c: adrp     x1, #0xffff000050fe4000
   0xffff000050f0b350: mov      x0, x19
   0xffff000050f0b354: add      x1, x1, #0x5a3
   0xffff000050f0b358: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b35c: adrp     x1, #0xffff000050ff2000
   0xffff000050f0b360: mov      x0, x19
   0xffff000050f0b364: add      x1, x1, #0x848
   0xffff000050f0b368: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b36c: mov      x0, x19
   0xffff000050f0b370: mov      x1, x20
   0xffff000050f0b374: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b378: mov      x0, x19
   0xffff000050f0b37c: mov      x1, x20
   0xffff000050f0b380: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b384: adrp     x1, #0xffff000050ffa000
   0xffff000050f0b388: mov      x0, x19
   0xffff000050f0b38c: add      x1, x1, #0x381
   0xffff000050f0b390: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b394: adrp     x1, #0xffff000050ff2000
   0xffff000050f0b398: mov      x0, x19
   0xffff000050f0b39c: add      x1, x1, #0x85e
   0xffff000050f0b3a0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b3a4: adrp     x1, #0xffff000050ffa000
   0xffff000050f0b3a8: mov      x0, x19
   0xffff000050f0b3ac: add      x1, x1, #0x39b
   0xffff000050f0b3b0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b3b4: adrp     x1, #0xffff000050ff8000
   0xffff000050f0b3b8: mov      x0, x19
   0xffff000050f0b3bc: add      x1, x1, #0x871
   0xffff000050f0b3c0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b3c4: adrp     x1, #0xffff000050fdf000
   0xffff000050f0b3c8: mov      x0, x19
   0xffff000050f0b3cc: add      x1, x1, #0xa7a
   0xffff000050f0b3d0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b3d4: mov      x0, x19
   0xffff000050f0b3d8: mov      x1, x20
   0xffff000050f0b3dc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b3e0: adrp     x1, #0xffff000050ff8000
   0xffff000050f0b3e4: mov      x0, x19
   0xffff000050f0b3e8: add      x1, x1, #0x8a3
   0xffff000050f0b3ec: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b3f0: adrp     x1, #0xffff000050fff000
   0xffff000050f0b3f4: mov      x0, x19
   0xffff000050f0b3f8: add      x1, x1, #0x37c
   0xffff000050f0b3fc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b400: adrp     x1, #0xffff000050fe8000
   0xffff000050f0b404: mov      x0, x19
   0xffff000050f0b408: add      x1, x1, #0xeba
   0xffff000050f0b40c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b410: adrp     x1, #0xffff000050fcf000
   0xffff000050f0b414: mov      x0, x19
   0xffff000050f0b418: add      x1, x1, #0x15c
   0xffff000050f0b41c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b420: adrp     x1, #0xffff000050fdf000
   0xffff000050f0b424: mov      x0, x19
   0xffff000050f0b428: add      x1, x1, #0xa91
   0xffff000050f0b42c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b430: mov      x0, x19
   0xffff000050f0b434: mov      x1, x20
   0xffff000050f0b438: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b43c: adrp     x1, #0xffff000050fed000
   0xffff000050f0b440: mov      x0, x19
   0xffff000050f0b444: add      x1, x1, #0xd8a
   0xffff000050f0b448: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b44c: adrp     x1, #0xffff000050fd6000
   0xffff000050f0b450: mov      x0, x19
   0xffff000050f0b454: add      x1, x1, #0x895
   0xffff000050f0b458: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b45c: adrp     x1, #0xffff000050fd7000
   0xffff000050f0b460: mov      x0, x19
   0xffff000050f0b464: add      x1, x1, #0xe16
   0xffff000050f0b468: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b46c: adrp     x1, #0xffff000050ff5000
   0xffff000050f0b470: mov      x0, x19
   0xffff000050f0b474: add      x1, x1, #0xbc9
   0xffff000050f0b478: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b47c: adrp     x1, #0xffff000050ff4000
   0xffff000050f0b480: mov      x0, x19
   0xffff000050f0b484: add      x1, x1, #0x8f
   0xffff000050f0b488: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b48c: adrp     x1, #0xffff000050ffb000
   0xffff000050f0b490: mov      x0, x19
   0xffff000050f0b494: add      x1, x1, #0xcc1
   0xffff000050f0b498: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b49c: adrp     x1, #0xffff000050ff0000
   0xffff000050f0b4a0: mov      x0, x19
   0xffff000050f0b4a4: add      x1, x1, #0xe62
   0xffff000050f0b4a8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b4ac: adrp     x1, #0xffff000050fe1000
   0xffff000050f0b4b0: mov      x0, x19
   0xffff000050f0b4b4: add      x1, x1, #0x233
   0xffff000050f0b4b8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b4bc: adrp     x1, #0xffff000050ffd000
   0xffff000050f0b4c0: mov      x0, x19
   0xffff000050f0b4c4: add      x1, x1, #0x8fe
   0xffff000050f0b4c8: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b4cc: adrp     x21, #0xffff000050ffd000
   0xffff000050f0b4d0: mov      x0, x19
   0xffff000050f0b4d4: add      x21, x21, #0x92a
   0xffff000050f0b4d8: mov      x1, x21
   0xffff000050f0b4dc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b4e0: adrp     x22, #0xffff000050fe4000
   0xffff000050f0b4e4: mov      x0, x19
   0xffff000050f0b4e8: add      x22, x22, #0x5f1
   0xffff000050f0b4ec: mov      x1, x22
   0xffff000050f0b4f0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b4f4: adrp     x1, #0xffff000050ffa000
   0xffff000050f0b4f8: mov      x0, x19
   0xffff000050f0b4fc: add      x1, x1, #0x3c3
   0xffff000050f0b500: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b504: mov      x0, x19
   0xffff000050f0b508: mov      x1, x20
   0xffff000050f0b50c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b510: adrp     x1, #0xffff000050fe8000
   0xffff000050f0b514: mov      x0, x19
   0xffff000050f0b518: add      x1, x1, #0xeed
   0xffff000050f0b51c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b520: adrp     x1, #0xffff000050ffb000
   0xffff000050f0b524: mov      x0, x19
   0xffff000050f0b528: add      x1, x1, #0xcda
   0xffff000050f0b52c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b530: adrp     x1, #0xffff000050ff2000
   0xffff000050f0b534: mov      x0, x19
   0xffff000050f0b538: add      x1, x1, #0x87e
   0xffff000050f0b53c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b540: adrp     x1, #0xffff000050fd7000
   0xffff000050f0b544: mov      x0, x19
   0xffff000050f0b548: add      x1, x1, #0xe40
   0xffff000050f0b54c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b550: mov      x0, x19
   0xffff000050f0b554: mov      x1, x21
   0xffff000050f0b558: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b55c: mov      x0, x19
   0xffff000050f0b560: mov      x1, x22
   0xffff000050f0b564: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b568: adrp     x1, #0xffff000050fe8000
   0xffff000050f0b56c: mov      x0, x19
   0xffff000050f0b570: add      x1, x1, #0xf10
   0xffff000050f0b574: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b578: adrp     x1, #0xffff000050fe2000
   0xffff000050f0b57c: mov      x0, x19
   0xffff000050f0b580: add      x1, x1, #0xb4c
   0xffff000050f0b584: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b588: mov      x0, x19
   0xffff000050f0b58c: mov      x1, x20
   0xffff000050f0b590: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b594: adrp     x1, #0xffff000050fec000
   0xffff000050f0b598: mov      x0, x19
   0xffff000050f0b59c: add      x1, x1, #0x523
   0xffff000050f0b5a0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b5a4: adrp     x1, #0xffff000050fec000
   0xffff000050f0b5a8: mov      x0, x19
   0xffff000050f0b5ac: add      x1, x1, #0x542
   0xffff000050f0b5b0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b5b4: adrp     x1, #0xffff000050fe7000
   0xffff000050f0b5b8: mov      x0, x19
   0xffff000050f0b5bc: add      x1, x1, #0x5ca
   0xffff000050f0b5c0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b5c4: mov      x0, x19
   0xffff000050f0b5c8: mov      x1, x20
   0xffff000050f0b5cc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b5d0: adrp     x1, #0xffff000050fd6000
   0xffff000050f0b5d4: mov      x0, x19
   0xffff000050f0b5d8: add      x1, x1, #0x8b6
   0xffff000050f0b5dc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b5e0: adrp     x1, #0xffff000050ffd000
   0xffff000050f0b5e4: mov      x0, x19
   0xffff000050f0b5e8: add      x1, x1, #0x950
   0xffff000050f0b5ec: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b5f0: adrp     x1, #0xffff000050ffd000
   0xffff000050f0b5f4: mov      x0, x19
   0xffff000050f0b5f8: add      x1, x1, #0x97a
   0xffff000050f0b5fc: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b600: adrp     x1, #0xffff000050fe7000
   0xffff000050f0b604: mov      x0, x19
   0xffff000050f0b608: add      x1, x1, #0x5f0
   0xffff000050f0b60c: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b610: mov      x0, x19
   0xffff000050f0b614: mov      x1, x20
   0xffff000050f0b618: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b61c: adrp     x1, #0xffff000050fd2000
   0xffff000050f0b620: mov      x0, x19
   0xffff000050f0b624: add      x1, x1, #0x15b
   0xffff000050f0b628: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b62c: adrp     x1, #0xffff000050fd2000
   0xffff000050f0b630: mov      x0, x19
   0xffff000050f0b634: add      x1, x1, #0x17a
   0xffff000050f0b638: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b63c: adrp     x1, #0xffff000050fd0000
   0xffff000050f0b640: mov      x0, x19
   0xffff000050f0b644: add      x1, x1, #0x5d1
   0xffff000050f0b648: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b64c: mov      x0, x19
   0xffff000050f0b650: mov      x1, x20
   0xffff000050f0b654: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b658: adrp     x1, #0xffff000050ff4000
   0xffff000050f0b65c: mov      x0, x19
   0xffff000050f0b660: add      x1, x1, #0xb0
   0xffff000050f0b664: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b668: adrp     x1, #0xffff000050ff2000
   0xffff000050f0b66c: mov      x0, x19
   0xffff000050f0b670: add      x1, x1, #0x8ae
   0xffff000050f0b674: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b678: adrp     x1, #0xffff000050fd7000
   0xffff000050f0b67c: mov      x0, x19
   0xffff000050f0b680: add      x1, x1, #0xe6c
   0xffff000050f0b684: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b688: adrp     x1, #0xffff000050fdd000
   0xffff000050f0b68c: mov      x0, x19
   0xffff000050f0b690: add      x1, x1, #0xdae
   0xffff000050f0b694: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b698: adrp     x1, #0xffff000050ff0000
   0xffff000050f0b69c: mov      x0, x19
   0xffff000050f0b6a0: add      x1, x1, #0xe84
   0xffff000050f0b6a4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b6a8: adrp     x1, #0xffff000050fdf000
   0xffff000050f0b6ac: mov      x0, x19
   0xffff000050f0b6b0: add      x1, x1, #0xab1
   0xffff000050f0b6b4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b6b8: adrp     x1, #0xffff000050ff0000
   0xffff000050f0b6bc: add      x1, x1, #0xeb3

loc_ffff000050f0b6c0:
   0xffff000050f0b6c0: mov      x0, x19
   0xffff000050f0b6c4: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b6c8: mov      x0, x19
   0xffff000050f0b6cc: mov      x1, x20
   0xffff000050f0b6d0: bl       #0xffff000050f07c4c  ; call 0xffff000050f07c4c
   0xffff000050f0b6d4: mov      w21, #1
   0xffff000050f0b6d8: b        #0xffff000050f0b728

loc_ffff000050f0b6dc:
   0xffff000050f0b6dc: mov      w8, #1
   0xffff000050f0b6e0: adrp     x1, #0xffff000050f0f000
   0xffff000050f0b6e4: stp      xzr, xzr, [sp, #0x30]
   0xffff000050f0b6e8: add      x1, x1, #0xd1c
   0xffff000050f0b6ec: add      x2, sp, #0x30
   0xffff000050f0b6f0: str      w8, [sp, #0x38]
   0xffff000050f0b6f4: b        #0xffff000050f0ad10

loc_ffff000050f0b6f8:
   0xffff000050f0b6f8: mov      w0, #1
   0xffff000050f0b6fc: bl       #0xffff000050f38260  ; call 0xffff000050f38260
   0xffff000050f0b700: cbz      w0, #0xffff000050f0b810

loc_ffff000050f0b704:
   0xffff000050f0b704: mov      w0, #1
   0xffff000050f0b708: bl       #0xffff000050f35c78  ; call 0xffff000050f35c78
   0xffff000050f0b70c: mov      x2, x0
   0xffff000050f0b710: adrp     x0, #0xffff000050fd9000
   0xffff000050f0b714: adrp     x1, #0xffff000050fea000
   0xffff000050f0b718: add      x0, x0, #0x53d
