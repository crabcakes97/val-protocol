/* kree_map_all.S -- EXHAUSTIVE on-device mapper: everything, crash-safe.
 *
 * Covers (one binary, no libc, static PIE, _start):
 *   PH0 dev opens: /dev/gz_kree, /dev/trusty-ipc-dev0, /dev/audio_ipi,
 *       /dev/mobicore-user. Logs open rc. Continues if some absent.
 *   PH1 KREE create per baked service (7 proven) + dynamic list file
 *       /data/local/tmp/kmap.svcs (one service name per line, written by
 *       kree_map_recon.sh from on-device lib strings -- this is the
 *       "not just what we picked" part). Logs sess handle per service.
 *   PH2 sub sweep 0..65535 via 0x5403 per session (baked + dynamic),
 *       struct {ret,sess,sub,0x20002,ustruct,0} (proven lib shape).
 *   PH3 shm register 0x5404 per session x sizes 4K/16K/64K/256K/1M
 *       (own dma_heap buffer -- safe, caller-owned).
 *   PH4 audio_ipi sweep: ioctls 0x40046900..0x0F x index 0..42, 0x48B
 *       struct magic 0x8888 (per READDUMP S24; 0x08-0x0F are instant
 *       reject, zero-risk). Logs every rc (only 688 calls).
 *   PH5 foreign sessions {1,3,4} x subs 0..65535 (same shape).
 *
 * Crash/reboot safety:
 *   - stdout is the log (runner redirects append). Every log write is
 *     followed by fsync(1) so a panic keeps the tail.
 *   - progress (phase,svc,sub) persisted to /data/local/tmp/kmap.prog
 *     on every phase entry, every service change, every 256 subs.
 *     Rerun resumes from prog. DONE marker phase=99.
 *   - anomalies only for KREE subs (rc||out); every RES for audio_ipi.
 *   - 2ms pacing per KREE call + 200ms per 4K (flood control, dmesg drain).
 *   - NEVER touches gz_test 4 (abort), NEVER flashes, NEVER preloader/efuse.
 *   - toybox-safe runner side; this binary needs no shell at all.
 */
    .arch armv8-a
    .text
    .global _start
    .equ SYS_OPENAT, 56
    .equ SYS_IOCTL, 29
    .equ SYS_WRITE, 64
    .equ SYS_READ, 63
    .equ SYS_CLOSE, 57
    .equ SYS_EXIT, 93
    .equ SYS_FSYNC, 82
    .equ SYS_NANOSLEEP, 101
    .equ SYS_MMAP, 222
    .section .rodata
dev_kree:   .asciz "/dev/gz_kree"
dev_trusty: .asciz "/dev/trusty-ipc-dev0"
dev_audio:  .asciz "/dev/audio_ipi"
dev_mcuser: .asciz "/dev/mobicore-user"
heap_path:  .asciz "/dev/dma_heap/system"
prog_path:  .asciz "/data/local/tmp/kmap.prog"
svcs_path:  .asciz "/data/local/tmp/kmap.svcs"
msg_PH:     .asciz "PH="
msg_SVC:    .asciz " SVC="
msg_SUB:    .asciz " SUB="
msg_RC:     .asciz " RC="
msg_OUT:    .asciz " OUT="
msg_SESS:   .asciz " SESS="
msg_SHM:    .asciz " SHM="
msg_SZ:     .asciz " SZ="
msg_FD:     .asciz " FD="
msg_CMD:    .asciz " CMD="
msg_IDX:    .asciz " IDX="
msg_NL:     .asciz "\n"
msg_HB:     .asciz "HB "
msg_BANNER: .asciz "KMAP-ALL v1 start\n"
msg_DONE:   .asciz "DONE\n"
msg_NODYN:  .asciz "DYN none\n"
s_mem:      .asciz "com.mediatek.geniezone.srv.mem"
s_sys:      .asciz "com.mediatek.geniezone.srv.sys"
s_imgs:     .asciz "com.mediatek.geniezone.srv.imgsensor"
s_test:     .asciz "com.mediatek.geniezone.test"
s_isp:      .asciz "com.mediatek.geniezone.isp"
s_echo:     .asciz "com.mediatek.geniezone.srv.echo"
s_cmdq:     .asciz "com.mediatek.geniezone.cmdq"
    .align 3
svc_table:
    .quad s_mem, s_sys, s_imgs, s_test, s_isp, s_echo, s_cmdq
    .equ NSVC, 7
    .align 3
size_table:
    .quad 0x1000, 0x4000, 0x10000, 0x40000, 0x100000
    .equ NSIZE, 5
foreign_tab:
    .word 1, 3, 4
    .equ NFOREIGN, 3
    .text
/* print helpers: x0=ptr,x1=len -> stdout; print_cstr x0=ptr */
print:
    mov x2, x1; mov x1, x0; mov x0, #1; mov x8, #SYS_WRITE; svc #0; ret
print_cstr:
    mov x2, x0; mov x3, #0
1:  ldrb w1, [x2, x3]; cbz w1, 2f; add x3, x3, #1; b 1b
2:  mov x1, x3; b print
print_hex32: // w0
    stp x29, x30, [sp, #-16]!
    mov x29, sp; sub sp, sp, #16; mov w1, w0; add x2, sp, #8; mov w3, #8
1:  sub x2, x2, #1; and w4, w1, #0xf; lsr w1, w1, #4; cmp w4, #10
    add w5, w4, #48; add w6, w4, #87; csel w4, w5, w6, lo; strb w4, [x2]
    subs w3, w3, #1; b.ne 1b
    mov x0, sp; mov x1, #8; bl print
    add sp, sp, #16; ldp x29, x30, [sp], #16; ret
/* fsync stdout: clobbers x0,x8 */
fsync_out:
    mov x0, #1; mov x8, #SYS_FSYNC; svc #0; ret
/* msleep w0=ms: clobbers x0-x2,x8 + 16B stack */
msleep:
    stp x29, x30, [sp, #-16]!
    mov x29, sp; sub sp, sp, #16
    mov w1, w0
    movz x0, #1000
    mul x1, x1, x0          // us
    movz x0, #1000
    mul x1, x1, x0          // ns
    str xzr, [sp]
    str x1, [sp, #8]
    mov x0, sp; mov x1, xzr; mov x8, #SYS_NANOSLEEP; svc #0
    add sp, sp, #16; ldp x29, x30, [sp], #16; ret
/* save_prog w19=phase,w20=svc,w25=sub. clobbers x0-x8. */
save_prog:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    stp x19, x20, [sp, #16]
    str w25, [sp, #24]
    movn x0, #99
    adrp x1, prog_path; add x1, x1, :lo12:prog_path
    mov w2, #0x241          // O_WRONLY|O_CREAT|O_TRUNC
    mov w3, #0x1a4          // 0644
    mov x8, #SYS_OPENAT; svc #0
    cmp x0, #0; b.lt 1f
    mov x4, x0
    add x0, sp, #16
    mov x1, #12
    mov x2, x1; mov x1, x0; mov x0, x4
    mov x8, #SYS_WRITE; svc #0
    mov x0, x4; mov x8, #SYS_FSYNC; svc #0
    mov x0, x4; mov x8, #SYS_CLOSE; svc #0
1:  ldp x29, x30, [sp], #32; ret
/* load_prog -> w19,w20,w25 (defaults 0,0,0; DONE phase=99 stays 99). */
load_prog:
    mov w19, #0; mov w20, #0; mov w25, #0
    movn x0, #99
    adrp x1, prog_path; add x1, x1, :lo12:prog_path
    mov x2, xzr; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    cmp x0, #0; b.lt 1f
    mov x4, x0
    sub sp, sp, #16
    mov x0, x4; mov x1, sp; mov x2, #12; mov x8, #SYS_READ; svc #0
    cmp x0, #12; b.ne 2f
    ldp x19, x20, [sp]
    ldr w25, [sp, #8]
    // clamp: phase<=6 or 99, svc<64, sub<65536
    cmp w19, #99; b.eq 2f
    cmp w19, #6; b.hi 3f
    cmp w20, #64; b.hs 3f
    mov w0, #0; movk w0, #0x1, lsl #16
    cmp w25, w0; b.hs 3f
    b 2f
3:  mov w19, #0; mov w20, #0; mov w25, #0
2:  add sp, sp, #16
    mov x0, x4; mov x8, #SYS_CLOSE; svc #0
1:  ret
/* hb_line: "HB PH=.. SVC=.. SUB=..\n" + fsync. uses w19,w20,w25. */
hb_line:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adrp x0, msg_HB; add x0, x0, :lo12:msg_HB; bl print_cstr
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, w19; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, w20; bl print_hex32
    adrp x0, msg_SUB; add x0, x0, :lo12:msg_SUB; bl print_cstr
    mov w0, w25; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    ldp x29, x30, [sp], #16; ret
/* hit_line: "PH=.. SVC=.. SUB=.. RC=.. OUT=..\n" + fsync.
 * in: w19=ph,w20=svc,w25=sub,w21=rc,w22=out */
hit_line:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, w19; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, w20; bl print_hex32
    adrp x0, msg_SUB; add x0, x0, :lo12:msg_SUB; bl print_cstr
    mov w0, w25; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w21; bl print_hex32
    adrp x0, msg_OUT; add x0, x0, :lo12:msg_OUT; bl print_cstr
    mov w0, w22; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    ldp x29, x30, [sp], #16; ret
_start:
    adrp x0, msg_BANNER; add x0, x0, :lo12:msg_BANNER; bl print_cstr
    bl fsync_out
    bl load_prog
    cmp w19, #99; b.ne have_start
    adrp x0, msg_DONE; add x0, x0, :lo12:msg_DONE; bl print_cstr
    bl fsync_out
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
have_start:
    /* ---- PH0: dev opens ---- */
    cmp w19, #0; b.hi skip_ph0
    mov w19, #0; mov w20, #0; mov w25, #0; bl save_prog
    movn x0, #99
    adrp x1, dev_kree; add x1, x1, :lo12:dev_kree
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x19, x0  // x19 reused as kree fd below; save phase separately
    // log kree fd
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #0; bl print_hex32
    adrp x0, msg_FD; add x0, x0, :lo12:msg_FD; bl print_cstr
    mov w0, w19; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    cmp x19, #0; b.ge kree_ok
    // no kree fd: still log other devs then exit(2) -- runner retries later
    mov x0, #2; mov x8, #SYS_EXIT; svc #0
kree_ok:
    // stash kree fd in x28 (callee-saved across helpers? helpers use x0-x8
    // only, plus x29/x30 -- x19-x28 safe). Reassign: x28=kree fd.
    mov x28, x19
    mov w19, #0
    // other devs: open+close, log rc only
    movn x0, #99
    adrp x1, dev_trusty; add x1, x1, :lo12:dev_trusty
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x9, x0
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #0; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #100; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w9; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    cmp x9, #0; b.lt 1f; mov x0, x9; mov x8, #SYS_CLOSE; svc #0
1:
    movn x0, #99
    adrp x1, dev_audio; add x1, x1, :lo12:dev_audio
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x9, x0
    mov x27, x0  // stash audio fd in x27
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #0; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #101; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w9; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    cmp x9, #0; b.lt 2f; // keep audio fd open in x27 for PH4
    b 3f
2:  mov x27, xzr  // mark invalid (0 is never a valid fd here? stdin=0; use -1)
    movn x27, #0  // x27 = -1
3:
    movn x0, #99
    adrp x1, dev_mcuser; add x1, x1, :lo12:dev_mcuser
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x9, x0
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #0; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #102; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w9; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    cmp x9, #0; b.lt 4f; mov x0, x9; mov x8, #SYS_CLOSE; svc #0
4:
    // dma_heap 1M buffer for PH3 (fall back 4K)
    movn x0, #99
    adrp x1, heap_path; add x1, x1, :lo12:heap_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x24, x0  // heap fd
    cmp x24, #0; b.lt no_dma
    sub sp, sp, #32
    mov x0, #0x100000
    str x0, [sp]
    str wzr, [sp, #8]
    mov w0, #2; movk w0, #0x8, lsl #16
    str w0, [sp, #12]
    str xzr, [sp, #16]
    mov x0, x24
    mov w1, #0x4800; movk w1, #0xc018, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov w26, w0  // alloc rc
    ldr w25, [sp, #8]  // dmabuf fd
    add sp, sp, #32
    cbnz w26, dma_4k
    mov x0, xzr
    mov x1, #0x100000
    mov x2, #3; mov x3, #1
    mov x4, x25; mov x5, xzr; mov x8, #SYS_MMAP; svc #0
    cmp x0, #0; b.lt dma_4k
    mov x26, x0  // dma base 1M
    mov x29, x25 // keep dmabuf fd? x29 is frame pointer -- use x23 instead
    mov x23, x25
    b dma_done
dma_4k:
    sub sp, sp, #32
    mov x0, #0x1000
    str x0, [sp]
    str wzr, [sp, #8]
    mov w0, #2; movk w0, #0x8, lsl #16
    str w0, [sp, #12]
    str xzr, [sp, #16]
    mov x0, x24
    mov w1, #0x4800; movk w1, #0xc018, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w25, [sp, #8]
    add sp, sp, #32
    mov x0, xzr
    mov x1, #0x1000
    mov x2, #3; mov x3, #1
    mov x4, x25; mov x5, xzr; mov x8, #SYS_MMAP; svc #0
    mov x26, x0
    mov x23, x25
    b dma_done
no_dma:
    mov x26, xzr; mov x23, xzr
dma_done:
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #0; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #103; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w26; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    b ph1_entry
skip_ph0:
    // resumed: reopen fds (kree + audio + dma minimal 4K)
    movn x0, #99
    adrp x1, dev_kree; add x1, x1, :lo12:dev_kree
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x28, x0
    cmp x28, #0; b.ge 1f
    mov x0, #2; mov x8, #SYS_EXIT; svc #0
1:
    movn x0, #99
    adrp x1, dev_audio; add x1, x1, :lo12:dev_audio
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x27, x0
    movn x0, #99
    adrp x1, heap_path; add x1, x1, :lo12:heap_path
    mov x2, #2; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    mov x24, x0
    sub sp, sp, #32
    mov x0, #0x1000
    str x0, [sp]
    str wzr, [sp, #8]
    mov w0, #2; movk w0, #0x8, lsl #16
    str w0, [sp, #12]
    str xzr, [sp, #16]
    mov x0, x24
    mov w1, #0x4800; movk w1, #0xc018, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    ldr w25, [sp, #8]
    add sp, sp, #32
    mov x0, xzr; mov x1, #0x1000; mov x2, #3; mov x3, #1
    mov x4, x25; mov x5, xzr; mov x8, #SYS_MMAP; svc #0
    mov x26, x0; mov x23, x25
ph1_entry:
    /* sess[16] area first (lives until exit), stash prog triple on top
     * so dropping the stash never touches sessions. */
    sub sp, sp, #128
    mov x22, sp  // sess[16] base
    sub sp, sp, #16
    str w19, [sp]
    str w20, [sp, #4]
    str w25, [sp, #8]
    ldr w9, [sp]  // stashed phase
    cmp w9, #1
    b.hi ph1_silent
    // fresh: normal logged creates from svc 0
    add sp, sp, #16  // drop stash (sess area intact below)
    mov w19, #1
    mov w20, #0
    b ph1_loop
ph1_silent:
    // resumed past PH1: re-create all, no prog writes, minimal logging
    mov w20, #0
ph1_silent_loop:
    adrp x9, svc_table; add x9, x9, :lo12:svc_table
    lsl x10, x20, #3
    add x10, x9, x10
    ldr x10, [x10]  // name ptr
    sub sp, sp, #32
    str xzr, [sp]
    str x10, [sp, #8]
    mov x0, x28
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0  // rc
    ldr w12, [sp, #4]  // sess
    add sp, sp, #32
    lsl x10, x20, #2
    add x10, x22, x10
    str w12, [x10]
    add w20, w20, #1
    cmp w20, #NSVC
    b.lt ph1_silent_loop
    // log one re-create line + restore prog triple
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #1; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #200; bl print_hex32  // 200 = silent re-create marker
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    ldr w19, [sp]
    ldr w20, [sp, #4]
    ldr w25, [sp, #8]
    add sp, sp, #16  // drop stash (sess area intact below, x22 still base)
    // route to saved phase
    cmp w19, #2; b.eq ph2_entry_resume
    cmp w19, #3; b.eq ph3_entry
    cmp w19, #4; b.eq ph4_entry
    cmp w19, #5; b.eq ph5_entry
    cmp w19, #6; b.eq ph6_entry
    b ph2_entry_resume  // default: re-sweep from saved svc/sub
ph1_loop:
    // skip if prog svc ahead
    // (prog svc = resume point; services below it already done)
    // w20 baked idx; dynamic handled in PH6
    adrp x0, svc_table  // careful: x0 clobbers? use x9/x10
    adrp x9, svc_table; add x9, x9, :lo12:svc_table
    lsl x10, x20, #3
    add x10, x9, x10
    ldr x10, [x10]  // name ptr
    sub sp, sp, #32
    str xzr, [sp]
    str x10, [sp, #8]
    mov x0, x28
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0  // rc
    ldr w12, [sp, #4]  // sess
    add sp, sp, #32
    // store sess
    lsl x10, x20, #2
    add x10, x22, x10
    str w12, [x10]
    // log
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #1; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, w20; bl print_hex32
    adrp x0, msg_SESS; add x0, x0, :lo12:msg_SESS; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    mov w25, #0; bl save_prog  // service change checkpoint (w19=1,w20=idx)
    mov w19, #1 // save_prog preserves? it uses x19/x20/w25 -- restore w19
    add w20, w20, #1
    cmp w20, #NSVC
    b.lt ph1_loop
    // keep sess base in x22 for PH2/PH3 (stack lives until end)
    b ph2_entry
ph2_entry_resume:
ph2_entry:
    /* ---- PH2: sub sweep per baked session ---- */
    cmp w19, #2; b.hi ph3_entry
    mov w19, #2
    // shared ustruct {0,0,0x1000@+16} persistent
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x21, sp  // wait x21 used for rc below; use x15? helpers only use
    mov x15, sp  // ustruct ptr in x15 (safe: print helpers use x0-x8)
    // resume: w20=svc already set by prog (clamp <NSVC)
    cmp w20, #NSVC; b.lo ph2_svc_ok
    mov w20, #0; mov w25, #0
ph2_svc_ok:
    // w25=sub already set by prog
ph2_svc_loop:
    // load sess for w20
    lsl x10, x20, #2
    add x10, x22, x10
    ldr w16, [x10]
    cbz w16, ph2_next_svc  // no session: skip service
ph2_sub_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w16, [sp, #4]
    str w25, [sp, #8]
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x15, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x28
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0  // rc
    ldr w12, [sp]  // out
    add sp, sp, #64
    // pacing 2ms
    mov w0, #2; bl msleep
    // heartbeat + prog every 256
    tst w25, #0xff
    b.ne ph2_no_hb
    bl hb_line
    bl save_prog
    mov w19, #2
ph2_no_hb:
    cbnz w11, ph2_hit
    cbnz w12, ph2_hit
    b ph2_next_sub
ph2_hit:
    // w21=rc,w22=out expected by hit_line; move
    mov w21, w11; mov w22, w12
    bl hit_line
ph2_next_sub:
    add w25, w25, #1
    mov w0, #0; movk w0, #0x1, lsl #16
    cmp w25, w0
    b.lt ph2_sub_loop
    mov w25, #0
ph2_next_svc:
    // checkpoint service done
    bl save_prog
    mov w19, #2
    add w20, w20, #1
    cmp w20, #NSVC
    b.lt ph2_svc_loop
    add sp, sp, #64  // free ustruct
    b ph3_entry
ph3_entry:
    /* ---- PH3: shm register per session x sizes ---- */
    cmp w19, #3; b.hi ph4_entry
    mov w19, #3
    cmp w20, #NSVC; b.lo ph3_ok
    mov w20, #0; mov w25, #0
ph3_ok:
    adrp x9, size_table; add x9, x9, :lo12:size_table
ph3_svc_loop:
    lsl x10, x20, #2
    add x10, x22, x10
    ldr w16, [x10]
    cbz w16, ph3_next
    mov w25, #0  // size idx
ph3_sz_loop:
    lsl x10, x25, #3
    add x10, x9, x10
    ldr x10, [x10]  // size
    sub sp, sp, #32
    str w16, [sp]       // sess
    str wzr, [sp, #4]   // shm out
    str x26, [sp, #8]   // buf = dma base
    str x10, [sp, #16]  // size
    str xzr, [sp, #24]
    mov x0, x28
    mov w1, #0x5404; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0
    ldr w12, [sp, #4]
    add sp, sp, #32
    // log every shm attempt (only 35 lines)
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #3; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, w20; bl print_hex32
    adrp x0, msg_SZ; add x0, x0, :lo12:msg_SZ; bl print_cstr
    lsl x10, x25, #3
    add x10, x9, x10
    ldr w0, [x10]
    bl print_hex32
    adrp x0, msg_SHM; add x0, x0, :lo12:msg_SHM; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    mov w0, #2; bl msleep
    add w25, w25, #1
    cmp w25, #NSIZE
    b.lt ph3_sz_loop
    mov w25, #0
ph3_next:
    bl save_prog
    mov w19, #3
    add w20, w20, #1
    cmp w20, #NSVC
    b.lt ph3_svc_loop
    b ph4_entry
ph4_entry:
    /* ---- PH4: audio_ipi sweep cmd 0x00..0x0F x idx 0..42 ---- */
    cmp w19, #4; b.hi ph5_entry
    mov w19, #4
    // resume: w20=cmd(0..15), w25=idx(0..42)
    cmp w20, #16; b.lo ph4_ok
    mov w20, #0; mov w25, #0
ph4_ok:
    cmp x27, #0; b.lt ph4_skip  // no audio fd
    // 0x48B struct on stack, reused
    sub sp, sp, #80
    mov x15, sp
ph4_cmd_loop:
    mov w25, #0
ph4_idx_loop:
    // zero struct
    mov x0, x15
    mov w1, #0x48
1:  strb wzr, [x0], #1
    subs w1, w1, #1
    b.ne 1b
    // +0x00 u16 magic 0x8888; +0x02 u8 idx; +0x03 u8 0; +0x04 dtype
    mov w0, #0x8888
    strh w0, [x15]
    strb w25, [x15, #2]
    strb wzr, [x15, #3]
    cmp w20, #2; b.hi 2f
    strb w20, [x15, #4]  // dtype = cmd for 0..2
    b 3f
2:  mov w0, #2
    strb w0, [x15, #4]
3:
    strb wzr, [x15, #5]
    // len field +0x08: type1 needs len; set 0x10
    mov w0, #0x10
    str w0, [x15, #8]
    mov x0, x27
    // ioctl = 0x40046900 + cmd
    movz w1, #0x6900
    movk w1, #0x4004, lsl #16
    add w1, w1, w20
    mov x2, x15; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0
    // log every audio RES (688 total, fine)
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #4; bl print_hex32
    adrp x0, msg_CMD; add x0, x0, :lo12:msg_CMD; bl print_cstr
    mov w0, w20; bl print_hex32
    adrp x0, msg_IDX; add x0, x0, :lo12:msg_IDX; bl print_cstr
    mov w0, w25; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    add w25, w25, #1
    cmp w25, #43
    b.lt ph4_idx_loop
    mov w25, #0
    bl save_prog
    mov w19, #4
    add w20, w20, #1
    cmp w20, #16
    b.lt ph4_cmd_loop
    add sp, sp, #80
    mov x0, x27; mov x8, #SYS_CLOSE; svc #0
    movn x27, #0
    b ph5_entry
ph4_skip:
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #4; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    b ph5_entry
ph5_entry:
    /* ---- PH5: foreign sessions {1,3,4} x subs ---- */
    cmp w19, #5; b.hi ph6_entry
    mov w19, #5
    // resume: w20=0..2 foreign idx, w25=sub
    cmp w20, #NFOREIGN; b.lo ph5_ok
    mov w20, #0; mov w25, #0
ph5_ok:
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x15, sp
    adrp x9, foreign_tab; add x9, x9, :lo12:foreign_tab
ph5_f_loop:
    lsl x10, x20, #2
    add x10, x9, x10
    ldr w16, [x10]
ph5_sub_loop:
    sub sp, sp, #64
    str wzr, [sp]
    str w16, [sp, #4]
    str w25, [sp, #8]
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x15, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x28
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0
    ldr w12, [sp]
    add sp, sp, #64
    mov w0, #2; bl msleep
    tst w25, #0xff
    b.ne ph5_no_hb
    bl hb_line
    bl save_prog
    mov w19, #5
ph5_no_hb:
    cbnz w11, ph5_hit
    cbnz w12, ph5_hit
    b ph5_next_sub
ph5_hit:
    mov w21, w11; mov w22, w12
    bl hit_line
ph5_next_sub:
    add w25, w25, #1
    mov w0, #0; movk w0, #0x1, lsl #16
    cmp w25, w0
    b.lt ph5_sub_loop
    mov w25, #0
    bl save_prog
    mov w19, #5
    add w20, w20, #1
    cmp w20, #NFOREIGN
    b.lt ph5_f_loop
    add sp, sp, #64
    b ph6_entry
ph6_entry:
    /* ---- PH6: dynamic service file (recon-discovered names) ----
     * File: /data/local/tmp/kmap.svcs, one name per line.
     * For each line: create + log sess. (Full 64k sweep would 10x the
     * runtime; dynamic gets create + 256-sub triage here. Promote any
     * interesting name to the baked table for a full sweep.)
     * Resume: w20=line idx, w25 unused.
     */
    cmp w19, #6; b.hi ph_done
    mov w19, #6
    movn x0, #99
    adrp x1, svcs_path; add x1, x1, :lo12:svcs_path
    mov x2, xzr; mov x3, xzr; mov x8, #SYS_OPENAT; svc #0
    cmp x0, #0; b.lt ph6_none
    mov x10, x0  // svcs fd
    // read up to 8KB
    sub sp, sp, #8192
    mov x11, sp
    mov x0, x10; mov x1, x11; mov x2, #8192; mov x8, #SYS_READ; svc #0
    mov x12, x0  // nread
    mov x0, x10; mov x8, #SYS_CLOSE; svc #0
    cmp x12, #0; b.le ph6_empty
    // iterate lines, skipping first w20 lines (resume)
    mov x13, x11       // ptr
    add x14, x11, x12  // end
    mov w20, w20       // line idx resume (already in w20)
    mov w9, #0         // current line idx
ph6_line:
    cmp x13, x14; b.hs ph6_lines_done
    // find line end
    mov x15, x13
1:  cmp x15, x14; b.hs 2f
    ldrb w1, [x15]
    cmp w1, #10; b.eq 2f
    add x15, x15, #1
    b 1b
2:  // [x13,x15) is the line; length x16=x15-x13
    sub x16, x15, x13
    // skip empty + comment (#) lines
    cbz x16, ph6_next_line
    ldrb w1, [x13]
    cmp w1, #35; b.eq ph6_next_line  // '#'
    // skip if line idx < resume w20
    cmp w9, w20; b.lo ph6_next_line_inc
    // copy to 256B NUL-terminated buf on stack for create struct
    sub sp, sp, #256
    mov x0, sp
    mov x1, x13
    mov x2, x16
    cmp x2, #255; b.ls 3f
    mov x2, #255
3:  // byte copy x2 bytes
    mov x3, xzr
4:  cmp x3, x2; b.hs 5f
    ldrb w4, [x1, x3]
    strb w4, [x0, x3]
    add x3, x3, #1
    b 4b
5:  strb wzr, [x0, x3]
    // create session with this name
    sub sp, sp, #32
    str xzr, [sp]
    str x0, [sp, #8]  // careful: x0 is buf ptr, still live
    mov x0, x28
    mov w1, #0x5401; movk w1, #0xc010, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0
    ldr w12, [sp, #4]
    add sp, sp, #32
    // log (SVC=1000+line idx to separate namespace)
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #6; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #1000
    add w0, w0, w9; bl print_hex32
    adrp x0, msg_SESS; add x0, x0, :lo12:msg_SESS; bl print_cstr
    mov w0, w12; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
    add sp, sp, #256
    // triage: 256 subs if session valid
    cbz w12, ph6_next_line_inc2
    cbnz w11, ph6_next_line_inc2  // rc!=0: still triage? no, skip
    // 256-sub triage with same struct shape (ustruct 4K zeros)
    sub sp, sp, #64
    str xzr, [sp]; str xzr, [sp, #8]
    mov x0, #0x1000; str x0, [sp, #16]
    str xzr, [sp, #24]; str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x15, sp
    mov w25, #0
ph6_tri:
    sub sp, sp, #64
    str wzr, [sp]
    str w12, [sp, #4]
    str w25, [sp, #8]
    mov w0, #2; movk w0, #0x2, lsl #16; str w0, [sp, #12]
    str x15, [sp, #16]
    str wzr, [sp, #24]
    str xzr, [sp, #32]; str xzr, [sp, #40]
    mov x0, x28
    mov w1, #0x5403; movk w1, #0xc020, lsl #16
    mov x2, sp; mov x8, #SYS_IOCTL; svc #0
    mov x11, x0
    ldr w10, [sp]
    add sp, sp, #64
    cbnz w11, ph6_tri_hit
    cbnz w10, ph6_tri_hit
    b ph6_tri_next
ph6_tri_hit:
    // log as PH=6 SVC=1000+line SUB=tri RC/OUT
    adrp x0, msg_PH; add x0, x0, :lo12:msg_PH; bl print_cstr
    mov w0, #6; bl print_hex32
    adrp x0, msg_SVC; add x0, x0, :lo12:msg_SVC; bl print_cstr
    mov w0, #1000
    add w0, w0, w9; bl print_hex32
    adrp x0, msg_SUB; add x0, x0, :lo12:msg_SUB; bl print_cstr
    mov w0, w25; bl print_hex32
    adrp x0, msg_RC; add x0, x0, :lo12:msg_RC; bl print_cstr
    mov w0, w11; bl print_hex32
    adrp x0, msg_OUT; add x0, x0, :lo12:msg_OUT; bl print_cstr
    mov w0, w10; bl print_hex32
    adrp x0, msg_NL; add x0, x0, :lo12:msg_NL; mov x1, #1; bl print
    bl fsync_out
ph6_tri_next:
    add w25, w25, #1
    cmp w25, #256
    b.lt ph6_tri
    add sp, sp, #64
    mov w25, #0
    b ph6_next_line_inc2
ph6_next_line_inc:
    // skipped (resume): still count
    b ph6_next_line_inc2
ph6_next_line_inc2:
    add w9, w9, #1
    mov w20, w9
    bl save_prog
    mov w19, #6
    b ph6_advance
ph6_next_line:
    add w9, w9, #1
ph6_advance:
    // advance x13 past newline
    add x13, x15, #1
    b ph6_line
ph6_lines_done:
    add sp, sp, #8192
    b ph_done
ph6_empty:
    add sp, sp, #8192
ph6_none:
    adrp x0, msg_NODYN; add x0, x0, :lo12:msg_NODYN; bl print_cstr
    bl fsync_out
    b ph_done
ph_done:
    // DONE marker prog phase=99
    mov w19, #99; mov w20, #0; mov w25, #0; bl save_prog
    adrp x0, msg_DONE; add x0, x0, :lo12:msg_DONE; bl print_cstr
    bl fsync_out
    mov x0, #0; mov x8, #SYS_EXIT; svc #0
