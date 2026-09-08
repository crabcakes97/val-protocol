; candidate function around xref 0xffff000050fa0780 to 'flashing_unlocked'
; estimated range 0xffff000050fa0700-0xffff000050fa07d0

   0xffff000050fa0700: stp      x29, x30, [sp, #-0x10]!
   0xffff000050fa0704: mov      x29, sp
   0xffff000050fa0708: bl       #0xffff000050f9d984
   0xffff000050fa070c: tbz      w0, #0, #0xffff000050fa0760
   0xffff000050fa0710: adrp     x0, #0xffff000050ff3000
   0xffff000050fa0714: mov      x1, xzr
   0xffff000050fa0718: add      x0, x0, #0xacf
   0xffff000050fa071c: mov      x2, xzr
   0xffff000050fa0720: bl       #0xffff000050fa46bc
   0xffff000050fa0724: cbz      w0, #0xffff000050fa077c
   0xffff000050fa0728: adrp     x0, #0xffff000050fe8000
   0xffff000050fa072c: mov      x1, xzr
   0xffff000050fa0730: add      x0, x0, #0x74d
   0xffff000050fa0734: mov      x2, xzr
   0xffff000050fa0738: bl       #0xffff000050fa46bc
   0xffff000050fa073c: cbz      w0, #0xffff000050fa0788
   0xffff000050fa0740: bl       #0xffff000050f9dc0c
   0xffff000050fa0744: adrp     x8, #0xffff000050ff6000
   0xffff000050fa0748: adrp     x9, #0xffff000050ffd000
   0xffff000050fa074c: add      x8, x8, #0xcf7
   0xffff000050fa0750: add      x9, x9, #0x224
   0xffff000050fa0754: tst      w0, #1
   0xffff000050fa0758: csel     x1, x9, x8, ne
   0xffff000050fa075c: b        #0xffff000050fa0790
   0xffff000050fa0760: adrp     x0, #0xffff000051106000
   0xffff000050fa0764: adrp     x1, #0xffff000050fed000
   0xffff000050fa0768: add      x0, x0, #0xcc6
   0xffff000050fa076c: add      x1, x1, #0x6b7
   0xffff000050fa0770: mov      w2, #0x40
   0xffff000050fa0774: bl       #0xffff000050f8e5bc
   0xffff000050fa0778: b        #0xffff000050fa07c4
   0xffff000050fa077c: adrp     x1, #0xffff000050ffb000
>> 0xffff000050fa0780: add      x1, x1, #0x5d7
   0xffff000050fa0784: b        #0xffff000050fa0790
   0xffff000050fa0788: adrp     x1, #0xffff000050fd9000
   0xffff000050fa078c: add      x1, x1, #0x96
   0xffff000050fa0790: adrp     x0, #0xffff000051106000
   0xffff000050fa0794: mov      w2, #0x40
   0xffff000050fa0798: add      x0, x0, #0xcc6
   0xffff000050fa079c: bl       #0xffff000050f8e5bc
   0xffff000050fa07a0: mov      w0, #0x66cc
   0xffff000050fa07a4: bl       #0xffff000050f9db18
   0xffff000050fa07a8: tbz      w0, #0, #0xffff000050fa07c4
   0xffff000050fa07ac: adrp     x0, #0xffff000051106000
   0xffff000050fa07b0: adrp     x1, #0xffff000050fdb000
   0xffff000050fa07b4: add      x0, x0, #0xcc6
   0xffff000050fa07b8: add      x1, x1, #0xd0d
   0xffff000050fa07bc: mov      w2, #0x40
   0xffff000050fa07c0: bl       #0xffff000050f8e528
   0xffff000050fa07c4: adrp     x0, #0xffff000051106000
   0xffff000050fa07c8: add      x0, x0, #0xcc6
   0xffff000050fa07cc: ldp      x29, x30, [sp], #0x10
   0xffff000050fa07d0: ret      
