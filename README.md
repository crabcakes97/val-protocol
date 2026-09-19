# Val Protocol (Moto LK Patcher)

Motorola LK Patcher That Allows Unlock Bootloader And Remove FRP on MTK Devices Using Fastboot and LK cert exploit

## Why Val Protocol?

`Val` is short for `Valeria`.

Valeria is the girl I am in love with, and during the whole implementation of this project I could not get her out of my mind. Her name was used as the first working secret. In the earliest builds, using secrets that were longer or shorter kept shifting the generated patch layout too much, which caused unstable behavior: repeated reboots, rejected commands, or devices that would not boot until the original LK was restored.

Using her name was the key that gave the project the stability I was looking for at the beginning. Later, the implementation became flexible enough to support other secrets, but this project started working because of her and because of her name.

Static analyzer and patch automation for Motorola MediaTek LK/LKS bootloader images.

This project extracts the `lk` payload from Motorola LK container images, locates relevant bootloader control-flow patterns, applies selected research patches, rebuilds the original image layout, and updates the MTK certificate hash so the modified image can be flashed on devices that already allow custom LK flashing.

## Afected devices

Moto Edge Devices:
XT2205-3  Moto Edge (2022)
XT2305-1  Moto Edge (2023)
XT2139-1  Moto Edge 20 Lite
XT2303-2  Moto Edge 40 (2023)
XT2307-1  Moto Edge 40 Neo 5G (2023)
XT2409-2  Moto Edge 50 Neo 5G (2024)
XT2519-1  Moto Edge (2025)
XT2505-3  Moto Edge 60
XT2509-1  Moto Edge 60 Neo
XT2503-1  Moto Edge 60 Fusion
XT2507-1  Moto Edge 60 Pro
XT2607-2  Moto Edge 70 Pro

Moto G Devices:
XT2163-1  Moto G Pure
XT2213-3  Moto G 5G (2022)
XT2613-1  Moto G (2026)
XT2513-1  Moto G 5G (2025)
XT2173-3  Moto G31
XT2625-6  Moto G37
XT2167-1  Moto G41
XT2625-5  Moto G47 5G
XT2149-1  Moto G50 5G (2021)
XT2343-1  Moto G54 5G
XT2435-1  Moto G55 5G (2024)
XT2529-1  Moto G56 5G (2025)
XT2133-1  Moto G60s
XT2431-1  Moto G64 5G
XT2529-3  Moto G66j 5G
XT2621-3  Moto G67 (2026)
XT2255-3  Moto G72
XT2237-1  Moto G73 5G (2023)
XT2621-3  Moto G77 5G
XT2527-2  Moto G86 5G
XT2527-1  Moto G86 5G
XT2527-6  Moto G86 Power 5G
XT2271-5  Moto G Play (2023)
XT2615-1  Moto G Play (2026)
XT2165-5  Moto G Power (2022)
XT2311-3  Moto G Power 5G (2023)
XT2415-5  Moto G Power 5G (2024)
XT2515-2  Moto G Power 5G(2025)
XT2211-2  Moto G Stylus (2022)
XT2317DL  Moto G Stylus (2023)

Moto Razr Devices:
XT2453-1  Moto Razr 50 
XT2453-1  Moto Razr (2024)
XT2553-1  Moto Razr 60 
XT2553-1  Moto Razr (2025)

## Scope

The tool focuses on Motorola/MTK LK images that use the common Motorola unlock flow:

- `fastboot oem unlock <key>`
- FRP/OEM unlock gate checks
- key/hash validation routines
- unlock-flow partition erase calls
- runtime serial number lookup through the bootloader `serialno` getter
- MTK `CERT1`/`CERT2` image hash verification metadata

Both AArch64 and ARM32 Thumb LK payloads are supported when their patterns match the analyzer signatures.

## Safety And Legal Notice

Use this project only on devices you own or are explicitly authorized to service. Bootloader modification can permanently brick devices, erase user data, affect warranty state, and violate local law or vendor terms if used without authorization.

This repository is intended for repair, interoperability research, recovery workflows, and controlled lab analysis. Always keep the original image and a known recovery path before flashing modified firmware.

## Features

- Extracts the `lk` subimage from Motorola LK/LKS containers.
- Detects architecture automatically: AArch64 or ARM32 Thumb.
- Generates detailed static-analysis artifacts:
  - string references
  - candidate flows
  - FRP/OEM checker candidates
  - key validator candidates
  - partition erase operations
  - serial number runtime source
- Applies research presets (unlock, erase, modem, ramdump-map, readdump-read, scp-bridge, factory-allow, factory-force, bootmode-cmdline, and hypervisor flows).
- Uses runtime serial number derivation for generated keys.
- Rebuilds the original multi-image container.
- Updates MTK `CERT2` image hashes.
- Verifies the rebuilt LK image after signing.

## Repository Layout

```text
.
|-- lk_auto_patch.py          # End-to-end analyzer, patcher, repacker
|-- lk_static_analyzer.py     # Static analysis and report generator
|-- lk_patch_partition.py     # Patch implementation engine
|-- lk_keygen.py              # 20-character key generator
|-- lk_oem_cmd_mapper.py      # map every oem command gate (static-only)
|-- lk_repack_signed.py       # Repack signed LK payload into container
|-- liblk/                    # Minimal LK/LKS container parser
|-- tools/
|   |-- build-part-img.py     # Replace subimage in MTK part image
|   |-- sign_mtk_cert.py      # Update MTK CERT2 hashes
|   `-- verify_mtk_image.py   # Verify MTK CERT1/CERT2 image metadata
`-- docs/
```

## Requirements

- Python 3.11+ 64-bit recommended
- Capstone 5.x

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

The project includes `liblk` locally. Capstone should be installed in the active Python environment. The analyzer also contains fallback logic for environments where a local `capstone/` folder shadows the installed package.

## Quick Start

Patch an LK image with the serial-based unlock preset:

```bash
python lk_auto_patch.py "path/to/lk.img" \
  -o "path/to/lk.unlock-serial.img" \
  --preset unlock-serial \
  --key-token-secret "YourSecret"
```

Read the device serial number:

```bash
fastboot getvar serialno
```

Generate a key for that serial number:

```bash
python lk_keygen.py --secret "YourSecret" --serialno "SERIAL_FROM_FASTBOOT" --count 1
```

Use the generated key:

```bash
fastboot oem unlock GENERATED_KEY
```

## Presets

### `unlock-serial`

Patches the unlock flow to use a key derived from a secret and the device serial number read internally by LK at runtime.

```bash
python lk_auto_patch.py "path/to/lk.img" \
  -o "path/to/lk.unlock-serial.img" \
  --preset unlock-serial \
  --key-token-secret "YourSecret"
```

### `erase-serial`

Reuses the `fastboot oem unlock <key>` flow, validates a serial-derived key, erases the selected partition in the unlock erase block, and returns before changing the bootloader unlock state.

```bash
python lk_auto_patch.py "path/to/lk.img" \
  -o "path/to/lk.erase-frp.img" \
  --preset erase-serial \
  --erase-token-partition frp \
  --erase-token-secret "YourSecret"
```

The runtime command is still:

```bash
fastboot oem unlock GENERATED_KEY
```

### `unlock-serial-nvdata`

Patches the unlock flow with serial-derived key validation and changes the unlock-flow partition erase target from the original radio-sensitive erase target to another partition name that fits in the original string slot.

```bash
python lk_auto_patch.py "path/to/lk.img" \
  -o "path/to/lk.unlock-frp.img" \
  --preset unlock-serial-nvdata \
  --key-token-secret "YourSecret" \
  --erase-partition frp
```

Use only replacement partition names that fit in the original string space. Short names such as `frp` and `cache` are typical examples.

### `ramdump-map`

Research preset (report-only: it **maps, it enables nothing** — the
commands themselves are ungated by `factory-allow`). Maps the
ramdump/MRDUMP subsystem in your LK: the fastboot command-table row, the
handler entry, the subcommand slots it actually parses (`help`, `enable`,
`disable`, `status` on the `-111-3` family), the USB `OKAY`/`INFO`
markers, and the dead `mrdump_*` strings. Re-signs `VALID` like every
other preset. (`ramdump` is not a preset name — if you see it, it means
this map.)

```bash
python lk_auto_patch.py "path/to/lk.img" \
  -o "path/to/lk.ramdump-report.img" \
  --preset ramdump-map
```

The runtime commands it unlocks context for (needs the `factory-allow`
gates on a stock LK; already live on slot B):

```bash
fastboot oem ramdump          # usage text, not "command restricted"
fastboot oem ramdump enable   # "enable full ramdump", OKAY
fastboot oem ramdump status   # answers (SSM-permission gate, no freeze)
```

Slot B ground truth, freeze-triage notes, and live-test proof:
[`ramdump-map` ground-truth section below](#ramdump-map-preset-mrdump-freeze-triage-slot-b-ground-truth).

### `readdump-read` (custom read command — WORKING proof-of-concept preset)

Builds the custom `oem readdump` command into LK (borrows the harmless
`regex` dispatch slot `0x1207B0`, handler in zero cave `0xCE080`,
old-byte gated, re-signs `VALID`). Proven live on slot B, byte-exact:

- `readdump <hexaddr>` — 256 B as 16 INFO hex lines (lowercase hex, no
  `0x`; 32-bit `0x50Fxxxxx` auto-extends; misses answer `deny: no
  window`, never read).
- `readdump <hexaddr>+` — 16 KB DATA dump (header via stock stub 7E00,
  data via 7E24, flush 7E34). Pull with the custom host client
  (`lk-tools/fb_dump.py`) — stock fastboot never enters DATA on `oem`.
- Read-only sysreg sentinels `f8|f9|fa|fb` (CurrentEL, TTBRs, MAIR).

**Step 0 — factory-allow FIRST** (readdump builds on an allowed base;
slot A is never touched):

```bash
python lk_auto_patch.py <lk_b.img> -o <lk_b_allow.img> \
  --preset factory-allow --factory-allow --factory-allow-unsafe
fastboot -s ZT4229CJG5 flash lk_b <lk_b_allow.img>  # need Send+Write OKAY
```

Then build + flash + read (needs `pip install capstone pyusb`):

```bash
python lk_auto_patch.py <lk_b_allow.img> -o <lk_b_readdump.img> \
  --preset readdump-read
fastboot -s ZT4229CJG5 flash lk_b <lk_b_readdump.img>
fastboot -s ZT4229CJG5 reboot bootloader
fastboot -s ZT4229CJG5 oem readdump ffff000050fce200  # 16 lines + OKAY
python lk-tools/fb_dump.py oem readdump ffff000050f00000+ chunk.bin
```

Current map (nevada `-111-3` LK maps its own image + USB + a registry
window only; kernel DRAM is NOT LK-mapped — `0x80000000` etc. fault):
see `lk-tools/README.md` (every builder documented, lineage, standing
orders) and `ramdump.md` (session log, MMU/remap workfront).

### `scp-bridge` (SCP firmware canary — WORKING proof-of-concept preset)

The SCP co-processor (RISC-V) runs firmware the AP verifies, not
itself — so it re-signs the same way LK does. Step 1 (this preset):
1-byte behavior-neutral log-text canary in `tinysys-scp-RV55_A`
(`L2TCM-MPU ENABLED!!` → `ENABLED!?`), old-byte gated (exactly once
or refuse), CERT re-sign, `Result: VALID` required. Roadmap (IPI
parsing, custom_cmd/log-ctrl, heap, MPU/remap, patched SCP with CCIF +
shared-DRAM access to the modem): `../ramdump.md` S7.

```bash
python lk_auto_patch.py <scp_a.bin> -o <scp_a_bridge.img> \
  --preset scp-bridge
fastboot -s ZT4229CJG5 flash scp_b <scp_a_bridge.img>  # inactive slot!
```

Flash to the INACTIVE scp slot only (`scp_b` while on `_a`), Send+Write
OKAY or treat as failed. Never touch preloader/efuse.

#### Files needed for a working readdump (minimal set)

Python files only — nothing else is required beyond a stock LK image,
Python 3, `capstone` + `pyusb` (`pip install capstone pyusb`), and
platform fastboot:

1. `lk_auto_patch.py` — entry point. Runs analysis, then the
   `readdump-read` builder, validates output.
2. `lk_static_analyzer.py` — produces `<analysis-dir>/lk.bin`
   (auto-run by the preset when missing).
3. `lk_repack_signed.py` — re-signs inside the builder
   (`tools/sign_mtk_cert.py` + `tools/verify_mtk_image.py`
   underneath; `Result: VALID` or the build refuses).
4. `lk-tools/build_bulk28.py` — THE builder (INFO + DATA + sentinels).
5. `lk-tools/build_readdump_v1.py` — shared lib it imports.
6. `lk-tools/fb_dump.py` — host-side 16 KB puller (stock fastboot
   can't do DATA phase on `oem`, so this is mandatory for `+` reads).
7. `tools/readdump_unrolled.py` — safe INFO-only fallback builder.

Step by step (slot B playground, slot A never touched):

```bash
# 0. deps + pulls (rooted dd of lk_a/lk_b kept as backups first!)
pip install capstone pyusb
# 1. factory-allow on slot B (readdump builds on this base):
python lk_auto_patch.py lk_b.img -o lk_b_allow.img \
  --preset factory-allow --factory-allow --factory-allow-unsafe
fastboot -s ZT4229CJG5 flash lk_b lk_b_allow.img   # Send+Write OKAY
fastboot -s ZT4229CJG5 reboot bootloader
# 2. build readdump (analysis auto-runs; gates + VALID enforced):
python lk_auto_patch.py lk_b_allow.img -o lk_b_readdump.img \
  --preset readdump-read
# 3. flash + verify alive:
fastboot -s ZT4229CJG5 flash lk_b lk_b_readdump.img
fastboot -s ZT4229CJG5 reboot bootloader
fastboot -s ZT4229CJG5 getvar current-slot           # want: b
fastboot -s ZT4229CJG5 oem readdump                  # usage = alive
fastboot -s ZT4229CJG5 oem readdump 1234             # deny (control)
fastboot -s ZT4229CJG5 oem readdump ffff000050fce200 # 16 lines + OKAY
# 4. bulk pull (custom client receives the DATA phase):
python lk-tools/fb_dump.py oem readdump ffff000050f00000+ chunk.bin
# 5. sweep a whole mapped megabyte (64 x 16 KB):
python lk-tools/sweep_lk.py OUTDIR [LK.BIN]
```

### `factory-force` (software factory cable — TESTED preset)

Forces the `bootmode == "factory"` + `mmi,factory-cable` path with no
cable, no button, no UTAG write: LK builds `0x0079726f74636166`
(`factory\0`) in `x9` and `cmp x8,x9` + `b.eq` to `Entering factory
mode`. Two such gates (`0x159CC` early, `0x17700` main → `0x17730:
bootmode UTAG is set to factory`) become unconditional `b` (same
target, capstone-verified); the cable check (`cmp w0,#2` + `b.ne` at
`0x17ECC`, skipping the `mmi,factory-cable` block at `0x17ED0`)
becomes `nop`. Per-image discovery (string xref → `cmp` shape →
branch-into-factory-zone) must reproduce the known offsets on known
builds (`-111-3`, `-114-1`) or refuse. Includes `factory-allow` (5
patches total), old-byte gated, `Result: VALID` required.

```bash
python lk_auto_patch.py <stock-lk.img> -o <lk_factoryforce.img> \
  --preset factory-force --factory-allow --factory-allow-unsafe \
  --factory-force --factory-force-unsafe
fastboot -s ZT4229CJG5 flash lk_b <lk_factoryforce.img>  # Send+Write OKAY
fastboot -s ZT4229CJG5 reboot bootloader
fastboot -s ZT4229CJG5 oem ramdump   # usage, NOT "command restricted"
```

**Proof (kill-timer isolation, stock control):** with UTAG
`bootmode=fastboot` + kill timer armed (`10`), unplug → forced slot
shuts down; stock slot with identical UTAGs stays on. The kill timer
(`factory_kill_timeout`: empty = disabled, `0` = instant, `1~100` =
seconds) only fires on the factory path — so the branches took it with
no genuine UTAG. Clear after testing (`oem config
factory_kill_timeout ""` writes empty = disabled). Genuine path also
works: `oem config bootmode factory` + reboot holds the bootloader
(authentic cable behavior — `reboot` loops to fastboot, `continue`
boots the kernel). Note: factory mode powers the cellular radio down
(`POWER_OFF`, SIM stays `READY`) — service returns on the normal
stack. Full record: `READDUMP.md` workfront + session notes.

### `bootmode-cmdline` (native `ro.bootmode` — TESTED preset)

LK never forwards the mode to Android (no `androidboot.bootmode`
anywhere in the 1.2 MB image; stock boot with UTAG=`factory` still
reads `ro.bootmode=normal`). This hooks the serialno stanza's cmdline
setter call (`0x1ADF0: bl setter@0x28DF0`, discovered per-image via the
`androidboot.serialno` xref → snprintf→setter pair, setter confirmed by
its `stp x29,x30,[sp,#-0x20]!` prologue) to a decode-verified cave at
`0xCE080`: run the original append, append static
`androidboot.bootmode=factory`, restore the original return. 67 bytes
vs the live image (4 B hook + 64 B cave+string), zero-gated cave,
`Result: VALID` required. Verified live: `/proc/bootconfig` carries
`androidboot.bootmode="factory"` and `ro.boot.bootmode=factory` with
no userspace help. Quirk: vendor init forces the legacy `ro.bootmode`
alias to `normal` anyway — covered by an early
`/data/adb/post-fs-data.d` `resetprop` (pre-app timing) until the
override is found.

#### Using the factory props (Android side)

The LK patch gives you `ro.boot.bootmode=factory` natively. For the
legacy `ro.bootmode` alias (what most apps check), install the
companion script (needs Magisk/KernelSU root; `tools/factory_bootmode_postfsdata.sh`
is the exact copy):

```bash
adb shell su -c "mkdir -p /data/adb/post-fs-data.d"
adb push tools/factory_bootmode_postfsdata.sh /sdcard/
adb shell su -c "cp /sdcard/factory_bootmode_postfsdata.sh \
  /data/adb/post-fs-data.d/factory_bootmode.sh \
  && chmod 755 /data/adb/post-fs-data.d/factory_bootmode.sh"
adb reboot bootloader            # factory UTAG holds here; then:
fastboot -s ZT4229CJG5 continue  # boot kernel
adb shell getprop ro.bootmode       # want: factory
adb shell getprop ro.boot.bootmode  # want: factory (LK-native, no script)
```

Back to normal: delete the script, set UTAG `fastboot` from a patched
slot (`fastboot oem config bootmode fastboot`), reboot. Note: factory
mode powers the cellular radio down (`POWER_OFF`, SIM stays `READY`) —
service returns on the normal stack. Kill timer must be empty
(`oem config factory_kill_timeout ""`) or unplug = shutdown.

#### Report-locked spoof (both layers)

Fastboot (`--preset lockspoof`, in `wide-open`): `getvar securestate`
reads `flashing_locked` while flashing, slot switches, and root keep
working — verified same boot. The on-screen fastboot menu and Android
read *different* reporters, covered by the companion script
(`tools/factory_bootmode_postfsdata.sh` → `/data/adb/post-fs-data.d/`):
`ro.bootmode=factory`, `ro.boot.flash.locked=1`,
`ro.boot.verifiedbootstate=green`,
`persist.motosecure.secure_lock_state=1`, `ro.oem_unlock_supported=0`
— all live-verified with adb root still working. Fully reversible
(delete script + reboot; LK side needs a reflash of a non-spoof image).

#### Results ledger (all live-verified unless noted)

- `factory-force`: kill-timer isolation vs stock control (forced slot
  shuts down on unplug, stock stays on, identical UTAGs).
- `bootmode-cmdline`: `androidboot.bootmode` in `/proc/bootconfig`,
  `ro.boot.bootmode=factory` with no userspace help.
- `mrdump-force`: `oem ramdump enable` → `enable full ramdump`,
  UTAG true. Fullmem/output legs are crash-time only (no trigger fired
  yet — sysrq reboots clean, `/dev/watchdog` held 100 s with no bark).
- `lockspoof`: `flashing_locked` + free flashing. Android reporters via
  script (above).
- Fuzz v1: `oem config` names ≤53 safe / ≥54 hang+wedge (reproduced);
  `getvar all` 46 vars mined (`factory-modes: disabled` traced to a
  DRAM-resident `check(0xd)` jump table — display-only, nothing gates
  on it); `hw`/`partition` dumps mined; `p2u`/`meta`/`engineering` not
  dispatched; `adb reboot meta|bptools` fall through to fastboot.

```bash
python lk_auto_patch.py <stock-lk.img> -o <lk_bootmode.img> \
  --preset bootmode-cmdline --factory-allow --factory-allow-unsafe \
  --factory-force --factory-force-unsafe \
  --bootmode-cmdline --bootmode-cmdline-unsafe
fastboot -s ZT4229CJG5 flash lk_b <lk_bootmode.img>  # no-brick check first
fastboot -s ZT4229CJG5 reboot bootloader             # must stay alive
fastboot -s ZT4229CJG5 flash lk_a <lk_bootmode.img>  # booting slot
fastboot -s ZT4229CJG5 reboot bootloader
fastboot -s ZT4229CJG5 continue                      # boots kernel
adb shell 'su -c "cat /proc/bootconfig"' | grep -A1 bootmode
```

### `oem` fuzzing (`tools/oem_fuzz.py`, read-only v1)

Enumerates the fastboot `oem`/getvar surface for hidden subcommands
and fault-oracles (hang/drop/reboot/new strings). Strictly read-only:
bare usages, single-arg `config` reads, `getvar`; never `lock`,
`unlock`, `cid_prov_req`, `off-mode-charge`, `fb_mode` writes,
`config` writes, or `hwid` add/remove. One command per fresh state,
15 s timeout, stops on wedge (replug + buttons). First blood: `oem
config` + 64-char name hangs the board (matches the `utag name length
must not exceed` check — retest pending); `hw` (50 lines),
`partition` (40 lines), `hwid` (29), `read_sv`, `get_unlock_data` all
answer and are mined for the next corpus.

```bash
python tools/oem_fuzz.py --out fuzz1.jsonl   # slot B fastboot, -s ZT4229CJG5
```

### `mrdump-force` (forced crash dumps — TESTED preset)

Forces LK's mrdump path: enable resolver fallback reports armed (`2`),
unknown output device becomes `internal-storage` (flash-backed,
pullable), and the fallocate handler always picks `fullmem`.
Same-footprint `MOVZ`/`B` flips, old-byte + decode gated
(the old words are `MOV Rd,wzr`, the gate checks that shape —
a wrong-register encoding was caught here before anything shipped).

```bash
python lk_auto_patch.py <stock-lk.img> -o <lk_mrdump.img> \
  --preset mrdump-force --mrdump-force --mrdump-force-unsafe
```

Verify: `fastboot oem ramdump enable` → `enable full ramdump`;
`status` may still print the SSM-permission line (separate display
path, not the resolver). The fullmem/output legs only run at crash
time — trigger is still open (sysrq reboots clean; watchdog bark next).

### `lockspoof` (report `locked`, stay unlocked — TESTED preset)

Table-walks the 24 B `[name,handler,flags]` getvar table to the
`securestate` getter, hooks its helper call to a 12 B cave (`adrp+add
x0, flashing_locked` + back; the string already lives in-image, and
the cave search starts past the bootmode reservation after a real
NUL-terminator collision was caught pre-ship). `getvar securestate`
then reads `flashing_locked` while flashing, slot switches, and every
other unlocked ability keep working. Report-only by design.

```bash
python lk_auto_patch.py <stock-lk.img> -o <lk_spoof.img> \
  --preset lockspoof --lockspoof --lockspoof-unsafe
fastboot -s ZT4229CJG5 getvar securestate   # want: flashing_locked
```

Note: no preset patches the verity/ThinkShield enforcement itself.
`disable-verity` / `disable-verification` exist as candidate names in
`lk_oem_cmd_mapper.py` (map-only, never flashed); `lockspoof` only spoofs
the `securestate` report while every unlocked ability keeps working. The
`ssm-bypass` preset below ungates the verbs instead (UNTESTED).

### `wide-open` (everything together — TESTED preset)

`factory-allow` + `factory-force` + `bootmode-cmdline` +
`mrdump-force` + `lockspoof` from a stock base in one build
(13 patch records, VALID). B first (no-brick check), then the booting
slot:

```bash
python lk_auto_patch.py <stock-lk.img> -o <lk_wideopen.img> \
  --preset wide-open --factory-allow --factory-allow-unsafe \
  --factory-force --factory-force-unsafe \
  --bootmode-cmdline --bootmode-cmdline-unsafe \
  --mrdump-force --mrdump-force-unsafe \
  --lockspoof --lockspoof-unsafe
fastboot -s ZT4229CJG5 flash lk_b <lk_wideopen.img>   # Send+Write OKAY
fastboot -s ZT4229CJG5 reboot bootloader              # must stay alive
```

### `ssm-bypass` (ungate verity + ThinkShield verbs — UNTESTED preset)

Never flown live. The Nevada LK routes `oem disable-verity` (code refs,
live-probed ROUTED) and ships `oem disable-thinkshield` /
`oem enable-thinkshield` ("disable thinkshield protection (persistent)",
`mot_sec: Entering ThinkShield protection check`). The OEM mapper confirms
these verbs sit behind the SHARED dispatcher restriction gates
(factory-allow scope: every routed command). Traced on the `-111-3` pull
(RETUS `-114-1` matches byte-identical) via the strcmp dispatch:
* dispatcher ungate (`0xF3F4` / `0xAD88`, old-byte gated, known-build
  cross-checked — byte-identical output to `factory-allow`, verified);
* `ssm-thinkshield-disable` (`0x9F83C`): the disable handler calls the FDR
  work fn, then `tbnz w8,#0` selects the success report (`w0=0`/OKAY) while
  fall-through prints `Failed to disable-thinkshield!` (`w0=3`). Replaced
  with `B -> success` (target re-resolved per-image, decode-gated). The
  work call still executes; caveat: a genuinely failed op would still
  report success;
* `ssm-avb-red` (`0x9DAA4`): boot-state compare + `b.eq -> AVB-red deny`
  (`mot_sec: AVB state is red and disallow to boot`, boot stops). NOPed —
  red state never denies, boot continues (target re-resolved per-image to
  the AVB-red string xref, decode-gated).
The sibling `oem disable-verity` handler is straight-line to success (no
conditional fail branch), so it needs only the dispatcher ungate.
`oem enable-thinkshield` is deliberately untouched. Any absent anchor,
missing xref, shape drift, or unknown build refuses instead of patching.
Handlers may still check unlock / CID / SSM state: the live answers
(`oem disable-verity`, `oem disable-thinkshield`, boot with red state)
are the verdict this preset cannot give.

```bash
python lk_auto_patch.py <stock-lk.img> -o <lk_ssm.img> \
  --preset ssm-bypass --ssm-bypass --ssm-bypass-unsafe
fastboot -s ZT4229CJG5 flash lk_b <lk_ssm.img>   # Send+Write OKAY
fastboot -s ZT4229CJG5 reboot bootloader         # must stay alive
fastboot -s ZT4229CJG5 oem disable-verity
fastboot -s ZT4229CJG5 oem disable-thinkshield
```

### Extra vehicle: `lk-tools/build_bulk29.py`
`build_bulk28` + one 16 KB window `[0xFFFF000051052000,
0xFFFF000051056000)` covering the proven USB vtable page (stock
dereferences `[0x51052280]` on every command — same 4 K page, so
mapped) for factory-flag/registry reads. Same gates + VALID.

## Runtime Serial Derivation

The current presets do not embed the target serial number into the LK image. Instead, the patched key validator calls the LK serial number getter at runtime and derives the validation condition from the serial reported by the device itself.

The generated key is still produced off-device:

```bash
python lk_keygen.py --secret "YourSecret" --serialno "SERIAL_FROM_FASTBOOT" --count 1
```

This allows one patched LK image per supported model/build while keys remain device-specific.

## Expected Output

A successful AArch64 patch usually includes lines similar to:

```text
Architecture : aarch64
Serialno runtime: 0x...
Patch   : FRP/OEM checker call skip
Patch   : KEY derived token gate
Mode    : EXPERIMENTAL runtime-serial-compact-inplace
Device  : runtime serialno from LK
SerialFn: 0x...
Result: VALID
```

A successful ARM32 Thumb patch usually includes:

```text
Architecture : arm32_thumb
Serialno runtime: 0x...
Patch   : KEY derived token gate
Arch    : arm32_thumb
Returns : success=... fail=...
Result: VALID
```

## Documentation

- [Usage Guide](docs/USAGE.md)
- [Architecture Notes](docs/ARCHITECTURE.md)
- [Analysis Outputs](docs/ANALYSIS_OUTPUTS.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [CustomTkinter UI](docs/UI.md)
- [Publishing Checklist](docs/PUBLISHING.md)

## Credits

This project was built on top of prior public Motorola/MTK LK research and tooling. Special thanks to:

- [kasnria001/pwnage24mtk](https://github.com/kasnria001/pwnage24mtk)
- [R0rt1z2/liblk](https://github.com/R0rt1z2/liblk)
- [R0rt1z2/lkpatcher](https://github.com/R0rt1z2/lkpatcher)

See [ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md) for details.

## Compatibility

Compatibility is pattern-based, not model-name-based. A new LK is considered compatible only when:

- the `lk` payload can be extracted,
- the architecture is detected,
- the unlock flow is found,
- the FRP/OEM checker candidate is found,
- the key validator candidate is found,
- the unlock erase block is found when the selected preset needs it,
- the serial number runtime source is found,
- the rebuilt image verifies as `Result: VALID`.

Always test patched images on recoverable lab devices before using them in production workflows.

## Modem-unlock research preset (nevada / Moto G Play 2026 XT2615V)

`--preset modem-unlock` targets the LK-side MediaTek CCCI modem-load path.
Developed against the LK **pulled from the live phone** (slot `_a`,
bootloader `W1WNS36.18-111-3`, AArch64 payload, base
`0xffff000050f00000`) — no lab or foreign images.

By default the preset is **report-only**: it locates the real
modem/CCCI/MPU/MMU markers in your LK and changes zero payload bytes.
With `--modem-size-bypass --modem-allow-unsafe` it NOPs three verified
LK-side MD table-validation gates (12 bytes total, old-byte gated, then
re-signs `VALID`).

### What this LK actually is (read before believing anything else)

- It is **not EL3**. LK calls *into* ATF/EL3 via SMC; patching LK stays at
  LK privilege. There is no EL3 via this preset.
- LK's MMU/EMI-MPU/mblock setup is **rebuilt by the kernel at boot**, so an
  LK remap does not persist into Linux/modem runtime.
- Modem signature verification does **not** live in LK. The CERT2 re-sign
  path remains the working bypass for flashing modified images.
- Symbol reality check (byte scan of the phone LK): `modem_auth`,
  `load_modem_fw`, `mmu_table_init`, `armv7_mmu_init` are all **absent**.
  The real surface is `platform_load_modem`, `ccci_plat_apply_mpu_setting`,
  `emi_mpu_set_protection`, `arm64_mmu_*`, `mtk_wdt_doe_setup`,
  `motorola_alloc_mblock`, plus DT nodes (`emimpu@10226000`, `emi_mpu`,
  `reserved-memory`, `ccci-dpmaif-*`, `md1_ccif`).

### The patch: LK-side MD validation gates

Function near VA `0xFFFF000050F49A24` validates the MD image table: region
id in `w22` must be one of `0xBC / 0x200 / 0x11C`, and `w22 <= w20`
(size bound). Violations log via the CCCI printer and return NULL. The
bypass NOPs the three branches feeding those fail paths:

| Gate | lk.bin offset / VA | old → new |
|---|---|---|
| region-id (`b.ne` → unknown-region fail) | `0x49A9C` / `…F49A9C` | `21060054` → `1f2003d5` (nop) |
| size-bound-1 (`b.hi` → size-fail + NULL) | `0x49AAC` / `…F49AAC` | `88040054` → `1f2003d5` (nop) |
| size-bound-2 (`b.hi` → size-fail + NULL) | `0x49B24` / `…F49B24` | `c8000054` → `1f2003d5` (nop) |

Same 3 old-byte values confirmed on both the phone build (-111-3) and
RETUS stock (-114-1). Any mismatch aborts (wrong build = instant refuse).
This gates **LK-side table parsing only**: no modem-signature bypass, no
modem-side size-limit removal, no DMA overlap, no watchdog/EL3 changes.
A malformed MD table can corrupt LK memory → bootloop with dead USB, so
test with recovery ready.

### Step-by-step runbook (slot A active)

0. Preconditions: bootloader unlocked, root (`su -c id` → `uid=0`), 30%+
   battery, steady cable, stock RETUS `lk.img` on hand.
1. Pull the live LK (16 MB partition):
   ```bash
   adb shell 'su -c "dd if=/dev/block/by-name/lk_a of=/sdcard/lk_a_phone.img bs=4096"'
   adb pull /sdcard/lk_a_phone.img lk_a_phone.img
   adb shell rm /sdcard/lk_a_phone.img
   ```
2. Report-only scan (changes nothing):
   ```bash
   python lk_auto_patch.py lk_a_phone.img -o /tmp/lk_report.img \
     --preset modem-unlock
   ```
3. Build the bypass image (12 bytes, re-signs `Result: VALID`):
   ```bash
   python lk_auto_patch.py lk_a_phone.img -o /tmp/lk_modem_bypass.img \
     --preset modem-unlock --modem-size-bypass --modem-allow-unsafe
   ```
4. Flash the **inactive** slot first (on `_a`, so `lk_b` — there is no
   `/dev/block/by-name/lk` on this device):
   ```bash
   fastboot flash lk_b /tmp/lk_modem_bypass.img
   fastboot --set-active=b
   ```
5. Verify: boot, then `adb shell dmesg | grep -i ccci`, confirm
   fastboot/USB stay alive.
6. Recover (Vol-Down+Power cable trick to force fastboot):
   ```bash
   fastboot --set-active=a              # known-good LK, or:
   fastboot flash lk_b <RETUS>/lk.img   # stock recovery
   ```
   Stock LK restores the lock flow but boots fine — it is the recovery
   image, not a brick. Never touch preloader/efuse.

Test evidence on the phone pull: `--apply` output differs by exactly the
12 gate bytes, all other subimages identical, re-sign `VALID`. Standalone
`tools/verify_mtk_image.py` reports `cert2 padded data exceeds file size`
on repacked images — it says the same for the **unmodified phone pull**,
a pre-existing script quirk with the -111-3 container, not a repack
defect. Full forensic record: [MODEM_UNLOCK.md](MODEM_UNLOCK.md).

### `factory-allow` preset (ungate hidden fastboot commands)

Same Val pipeline, different target: the oem command dispatcher. This is
what **factory mode would unlock** — the preset enables those same factory
OEM commands without needing factory mode or cable: `oem ramdump …`
(usage + `enable`), `oem config …` (reaches the UTAG layer), plus the
already-visible `hw`, `cdms`, `read_sv`, `get_unlock_data`, `cid_prov_req`.
Live-proven on slot B (ramdump went from `command restricted` to working).
Two NOPs, old-byte gated:

| Gate | lk.bin offset / VA | old → new |
|---|---|---|
| dispatcher deny (`tbz` → "command restricted") | `0xF3F4` / `…F0F3F4` | `00010036` → `1f2003d5` |
| config-subcommand deny (`tbz` → "Not allowed command") | `0xAD88` / `…F0AD88` | `a0090036` → `1f2003d5` |

```bash
python lk_auto_patch.py lk.img -o /tmp/lk_factory.img \
  --preset factory-allow --factory-allow --factory-allow-unsafe
```

OEM census: `lk_oem_cmd_mapper.py lk.bin` maps all 76 known commands
(absent / routed / proven-live) against the 2 global gates and writes
`.oemmap.json` — read-only, never probes destructive commands.

`full-allow` combines both (5 NOPs, 20 bytes — needs all four flags):
`--preset full-allow --modem-size-bypass --modem-allow-unsafe
--factory-allow --factory-allow-unsafe`.

### `ramdump-map` preset (MRDUMP freeze triage, slot B ground truth)

Same Val pipeline, report-only: maps the ramdump/MRDUMP subsystem per
image (command-table row → handler entry, subcommand strcmp slots, USB
`OKAY`/`INFO`/`usb_write` markers, dead `mrdump_*` strings) and changes
zero payload bytes. Grounded against the live slot B pull (`-111-3`,
factory-allow already applied there):

```bash
python lk_auto_patch.py lk_b_phone.img -o /tmp/lk_b_ramdump_report.img \
  --preset ramdump-map
```

| Item | slot B lk.bin offset / VA |
|---|---|
| `ramdump` c-string | `0xF7195` / `…FF7195` |
| command-table row `[name-ptr, handler-ptr]` | `0x120870` |
| handler entry (4-slot strcmp chain) | `0xDE1C` / `…F0DE1C` |
| `help` / `enable` / `disable` / `status` slots | `0xDE3C` / `0xDE50` / `0xDE64` / `0xDE78` |
| `usage: fastboot oem ramdump` | `0xF72F7` (1 ref) |
| `enable_fulldump` flag | `0xF72E7` (11 refs) |

Findings that shape the freeze hunt: this build has **no**
`pull`/`now`/`clear` subcommand slot (unknown args fall through to the
usage text — no freeze path there); `mrdump_chkimg` / `mrdump_fallocate` /
`mrdump_out_set` sit in the secondary full-name table (`0x120DD8` /
`0x120DF0` / `0x120E08`, help/gate list only) but are **absent from the
14-entry dispatch table**, so the live dispatcher rejects them (`not a
supported oem command` — proven live, cannot freeze, cannot pull);
`total ram size` / `dram init` / `[PL LOG]` are absent. The parser holds no `0x40000000` DRAM-range check — a Data-Abort
freeze would live in the dump backend behind the `enable` path, so trace
the handler's BL targets with capstone and audit `CBZ`/`CBNZ`/`CMP` there.

Live-proven on slot B: preset output flashed to `lk_b`, booted to
fastboot, `oem ramdump` prints usage (not `command restricted`),
`oem ramdump status` answers (SSM-permission gate, no freeze),
`oem ramdump enable` returns `enable full ramdump` + `OKAY`, no freeze.

### `readdump` (custom read command — graduated, see preset above)

Since this LK has no pull verb and crash capture yields logs only, a
custom `oem readdump <hexaddr>` command was built (borrows the harmless
`regex` dispatch slot `0x1207B0`, handler in zero cave `0xCE080`,
old-byte gated, re-signs `VALID`). It graduated to
`--preset readdump-read` (proof-of-concept, working, byte-exact live).
Design notes that stay true:

- Arg parse (lowercase hex, no `0x`), LK-short `0x50Fxxxxx`
  auto-extend, window-table allowlist (miss => `deny: no window`),
  256 B reads as 16 INFO hex lines, byte-exact (cave oracle).
- Loop bug, solved: counted dump loops run away on this LK; all exact
  outputs come from straight-line unrolled blocks (see lineage).
- Stale-x20 lesson: verify VAR==want per address (a table-hit branch
  once skipped the addr move and echoed scratch as "DRAM").
- Dev lineage, per-file docs, and standing orders:
  [`lk-tools/README.md`](lk-tools/README.md). Session log: `ramdump.md`.
- Open workfront: LK maps its image + USB + registry only — modem DRAM
  needs the remap path (registry append proven live, map() unreachable
  via its boot-time pointer so far). `oem regex` is sacrificed for the
  slot while a readdump image is flashed.

The old prototype flow (kept for reference; preset does this now):

```bash
# 1. analyze your LK pull (once):
python lk_static_analyzer.py /tmp/lk_b_phone.img -o /tmp/lk_b_analysis --no-full-disasm
# 2. build (self-tests + old-byte gates + VALID re-sign, refuses on mismatch):
python tools/readdump_unrolled.py /tmp/lk_b_phone.img /tmp/lk_b_readdump.img \
  --analysis-dir /tmp/lk_b_analysis
# 3. flash inactive slot only, reboot to bootloader:
fastboot flash lk_b /tmp/lk_b_readdump.img
fastboot reboot bootloader
# 4. read (lowercase hex, no 0x; 32-bit 0x50Fxxxxx auto-extends to LK VA;
#    anything outside the allowlist answers "deny: no window"):
fastboot oem readdump ffff000050fce7d0   # own code: must echo file bytes
fastboot oem readdump 40000000           # 256 B of DRAM scratch
```
Allowlist lives in `WINDOWS` at the top of the builder in use — extend
one proven 256 B probe at a time; an unmapped probe reboots the board
(watchdog), never bricks it.

### Cross-device: auto-detect + experimental

Gate offsets are **discovered per image**, not hardcoded: anchor string →
code xref (deny block) → backwards scan for the feeding branch
(`B.HI`/`B.NE` for modem gates, `TBZ bit0` for factory gates). Verified
builds live in a known-build table — discovery must reproduce the table
offsets or the run refuses (layout drift). Anything else needs
`--experimental` (discovery-only trust, banner printed):

```bash
python lk_auto_patch.py other-moto-lk.img -o /tmp/out.img \
  --preset full-allow --modem-size-bypass --modem-allow-unsafe \
  --factory-allow --factory-allow-unsafe --experimental
```

`--detect-only` fingerprints without touching anything (build id +
resolvable gates per family, or the exact refusal reason). ARM32 Thumb LKs
refuse cleanly (no thumb gate map yet). The modem cell-unlock side
auto-selects the same way: `unlock.py custom --patches auto` fingerprints
the stock md1img (size + sha256) and picks the bundled kansas/nevada
table, refusing unknown builds with porting instructions.

### Full-RAM dump status (nevada, kernel 5.15.180-android13-8)

- No `/proc/kcore` (`CONFIG_PROC_KCORE` off), no `/dev/mem`/`kmem`
  (`CONFIG_DEVMEM` off) — compiled out, not permission issues.
- SysRq crash works (panic → 262KB ramoops logs → clean reboot) but yields
  logs only; expdb is logs-only storage; no USB fetch command found.
- **Open, proven possible:** unsigned kernel modules load
  (`CONFIG_MODULE_SIG_FORCE` off, `modules_disabled=0`). Recipe: sync GKI
  `android13-8` sources for `5.15.180-g9b2308ac0ad6`, build a minimal
  physical-range reader (`/proc/iomem` System RAM map is world-readable),
  `insmod` via root, dump in chunks. Multi-hour job, not yet done.
- **Live via LK (`--preset readdump-read`):** custom `oem readdump`
  pulls mapped memory over USB today (256 B INFO + 16 KB DATA,
  byte-exact; full LK megabyte swept). Blocker is mapping, not
  transport: this LK maps its image + USB + registry only — modem DRAM
  needs the remap path (in progress, see `ramdump.md`).

### Live exploit surface (no flash — Trustonic MobiCore TEE)

- TEE is MobiCore MTEE SDK 2.2.2.004 (Oct 2022), reachable from root shell:
  `/dev/trusty-ipc-dev0` and `/dev/gz_kree` both open; `/dev/mobicore`
  busy (held by TeeService — use the IPC nodes directly).
- Full GP TEEC client stack on-device (`libMcClient`, `libTEECommon`,
  `libgz_uree`, `libgz_gp_client`): sessions, shared memory, command
  invocation, secure-mem alloc.
- 14 trustlets inventoried (`/vendor/app/mcRegistry`, world-readable for
  static audit): fingerprint, Keymaster/Keymint, Gatekeeper, Widevine,
  HDCP + shims. **No modem TA exists.** Hands off Gatekeeper verify calls
  (attempt counters); session open/close + fingerprint/Keymaster parsing
  are the audit targets.

Fastboot-only code paths — normal Android boot is untouched. Flash to the
inactive slot (`fastboot flash lk_b …`, `fastboot --set-active=b`), test,
fall back with `--set-active=a`. `config unprotect` may still deny via
further checks; each remaining gate gets traced the same way (string →
xref → branch → gated NOP).

### Hypervisor (GenieZone) images: patch + re-sign compatible

The same CERT2 hash-override re-sign used for LK/modem works mechanically
on `gz` (GenieZone hypervisor) images: `tools/sign_mtk_cert.py -w` +
`tools/verify_mtk_image.py` (`Result: VALID`). Live-proven on nevada:
a 1-byte behavior-neutral log-text change, re-signed, **booted through
the full chain on slot B** (preloader→bl2_ext→TEE→GZ→LK→fastboot alive).
Status: **proof of concept** — acceptance proven, no payload presets yet
(SMMU/stage-2 gate design needs hypervisor disassembly first).

Run it end to end (proof-of-concept canary, exact bytes reproducible):

```bash
# 1. pull the live hypervisor (rooted device, slot A healthy):
adb shell 'su -c "dd if=/dev/block/by-name/gz_a of=/sdcard/gz_a.img bs=4096"'
adb pull /sdcard/gz_a.img gz_a.img

# 2. build the canary (1 log byte + re-sign, exact size kept, VALID):
python lk_auto_patch.py gz_a.img -o /tmp/gz_canary.img --preset gz-canary

# 3. flash the INACTIVE slot and boot it (no system needed there):
fastboot flash gz_b /tmp/gz_canary.img
fastboot --set-active=b
fastboot reboot bootloader
# PASS = fastboot USB answers (hypervisor accepted + ran forged cert).

# 4. home, and keep this image: it is the exact-size restore file too:
fastboot --set-active=a
fastboot reboot
```

`--preset gz-range` (same flow, 2 NOPs): forces the hypervisor address
range-check to pass (`0x200E4: c8010054`, `0x200EC: 83010054` → NOPs,
old-byte gated). Boots to slot-B fastboot for no-regression validation;
effect needs a caller path (hypercall/KREE mapping, open RE target).

Consequences and constraints:

- Exact-fit partitions (gz fills its 32MB partition) reject the +96-byte
  cert growth (`data size is larger than partition size`): trim trailing
  zero padding back to exact partition size after re-signing, then
  re-verify parse before flashing.
- Test on the inactive slot (`fastboot flash gz_b …`,
  `fastboot --set-active=b`); fastboot USB presence is the pass signal
  (no system needed on that slot). Fall back with `--set-active=a`.
- No GZ *payload* presets exist yet — SMMU/stage-2 gate design needs
  hypervisor disassembly first. The acceptance proof is what this unlocks.

## Core pipeline tools (what each file does)

The end-to-end flow is `lk_auto_patch.py` (analyze → patch → re-sign →
verify). The rest are its stages, exposed for manual control.

| Tool | What it does | How to use it |
|---|---|---|
| `lk_auto_patch.py` | Main entry point: extracts the `lk` payload, runs the analyzer, applies a `--preset`, rebuilds the container, updates CERT2, verifies `VALID`. Presets: `unlock-serial`, `erase-serial`, `unlock-serial-nvdata` (+ legacy `unlock-imei` aliases), research `modem-unlock`, `ramdump-map`, working PoC `readdump-read`, working PoC `scp-bridge`, `factory-allow`, `full-allow`, `gz-canary`, `gz-range`. | `python lk_auto_patch.py lk.img -o out.img --preset unlock-serial --key-token-secret "YourSecret"` |
| `lk_static_analyzer.py` | Static analysis only: disassembles the payload, finds unlock flows, FRP/OEM checkers, key validators, erase ops, serialno source; writes `summary.txt`, JSON reports, flow graphs into an analysis dir. | `python lk_static_analyzer.py lk.img -o analysis/ [--full-disasm]` |
| `lk_patch_partition.py` | Patch engine: applies gates/presets to an extracted payload using an analysis dir (report-only or `--apply`). All research gates (`--modem-size-bypass`, `--factory-allow`, …) live here with old-byte checks. | `python lk_patch_partition.py --analysis-dir analysis/ --apply --output lk.patched.bin --preset-flags…` |
| `lk_keygen.py` | Generates 20-char unlock keys derived from secret + device serialno (deterministic with `--seed`). | `python lk_keygen.py --secret "YourSecret" --serialno "SERIAL" --count 1` |
| `lk_repack_signed.py` | Reinserts a patched payload into the original container, updates CERT2 hashes, verifies the result. | `python lk_repack_signed.py --original-image lk.img --patched-lk-bin lk.patched.bin --output out.img` |
| `ctk_lk_patcher_ui.py` | CustomTkinter desktop GUI over the same pipeline (`run_lk_patcher_ui.bat` on Windows). | `python ctk_lk_patcher_ui.py` |
| `liblk/` package (8 modules, all imported — never run directly) | Minimal LK/LKS container parser used by every tool above. |
| `liblk/__init__.py` | Package exports (`LkImage`, structures, exceptions). |
| `liblk/image.py` | `LkImage`: loads a container, exposes `partitions` dict (`lk`, `bl2_ext`, `aee`, `lk_main_dtb`, `lk_dtbo`, certs). |
| `liblk/constants.py` | `Magic` (`0x58881688`/`0x58891689`), addressing modes, LK load/phys-offset patterns. |
| `liblk/exceptions.py` | `LkImageError`, `InvalidLkPartition` — raised on malformed containers (wrong build = instant refuse). |
| `liblk/structures/__init__.py` | Structure subpackage exports. |
| `liblk/structures/header.py` | `part_hdr_t` header struct + `ImageType` (names, cert/group flags, list-end). |
| `liblk/structures/partition.py` | `LkPartition`: sub-image data, padding, CERT linkage. |
| `liblk/structures/certificate.py` | CERT1/CERT2 parsing + DER length helpers behind re-sign/verify. |
| `tools/build-part-img.py` | Rebuilds MTK multi-image containers: `replace` swaps one sub-image (header+data+certs), `concat` joins singles in order. Tolerates the trailing-CERT-padding quirk with a loud warning. | `python tools/build-part-img.py replace in.img --name lk --file lk.new -o out.img` |
| `tools/sign_mtk_cert.py` | Reads/updates MTK CERT2 image hashes (`-w` writes, `--legacy` for old libsec bypass_mode=1). Vendored from pwnage24mtk. | `python tools/sign_mtk_cert.py -w in.img -o out.img` |
| `tools/verify_mtk_image.py` | Verifies CERT1/CERT2 metadata (`-n` one image, `--all` everything). Post-sign gate. | `python tools/verify_mtk_image.py out.img` |
| `lk-tools/` (47 files + README) | readdump session lineage: every builder (`build_bulk28.py` = bulk vehicle, `build_remap6.py` = recon vehicle, `build_readdump_v1.py` = shared lib, ladders/probes/sysreg/remap history) + host tools (`fb_dump.py` DATA client, `fb_min.py` wire tap, `sweep_lk.py` 1 MB sweeper). Per-file docs + standing orders in `lk-tools/README.md`. | `python lk-tools/build_bulk28.py lk.img out.img --analysis-dir analysis/` |
| `tools/parse_mtk_certs.py` | DER/CERT parsing helpers shared by the sign/verify scripts. | imported, not run directly |

## Exploit-suite tools (nevada research set)

Every tool below is **report-only by default**: static analysis, read-only
dumps, or live queries that change nothing. Anything that builds a flashable
image is old-byte gated, re-signs, re-verifies `VALID`, prints slot-`_b`-only
flash commands, and never flashes itself. Proven live on the XT2615V lab
unit where marked; the rest is ready-to-run recon.

| Tool | What it does | How to use it |
|---|---|---|
| `lk_oem_cmd_mapper.py` | Maps all 78 known `oem` commands against the global gates (`0xF3F4`/`0xAD88`): PROVEN_LIVE / ROUTED / ABSENT + JSON. Read-only, never probes destructive commands. | `python lk_oem_cmd_mapper.py lk.bin -o out.oemmap.json` |
| `bl2_ext_patcher.py` | Reports `sec_get_vfy_policy`/cert-verify anchors in a bl2_ext image; gated `--apply` replaces the policy entry with `mov w0,#0; ret`, re-signs, exact-size trims, verifies `VALID`. | `python bl2_ext_patcher.py bl2_ext.bin` (add `--apply --unsafe --old-bytes … --entry …` to build) |
| `kree shit/kree_ioctl_explorer.c` | NDK userspace KREE prober with the measured ABI (`0x5404` = register-shm, 32B struct documented in-file). Phases: recon, `--self-share`, gated `--target`. | Build with NDK clang, run as root on device |
| `kree shit/kree_abi_recon.py` | Recovers KREE ioctl numbers from vendor libs (GOT→PLT two-hop + `w1` backscan + per-function attribution) into JSON. | `python "kree shit/kree_abi_recon.py" libgz_uree.so -o kree_abi.json` |
| `kree shit/` probers (`kree_try/share/share2/sys/alloc/echo/fod/close/enum/getchm/xsess/fp/svc/testsvc/matrix/deep/full/bis/cnt/leak/watch`) | Freestanding static-PIE device probers (no libc/NDK): open, session-create scan, dma_heap share, trusty discriminator, NULL sweep, service/enumeration/bounds/canary sweeps. `kree_share.S` holds the live-proven service-name flow. | `aarch64-linux-gnu-as …; ld -static -e _start …; adb push …; adb shell 'su -c ./kree_share'` |
| `kree shit/mkmarker.py` + `kree shit/marker.S` | Minimal no-system boot-image kit: v0/v4 repack, cpio builder, cmdline set, AVB-footer trim-to-fit, kernel swap; static `/init` (sysfs mount, PARTNAME expdb scan, marker write, RESTART2-bootloader). | `python "kree shit/mkmarker.py" --in boot.img --init marker --init-name marker -o out.img --fit-to 67108864` |
| `kree shit/phys_reader.c` | Stock-kernel phys-range reader module source (staged; needs GKI headers + `insmod -f`): ioremap + /proc node, shared windows first, modem-private second. | headers + `make`, `insmod phys_reader.ko` on live system |
| `gz_region_parser.py` | Parses `all_mem_region`/`oem_all_mem_region` references plus the live `gz_log` RKP unmaps + trusty share windows into JSON. | `python gz_region_parser.py gz_a.bin --base -0x200 --live-log gz_log.txt` |
| `dead_code_survey.py` | Zero-cave + dead-function survey ranked by distance to given hooks with branch-reach flags. | `python dead_code_survey.py md1rom.bin --hooks 0x… --base 0x…` |
| `gki_kmod_builder.py` | Generates a GKI phys-range reader module + exact repo-sync/build recipe for `5.15.180-android13-8`; validates ranges against `/proc/iomem`, refuses modem-private without explicit ack. | `python gki_kmod_builder.py --iomem iomem.txt --range 0x8c000000+0x1360000 -o gki_mod` |
| `full_allow_wedge_diagnosis.py` | Post-mortems a wedge from `getvar` captures + LK image gates + flash history; verdicts slot-race vs gate-fault. Read-only. | `python full_allow_wedge_diagnosis.py --getvar getvar.txt --image lk_b.img` |
| `dump_all_bootchain.py` | Full bootchain backup over root adb (preloader, lk/gz/boot/vbmeta/seccfg/scp/md1img + manifest). Refuses the fused BROM path. Never flashes/writes. | `python dump_all_bootchain.py --out backups/ --full-modem` |
| `preloader_disasm.py` | Static preloader disassembly (auto/arm64/arm32), security anchors, verify-site context. No flash path exists in the tool. | `python preloader_disasm.py preloader_a.bin --around 0x…` |
| `brom_interface_scanner.py` | BROM surface census: static string scan + USB ID table + boot-log SLA verdict; live handshake refused on fused devices without explicit override. | `python brom_interface_scanner.py --image preloader.bin --boot-log boot.log` |
| `seccfg_analyzer.py` | Read-only seccfg backup parser (magic, flag words, JSON). There is no write path in this file. | `python seccfg_analyzer.py seccfg.bin` |
| `da_extractor.py` | USB-capture DA-transfer census (metadata/hashes only — DA bytes are never written or bundled). | `python da_extractor.py capture.txt [--raw]` |
| `preloader_payload_builder.py` | EL3 research scaffold: cave survey + return-to-caller canary *source template*; binary emission needs reviewer-confirmed offsets, and no flash command is ever printed (preloader has no slot). | `python preloader_payload_builder.py --image preloader.bin` |
| `brom_exploit_prober.py` | Evaluates known BROM exploit preconditions against your seccfg/boot-log evidence (APPLICABLE/BLOCKED); live probing refused on fused devices. No execute flag exists. | `python brom_exploit_prober.py --boot-log boot.log` |
| `kree shit/kree_map_all.S` + `build_kmap_all.sh`, `kree_map_{recon,run}.sh`, `kmap_service.sh` | KREE map-all sweep kit: static-PIE mapper source + NDK build script + on-device recon/run wrappers (crash-resume via `/data/local/tmp/kmap.prog`) + optional Magisk service stub. | `bash "kree shit/build_kmap_all.sh"`, push binary + scripts, run as root |
| `lk-tools/kmod-relay/` (`reader.c` + `Makefile`) | GKI relay module source: standard sysfs params (`ticket`, `buildtag`) for the DRAM-scratch relay test (module writes scratch, LK reads after reboot). | GKI `5.15` headers + `make`, Magisk-boot install (fresh id per install) |
| `lk-tools/kmod-spin/` (`spin.c` + `Makefile`) | GKI execution-probe module source: init issues `panic("SPINMARKER")` to prove the init body ran. | same build/install path as the relay module |
| `lk-tools/valbridge_pull.py` | Host half of VALBRIDGE: pulls `jobs.txt` from sdcard, reboots to bootloader, per-job readdump pulls via `fb_dump.py`, reboots and pushes results back. | `python lk-tools/valbridge_pull.py [--serial ZT4229CJG5]` |
| `tools/btf_parse.py` | Struct member offsets from raw BTF (`/sys/kernel/btf/vmlinux`). No dependencies. | `python tools/btf_parse.py <btf> --want task_struct:cred,...` |
| `tools/kallsyms_parse.py` | Full static kallsyms recovery from a raw arm64 `Image` (handles `BASE_RELATIVE` u32 addrs). | `python tools/kallsyms_parse.py <Image> [--want a,b]` |
| `ghostlock/` | Cred/session-shift sweep: preload + sweep scripts (`sweep.sh`, `preflight.sh`), measured offsets, panic-console + sweep logs, port notes. | see `ghostlock/README.md` + `ghostlock/RUNLOG.md` |

Live-proven so far: OEM census reproduces byte-identical on the phone LK;
KREE session + share handshake completes against `com.mediatek.geniezone.srv.mem`
(session handle + shm handle acquired from a root shell, no flash).

## License

GNU Affero General Public License v3.0
