; candidate function around xref 0xffff000050f8b27c to 'Invalid partition table!'
; estimated range 0xffff000050f8b18c-0xffff000050f8b29c

   0xffff000050f8b18c: stp      x29, x30, [sp, #-0x20]!
   0xffff000050f8b190: stp      x20, x19, [sp, #0x10]
   0xffff000050f8b194: mov      x29, sp
   0xffff000050f8b198: mov      w19, w0
   0xffff000050f8b19c: bl       #0xffff000050f8aaf4
   0xffff000050f8b1a0: mov      x20, x0
   0xffff000050f8b1a4: bl       #0xffff000050f24d58
   0xffff000050f8b1a8: cbz      x20, #0xffff000050f8b28c
   0xffff000050f8b1ac: sub      w19, w19, w0
   0xffff000050f8b1b0: lsr      w8, w19, #0x18
   0xffff000050f8b1b4: cbnz     w8, #0xffff000050f8b28c
   0xffff000050f8b1b8: bl       #0xffff000050f8aaf4
   0xffff000050f8b1bc: cbz      x0, #0xffff000050f8b28c
   0xffff000050f8b1c0: bl       #0xffff000050f8aaf4
   0xffff000050f8b1c4: adrp     x8, #0xffff000051105000
   0xffff000050f8b1c8: ldr      w3, [x0, #0x74]
   0xffff000050f8b1cc: ldr      x8, [x8, #0xbc0]
   0xffff000050f8b1d0: cmp      w3, #0
   0xffff000050f8b1d4: csel     x9, x8, xzr, eq
   0xffff000050f8b1d8: cbnz     x9, #0xffff000050f8b1e8
   0xffff000050f8b1dc: mov      w8, #0x38
   0xffff000050f8b1e0: ldr      x8, [x8]
   0xffff000050f8b1e4: cbz      x8, #0xffff000050f8b274
   0xffff000050f8b1e8: ldr      x8, [x9, #0x38]
   0xffff000050f8b1ec: ldr      w4, [x8, #0x54]
   0xffff000050f8b1f0: and      w8, w19, #0xff
   0xffff000050f8b1f4: cmp      w4, w8
   0xffff000050f8b1f8: b.ls     #0xffff000050f8b22c
   0xffff000050f8b1fc: ldr      x9, [x9, #0x48]
   0xffff000050f8b200: cbz      x9, #0xffff000050f8b24c
   0xffff000050f8b204: mov      x19, xzr
   0xffff000050f8b208: b        #0xffff000050f8b214
   0xffff000050f8b20c: ldur     x9, [x9, #0x1c]
   0xffff000050f8b210: cbz      x9, #0xffff000050f8b250
   0xffff000050f8b214: ldr      w10, [x9, #0x18]
   0xffff000050f8b218: cmp      w10, w8
   0xffff000050f8b21c: b.ne     #0xffff000050f8b20c
   0xffff000050f8b220: ldur     x10, [x9, #0xc]
   0xffff000050f8b224: lsl      x19, x10, #9
   0xffff000050f8b228: b        #0xffff000050f8b20c
   0xffff000050f8b22c: adrp     x1, #0xffff000050fd4000
   0xffff000050f8b230: adrp     x2, #0xffff000050feb000
   0xffff000050f8b234: add      x1, x1, #0x692
   0xffff000050f8b238: add      x2, x2, #0x9ff
   0xffff000050f8b23c: mov      w0, wzr
   0xffff000050f8b240: mov      w3, w8
   0xffff000050f8b244: bl       #0xffff000050f29978
   0xffff000050f8b248: b        #0xffff000050f8b28c
   0xffff000050f8b24c: mov      x19, xzr
   0xffff000050f8b250: adrp     x1, #0xffff000050ff9000
   0xffff000050f8b254: adrp     x2, #0xffff000050feb000
   0xffff000050f8b258: add      x1, x1, #0xb09
   0xffff000050f8b25c: add      x2, x2, #0x9ff
   0xffff000050f8b260: mov      w0, #2
   0xffff000050f8b264: mov      w4, w8
   0xffff000050f8b268: mov      x5, x19
   0xffff000050f8b26c: bl       #0xffff000050f29978
   0xffff000050f8b270: b        #0xffff000050f8b290
   0xffff000050f8b274: adrp     x1, #0xffff000050fd1000
   0xffff000050f8b278: adrp     x2, #0xffff000050feb000
>> 0xffff000050f8b27c: add      x1, x1, #0x7f4
   0xffff000050f8b280: add      x2, x2, #0x9ff
   0xffff000050f8b284: mov      w0, wzr
   0xffff000050f8b288: bl       #0xffff000050f29978
   0xffff000050f8b28c: mov      x19, xzr
   0xffff000050f8b290: mov      x0, x19
   0xffff000050f8b294: ldp      x20, x19, [sp, #0x10]
   0xffff000050f8b298: ldp      x29, x30, [sp], #0x20
   0xffff000050f8b29c: ret      
