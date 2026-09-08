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
- Applies research presets (unlock, erase, modem, ramdump-map, factory, and hypervisor flows).
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
| `lk_auto_patch.py` | Main entry point: extracts the `lk` payload, runs the analyzer, applies a `--preset`, rebuilds the container, updates CERT2, verifies `VALID`. Presets: `unlock-serial`, `erase-serial`, `unlock-serial-nvdata` (+ legacy `unlock-imei` aliases), research `modem-unlock`, `ramdump-map`, `factory-allow`, `full-allow`, `gz-canary`, `gz-range`. | `python lk_auto_patch.py lk.img -o out.img --preset unlock-serial --key-token-secret "YourSecret"` |
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
| `tools/parse_mtk_certs.py` | DER/CERT parsing helpers shared by the sign/verify scripts. | imported, not run directly |

## Exploit-suite tools (nevada research set)

Every tool below is **report-only by default**: static analysis, read-only
dumps, or live queries that change nothing. Anything that builds a flashable
image is old-byte gated, re-signs, re-verifies `VALID`, prints slot-`_b`-only
flash commands, and never flashes itself. Proven live on the XT2615V lab
unit where marked; the rest is ready-to-run recon.

| Tool | What it does | How to use it |
|---|---|---|
| `lk_oem_cmd_mapper.py` | Maps all 76 known `oem` commands against the global gates (`0xF3F4`/`0xAD88`): PROVEN_LIVE / ROUTED / ABSENT + JSON. Read-only, never probes destructive commands. | `python lk_oem_cmd_mapper.py lk.bin -o out.oemmap.json` |
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

Live-proven so far: OEM census reproduces byte-identical on the phone LK;
KREE session + share handshake completes against `com.mediatek.geniezone.srv.mem`
(session handle + shm handle acquired from a root shell, no flash).

## License

GNU Affero General Public License v3.0
