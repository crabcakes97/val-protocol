# ramdump.md — session log: slot-B MRDUMP triage + `readdump` custom LK command
# (val-protocol session, started 2026-09-08. Read this first on resume.)

## 0. Goal (why)
Read physical DRAM over USB from fastboot on the nevada lab unit, aiming
at modem-shared memory. Motorola's LK has NO pull/fetch verb, the crash-
capture path yields logs only, so we are building a custom `oem readdump`
command into LK. Nothing here touches slot A (healthy stock) or
preloader/efuse. Ever.

## 1. Bench state (what / where)
- Device: moto g play 2026 (nevada, XT2615V), 4 GB RAM (getvar: `4GB
  MICRON LP4` — NOT 8 GB; old notes saying 8 GB are wrong).
- Root: Magisk, `adb shell su -c id` -> uid=0. Host user has no `su`
  password; everything root goes through `adb shell su -c "..."`.
- Slots: `_a` = stock LK + bootable Android (safe home). `_b` = our
  playground (LK boots to fastboot; NO bootable system on B — do not
  expect Android on slot B).
- Live pulls (rooted dd, outside repo): `/tmp/lk_a_phone.img` (stock,
  sha256 `0b0cd33e...`), `/tmp/lk_b_phone.img` (factory-allow patched,
  sha256 `ad63a4ba...`). Magic `0x58881688` both.
- Analysis dirs: `/tmp/lk_a_analysis/`, `/tmp/lk_b_analysis/` (do NOT
  confuse with repo `./lk_analysis/`, which is an older ARM32-thumb
  image from another device).
- Current slot hopefully B; if lost: `fastboot --set-active=a` is home.
  Recovery wedge: hold Power 12 s, black screen -> Vol-Down+Power 12 s
  -> fastboot. Restore pull (NOT stock): `fastboot flash lk_b
  /tmp/lk_b_phone.img`.

## 2. Ground truth established this session (all slot-B live-proven)
- LK: AArch64, base `0xffff000050f00000`, payload 1,238,168 B, build
  `-111-3`. Slot A vs B LK differ by exactly 8 B = the 2 factory-allow
  NOPs (`0xAD88`, `0xF3F4` -> `1f2003d5`), already on B before session.
- Fastboot command table: 48-B entries, 14 commands, walked by loop at
  file off `0xF2BC` (steps `0x18`, matches `[x21+8]` name via strncmp).
  `ramdump` row @ `0x120870` -> handler @ `0xDE1C` (4 strcmp slots:
  `help`/`enable`/`disable`/`status` @ `0xDE3C/50/64/78`). NO
  pull/now/clear slot (unknown args -> usage text, proven live).
- `mrdump_chkimg/fallocate/out_set` + `dump_pllk_log`/`usb2jtag`/
  `get_socid`: listed in secondary full-name table (`0x120D90+`) but
  NOT in dispatch table; live answer is `'X' is not a supported oem
  command`. Dead for pull purposes.
- Extra: `oem mrdump_*` do not exist; `vcp_do_dramdump` @ `0x615D0` is
  the baseband voice-proc dumper, not USB-reachable.
- TX primitive: responder @ file `0x7C4C` (`(x0=tag, x1=msg)` sends one
  INFO/OKAY line; splits on `\n`); raw bulk via vtable
  `[0x51052280]+0x30`. Callee-saved regs preserved on main path.
- `oem config unprotect enable_fulldump` works; UTAG reads back true.
- `total ram size` / `dram init` / `[PL LOG]` absent from this LK.

## 3. New repo preset: `ramdump-map` (report-only, enables NOTHING)
- Files: `lk_patch_partition.py` (`RAMDUMP_*` tables ~:134,
  `ramdump_research_scan` / `print_ramdump_research_report`,
  `--ramdump-research-report-only`, `detect_report` Ramdump line),
  `lk_auto_patch.py` (`"ramdump-map"` in PRESETS + forwarder).
- Docs: `README.md` (`### ramdump-map` + ground-truth section + tool
  table + Features bullet), `docs/INSTRUCTIONS.md` (table row + run).
- NOTE (confusion we already hit twice): there never was an enabling
  `ramdump` preset. Enabling = `factory-allow`. `ramdump-map` only
  prints the map (zero bytes changed, verified by cmp). The old
  `ramdump` alias was REMOVED; single name now.
- Usage: `python lk_auto_patch.py lk.img -o r.img --preset ramdump-map`

## 4. Option 1 VERDICT: crash capture = DEAD (do not retry blindly)
- `oem ramdump enable` + UTAG true armed at both layers (proven live).
- `echo c > /proc/sysrq-trigger` (with sysrq verified `1`) causes an
  INSTANT CLEAN REBOOT, not a panic: bootreason stays `reboot`, zero
  panic/Oops/ramoops in dmesg, pstore empty. Two attempts, same result.
  The old ramdump.md S5 claim (ramoops files after sysrq) does NOT
  reproduce on this build.
- Post-reboot yield: pstore empty, `/data/ramdump` empty,
  `/data/vendor/aee_exp` absent, expdb = logs only (pulled
  `/tmp/expdb_post.img`: 98.5% zeros, no ELF/minidump).
- Lesson: no panic => no capture, flags irrelevant. Closed unless a
  different trigger (watchdog?) is found.

## 5. Option 2 STATUS: kernel reader module (background)
- `gki_kmod_builder.py` generated `/tmp/gki_mod/phys_reader.c` for
  `0x40000000+0x100000`; FIXED its `-EBUSY` bug (dropped
  `request_mem_region`, `ioremap_cache` directly — kernel owns all
  System RAM so the request can never succeed).
- GKI sync running in `~/gki` (branch `common-android13-5.15`; the `-8`
  in the version is KMI generation, not a branch; `repo` from `~/bin`
  because system repo launcher can't self-update). Was ~4.4 GB and
  growing; needs aarch64 toolchain + `insmod -f` (device kernel is
  MTK `-00018-...-ab14563692` downstream, vermagic will mismatch).
  Check: `tail ~/gki/sync.log; du -sh ~/gki`.

## 6. Option 3 STATUS: custom `readdump` LK command (ACTIVE FRONT)
- Design: borrow `regex` dispatch slot (`0x1207B0`, harmless pattern
  matcher) for `readdump <hexaddr>`; handler in zero cave @ `0xCE080`;
  old-byte gated row swap; 256 B reads as 16 INFO hex lines.
- Builder: `/tmp/build_readdump_v1.py` (+ variants:
  `build_hello.py`, `build_oneline.py`, `build_unrolled.py`,
  `build_readdump_const.py`, `build_readdump_bisect*.py`). Every build
  self-tests via capstone (mnemonic sequence + operand gate) and
  refuses on mismatch; repacks + requires `Result: VALID`.
- PROVEN LIVE: parse, window checks, LK-VA reads byte-exact (cave
  oracle `72656164...` matches), guards deny bad input, `deny: no
  window` on misses, DRAM-base reads without fault.
- Address rules (learned hard): argv = `[cmd, addr]` (argc == 2, NOT
  3); lowercase hex, no `0x`; 32-bit `0x50Fxxxxx` gets LK-high bits;
  full 16-digit VAs pass through; window table allowlist, 256 B must
  fit inside one window or deny.
- v13 layout (CURRENTLY FLASHED as of 06:5x UTC — VERIFY, see S7):
  handler `0xCE080`, name `0xCE200`, usage `0xCE210`, deny `+32`,
  table after that; windows `[0x40000000,0x40001000)` + LK image VA.
- THE LOOP BUG (open): multi-line loop runs away (1.4 M lines,
  timeout-killed) even with counter init 1 and even with the counter
  spilled to stack. Hello (no loop) + one-liner (no loop-back) both
  pass cleanly. Unrolled x16 build (`/tmp/lk_b_unroll.img`) printed
  EXACTLY 16 lines + OKAY + exit 0. Prime suspect: the `b.ne line`
  back-edge/counter path; the responder was cleared (single ret,
  restores verified). DO NOT reflash looping builds without a line
  cap; a runaway walks x20 off mapped memory -> Data Abort -> freeze
  + watchdog reboot (recoverable, slot A untouched, but noisy).
- Big lesson: kernel iomem IS NOT LK's map. `0x80000000` (System RAM
  for Linux) is unmapped-or-secure for LK: first touch froze the
  board. Probe discipline: one 256 B read per new window; a freeze
  costs only a reboot. Allowlist stays LEAN (proven windows only).
- Oddity on record: `0x40000000` reads back LK-image content (likely
  the fastboot download buffer still holding the flashed image, not
  a true mirror — content changes per session). `0x50F00000` reads
  zeros (header area zero at runtime).

## 7. Resume checklist (exact commands)
```bash
cd /home/cameron/kansas-modem-unlock/val-protocol
fastboot devices; fastboot getvar current-slot   # want: slot b, fastboot
# what LK is live? bare readdump prints its usage marker:
fastboot oem readdump                            # v13+: usage text
# counter test (MUST be 16 lines + OKAY + fast exit; if spam -> loop bug alive):
timeout 25 fastboot oem readdump ffff000050fce200 | tee /tmp/t.txt | wc -l
tail -2 /tmp/t.txt                               # want: OKAY
# GKI sync:
tail -3 ~/gki/sync.log; du -sh ~/gki
# repo state:
git status --short; git diff --stat
```
- If slot B wedged: Power 12 s -> Vol-Down+Power 12 s -> fastboot,
  `fastboot --set-active=a` home, or reflash pull to `lk_b`.
- Val work (preset) is committed? NO — working tree only (`git
  status`). Nothing pushed. Commit before risky flashes.

## 9. v14+ : loop blown away, table allowlist, slot-B flag truth (2026-09-08 ~07:xx UTC)- Counter (reg AND stack-spilled) never terminated: init=1 STILL ran
  away (475 K lines), so the exit path itself is suspect, NOT the init.
  Scientific ladder: hello (dispatch/return OK) -> one-liner (body OK,
  `72656164...` exact) -> unrolled x16 (EXACTLY 16 lines + OKAY).
- Unrolled = no counter, no loop-back: 16 straight-line blocks.
  Committed as `tools/readdump_unrolled.py` (+ README usage).
- Root-caused a second silent killer the same night: table-hit `b
  line` SKIPPED `mov x20,x10`, so every read used stale x20 (all
  addresses echoed cave-adjacent garbage). Fix: mov lives INSIDE
  block 0 now. Lesson: verify VAR=want per address, not just shape.
- Deny path proven twice (`deny: no window` + OKAY, incl. isolated
  `0x80000000` retest). An earlier 0x80000000 death was load/timing
  (3rd rapid command), not the address — isolated retest denies clean.
- `0x48402000` (kernel System RAM) = REAL Data Abort (device dropped
  mid-read, watchdog rebooted). Kernel iomem != LK map, confirmed
  live. Removed from table; re-add one row per probe, never batches.
- SIDE EFFECT: repeated Data Aborts burned slot B's retries:
  `slot-unbootable:_b: yes`, retry-count 0. Fastboot on B works fine
  (system boot on B never existed anyway). Slot A untouched/healthy.
  Rule stands: never `fastboot reboot` on B (system attempt), always
  `reboot bootloader`. Recovery unchanged.
- Throughput reality: 256 B INFO-hex calls can NEVER cover 4 GB
  (~16 M calls). Next engineering step is DATA-phase bulk transport
  (raw vtable send `[0x51052280]+0x30`), then window campaign, then
  scripted sweep. Do NOT grind more 256 B probes until transport
  exists — low value per flash cycle.

## 8. Next steps (in order, updated)
1. DONE: loop termination via unrolled build (16 exact + OKAY);
   counter mystery archived (all counter forms ran away; unrolled
   has no counter to break). Keep unrolled shape for all future revs.
2. Length arg + bigger windows (one proven 256 B probe per window;
   modem windows expected to fault -> reboot -> note + move on).
3. DATA-phase transport for speed (currently 16 INFO lines per call).
4. Graduate `readdump` from `/tmp` prototype to a real Val preset
   (`--preset readdump-read`?) with docs, once fully trusted.
5. Finish GKI module (option 2) as the no-flash parallel path.
   (Old items 1-5 below were written before the loop was solved.)

OLD:
1. Fix the dump-loop termination (unrolled build already proves the
   shape works; graduate it or fix the counter, then re-test counts).
2. Length arg + bigger windows (one proven 256 B probe per window;
   modem windows expected to fault -> reboot -> note + move on).
3. DATA-phase transport for speed (currently 16 INFO lines per call).
4. Graduate `readdump` from `/tmp` prototype to a real Val preset
   (`--preset readdump-read`?) with docs, once fully trusted.
5. Finish GKI module (option 2) as the no-flash parallel path.

## 10. Bulk/DATA front + the INFO-blocks mystery (2026-09-08 ~09:xx UTC, context ~60%)
- LIVE NOW: `/tmp/lk_b_bypass.img` (bulk4 layout, info_path bypassed to
  usage). `oem readdump 40000000` -> usage + OKAY + alive.
- Stock bulk primitives mapped: eMMC sender @`0xA840` (16 KB chunks via
  `bl 0x89638`, `cmp w0,w26` verify); USB vtable send =
  `[0x51052280]+0x30` (x0=buf, w1=len, w2=0x1388); `DATA%08x` fmt @
  `0xDDD40`, `DATA%016llx` @`0xFA311`; OKAY @`0xD4DBA`, FAIL @`0xFA223`
  (both exact C-strings, usable as responder tags).
- Builder `/tmp/build_bulk.py` (+`build_bulk2.py` shrunk-frame): full
  bulk handler (parse x2, len cap 1 MB, window table on [addr,addr+len),
  DATA header, chunk loop, OKAY/FAIL, INFO fallback). Gates pass,
  VALID re-signs. Has 3 REAL bugs found+fixed along the way:
  (a) parse ran before argc check (bare call deref garbage -> crash);
  (b) prologue stp/ldp words mis-encoded dup regs (x24/x26 never
  saved -> caller-clobber); (c) `subs_imm32` helper emitted SUB not
  SUBS; (d) emit_parse LDRB base 0x38 not 0x38_4 (store not load);
  (e) gadget ldr transposed imm12. LESSON: python-compute every word,
  capstone-verify every operand, never mental hex.
- ISOLATION RESULT (the big one): bulk 1-arg INFO path dies with ZERO
  output, but the bypass build (same binary, info blocks skipped)
  prints usage + OKAY + alive. So parse/dispatch/usage/deny/return/
  responder ALL work in bulk layout; the fault is INSIDE the 16 INFO
  blocks as built into bulk files — even though they are
  mnemonic-identical to the PROVEN unrolled blocks. Untested delta:
  adrp/bl absolute targets (layout-shifted), block overlap with
  strings/table (asserts say no), x20/entry state (mov present).
- NEXT: binary-diff bulk-info-blocks vs unrolled-blocks WORD BY WORD
  (not mnemonics — full 32-bit words, flagging every non-target
  difference); then single-block bring-up (first block only + return)
  to find the faulting instruction class. DO NOT reflash looping
  counter builds; unrolled shape only.
- ALSO OPEN: preloader-loop incident (bulk1 bare crash + torn-flash
  scare): slot B flagged unbootable (retry 0) but fastboot fine;
  fallback to A proven twice. `fastboot flash` MUST show Send+Write
  OKAY lines — a swallowed timeout == treat image as NOT flashed.
- OTHER PHONE ON BUS: `22b8:2e24 moto g play 2023` shares the host.
  ALWAYS use `-s ZT4229CJG5` for fastboot/adb.

## 11. THE MMU WALL: LK cannot see DRAM (2026-09-08 ~10:xx UTC, context ~60%+)
- HARD RESULT: true reads of `0x40000000` (and `0x48402000`,
  `0x80000000`) Data-Abort. LK's page tables do NOT map low DRAM;
  kernel iomem != LK map, confirmed 3x live. Only LK's own image VA
  (`0xFFFF000050Fxxxxx`) ever truly read (cave oracle exact, header
  file-identical `5c4238d5...`, hardcode-x20 test).
- RETRACTED: every "DRAM success" (v10 18-line dump, mirror test
  `400ce1e0`->cave, p1/p2 distinct lines) was STALE-x20 reads of
  dispatcher scratch, NOT true reads. Mechanism: table-hit `b line`
  SKIPPED `mov x20,x10` (mov sat before the label) in ALL counter
  builds; stale x20 pointed near cave/argv scratch (mapped, coherent
  garbage incl. ASCII arg strings). The mirror "miracle" = stale x20
  near the window table (which lives in-cave). Lesson: byte-exact
  ORACLE vs requested address on EVERY test, no exceptions.
- efuse verdict (asked live): NO, efuse is not the blocker. efuse
  gates secure boot, not runtime LK reads; LK-VA reads work fine.
  Faults are unmapped-VA Data Aborts (deny-vs-fault pattern proves
  it). TZ/EMI-MPU may additionally guard modem regions, but the
  observed wall is page tables, not fuses.
- Open-code-crash safety: repo pushed through `61d1e17`; builders in
  /tmp are NOT all committed. On resume: `git log --oneline -3`,
  check `fastboot getvar current-slot`, re-derive cave offsets from
  the FLASHED image (layouts shift every build!).
- PARKED STATE: slot B = unrolled build (`/tmp/lk_b_unroll.img`,
  stale-x20 = accidentally safe, 16 lines + OKAY). Slot A stock.
  Slot B flagged unbootable (retry 0) — fastboot fine, never
  `fastboot reboot` on B. Second phone on bus (`22b8:2e24` 2023):
  ALWAYS `-s ZT4229CJG5`.
- PATHS NOW: (A) kernel module reads anything via kernel mappings —
  needs GKI env rebuild (disk was the blocker; ~/gki DELETED, 91%
  free); (B) LK MMU-remap command (add DRAM page-table entries, then
  read — bigger RE, higher risk, true option-3); (C) map LK-visible
  scratch (diminishing). RECOMMENDATION: A for full dump, B as
  research. 256B INFO-hex can never cover 4GB; DATA bulk (vtable
  `[0x51052280]+0x30`, `DATA%08x` fmt mapped) still untested live.

## 12. Option-B scouting: LK MMU internals mapped (static only, no flash)
- `arm64_mmu_map` entry @ file `0x6844` (4-level walker, shifts
  48/36?/27/18/12, block/page descriptor handling, page-table pages
  via internal allocator `bl 0xF88884`; returns 0/-2/-37). Called from
  4 sites `0x88944/9d4/a5c/c90` (boot-time region setup).
- Table root is NOT global: `mrs x8,tpidr_el1` -> `[x8,#0x38]` struct
  -> `+0x58` passed as map arg (per-CPU MMU struct). Any remap command
  must resolve this pointer live (same adrp/ldr chain shape).
- EL evidence: `tpidr_el1` use suggests EL1 (not proven; EL2 can also
  access it). TLB scope + TTBR selection hinge on this: confirm via
  `mrs` ID regs before writing any remap (wrong scope = silent stale
  mappings or crash).
- `arm64_mmu_unmap` string @`0xD051F`, callers @`0x7230/64/e8`
  (TLB-maintenance helper likely adjacent — read before building).
- UNTRIED CHEAP PATH FIRST: LK-visible set is still ~unmapped (only
  LK image + deny/fault probed). Modem-shared windows
  (`0xC0000000+`, `0x9F...`) were NEVER probed — single-row probes
  (one flash cycle each, reboot on fault) come BEFORE any remap
  surgery. Remap = last resort inside option B, not the opener.
