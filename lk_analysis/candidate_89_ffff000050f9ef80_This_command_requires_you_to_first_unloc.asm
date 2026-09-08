; candidate function around xref 0xffff000050f9efd4 to 'This command requires you to first unlock the bootloader'
; estimated range 0xffff000050f9ef80-0xffff000050f9effc

   0xffff000050f9ef80: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f9ef84: stp      x20, x19, [sp, #0x10]
   0xffff000050f9ef88: mov      x29, sp
   0xffff000050f9ef8c: ldr      x19, [x0, #0x10]
   0xffff000050f9ef90: ldrb     w8, [x19, #1]!
   0xffff000050f9ef94: cmp      w8, #0x20
   0xffff000050f9ef98: b.eq     #0xffff000050f9ef90
   0xffff000050f9ef9c: adrp     x8, #0xffff000051106000
   0xffff000050f9efa0: ldr      w20, [x8, #0xa14]
   0xffff000050f9efa4: cbz      w20, #0xffff000050f9efc8
   0xffff000050f9efa8: mov      w8, #0x7070
   0xffff000050f9efac: cmp      w20, w8
   0xffff000050f9efb0: b.ne     #0xffff000050f9f000
   0xffff000050f9efb4: adrp     x0, #0xffff000050fd9000
   0xffff000050f9efb8: adrp     x1, #0xffff000050fd9000
   0xffff000050f9efbc: add      x0, x0, #0x53d
   0xffff000050f9efc0: add      x1, x1, #0x57
   0xffff000050f9efc4: b        #0xffff000050f9efec
   0xffff000050f9efc8: adrp     x19, #0xffff000050fd9000
   0xffff000050f9efcc: adrp     x1, #0xffff000050fd3000
   0xffff000050f9efd0: add      x19, x19, #0x53d
>> 0xffff000050f9efd4: add      x1, x1, #0xe6
   0xffff000050f9efd8: mov      x0, x19
   0xffff000050f9efdc: bl       #0xffff000050f07c4c
   0xffff000050f9efe0: adrp     x1, #0xffff000050fe0000
   0xffff000050f9efe4: mov      x0, x19
   0xffff000050f9efe8: add      x1, x1, #0xb3d
   0xffff000050f9efec: bl       #0xffff000050f07c4c
   0xffff000050f9eff0: mov      w0, #3
   0xffff000050f9eff4: ldp      x20, x19, [sp, #0x10]
   0xffff000050f9eff8: ldp      x29, x30, [sp], #0x20
   0xffff000050f9effc: ret      
