# modem-unlock preset (nevada / Moto G Play 2026 XT2615V)

Research LK patch for the MediaTek MT6835 modem-load path. Target device:
`moto g play - 2026`, SKU `XT2615V`, slot `_a`, bootloader unlocked
(`flashing_unlocked`), rooted. Phone LK is bootloader **W1WNS36.18-111-3**;
RETUS factory package is **W1WNS36.18-114-1** (newer, same gate code).

All work was done against the LK **pulled from the phone** — no lab or
foreign images. Phone sources live outside this repo in
`../patched lk/` (raw 16 MB `lk_a_phone.img`, trimmed container
`lk_a_phone_nopad.img`, extracted payload `lk.img`, full `analysis-phone/`).

## What this LK actually is

- AArch64 payload, 1,238,168 bytes, base `0xffff000050f00000`.
- It is **not EL3**. LK calls *into* ATF/EL3 via SMC. Patching LK stays at
  LK privilege — there is no EL3 via this preset.
- LK's MMU/EMI-MPU/mblock setup is **rebuilt by the kernel at boot**, so an
  LK remap does not persist into Linux/modem runtime.
- Modem signature verification does **not** live in LK. The CERT2 re-sign
  path (`unlock.py` / `lk_repack_signed.py`) remains the working bypass for
  flashing modified images.

## Symbol reality check (byte scan of the phone LK)

Absent — do not assume these functions exist:

| Name | Found |
|---|---|
| `modem_auth` | no |
| `load_modem_fw` | no |
| `mmu_table_init` | no |
| `armv7_mmu_init` | no |

Present — the real modem-load surface (`--preset modem-unlock`
report-only lists file offset + VA for each):

| Marker | lk.bin offset | VA |
|---|---|---|
| `platform_load_modem` | `0xD0EF2` | `0xFFFF000050FD0EF2` |
| `ccci_resv_named_memory` | `0xCF7E1` | `0xFFFF000050FCF7E1` |
| `ccci_plat_apply_mpu_setting` | `0xD92F4` | `0xFFFF000050FD92F4` |
| `ccci_sec_data` | `0xD609C` | `0xFFFF000050FD609C` |
| `md1_sib_mem` | `0xD0DEC` | `0xFFFF000050FD0DEC` |
| `md1_bank4_cache_info` | `0xD580B` | `0xFFFF000050FD580B` |
| `emi_mpu_set_protection` | `0xD0D1A` | `0xFFFF000050FD0D1A` |
| `arm64_mmu_unmap` | `0xD051F` | `0xFFFF000050FD051F` |
| `arch/arm64/mmu.c` | `0xD94BC` | `0xFFFF000050FD94BC` |
| `motorola_alloc_mblock` | `0xCF0CC` + 4 more | — |
| `mtk_wdt_doe_setup` | `0xD13D3` | `0xFFFF000050FD13D3` |
| `apwdt is disabled by doe` | `0xD5D6F` | `0xFFFF000050FD5D6F` |

Overlap truth lives in `lk_main_dtb`: `emimpu@10226000`, `emi_mpu`,
`reserved-memory`, `ccci-dpmaif-cache/nocache-memory`, `md1_ccif`,
`modem_temp_share`. Both LK and the kernel consume this DT.

## The patch: LK-side MD validation gates

Function near VA `0xFFFF000050F49A24` validates the MD image table:
region id in `w22` must be one of `0xBC / 0x200 / 0x11C`, and
`w22 <= w20` (size bound). Violations log via the CCCI printer and the
function returns NULL. Three conditional branches feed those fail paths;
the bypass NOPs all three (same footprint, old-byte gated):

| Gate | lk.bin offset / VA | old bytes | new bytes |
|---|---|---|---|
| region-id (`b.ne` → unknown-region fail) | `0x49A9C` / `…F49A9C` | `21060054` | `1f2003d5` (nop) |
| size-bound-1 (`b.hi` → size-fail + NULL) | `0x49AAC` / `…F49AAC` | `88040054` | `1f2003d5` (nop) |
| size-bound-2 (`b.hi` → size-fail + NULL) | `0x49B24` / `…F49B24` | `c8000054` | `1f2003d5` (nop) |

Total delta: **12 bytes**. Same 3 old-byte values confirmed on both the
phone build (-111-3) and RETUS stock (-114-1). Any mismatch aborts with
the offset and expected-vs-found bytes (wrong build = instant refuse).

This gates **LK-side table parsing only**. It does not bypass modem
signatures, modem-side size limits, or create DMA overlap, and it does
not touch MMU/EMI-MPU/watchdog/EL3. A malformed MD table can corrupt LK
memory → bootloop with dead USB. Test with recovery ready.

## Usage

```bash
# report-only (default, changes zero payload bytes):
python3 lk_auto_patch.py "<lk-container.img>" -o /tmp/lk_report.img \
  --preset modem-unlock

# build the bypass image (still no flash):
python3 lk_auto_patch.py "<lk-container.img>" -o /tmp/lk_modem_bypass.img \
  --preset modem-unlock --modem-size-bypass --modem-allow-unsafe
```

Direct engine form (needs an analysis dir from `lk_static_analyzer.py`):

```bash
python3 lk_patch_partition.py --analysis-dir <analysis-dir> \
  --modem-research-report-only
python3 lk_patch_partition.py --analysis-dir <analysis-dir> --apply \
  --output <lk.patched.bin> --modem-size-bypass --modem-allow-unsafe
```

`--modem-size-bypass` without `--modem-allow-unsafe` is refused, and
report-only refuses to combine with any other patch flag.

## Test evidence (phone pull, XT2615V slot A)

- Analyzer completes: aarch64, 264141 insns, best flow `…F9E82C`.
- `--apply` output differs from input by exactly the 12 gate bytes;
  `bl2_ext`/`aee`/`lk_main_dtb`/`lk_dtbo` payloads identical.
- Full pipeline re-sign: `Result: VALID`.
- NOTE: standalone `tools/verify_mtk_image.py` reports
  `cert2 padded data exceeds file size` on the repacked image — it says
  the same for the **unmodified phone pull**, so this is a pre-existing
  quirk of that script with the -111-3 container, not a repack defect
  (stock -114-1 verifies VALID).

## Flash / test / recovery (A/B slots!)

This device has `lk_a`/`lk_b` — there is **no** `/dev/block/by-name/lk`.
Never `dd` to a guessed LK path from Android; flash from fastboot,
inactive slot first (device was on `_a`):

```bash
fastboot flash lk_b /tmp/lk_modem_bypass.img
fastboot --set-active=b
# boot, then: adb shell dmesg | grep -i ccci ; confirm fastboot/USB alive
```

If it bootloops with dead USB: Vol-Down+Power cable trick to force
fastboot, then either `fastboot --set-active=a` (known-good Val-patched
LK is still there) or `fastboot flash lk_b <RETUS>/lk.img` for stock.
Stock LK restores the lock flow but boots fine — it is the recovery
image, not a brick. Never touch preloader/efuse.

## Files changed in this repo

- `lk_patch_partition.py` — `MODEM_RESEARCH_MARKERS`,
  `MODEM_ABSENT_MARKERS`, `MODEM_SIZE_GATES`, `patch_bytes_checked`,
  `apply_modem_size_gates`, `--modem-research-report-only`,
  `--modem-size-bypass`, `--modem-allow-unsafe`.
- `lk_auto_patch.py` — `modem-unlock` in `PRESETS`,
  `--modem-size-bypass` / `--modem-allow-unsafe` forwarding.
- `lk_static_analyzer.py` — fixed `write_summary` crash on images with
  erase ops but no key validators (validator/erase-op copy-paste bug;
  erase ops carry `failure_target`, not `failure_edges`).
