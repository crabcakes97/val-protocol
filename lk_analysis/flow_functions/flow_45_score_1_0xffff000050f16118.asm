; flow candidate 0xffff000050f16118-0xffff000050f16164
; score: 1
; matched targets: sku
; calls: 0xffff000050f38024

   0xffff000050f16118: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f1611c: str      x19, [sp, #0x10]
   0xffff000050f16120: mov      x29, sp
   0xffff000050f16124: adrp     x19, #0xffff000051052000
   0xffff000050f16128: adrp     x1, #0xffff000050fd2000
   0xffff000050f1612c: add      x19, x19, #0x640
; XREF string 0xffff000050fd2224: 'sku' -> 'carrier_sku'
>> 0xffff000050f16130: add      x1, x1, #0x224
   0xffff000050f16134: mov      w0, wzr
   0xffff000050f16138: mov      x2, x19
   0xffff000050f1613c: mov      w3, #0x10
   0xffff000050f16140: bl       #0xffff000050f38024  ; call 0xffff000050f38024
   0xffff000050f16144: ldrb     w8, [x19]
   0xffff000050f16148: cmp      w8, #0
   0xffff000050f1614c: adrp     x8, #0xffff000050fd6000
   0xffff000050f16150: ccmp     x0, #0, #4, ne
   0xffff000050f16154: add      x8, x8, #0x800
   0xffff000050f16158: csel     x0, x8, x19, eq
   0xffff000050f1615c: ldr      x19, [sp, #0x10]
   0xffff000050f16160: ldp      x29, x30, [sp], #0x20
   0xffff000050f16164: ret      
