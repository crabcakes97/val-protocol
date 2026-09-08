#!/usr/bin/env python3
"""brom_interface_scanner.py -- BROM download-mode surface census (static-first).

Closed with receipts: BROM code-exec/download is CLOSED on nevada (SLA/DAA
fused, sbc_en=1; needs a Motorola-signed DA). LK only knows the BROM-DIS
fuse STATUS. This tool therefore defaults to STATIC analysis: scans a
preloader/LK backup for BROM/DA/SLA strings, prints the MTK BROM USB VID:PID
table, and checks a supplied boot log for the SLA verdict. A live USB
handshake probe exists but REFUSES on fused devices unless --force-fused is
given with typed YES, and even then it only performs the benign handshake
(0xA0 echo), never a download/exploit step.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

MTK_BROM_IDS = (("0e8d", "0003", "MTK Preloader / BROM"),
                ("0e8d", "2000", "MTK BROM download"),
                ("0e8d", "2001", "MTK BROM download (alt)"))
STRINGS = (b"brom", b"download agent", b"sla", b"daa", b"brom-dis",
           b"usb download", b"meta mode", b"0xa0")


def static_scan(data: bytes) -> dict[str, int]:
    low = data.lower()
    return {s.decode(): low.count(s) for s in STRINGS}


def sla_verdict(log_text: str) -> str:
    m = re.search(r"sbc_en=(\d).*?img_auth_required=(\d)", log_text, re.S)
    if m:
        return f"sbc_en={m.group(1)} img_auth_required={m.group(2)}"
    m = re.search(r"bl2_ext cert vfy\s*->\s*(\w+)", log_text)
    if m:
        return f"bl2_ext cert vfy -> {m.group(1)}"
    return "unknown (no SLA lines in supplied log)"


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--image", default=None, help="preloader/LK backup to scan")
    p.add_argument("--boot-log", default=None, help="expdb/boot log for SLA verdict")
    p.add_argument("--live-probe", action="store_true")
    p.add_argument("--force-fused", action="store_true")
    args = p.parse_args()
    if args.image:
        data = Path(args.image).read_bytes()
        print(f"static scan of {args.image} ({len(data)} bytes):")
        for s, n in static_scan(data).items():
            print(f"  {s:16s} x{n}")
    print("MTK BROM USB IDs:")
    for vid, pid, desc in MTK_BROM_IDS:
        print(f"  {vid}:{pid}  {desc}")
    if args.boot_log:
        print("SLA verdict:",
              sla_verdict(Path(args.boot_log).read_text(errors="replace")))
    if args.live_probe:
        if not args.force_fused:
            print("REFUSED: live BROM probe on a fused device needs "
                  "--force-fused plus typed YES (brick risk, no recovery "
                  "without a signed DA). Static results above are the finding.")
            return 2
        ans = input("type YES to send benign BROM handshake only: ")
        if ans != "YES":
            print("aborted.")
            return 2
        try:
            import usb.core  # type: ignore
        except ImportError:
            print("pyusb not installed; cannot probe. pip install pyusb "
                  "on your host if you really own this risk.")
            return 2
        for vid, pid, desc in MTK_BROM_IDS:
            dev = usb.core.find(idVendor=int(vid, 16), idProduct=int(pid, 16))
            print(f"  {vid}:{pid} ({desc}): {'PRESENT' if dev else 'absent'}")
        print("handshake step NOT auto-sent: craft it by hand from the "
              "mtkclient BROM protocol docs if you accept the risk.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
