; candidate function around xref 0xffff000050f1add8 to 'serialno'
; estimated range 0xffff000050f1ad70-0xffff000050f1ae64

   0xffff000050f1ad70: sub      sp, sp, #0x80
   0xffff000050f1ad74: stp      x29, x30, [sp, #0x70]
   0xffff000050f1ad78: add      x29, sp, #0x70
   0xffff000050f1ad7c: bl       #0xffff000050f3b800
   0xffff000050f1ad80: ldrb     w8, [x0]
   0xffff000050f1ad84: cbz      w8, #0xffff000050f1adcc
   0xffff000050f1ad88: adrp     x2, #0xffff000050ff5000
   0xffff000050f1ad8c: mov      x3, x0
   0xffff000050f1ad90: add      x2, x2, #0xefd
   0xffff000050f1ad94: add      x0, sp, #0xc
   0xffff000050f1ad98: mov      w1, #0x63
   0xffff000050f1ad9c: bl       #0xffff000050f8c89c
   0xffff000050f1ada0: tbnz     w0, #0x1f, #0xffff000050f1adb0
   0xffff000050f1ada4: add      x0, sp, #0xc
   0xffff000050f1ada8: bl       #0xffff000050f28df0
   0xffff000050f1adac: b        #0xffff000050f1adcc
   0xffff000050f1adb0: adrp     x1, #0xffff000050fd3000
   0xffff000050f1adb4: adrp     x2, #0xffff000050fd0000
   0xffff000050f1adb8: add      x1, x1, #0x7e6
   0xffff000050f1adbc: add      x2, x2, #0x896
   0xffff000050f1adc0: mov      w0, #1
   0xffff000050f1adc4: mov      w3, #0xdf
   0xffff000050f1adc8: bl       #0xffff000050f29978
   0xffff000050f1adcc: bl       #0xffff000050f1b690
   0xffff000050f1add0: adrp     x2, #0xffff000050fda000
   0xffff000050f1add4: mov      x3, x0
>> 0xffff000050f1add8: add      x2, x2, #0xd71
   0xffff000050f1addc: add      x0, sp, #0xc
   0xffff000050f1ade0: mov      w1, #0x63
   0xffff000050f1ade4: bl       #0xffff000050f8c89c
   0xffff000050f1ade8: tbnz     w0, #0x1f, #0xffff000050f1adf8
   0xffff000050f1adec: add      x0, sp, #0xc
   0xffff000050f1adf0: bl       #0xffff000050f28df0
   0xffff000050f1adf4: b        #0xffff000050f1ae14
   0xffff000050f1adf8: adrp     x1, #0xffff000050fd3000
   0xffff000050f1adfc: adrp     x2, #0xffff000050fd0000
   0xffff000050f1ae00: add      x1, x1, #0x7e6
   0xffff000050f1ae04: add      x2, x2, #0x896
   0xffff000050f1ae08: mov      w0, #1
   0xffff000050f1ae0c: mov      w3, #0xe6
   0xffff000050f1ae10: bl       #0xffff000050f29978
   0xffff000050f1ae14: bl       #0xffff000050fa58e4
   0xffff000050f1ae18: adrp     x2, #0xffff000050ff8000
   0xffff000050f1ae1c: mov      w3, w0
   0xffff000050f1ae20: add      x2, x2, #0xb0c
   0xffff000050f1ae24: add      x0, sp, #0xc
   0xffff000050f1ae28: mov      w1, #0x63
   0xffff000050f1ae2c: bl       #0xffff000050f8c89c
   0xffff000050f1ae30: tbnz     w0, #0x1f, #0xffff000050f1ae40
   0xffff000050f1ae34: add      x0, sp, #0xc
   0xffff000050f1ae38: bl       #0xffff000050f28df0
   0xffff000050f1ae3c: b        #0xffff000050f1ae5c
   0xffff000050f1ae40: adrp     x1, #0xffff000050fd3000
   0xffff000050f1ae44: adrp     x2, #0xffff000050fd0000
   0xffff000050f1ae48: add      x1, x1, #0x7e6
   0xffff000050f1ae4c: add      x2, x2, #0x896
   0xffff000050f1ae50: mov      w0, #1
   0xffff000050f1ae54: mov      w3, #0xed
   0xffff000050f1ae58: bl       #0xffff000050f29978
   0xffff000050f1ae5c: ldp      x29, x30, [sp, #0x70]
   0xffff000050f1ae60: add      sp, sp, #0x80
   0xffff000050f1ae64: ret      
