# Val Protocol — Complete Instructions

Covers every script in this repo: what it is, when to use it, exact commands,
and the safety rules that apply. Research (nevada) additions are marked.

Standing rules (apply to everything): inactive slot first, old-byte gates
(any mismatch refuses), stock images as recovery, never preloader/efuse/fuses,
never destructive probing from mapping tools, verify `VALID` after signing.

## 1. Core flow (unlock / erase presets)

Analyze-only first:

```bash
python lk_static_analyzer.py "path/to/lk.img" -o analysis/ [--full-disasm]
```

Key outputs: `summary.txt`, `key_validators.json`, `frp_checkers.json`,
`serialno_runtime.json`, `partition_erases/`, `flow_functions/`.

Patch (recommended entry point):

```bash
python lk_auto_patch.py "path/to/lk.img" -o out.img \
  --preset unlock-serial --key-token-secret "YourSecret"
fastboot getvar serialno
python lk_keygen.py --secret "YourSecret" --serialno "SERIAL" --count 1
fastboot oem unlock GENERATED_KEY
```

Presets: `unlock-serial`, `erase-serial`, `unlock-serial-nvdata`
(legacy aliases `unlock-imei`, `erase-imei`, `unlock-imei-nvdata`).
`erase-serial` reuses the unlock flow to erase `--erase-token-partition`
(typically `frp`) and returns before changing unlock state.

Manual two-step form (same engine, explicit control):

```bash
python lk_patch_partition.py --analysis-dir analysis/ --apply \
  --output lk.patched.bin [patch flags]
python lk_repack_signed.py --original-image lk.img \
  --patched-lk-bin lk.patched.bin --output out.img
python tools/verify_mtk_image.py out.img   # must say VALID
```

Diagnostic checkpoints (temporary builds that swap failure text for `LKDBG`
markers and return normally — diagnosis only, never production):

```bash
python lk_auto_patch.py lk.img -o chk.img --preset erase-serial \
  --erase-token-partition frp --erase-token-secret "YourSecret" \
  --key-token-debug-stop entry   # entry|caller_before_key|before_serial|
                                 # after_serial|token_ok|token_fail
```

GUI: `python ctk_lk_patcher_ui.py` (Windows: `run_lk_patcher_ui.bat`).

## 2. Container / certificate tools (`tools/`)

```bash
python tools/build-part-img.py replace in.img --name lk --file lk.new -o out.img
python tools/build-part-img.py concat dir/ --order lk,bl2_ext,aee,lk_main_dtb,lk_dtbo -o out.img
python tools/sign_mtk_cert.py image.bin            # info only
python tools/sign_mtk_cert.py -w image.bin -o out.bin [--legacy]
python tools/verify_mtk_image.py out.img [-n lk | --all]
```

`parse_mtk_certs.py` holds the shared DER helpers (imported, not run).
 quirk note: on some containers (nevada `-111-3` phone pull) the standalone
verifier reports `cert2 padded data exceeds file size` on the *unmodified*
pull too — compare input vs output reports (parity) instead of trusting it
blindly; the pipeline's own `Result: VALID` plus a slot-B boot test decide.

## 3. Nevada research presets (all in `lk_auto_patch.py` + `lk_patch_partition.py`)

Report-only default; mutation needs the paired `--*-unsafe` flags; gates are
discovered per image (anchor → xref → feeding branch) and must reproduce the
known-build table or refuse (`--experimental` overrides for unknown builds,
`--detect-only` fingerprints without touching anything).

| Preset | Target | Gates | Flags | Proven |
|---|---|---|---|---|
| `modem-unlock` | LK MD-table validation (LK-side parsing only — no sig/DMA/EL3) | `0x49A9C/0x49AAC/0x49B24` → NOP (12B) | `--modem-size-bypass --modem-allow-unsafe` | report + VALID |
| `factory-allow` | oem dispatcher deny + config-subcommand deny | `0xF3F4`/`0xAD88` → NOP (8B) | `--factory-allow --factory-allow-unsafe` | **live slot B**: ramdump/config reach handlers |
| `ramdump-map` | MRDUMP freeze triage: table row → handler → subcommand slots → USB markers (REPORT-ONLY, 0B; enables nothing — that is `factory-allow`) | none (read-only) | none | **live slot B**: row `0x120870`, handler `0xDE1C`, sub `help/enable/disable/status`, no pull/now/clear slot, `mrdump_*` dead |
| `full-allow` | both above | 5 NOPs (20B) | all four flags | builds VALID |
| `gz-canary` | 1 behavior-neutral log byte in GZ + re-sign, exact-size trim | 1B | none | **live slot B**: boots to fastboot |
| `gz-range` | hypervisor range-check force-pass `0x200E4/0x200EC` → NOP | 8B | none (own preset) | **live slot B**: boots, no regression |

```bash
python lk_auto_patch.py lk.img -o factory.img \
  --preset factory-allow --factory-allow --factory-allow-unsafe
python lk_auto_patch.py lk.img -o ramdump_report.img --preset ramdump-map
python lk_auto_patch.py gz.img -o gz_canary.img --preset gz-canary
# inactive slot only, then verify twice:
fastboot flash lk_b factory.img; fastboot set_active b   # NOT set-active
fastboot reboot bootloader   # PASS = fastboot answers
fastboot oem ramdump         # usage text, not "command restricted"
fastboot oem ramdump enable  # "enable full ramdump", OKAY (armed, persists)
fastboot oem config unprotect enable_fulldump  # UTAG reads back true
```

Flash/recovery: `fastboot --set-active=a` is home; deeper fallback is the
stock RETUS image. Never touch preloader/efuse; never `set-active` twice
without verifying between (slot-race wedge, see below).

## 4. OEM command census

```bash
python lk_oem_cmd_mapper.py lk.bin -o out.oemmap.json
```

76 commands mapped static-only (string → ADRP+ADD/ADR xref → handler block →
feeding branch) against the two global gates; JSON + table; destructive
commands are mapped, never probed. Statuses: PROVEN_LIVE (12: ramdump,
config, hw, hwid, cdms, read_sv, get_unlock_data, cid_prov_req, show_screen,
fb_mode_set/clear, off-mode-charge), ROUTED (handler exists, e.g. uart,
unlock, erase, barcode), ABSENT (no handler — cannot be ungated: fuses,
getimei*, ultraflash, shipmode, qcom-*, …). Subcommand vocabularies for
ramdump/config/hw are included. Proven: re-runs reproduce byte-identical.

## 5. KREE / hypervisor live workflow (no flash, root shell)

Measured ABI (from `kree shit/kree_abi_recon.py` against live-pulled libs; `uree`
opens `/dev/gz_kree`, TEEC libs use `/dev/mobicore-user` — separate doors):

- `0x5401` create (16B `{0, service-name}`), `0x5402` close,
  `0x5403` service-call (32B), `0x5404` register-shm (32B
  `{session, shm-out, buf, size, pad}`), `0x5415/0x5416` misc.
- Service names (not UUIDs): `com.mediatek.geniezone.srv.mem` (memory
  service — sessions + own-buffer register proven live: session handle,
  `shm hd=0x12`), `com.mediatek.geniezone.isp` (session ok, share gated).
- FP/keymaster/widevine UUIDs reach the driver but fail service-connect
  (`-107`); driver narrates every call in `dmesg` (`[KREE]` tag) — always
  capture `dmesg` around attempts.
- Driver self-test hook: `cat /sys/class/misc/gz_kree/gz_test` prints the
  menu; `echo 0` (version), `1` (TIPC), `2` (functions), `3` (shared memory
  self-test), `5` (chunk mem), `C` (secure storage). Never `4` (abort).

```bash
python "kree shit/kree_abi_recon.py" libgz_uree.so -o kree_abi.json
# freestanding probers (no NDK: as+ld -static, push, run as root) live in
# "kree shit/" (kree_share.S = live-proven service-name flow):
aarch64-linux-gnu-as -o k.o "kree shit/kree_share.S"
aarch64-linux-gnu-ld -static -e _start -o kree_share k.o
adb push kree_share /data/local/tmp/ && adb shell 'su -c /data/local/tmp/kree_share'
```

`kree_ioctl_explorer.c` is the NDK C version of the same flow (recon,
`--self-share`, gated `--target`). `kree_try.S` is the earlier scan
iteration. `gz_region_parser.py` parses static region lists plus the live
`gz_log` RKP unmaps/shares:
`python gz_region_parser.py gz_a.bin --base -0x200 --live-log gz_log.txt`.

## 6. Analysis-only tools (never flash, never probe live destructively)

- `gz_region_parser.py`, `dead_code_survey.py` (caves/dead-code near hooks:
  `python dead_code_survey.py md1rom.bin --hooks 0x… --base 0x…`),
  `gki_kmod_builder.py` (GKI phys-reader recipe for 5.15.180),
  `full_allow_wedge_diagnosis.py` (slot-race vs gate-fault verdicts),
  `dump_all_bootchain.py` (`--out dir/ [--full-modem]`, skips fastboot steps
  when the phone is in Android), `preloader_disasm.py`,
  `brom_interface_scanner.py` (static-first; live probe refused on fused
  devices), `seccfg_analyzer.py` (no write path exists),
  `da_extractor.py` (parse-only; DA bytes never saved/bundled),
  `preloader_payload_builder.py` (source template only; no flash path —
  preloader has no slot), `brom_exploit_prober.py` (evaluates preconditions,
  never executes), `bl2_ext_patcher.py` (report default; gated apply).

## 7. Slot discipline (read twice, flash once)

- Daily driver stays on `_a`; testbed is `_b` (no system there — it boots
  fastboot only, which is the pass signal for bootloader tests).
- Flash `*_b` while `_a` is active; `set_active` (underscore form) then
  verify `current-slot` TWICE with a pause between; never two set-actives
  without verifying (triple set-active race = the full-allow wedge shape).
- `fb_mode_set factory` is NOT factory mode (force-fastboot loop flag only);
  the `factory-allow` gates replace factory mode — no cable, no UTAG writes.
- To leave: `set_active a`, verify twice, `reboot`, confirm
  `boot_completed=1`, SIM `LOADED`, `su -c id` → `uid=0`.
- Wedged bootloader (enumerates, silent): hold Power 12s; black screen →
  Vol-Down+Power 12s → fastboot.
