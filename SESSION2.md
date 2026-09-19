# SESSION2.md — conversation log, 2026-09-08 late session (this window).

Why this file: context hit 81%. A fresh window must read READDUMP.md
(S23+) then THIS file to continue without losing the plot.

## Who/how (user operating style — obey it)
- Terse commands: GO / STOP / REPLY NOW / pause / wait / again / retry.
  Text back FIRST when asked to reply (often means "talk, don't act").
- Corrects fast and is usually right (slot flips, poisoned channel,
  "phone was on stock", typo'd addresses, BROM dead call).
- Standing rules (RESTATED, still binding): slot A NEVER flashed.
  Preloader/efuse never touched. `lk_b` (and now `scp_b`-class) only
  with Send+Write OKAY or it didn't happen. PAT burned — fresh token
  for every push, wipe after. Push branch `full-exploit-suite`, NEVER
  main. Second phone on bus: always `-s ZT4229CJG5`.
- User owns: buttons (power/vol), Magisk app (grants!), USB replugs,
  audio playback, reboot calls when asked. Internet died twice today.
- "IDC IF BRICK" was said — still keep slot A home (refused flashing
  A; user accepted). Recoverable-only risks otherwise OK.
- Promises made (keep!): everything graduates to real val-protocol
  presets when proven (readdump-read + scp-bridge DONE); ramdump work
  documented at every break; backup truth kept current.

## Message flow (condensed, in order)
1. Read ramdump.md + session_log.md -> summarized MMU wall/live state.
2. "read resume.md" -> RESUME.md (old one) said rebuild bulk16 with
   request-struct; did repo pull (already synced), fastboot check,
   builder inspection.
3. Found eMMC sender uses stubs 7E00/7E24/7E34 (not raw vtable) ->
   built b17 (stub transport). User: hold/stop/wait (repo hygiene!),
   found tools/build_readdump_v1.py untracked (fixed by sibling commit
   56be7fd while diagnosing — confirmed, stood down).
4. Reread RESUME+ramdump (rewritten by siblings: backup dir truth,
   tools/ workfront). Flashed b17 -> INFO test crashed board twice.
5. "TRY 16 EXACTLY": INFO kept crashing on b17. Found THE bug: table
   ldp clobbers w13 bulk flag -> dispatch always-bulk, INFO dead code.
   Fixed x16 (b18): INFO revived byte-exact. User confirmed ("THATS WHY").
6. Stop (phone was on stock=A after fallback — user caught it).
7. Bulk `+` on b18 crashed -> stub analysis -> b19 (header via 7E24).
   Crashed -> ladder b20a/b/c + A0 (A0 lived: parse innocent).
8. DRAM question (user sure it worked): tested 0x40000000 -> chaos
   (OKAY-once then DROP x3). Verdict: unmapped (old reads were
   download-buffer echoes / stale-x20 era). User accepted after docs.
9. Bisection: b20a INFO green, `+` crash; deny green; A0 `+` OKAY.
   -> fault isolated to snapshot/header-build block.
10. User impatience (SIGH/GO x3): slot dance A->B, deny+INFO greens.
11. b21 zero-stack-writes: OKAY+alive+EOVERFLOW (BYTES MOVE, unframed!).
12. F29978 header tries (b22 phantom-F crash [my misread], b23/B, b24/A):
    all alive + EOVERFLOW. Responder-tag b25: clean OKAY + delayed
    poison. 7E00-aligned b26: same. Barrier b27: instant FAIL (7E34-cold
    fails — eMMC skips it pre-first-send!). b28 (no barrier): header +
    16KB + OKAY observed ON WIRE (fb_min tap!) but distro won't consume.
13. Custom host client fb_dump.py: FIRST FULL 16KB PULL BYTE-EXACT.
    sweep_lk.py: LK megabyte 64/64, diffs ONLY cave page. TRANSPORT DONE.
14. Sysregs live (f8 EL1, f9/fa TTBRs, fb MAIR, fe tpidr=thread,
    ff [tpidr+0x38]=0, fc phys_to_virt=0). Registry decoded (8 regions,
    linear VIRT=PHYS+..., free e08). Append VERIFIED live (boot wipes).
    map() unreachable (null chain; +2 was argc). Threads scanned (2,
    both null). Fab-struct crashed (pink screen = LK data-abort).
    Descriptor-write discovery (x3 = OUT ptr) from map body RE.
    e00 288MB span PROVEN mapped (0x52 zeros); modem outside it.
15.preset promise confirmed x2. Slot-A flip for Android work.
16. Android campaign (root+permissive by user): kcore absent, devmem
    absent, debugfs empty, ccci_dump LAYOUT TABLE (!), DT reserved
    ranges (modem addrs!), md1img 200MB pulled (= stock version),
    Force Assert exists (no trigger), md_log/emlogger/AT/radio-writes
    sealed or idle, bugreport 12MB, md1 strings mined.
17. Stock on machine found (RETUS full FW, NDK, local mtkclient, TWRP).
    BROM: handshake WORKS (MT6835V/ZA, SBC on, SLA off, DAA on, mem
    auth off, ME/SOC IDs!), watchdog disable works, preloader port
    appears per boot. DA upload BLOCKED: DAA_SIG_VERIFY_FAILED
    (infinix cert rejected; infinix DA is right chip MT1209, wrong
    signer; moto DAs are wrong chip MT6768). User declared BROM dead
    (parked unless Moto-signed DA leaks).
18. GKI: shallow sync DONE (8.4G, .repo removed for space). defconfig,
    module builds, vermagic forged IDENTICAL, PLT sections fixed,
    loader binary built (NDK). insmod flips EACCES/EPERM/silence.
    ONE proven execution (Oops named reader: mod_sysfs_setup fault on
    5.15.211 structs). True-180 rebuild. Magisk-boot path: modules DO
    load at boot (hello + reader in lsmod). Output channels ALL dark
    (printk/proc/sysfs-custom) except standard param reads. CFI panic
    on custom sysfs getter (data_get) PROVED callback danger.
    -> relay design (module writes DRAM scratch, LK reads after
    reboot). v12 neutered/v13 relay/v14 marker/v15 new-id.
    STATUS: v14 AND v15 BOTH installed (user confirmed); scratch reads
    zeros twice (relay unverified — marker read pending).
    GKI ON HOLD, resumed, currently ACTIVE (module track hot).
19. SCP track: FW parsed, scp-bridge preset WORKS (VALID), audio_ipi
    opens as media, writes need magic header, audio capture dry
    (session-gated), disasm needs load base (DT: reserved + share
    addrs pulled). Docs: kansas ramdump.md S7/S8.
20. Docs: ramdump.md (shared, left for siblings), READDUMP.md (THIS
    window's log), lk-tools/ (47 files + per-file README), presets
    readdump-read (byte-identical tested) + scp-bridge (VALID tested),
    main README (preset sections, file lists, steps). Push blocked on
    fresh PAT (ask user). Commits: ca52609 (sibling), fa399d8, 62b0ac4,
    ec97c91 (all branch-only).

## Live quirks learned (don't relearn!)
- Slot flips after crashes (ALWAYS getvar after recovery).
- EOVERFLOW = bytes pending (reboot drains); errored reboots still
  reboot; enumeration != alive; pink screen = LK abort (recovers).
- Distro fastboot never does DATA on oem (custom client mandatory).
- adb push + cp files can land unreadable (use on-device cat copy).
- toybox sh: NO for-loops, NO parens in grep patterns.
- Read tool: re-read after cp (race); cp before read.
- Never hand-compute hex (gate caught 3+ nibble slips).
- Magisk updates may not replace (use NEW ids for clean installs).
- /data/adb only via nsenter (flaky) or magisk --install-module.
- Phone reboots around insmod attempts (watch uptime!).

## Module saga addon (late session)
- Magisk-boot insmod PROVEN (lsmod across boots). Shell insmod flaky.
- True-180 rebuilds load clean; 211 builds Oops (drift, last_kmsg proof).
- Exfil: only STANDARD sysfs param reads work. Custom getter = CFI death.
  filp_open/kernel_write UNEXPORTED (ksymtab-verified). printk dark.
- Relay: modem->scratch(0x52000000)->reboot-B->bulk. Ticket stays 0
  across builds (entry stamp/marker/checksum all silent). Spin-test
  (45s mdelay) pending to prove init execution. Fresh Magisk id per
  test (updates don't replace!). /tmp wiped once (sources in repo!).
- User manages Magisk app (removals/reboots/buttons). No flashes while
  close. Push needs PAT. Usage hit 88%: handoffs current (READDUMP S26).
