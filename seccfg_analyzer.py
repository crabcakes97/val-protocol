#!/usr/bin/env python3
"""seccfg_analyzer.py -- parse an seccfg backup (READ-ONLY, no write path).

seccfg holds lock-state flags (SLA/DAA/SBC, unlock state). A wrong write =
permanent brick with no slot fallback, so this tool contains ZERO write
code: it parses a backup file (from dump_all_bootchain.py), prints magic,
flag words, and the interpreted lock posture, plus JSON. There is no
--write flag and there never will be in this file; go through the vendor
unlock ceremony for state changes.
"""
from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("image", help="seccfg.bin BACKUP (never the live node)")
    p.add_argument("-o", "--out", default=None)
    args = p.parse_args()
    data = Path(args.image).read_bytes()
    if len(data) < 64:
        print(f"REFUSED: {args.image} too small ({len(data)}B) for seccfg")
        return 2
    magic, = struct.unpack_from("<I", data, 0)
    words = struct.unpack_from("<16I", data, 0)
    result = {"image": args.image, "size": len(data),
              "magic": hex(magic),
              "flag_words": [hex(w) for w in words],
              "all_zero": all(w == 0 for w in words),
              "all_ff": all(w == 0xFFFFFFFF for w in words)}
    print(f"seccfg backup: {len(data)} bytes, magic {magic:#x}")
    for i, w in enumerate(words):
        print(f"  w{i:02d} {w:#010x}")
    if result["all_zero"]:
        print("note: all-zero flag words (matches SV-fuses-zero posture; "
              "interpretation needs a second backup to confirm stability).")
    out = Path(args.out or (Path(args.image).name + ".seccfg.json"))
    out.write_text(json.dumps(result, indent=1))
    print(f"JSON: {out}")
    print("no write path in this tool. State changes go through the vendor "
          "unlock ceremony, never through seccfg edits.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
