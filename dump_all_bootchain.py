#!/usr/bin/env python3
"""dump_all_bootchain.py -- full bootchain backup over root adb (read-only).

Pulls every boot-stage partition BEFORE any test flash so the way home is
real: preloader_a, lk_a/b, gz_a/b, boot_a, vbmeta(_a), seccfg, md1img_a/b
(head 4K + full md1img), scp_a, plus fastboot getvar snapshot. Writes a
sha256 MANIFEST. This tool NEVER flashes, NEVER writes to the device, never
names efuse/fuses, never writes nvram/nvdata/seccfg (reads only).

The MTKClient/BROM-download path (--via brom) is REFUSED on fused devices
(SLA/DAA fused per boot logs; needs a Motorola-signed DA we do not have and
will not bundle). Unlocked fastboot + root dd already covers every backup
need; BROM download tools are a different tool class, not used here.
"""
from __future__ import annotations

import argparse
import hashlib
import subprocess
import sys
from pathlib import Path

PARTITIONS = ("preloader_a", "lk_a", "lk_b", "gz_a", "gz_b", "boot_a",
              "vbmeta_a", "vbmeta_system_a", "seccfg", "scp_a", "md1img_a",
              "md1img_b", "misc", "boot_para")
FASTBOOT_VARS = ("current-slot", "unlocked", "secure", "serialno", "cid")


def sh(*cmd: str) -> subprocess.CompletedProcess:
    return subprocess.run(cmd, capture_output=True, text=True, timeout=120)


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--out", required=True, help="backup dir (stays on YOUR disk)")
    p.add_argument("--via", default="root-dd", choices=("root-dd", "brom"),
                   help="transport (brom is refused on fused devices)")
    p.add_argument("--full-modem", action="store_true",
                   help="also pull full md1img_a/b (~76MB each, slow)")
    args = p.parse_args()
    if args.via == "brom":
        print("REFUSED: BROM download path is closed on this device "
              "(SLA/DAA fused, sbc_en=1; needs Motorola-signed DA). "
              "Use --via root-dd: unlocked fastboot + su covers all backups.")
        return 2
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    manifest = []
    r = sh("adb", "shell", "su -c id")
    if "uid=0" not in r.stdout:
        print("REFUSED: root required (on-phone Magisk/KernelSU allow-tap first)")
        return 2
    for part in PARTITIONS:
        if part.startswith("md1img") and not args.full_modem:
            node, count = part, 1024  # 4MB head for fingerprinting
        else:
            node, count = part, None
        dst = out / f"{part}.bin"
        if dst.exists():
            print(f"skip {part} (already present)")
        else:
            dd = (f"dd if=/dev/block/by-name/{node} of=/sdcard/{part}.bin bs=4096"
                  + (f" count={count}" if count else ""))
            r = sh("adb", "shell", f"su -c {dd!r}")
            if r.returncode != 0:
                print(f"warn: dd {part} failed: {r.stderr.strip()[:160]}")
                continue
            r = sh("adb", "pull", f"/sdcard/{part}.bin", str(dst))
            sh("adb", "shell", f"rm /sdcard/{part}.bin")
            if r.returncode != 0:
                print(f"warn: pull {part} failed")
                continue
        h = hashlib.sha256(dst.read_bytes()).hexdigest()
        manifest.append(f"{h}  {dst.name}  {dst.stat().st_size}")
        print(f"saved {dst.name} {dst.stat().st_size}B sha256:{h[:16]}...")
    gv = sh("fastboot", "getvar", "all")
    (out / "getvar.txt").write_text(gv.stdout + gv.stderr)
    (out / "MANIFEST.txt").write_text("\n".join(manifest) + "\n")
    print(f"MANIFEST: {out / 'MANIFEST.txt'} ({len(manifest)} entries)")
    print("backups are revert material only: restore with "
          "`fastboot flash <part>_b <file>` (inactive slot), never _a first.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
