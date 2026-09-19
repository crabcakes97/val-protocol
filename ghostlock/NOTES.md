# anchor/profiles/nevada — GhostLock port profile, moto g play 2026

| | |
|---|---|
| Device | moto g play 2026 / nevada / XT2615V |
| SoC | MediaTek MT6835 (Dimensity 6100+) |
| Kernel | `5.15.180-android13-8-g9b2308ac0ad6-ab14563692` (4K pages, clang 14.0.7) |
| Build | phone `W1WNS36.18-111-3`, RETUS `W1WNS36.18-114-1` |
| Bug | CVE-2026-43499, LIKELY unfixed (timeline + k515 tree shape) |

## How the offsets were obtained

Live from the rooted lab unit, 2026-09-10. Stock hides kallsyms
(`kptr_restrict=2`, all-zero addresses even as root), but root can lower it:

```
adb shell su -c 'echo 0 > /proc/sys/kernel/kptr_restrict'
adb shell su -c 'grep -w init_task /proc/kallsyms'
ffffffd469843640 D init_task
```

Every offset = live addr − live `_text` (`ffffffd466c00000`), so all are
KASLR-independent. Method mirrors the pmg110 port's "confirmed from the
rooted shell" table. Confidence: HIGH for symbol offsets.

## Memory geometry (measured)

`/proc/iomem`: `40000000-4807ffff : System RAM`, `40010000-4286ffff : Kernel
code`, `42af0000-42deffff : Kernel data`. `_stext-_text` = `0x10000`, so
`_text` = phys `0x40000000` → `P0_KERNEL_PHYS_LOAD = P0_PHYS_OFFSET =
0x40000000`, delta 0. DRAM is sparse (modem/shared holes) — see ccci/iomem
evidence in the val-protocol backup.

## What is NOT yet verified (do not live-fire until closed)

1. Struct-field offsets (task_struct, rt_mutex_waiter, pipe, page) —
   carryover from the 6.6 reference. Derive from the k515 5.15.180 tree +
   targeted disasm of this exact Image.
2. pselect stack overlay (word shifts, nfds) — unmeasured on 5.15.
3. Binary-level remove_waiter shape — timeline says vulnerable, disasm TODO.
4. `KIMAGE_TEXT_BASE` — standard GKI 5.15 link base assumed; physmap path
   does not depend on it.
5. `FUTEX_HASHSIZE=2048` — inferred from 8 CPUs; kernelsnitch self-calibrates.
6. `copy_splice_read`, `tracefs_worker_caller`, `entry_task` — absent from
   this build's kallsyms (entry_task expected; others need substitutes).
7. `selinux_enforcing` — absent on 5.15; profile uses `selinux_state` (+0).

## References (offline copies)

- `~/Documents/ghostlock.txt` — ashmem-flavored howto. NOTE: its target.h
  mixes an ashmem-driver bug shape with CVE-2026-43499 branding; the real
  GhostLock is the futex-PI UAF above. Keep the doc for its workflow
  (magiskboot → symbols → offsets → target.h → make → push → run), not its
  bug theory.
- `/tmp/pmg110` (soralis0912, MTK port, VERIFIED uid=0 on device) — the
  build/run template: one LD_PRELOAD .so, Write 1 (permissive) + Write 2
  (cred→init_cred), embedded su daemon, no KernelSU.
- Root-My-Galaxy-Payloads (BuSung-dev) — profile/feed architecture the
  Anchor section of motoFucker copies (per-device dirs + support feed).
- OnePlus Anchor app — NOT yet researched (offline). Its device-profile
  concept is mirrored in `anchor/profiles/`; drop the APK/docs on disk and
  the screen gets its real fields.
