# lk-tools — readdump session lineage (nevada XT2615V, 2026-09-08)

Custom `oem readdump` command for Motorola LK (which ships NO pull verb):
borrow the `regex` dispatch slot, handler in the zero cave @ `0xCE080`,
old-byte gated row swap, VALID re-sign. Every builder self-tests with
capstone (operand gate) and refuses on mismatch — never mental hex.

## STEP 0 — factory-allow FIRST (mandatory, via val-protocol)

All readdump images build on top of a **factory-allowed** `lk_b`
(factory permission checks NOPed). Do this before anything here:

```bash
# 1. Pull your own partitions first (rooted dd, keep safe copies!):
#    adb shell su -c "dd if=/dev/block/by-name/lk_a ..."
#    adb shell su -c "dd if=/dev/block/by-name/lk_b ..."
# 2. Factory-allow slot B ONLY (slot A is never touched):
python3 lk_auto_patch.py <lk_b.img> -o <lk_b_allow.img> \
    --preset factory-allow --factory-allow --factory-allow-unsafe
fastboot -s ZT4229CJG5 flash lk_b <lk_b_allow.img>   # need Send+Write OKAY
fastboot -s ZT4229CJG5 reboot bootloader
# 3. Extract lk.bin from the ALLOWED image into an analysis dir
#    (builders need <analysis-dir>/lk.bin):
python3 lk_static_analyzer.py <lk_b_allow.img> -o <analysis-dir> --no-full-disasm
# 4. Then build below with --analysis-dir <analysis-dir>.
```

## Star files (use these)

- `build_bulk28.py` — THE bulk vehicle. `readdump <hexaddr>` = 256 B as
  16 INFO hex lines; `readdump <hexaddr>+` = 16 KB DATA dump (header via
  stock stub 7E00, data via 7E24, flush 7E34). Byte-exact proven live.
- `build_readdump_v1.py` — SHARED LIB (Asm class, movz/movk/helpers,
  BASE/CAVE/RESPONDER/REGEX_ROW/WINDOWS) + v1 prototype. Nearly every
  builder imports it (already fixed to import locally, no /tmp needed).
- `build_remap6.py` — latest RECON vehicle (INFO + sysreg sentinels
  f8-fb/ff + phys_to_virt fc + remap fd tracer + wide windows).
- `../tools/readdump_unrolled.py` — repo-committed INFO-only fallback
  (always-safe, no bulk, no sentinels).
- `fb_dump.py` — custom host DATA client (pyusb). The stock fastboot
  client never enters DATA phase on `oem`, so THIS is the dump tool:
  `python3 fb_dump.py oem readdump <hexaddr>+ out.bin`
  (needs `pip install pyusb`, device 22b8:2e80 in fastboot).
- `fb_min.py` — minimal raw client / wire tap (observe every packet).
- `fb_raw.py` — first raw client draft (superseded by fb_min; kept).
- `sweep_lk.py` — sweep LK's 1 MB in 64x16 KB:
  `python3 sweep_lk.py OUTDIR [LK.BIN]` (LK.BIN optional verify ref).

## Every builder, file by file

Ladder (dispatch/return science — killed the loop bug):
- `build_hello.py` — hello world: dispatch + return, no body. Proved
  the slot/row/cave mechanism. Run: bare `oem readdump` → usage.
- `build_oneline.py` — one INFO line, no loop-back. Proved body+return.
- `build_unrolled.py` — 16 straight-line INFO blocks (no counter, no
  loop-back). THE safe shape; committed as
  `../tools/readdump_unrolled.py`. 16 lines + OKAY, byte-exact.
- `build_readdump_bisect.py`, `build_readdump_bisect2.py` — loop-bug
  bisection builds (counter vs unrolled isolation).
- `build_readdump_const.py` — const-address read build.
- `build_readdump_oneshot.py` — one-shot read variant.

Core reader lineage (parse, windows, deny):
- `build_readdump_v1.py` — prototype + shared lib (see Star files).
- `build_hardcode.py` — hardcoded-x20 test (proved header reads
  file-identical bytes; VAR==want discipline starts here).
- `build_probeB.py` — 6-row probe campaign vehicle (C0000000, 9FFF0000,
  D9B80000, EE000000 + DRAM + LK). 0-for-6: kernel iomem != LK map.
- `build_probeT.py` — TTBR-low probe row (0x500000): faulted, no
  identity map. Row kept as documented negative.
- `build_probeU.py` — USB/registry row: dumped the region registry
  (768 B: 8 regions + free slot; VIRT=PHYS+linear).
- `build_probeV.py` — phys_to_virt FC sentinel (=0: tables unregistered).
- `build_probeW.py` — linear-e00 row (0x52000000 mapped+zeros proof).

Bulk lineage (DATA transport fights):
- `build_bulk.py` — first full bulk (parse x2, len cap 1 MB, chunk loop,
  DATA header). Bugs a–e era (argv order, stp regs, SUB-vs-SUBS, LDRB
  base, gadget imm). Gates pass, VALID re-signs.
- `build_bulk2.py` — shrunk-frame bulk variant.
- `build_bulk16.py` — bulk16 (INFO + 16 KB raw-vtable). Crashed: +0x30
  needs (buf,len,timeout), not raw. Committed copy:
  `../tools/readdump_bulk16.py`.
- `build_bulk17.py` — stub transport v1 (7E00/7E24/7E34). INFO blackout
  (x13 flag clobber — see b18).
- `build_bulk18.py` — + x16 flag fix (flag survived table ldp). INFO
  revived, byte-exact. `+` still crashed (struct/header question).
- `build_bulk19.py` — header ALSO via 7E24 (raw-only). Crashed: 7E00
  (+0x30, timeout -1) vs 7E24 (+0x40 raw) roles unclear.
- `build_bulk2.py` — (see above, frame variant).
- `build_bulk20c.py` / `build_b20c.py` — rung-C twins (12 B header via
  7E24 only, then OKAY). Same bytes modulo docstring; both kept.
- `build_b20a.py` — LADDER rung A (header-build, no stub calls).
  Crashed though every word is benign (open anomaly).
- `build_b20a0.py` — rung A0 (parse/dispatch only → OKAY). Lived:
  parse/dispatch innocent.
- `build_b20b.py` — rung B (7E34 flush only). Built, superseded.
- `build_bulk21.py` — b19 + zero-stack-writes + static header
  (addr x19). OKAY + alive, EOVERFLOW: bytes MOVE, framing missing.
- `build_bulk22.py` — header via F29978 at BASE+0xF29978 (PHANTOM-F:
  real VA is BASE+0x29978; jumped 15 MB wild → crash). Lesson file.
- `build_bulk23.py` — F29978 at right addr, convention-B (empty tag).
  Alive, EOVERFLOW (framing still off).
- `build_bulk24.py` — F29978 convention-A (fmt=x1). Alive, EOVERFLOW.
- `build_bulk25.py` — responder-tag header ("DATA00004000" as tag).
  Clean OKAY + delayed poison (framing still off, safest try).
- `build_bulk26.py` — eMMC-exact recipe + 64 B-aligned static header.
  OKAY + poison (alignment not the framing key).
- `build_bulk27.py` — + 7E34 barrier (instant FAIL: 7E34-cold fails;
  eMMC skips it pre-first-send — wire-tap proof).
- `build_bulk28.py` — barrier REMOVED (header+data+flush). THE vehicle:
  16 KB byte-exact + OKAY via custom host client.
- `build_bypass.py` — bulk4 layout with info_path bypassed to usage
  (isolation: parse/dispatch/responder all fine; fault was in blocks).
- `build_hardcode.py` — (see core reader above).
- `build_ubulk.py` — micro-bulk variant.

Sysreg lineage (read-only chip recon, zero new slots):
- `build_sysreg.py` — first sysreg probe (uncommitted era).
- `build_sysreg2.py` — sentinels f8|f9|fa|fb → CurrentEL=EL1,
  TTBR0/TTBR1, MAIR. All live-proven, zero-risk pattern.

Remap lineage (MMU fight):
- `build_remap1.py` — FD vehicle (append e08 + tpidr-chain map →
  mapfail printed ARGC: chain null at runtime, map never ran).
- `build_remap2.py` — + FE/FF sentinels (tpidr struct VA; [tpidr+0x38]
  is null even though the thread struct is reachable).
- `build_remap3.py` — fabricated mmu sub-struct + map call (faulted
  inside map: pink-screen data abort, reboot-grade).
- `build_remap4.py` — remap3 + linear row (spot reads; zeros).
- `build_remap5.py` — x3 = descriptor OUT-pointer fix (map stores leaf
  desc via [x19]; x3=0 was the null deref). Still faulted.
- `build_remap6.py` — M1/M2/M3 breadcrumbs (M1 then fault = inside
  map's table walk: tables unregistered, walker derefs 0).

Host tools:
- `fb_dump.py` — 16 KB DATA puller (see Star files).
- `fb_min.py` — wire tap (see Star files).
- `fb_raw.py` — first draft (superseded).
- `sweep_lk.py` — 1 MB sweeper (see Star files). Stops cold on first
  short read; 1 s pacing between calls.

## Build pattern (every builder)

```bash
python3 lk-tools/<builder>.py <container.img> <out.img> \
    --analysis-dir <dir-with-lk.bin>
# gates: operand gate (capstone) + cave-zero + regex-row old-bytes
# repack: requires `Result: VALID` or it refuses to write
```

## Live use (fastboot, slot B ONLY)

```bash
S=ZT4229CJG5
fastboot -s $S getvar current-slot            # want: b
fastboot -s $S oem readdump                   # usage text = alive
fastboot -s $S oem readdump 1234              # deny: no window (control)
fastboot -s $S oem readdump ffff000050fce200  # 16 INFO lines + OKAY
python3 lk-tools/fb_dump.py oem readdump ffff000050f00000+ chunk.bin
```

## Standing orders (non-negotiable)

1. Factory-allow FIRST (see Step 0). Slot A NEVER flashed.
2. Preloader/efuse never touched. `lk_b` only; every flash must show
   Send+Write OKAY or treat as NOT flashed.
3. One probe per fresh fastboot; `reboot bootloader`, never `reboot`.
4. Always `-s ZT4229CJG5` (second phone on the bus).
5. New addresses need an MMU reason first (no blind probes).
6. Deps: python3 + capstone (`pip install capstone`) + pyusb (host).
