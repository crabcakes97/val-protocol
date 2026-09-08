# SESSION_LOG — 2026-09-08 full-day slot-B ramdump session
# Companion to ramdump.md (technical state). This file = what happened,
# in order, including confusion and how it got resolved. Read both on resume.

## Cast & bench
- User (lab owner, rooted nevada XT2615V 4 GB, Magisk) + assistant.
- Device slots: `_a` stock + bootable Android (safe home, NEVER flashed).
  `_b` playground (LK fastboot only, no system). Second phone on the USB
  bus (`22b8:2e24` 2023) — ALWAYS use `-s ZT4229CJG5`.
- Repo: `crabcakes97/val-protocol`, branch `full-exploit-suite`.
  PAT was pasted in chat twice — treat as burned, rotate it.

## Timeline (UTC-ish, Sep 8)
### 05:30 — pulls
- User: pull slot-B LK, has root. Did: `dd lk_b` via `su -c` (16 MB,
  sha `ad63a4ba…`, magic `0x58881688` OK). Also pulled `lk_a`
  (`0b0cd33e…`) for comparison. DIFFERENT files.
- Finding: same base `0xffff000050f00000`, same size, same build
  `-111-3`; B differs from A by exactly 8 B = the 2 factory-allow NOPs
  already on B. Other subimages differ more (out of scope).

### 05:45 — slot-B MRDUMP analysis (the 5-task prompt)
- String scan/XREFs: `ramdump` c-string `0xF7195`; table row
  `[name,handler]` @`0x120870` -> handler `0xDE1C` (4 strcmp slots
  help/enable/disable/status @`0xDE3C/50/64/78`); NO pull/now/clear
  slots (fall through to usage); `mrdump_*` in secondary full-name
  table only, dispatcher rejects live (`not a supported oem command`);
  `total ram size`/`dram init`/`[PL LOG]` absent; OKAY/INFO/usb_write
  mapped; `vcp_do_dramdump` is baseband-side, not USB-reachable.
- Fastboot table = 48-B entries, 14 commands, walker loop @`0xF2BC`
  (steps 0x18). `logdump` exists; `regex`/`shwi_test` are borrowable.

### 06:00 — new preset + confusion #1 (preset enables nothing)
- Added `ramdump` preset (report-only mapper). User thought it enabled
  ramdump. Truth: NOTHING ever enabled ramdump except the earlier
  `factory-allow` flash. Renamed to `ramdump-map`, then dropped the
  alias entirely. Rule now: `factory-allow` = surgery, `ramdump-map`
  = X-ray. README/documents updated 3x before this stuck.

### 06:10 — live slot-B tests (all pass)
- Flashed preset output to `lk_b`, booted: `oem ramdump` usage,
  `status` (SSM gate, no freeze), `enable` OKAY, `config unprotect
  enable_fulldump` (UTAG true). `pull/now/clear` -> usage (no such
  slots). `disable` then re-`enable` (left armed).

### 06:20 — crash capture (option 1): DEAD, plus an overclaim
- SysRq `echo c` (sysrq verified `1`) caused instant CLEAN reboots
  (bootreason `reboot`, no panic/Oops/ramoops, pstore empty) — twice.
  Assistant wrongly called the first one a panic; user challenged;
  boot-reason check proved user right. Retraction recorded.
- Yield: pstore empty, `/data/ramdump` empty, `aee_exp` absent, expdb
  logs-only (pulled 128 MB, 98.5% zeros). CLOSED: no panic => no
  capture, flags irrelevant.

### 06:30 — kernel module (option 2): parked
- `gki_kmod_builder.py` generated reader for `0x40000000+0x100000`;
  fixed its `-EBUSY` bug (dropped `request_mem_region`, `ioremap`
  directly). GKI sync started (branch `common-android13-5.15`, NOT
  `-8`), hit wrong-branch + repo-launcher issues, fixed both, then
  filled the disk (100%) and was KILLED + `~/gki` DELETED per user.
  Needs ~10 GB free to redo; user files own the disk. LAST RESORT,
  kept as backup per user order. NDK r29 exists on box (unused).

### 07:00-09:30 — custom `readdump` command (option 3, the saga)
- Borrowed `regex` slot (`0x1207B0`), handler in cave `0xCE080`,
  old-byte gated, VALID re-signs. Builder files multiplied in /tmp
  (lesson: CONSOLIDATE; authoritative = `tools/readdump_unrolled.py`
  in repo + `/tmp/build_unrolled.py` lineage).
- Bugs found the hard way (each verified live): argc is 2 not 3
  (argv=[cmd,addr]); LSL/LSR/AND-imm encodings hand-computed wrong
  (rule: python-compute + capstone-render-check EVERY word, never
  mental hex); movk high-bits literal wrong; cond LO=3/HS=2 swapped
  twice; AND mask read wrong reg (hi-nibble dup bug); ldrb Rn x21
  scare (false alarm — original was right); table-hit skipped
  `mov x20` (STALE-x20: every "DRAM success" was scratch reads!);
  prologue stp/ldp dup regs (x24/x26 never saved); subs-vs-sub helper;
  argv[2] NEVER arrives (dispatcher caps args — killed the len-arg
  design, hence `addr+` suffix and fixed sizes).
- PROVEN live, repeatable: parse, guards, LK-VA reads byte-exact
  (cave oracle `72656164...`), deny (`deny: no window`), 16-line
  exact + OKAY + fast exit (unrolled shape ONLY).
- THE LOOP BUG (open): every counted loop runs away (init=1 too,
  stack-spilled too). Hello (no loop) + one-liner pass. Unrolled x16
  is the safe shape. Prime suspect was responder-clobbered x22, then
  stale flashes; neither fully closed. DO NOT reflash counter builds.
- STALE-x20 RETRACTION: v10 "DRAM dump", mirror test, p1/p2 distinct
  lines were all stale-pointer scratch reads. Only LK-VA reads ever
  truly verified. Verify VAR==want per address, always.

### 09:30-10:30 — MMU wall + freezes
- True reads of `0x40000000`/`0x48402000`/`0x80000000`/`0xC0000000`/
  `0x9FFF0000`/`0xD9B80000`/`0xEE000000` ALL Data-Abort (0-for-7).
  LK maps only its image. Kernel iomem != LK map. efuse NOT guilty
  (page tables, proven by deny-vs-fault pattern).
- Two crash flavors seen: Data-Abort (watchdog reboots, fallback to
  A, manual return) and SILENT MMIO bus-hang (no output, no reboot
  for 30+ min — needed USER BUTTONS: Power 12 s, Vol-Down+Power 12 s;
  remote is powerless there).
- Slot B flagged unbootable (retry 0) from repeated aborts; fastboot
  fine; never `fastboot reboot` on B. Channel poisoning: failed bulk
  sends leave 16 KB pending -> EOVERFLOW on later commands until
  reboot; reboot-before-each-bulk-test discipline adopted (user's
  theory, confirmed: manual reboot fixed it).
- MMU RE (static): map fn @`0x6844`, table root via
  `mrs tpidr_el1`->`[+0x38]`->`+0x58`, unmap callers @`0x7230/64/e8`,
  EL1 hinted unconfirmed. Remap design in ramdump.md S15/S12.

### 10:30-11:30 — bulk DATA front (current)
- Stock bulk primitives mapped: eMMC sender @`0xA840` (16 KB chunks),
  USB method `[0x51052280]+0x30`, `DATA%08x` fmt @`0xDDD40`,
  OKAY @`0xD4DBA`, FAIL @`0xFA223`.
- `readdump <addr>+` bulk16 build: OKAY + exit 0 + alive, but 0 bytes
  (framing suspect: responder may split DATA+size into two packets;
  fix staged = contiguous stack header via raw send, NOT flashed
  yet). Then a bulk attempt crashed the board (root cause FOUND:
  vtable method takes a REQUEST STRUCT, not (buf,len) — replicate
  stock req-build from responder `0x7CB4-0x7CEC` + `0xF8DEF4`).
- eMMC answer (user asked): raw R/W EXISTS (block vtable @`0x89638`
  bounds-checks then indirect-calls). Read-only interest.

### 15:00-15:30 — TRANSPORT COMPLETE + 1MB sweep
- b21-b28 lineage: zero-stack-writes bulk (addr x19, static strings),
  header via 7E00, data 7E24, flush 7E34. Rung ladder (A0 lives, A
  crashes-benign) + flag-clobber fix (x16) + phantom-F fix along the way.
- Wire tap (`fb_min.py`, pyusb claim-only): header 12B exact, 32x512B
  data, OKAY. Distro client never enters DATA on oem (all EOVERFLOWs);
  custom `fb_dump.py` IS the dump tool. First full 16KB pull byte-exact.
- `sweep_lk.py`: LK 1MB in 64x16KB, 64/64 OK, diffs confined to our
  cave page. Standing orders kept: slot A untouched, all reboot-grade.
- User direction: aim = WHOLE RAM (modem = way in); everything
  graduates to a real val-protocol preset when proven. Toolbox Q&A:
  custom commands/reads/writes/stock-calls proven; `fastboot boot`
  re-add plausible later; BROM out of scope.

### 15:30-16:30 — REMAP CAMPAIGN (details in ramdump.md S21)
- Sysregs live (EL1, TTBRs, MAIR, tpidr, null chain). Registry decoded
  (linear map, free slot). Append verified live (boot wipes it).
- map() unreachable via boot chain (null) + fab-struct crashed once;
  direct modem read faults clean. Thread scan: 2 threads, both null.
- Docs updated at break per standing orders. Backup holds all builders
  + images (b17-b28, sysreg2, probeT/U/V/W, remap1-3).

## Standing orders (user-set, keep obeying)
1. Slot A never flashed. Preloader/efuse never touched.
2. Inactive slot only; every image gated + VALID before cable.
3. One probe per fresh fastboot; `reboot bootloader`, never `reboot`.
4. Always `-s ZT4229CJG5` (second phone on bus).
5. Ramdump.md updated + pushed at every break (PAT in chat = burned,
   rotate it; helper shredded after each push).
6. Goal = WHOLE RAM, not just modem. Order: shared windows, then
   modem-private, then full sweep. Throughput (DATA) before coverage.

## Resume checklist
```bash
cd /home/cameron/kansas-modem-unlock/val-protocol
git log --oneline -3; git status --short | grep -v pycache
fastboot -s ZT4229CJG5 devices; fastboot -s ZT4229CJG5 getvar current-slot
# expect: slot B fastboot, readdump dispatches (usage text)
tail -5 ramdump.md  # current section = the workfront
```
