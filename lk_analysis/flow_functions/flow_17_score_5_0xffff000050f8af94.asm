; flow candidate 0xffff000050f8af94-0xffff000050f8b040
; score: 5
; matched targets: Invalid partition table!
; calls: 0xffff000050f8aaf4, 0xffff000050f24d58, 0xffff000050f29978

   0xffff000050f8af94: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f8af98: stp      x20, x19, [sp, #0x10]
   0xffff000050f8af9c: mov      x29, sp
   0xffff000050f8afa0: mov      w19, w0
   0xffff000050f8afa4: bl       #0xffff000050f8aaf4  ; call 0xffff000050f8aaf4
   0xffff000050f8afa8: mov      x20, x0
   0xffff000050f8afac: bl       #0xffff000050f24d58  ; call 0xffff000050f24d58
   0xffff000050f8afb0: cbz      x20, #0xffff000050f8b034
   0xffff000050f8afb4: adrp     x8, #0xffff000051105000
   0xffff000050f8afb8: ldr      w9, [x20, #0x74]
   0xffff000050f8afbc: ldr      x8, [x8, #0xbc0]
   0xffff000050f8afc0: cmp      w9, #0
   0xffff000050f8afc4: csel     x8, x8, xzr, eq
   0xffff000050f8afc8: cbnz     x8, #0xffff000050f8afd8
   0xffff000050f8afcc: mov      w9, #0x38
   0xffff000050f8afd0: ldr      x9, [x9]
   0xffff000050f8afd4: cbz      x9, #0xffff000050f8b01c

loc_ffff000050f8afd8:
   0xffff000050f8afd8: ldr      x9, [x8, #0x38]
   0xffff000050f8afdc: sub      w3, w19, w0
   0xffff000050f8afe0: ldr      w4, [x9, #0x54]
   0xffff000050f8afe4: tbnz     w3, #0x1f, #0xffff000050f8b000
   0xffff000050f8afe8: cmp      w4, w3
   0xffff000050f8afec: b.ls     #0xffff000050f8b000
   0xffff000050f8aff0: ldr      x8, [x8, #0x40]
   0xffff000050f8aff4: mov      w9, #0x34
   0xffff000050f8aff8: umaddl   x0, w3, w9, x8
   0xffff000050f8affc: b        #0xffff000050f8b038

loc_ffff000050f8b000:
   0xffff000050f8b000: adrp     x1, #0xffff000050fd4000
   0xffff000050f8b004: adrp     x2, #0xffff000050ffe000
   0xffff000050f8b008: add      x1, x1, #0x692
   0xffff000050f8b00c: add      x2, x2, #0x82a
   0xffff000050f8b010: mov      w0, wzr
   0xffff000050f8b014: bl       #0xffff000050f29978  ; call 0xffff000050f29978
   0xffff000050f8b018: b        #0xffff000050f8b034

loc_ffff000050f8b01c:
   0xffff000050f8b01c: adrp     x1, #0xffff000050fd1000
   0xffff000050f8b020: adrp     x2, #0xffff000050ffe000
; XREF string 0xffff000050fd17f4: 'Invalid partition table!' -> '%s: Invalid partition table!\n'
>> 0xffff000050f8b024: add      x1, x1, #0x7f4
   0xffff000050f8b028: add      x2, x2, #0x82a
   0xffff000050f8b02c: mov      w0, wzr
   0xffff000050f8b030: bl       #0xffff000050f29978  ; call 0xffff000050f29978

loc_ffff000050f8b034:
   0xffff000050f8b034: mov      x0, xzr

loc_ffff000050f8b038:
   0xffff000050f8b038: ldp      x20, x19, [sp, #0x10]
   0xffff000050f8b03c: ldp      x29, x30, [sp], #0x20
   0xffff000050f8b040: ret      
