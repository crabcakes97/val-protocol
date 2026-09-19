# Troubleshooting

## `capstone` Import Error

Install Capstone in the active Python environment:

```bash
python -m pip install capstone
```

If the package is installed but still not found, confirm that the same Python executable is running the scripts:

```bash
python -c "import sys; print(sys.executable)"
python -c "import capstone; print(capstone.__version__)"
```

## Analyzer Finds No Candidates

Check:

- the input is a supported Motorola LK/LKS image,
- the image contains a subimage named `lk`,
- the correct subimage name is passed with `--name` if needed,
- the architecture is correctly detected,
- the relevant strings exist in the image.

Run full analysis:

```bash
python lk_static_analyzer.py "path/to/lk.img" -o "path/to/analysis" --full-disasm
```

Then inspect:

- `summary.txt`
- `serialno_runtime.json`
- `key_validators.json`
- `frp_checkers.json`
- `best_flow.asm`

## Device Resets After `fastboot oem unlock`

This usually means the patched flow entered an invalid function address, returned through the wrong prologue/epilogue shape, or called a runtime helper from an unsafe entry.

Inspect:

- `SerialFn` in patch output
- `serialno_runtime.json`
- the first instructions at the reported serial function
- whether AArch64 `PACIASP/AUTIASP` prologues are being entered correctly

For diagnosis, build checkpoint images:

```bash
python lk_auto_patch.py "path/to/lk.img" \
  -o "path/to/lk.chk-after-serial.img" \
  --preset erase-serial \
  --erase-token-partition frp \
  --erase-token-secret "YourSecret" \
  --key-token-debug-stop after_serial
```

## Key Always Fails

Confirm:

- the serial was copied exactly from `fastboot getvar serialno`,
- the same secret was used for patching and key generation,
- the same alphabet was used,
- the LK image flashed to the device matches the generated key mode,
- `serialno_runtime.json` points to the correct runtime serial getter.

Generate a key:

```bash
python lk_keygen.py --secret "YourSecret" --serialno "SERIAL_FROM_FASTBOOT" --count 1
```

## Repack Fails Verification

Inspect the output from:

```bash
python tools/verify_mtk_image.py "path/to/output.img" -n lk
```

The expected final line is:

```text
Result: VALID
```

## Replacement Partition Name Does Not Fit

Some presets replace an existing partition string in-place. The new name must fit within the available original string space.

Examples that usually fit:

- `frp`
- `cache`

Longer names may require a different patch strategy.

## Bricked Nevada: preloader loops, no fastboot (2026-09-19 log)

Bad LK on flash → preloader (`0e8d:2000 MT65xx Preloader`) enumerates for
~2 s per bootloop, then drops. Sometimes half-enumerates (visible in
`sysfs`, no `/dev/ttyACM*`, handshake impossible) — that state needs
hands: unplug, hold Power 12 s, replug. For BROM mode (`0e8d:0003`,
stable, no timeout): hold Vol-Up + Vol-Down and plug USB.

Handshake works with the stock preloader as DRAM config
(`verizon preloader/preloader_a.bin`, sha256 `2eb94daf…`, identical to
`../preloader_a.bin`): `MT6835V/ZA`, `SBC True / SLA False / DAA True`,
watchdog disable OK, `gettargetconfig` green. Everything past the
handshake (flash, read, `plstage`, `peek`, `dumpsram`) dies at the DA
signature check — `DAA_SIG_VERIFY_FAILED (0x7024)` from the device.

DA loaders tried (all fail identically at DAA, before any chip check):
`MTK_AllInOne_DA.bin`, `DA_A15_lamu.bin`, `DA_A14_lamulg.bin`,
`DA_SWSEC_2404_lamu_dl_forbidden.bin`, `DA_PL.bin`, Infinix `MT6835_1.bin`
(right chip, wrong signer). The "Moto-signed wrong-chip passes DAA"
hypothesis is disproven on this unit: DAA fails first, so no available DA
reaches the chip check. No auth file (`auth_sv5.auth`) and no Moto-signed
MT6835 DA exist on disk; no BROM payload for hwcode `0x1209` exists in
mtkclient (`brom_config.py` documents the chip but ships no exploit
payload — amonet/kamakiri/carbonara target pre-2020 BROMs).

Untested last lane: `mtk.py crash` in a preloader window → BROM `0003` →
`stage`/`payload` with a forced `--ptype`. Near-certain fail on a 2023
BROM, reboot-grade only (SRAM execution, flash untouched). Needs the
button dance above; say GO with the phone in BROM and it runs.

Stock restore image (when any lane opens): `../lk_a_phone.img` (16 MB
partition dump, sha256 `0b0cd33e…`, LK magic `88168858` at 0x0). Flash
`lk_b` first; `lk_a` only on explicit override of the never-flash-A rule.

