; candidate function around xref 0xffff000050f901d0 to 'validate_hash_password: Version 1 datablock'
; estimated range 0xffff000050f9014c-0xffff000050f902e4

   0xffff000050f9014c: sub      sp, sp, #0xa0
   0xffff000050f90150: stp      x29, x30, [sp, #0x70]
   0xffff000050f90154: add      x29, sp, #0x70
   0xffff000050f90158: stp      x22, x21, [sp, #0x80]
   0xffff000050f9015c: stp      x20, x19, [sp, #0x90]
   0xffff000050f90160: mov      w8, #0x20
   0xffff000050f90164: mov      x19, x0
   0xffff000050f90168: stur     xzr, [x29, #-8]
   0xffff000050f9016c: str      w8, [sp, #0xc]
   0xffff000050f90170: bl       #0xffff000050f90010
   0xffff000050f90174: tbz      w0, #0, #0xffff000050f901d8
   0xffff000050f90178: sub      x0, x29, #8
   0xffff000050f9017c: sub      x1, x29, #0xc
   0xffff000050f90180: bl       #0xffff000050f90f78
   0xffff000050f90184: mov      w8, w0
   0xffff000050f90188: mov      w20, wzr
   0xffff000050f9018c: ldur     x0, [x29, #-8]
   0xffff000050f90190: cmp      w8, #0xf
   0xffff000050f90194: b.ne     #0xffff000050f902c8
   0xffff000050f90198: cbz      x0, #0xffff000050f902c8
   0xffff000050f9019c: bl       #0xffff000050f923f0
   0xffff000050f901a0: mov      w21, w0
   0xffff000050f901a4: ldur     x0, [x29, #-8]
   0xffff000050f901a8: bl       #0xffff000050f923cc
   0xffff000050f901ac: mov      w20, w0
   0xffff000050f901b0: and      w8, w21, #0xffff
   0xffff000050f901b4: cmp      w8, #2
   0xffff000050f901b8: b.eq     #0xffff000050f901e0
   0xffff000050f901bc: cmp      w8, #1
   0xffff000050f901c0: b.ne     #0xffff000050f90298
   0xffff000050f901c4: adrp     x1, #0xffff000050fee000
   0xffff000050f901c8: mov      w21, wzr
   0xffff000050f901cc: mov      w22, #0x14
>> 0xffff000050f901d0: add      x1, x1, #0xcce
   0xffff000050f901d4: b        #0xffff000050f901f0
   0xffff000050f901d8: mov      w20, wzr
   0xffff000050f901dc: b        #0xffff000050f902d0
   0xffff000050f901e0: adrp     x1, #0xffff000050fd1000
   0xffff000050f901e4: mov      w21, #1
   0xffff000050f901e8: mov      w22, #0x20
   0xffff000050f901ec: add      x1, x1, #0x916
   0xffff000050f901f0: mov      w0, #1
   0xffff000050f901f4: bl       #0xffff000050f29978
   0xffff000050f901f8: ldur     x8, [x29, #-8]
   0xffff000050f901fc: add      x10, sp, #0x30
   0xffff000050f90200: add      x3, x10, #0x10
   0xffff000050f90204: add      x4, sp, #0xc
   0xffff000050f90208: mov      w0, w21
   0xffff000050f9020c: mov      x1, x19
   0xffff000050f90210: ldp      x8, x9, [x8, #8]
   0xffff000050f90214: mov      w2, #0x14
   0xffff000050f90218: stp      x8, x9, [sp, #0x30]
   0xffff000050f9021c: bl       #0xffff000050f90cec
   0xffff000050f90220: cmp      w0, #0xf
   0xffff000050f90224: b.ne     #0xffff000050f902a4
   0xffff000050f90228: add      w2, w22, #0x10
   0xffff000050f9022c: add      x1, sp, #0x30
   0xffff000050f90230: add      x3, sp, #0x10
   0xffff000050f90234: add      x4, sp, #0xc
   0xffff000050f90238: mov      w0, w21
   0xffff000050f9023c: str      w22, [sp, #0xc]
   0xffff000050f90240: add      x19, sp, #0x10
   0xffff000050f90244: bl       #0xffff000050f90cec
   0xffff000050f90248: cmp      w0, #0xf
   0xffff000050f9024c: b.ne     #0xffff000050f902b0
   0xffff000050f90250: mov      x2, xzr
   0xffff000050f90254: ldur     x8, [x29, #-8]
   0xffff000050f90258: add      w9, w20, #0x26
   0xffff000050f9025c: mov      w10, w22
   0xffff000050f90260: add      w11, w9, w2
   0xffff000050f90264: ldrb     w3, [x19, x2]
   0xffff000050f90268: ldrb     w11, [x8, w11, uxtw]
   0xffff000050f9026c: cmp      w3, w11
   0xffff000050f90270: b.ne     #0xffff000050f902e8
   0xffff000050f90274: add      x2, x2, #1
   0xffff000050f90278: cmp      x10, x2
   0xffff000050f9027c: b.ne     #0xffff000050f90260
   0xffff000050f90280: add      x0, sp, #0x10
   0xffff000050f90284: mov      w1, wzr
   0xffff000050f90288: mov      w2, #0x20
   0xffff000050f9028c: bl       #0xffff000050f9b76c
   0xffff000050f90290: mov      w20, #1
   0xffff000050f90294: b        #0xffff000050f902c4
   0xffff000050f90298: adrp     x1, #0xffff000050fcf000
   0xffff000050f9029c: add      x1, x1, #0xfed
   0xffff000050f902a0: b        #0xffff000050f902b8
   0xffff000050f902a4: adrp     x1, #0xffff000050fdd000
   0xffff000050f902a8: add      x1, x1, #0x537
   0xffff000050f902ac: b        #0xffff000050f902b8
   0xffff000050f902b0: adrp     x1, #0xffff000050ff5000
   0xffff000050f902b4: add      x1, x1, #0x40f
   0xffff000050f902b8: mov      w0, #1
   0xffff000050f902bc: bl       #0xffff000050f29978
   0xffff000050f902c0: mov      w20, wzr
   0xffff000050f902c4: ldur     x0, [x29, #-8]
   0xffff000050f902c8: cbz      x0, #0xffff000050f902d0
   0xffff000050f902cc: bl       #0xffff000050f9b6f0
   0xffff000050f902d0: mov      w0, w20
   0xffff000050f902d4: ldp      x20, x19, [sp, #0x90]
   0xffff000050f902d8: ldp      x22, x21, [sp, #0x80]
   0xffff000050f902dc: ldp      x29, x30, [sp, #0x70]
   0xffff000050f902e0: add      sp, sp, #0xa0
   0xffff000050f902e4: ret      
