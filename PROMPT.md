# PROMPT.md — paste into a NEW OpenCode window to continue. Do NOT clone.

You are continuing the val-protocol ramdump/modem project on this machine.
Repo: `/home/cameron/kansas-modem-unlock/val-protocol`, branch
`full-exploit-suite` (NEVER main). Read `READDUMP.md` S23–S26, then
`SESSION2.md`, then `lk-tools/README.md`. User talks terse (GO/STOP/
REPLY NOW/pause); reply-first when asked, act on GO. Standing orders:
slot A NEVER flashed; preloader/efuse untouched; `lk_b` only with
Send+Write OKAY or it didn't happen; always `-s ZT4229CJG5` (2nd phone
on bus); `reboot bootloader` never `reboot` on B; PAT burned (ask for a
fresh token per push, wipe after); /tmp gets WIPED hourly (sources live
in repo + `~/val-session-backup-2026-09-08/`).

## State
- Phone: slot A Android (adb, Magisk root, SELinux permissive, user
  manages Magisk app + buttons + audio). Slot B: LK playground.
- DONE + PROVEN: custom `oem readdump` (INFO 256B + 16KB bulk,
  byte-exact), full LK 1MB sweep, sysreg sentinels, region registry
  decoded + writable, presets `readdump-read` + `scp-bridge` (VALID),
  modem addresses (shared 0x8C/0x8E, md 0xD0...), md1img + drivers
  pulled, BROM handshake works (DA blocked on Moto signature).
- HOT FRONT (kernel module): GKI tree at `~/gki` (no .repo), defconfig'd,
  modules build with forged vermagic identical to stock. Magisk-boot
  insmod path WORKS (modules appear in lsmod). Source:
  `lk-tools/kmod-relay/reader.c` (relay modem->scratch + checksum
  ticket + buildtag), `lk-tools/kmod-spin/spin.c` (45s stall test).
  BLOCKER UNKNOWN: module inits list but show no effects (ticket stays
  0). Prime suspects: init not executing body vs writes vanishing.
  NEXT: build spin (`make -C ~/gki/common M=<dir> ARCH=arm64 LLVM=1
  LOCALVERSION=-8-g6558a72298ed KDIR=~/gki/common modules` with NDK/
  prebuilt clang on PATH), package Magisk zip (fresh id EACH time —
  updates don't replace!), install, reboot, time the boot (stall =
  runs). Toolchain: `~/gki/prebuilts/clang/.../clang-r450784e/bin`.
- NEVER: hand-compute hex (gate every word), toybox-sh loops/parens,
  blind probes (MMU reason first), `fastboot reboot` on B, flashing A.

## Verify-first discipline (learned hard)
Slot (`getvar current-slot`) + `oem readdump` usage + controls (deny +
INFO-16 + oracle compare) before believing any state. Cave oracle:
`readdump ffff000050fce200` must match image bytes. Board silent but
enumerating = wedged pipe: replug, then buttons (Power 12s,
Vol-Down+Power 12s). Pink screen = LK abort (self-recovers).
