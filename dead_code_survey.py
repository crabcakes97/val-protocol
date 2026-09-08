#!/usr/bin/env python3
"""dead_code_survey.py -- code-cave + dead-code survey near hooks (read-only).

Proven constraint (signed modem anatomy): 5,664 zero-caves / 2.9MB exist in
md1rom, but ZERO >=1.1KB caves sit within +/-128KB of the 8 nevada hooks
(nearest: 28B paddings at +227KB; nearest big cave 6.8MB away -- out of
branch reach). Payload room must therefore come from DEAD CODE near a hook,
not distant caves. Zeros != executable without MPU changes.

This tool, given an image + hook file-offsets: (1) maps zero caves >=
threshold, (2) finds function prologues with no code xref (dead-code
candidates), (3) ranks both by distance to the nearest hook with branch
reachability (AArch64 B +/-128MB, ADRP +/-4GB), (4) emits JSON + table.
Works on md1rom carves, LK payloads, or GZ payloads (--arch arm64 default).
"""
from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path

B_RANGE = 128 * 1024 * 1024  # AArch64 unconditional branch reach


def find_zero_caves(data: bytes, min_size: int) -> list[dict]:
    caves = []
    i, n = 0, len(data)
    while i < n:
        if data[i] == 0:
            j = i
            while j < n and data[j] == 0:
                j += 1
            if j - i >= min_size:
                caves.append({"offset": hex(i), "size": j - i})
            i = j
        else:
            i += 1
    return caves


def find_prologues(data: bytes) -> list[int]:
    # stp x29,x30,[sp,#-..]! variants: 0xA9BF7BFD-ish family + pacibsp hint
    out = []
    for off in range(0, len(data) - 4, 4):
        w = struct.unpack_from("<I", data, off)[0]
        if (w & 0xFFC003FF) == 0xA98003FD or w == 0xD503233F:
            out.append(off)
    return out


def has_code_ref(data: bytes, base: int, target_off: int) -> bool:
    # Any BL/ADRP resolving into target_off?
    va = base + target_off
    for off in range(0, len(data) - 4, 4):
        w = struct.unpack_from("<I", data, off)[0]
        if (w & 0xFC000000) == 0x94000000:  # BL
            imm = w & 0x3FFFFFF
            if imm & 0x2000000:
                imm -= 0x4000000
            if base + off + imm * 4 == va:
                return True
        elif (w & 0x9F000000) == 0x90000000:  # ADRP (page check only)
            cur = base + off
            imm = (((w >> 5) & 0x7FFFF) << 2) | ((w >> 29) & 0x3)
            if imm & 0x100000:
                imm -= 0x200000
            if (cur & ~0xFFF) + imm * 0x1000 == (va & ~0xFFF):
                return True
    return False


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("image")
    p.add_argument("--hooks", required=True,
                   help="comma-separated hook file offsets hex, e.g. 0x1a17c30,...")
    p.add_argument("--base", default="0x90000000")
    p.add_argument("--min-cave", type=int, default=1126,
                   help="min cave bytes (default 1126 = 1.1KB payload)")
    p.add_argument("--near", type=int, default=128 * 1024,
                   help="nearness window bytes (default 128KB)")
    p.add_argument("-o", "--out", default=None)
    args = p.parse_args()
    data = Path(args.image).read_bytes()
    base = int(args.base, 16)
    hooks = [int(h, 16) for h in args.hooks.split(",") if h.strip()]

    caves = find_zero_caves(data, args.min_cave)
    prologs = find_prologues(data)

    def nearest_hook(off: int) -> int:
        return min(abs(off - h) for h in hooks)

    ranked_caves = sorted(
        ({"offset": c["offset"], "size": c["size"],
          "nearest_hook_dist": nearest_hook(int(c["offset"], 16)),
          "in_branch_reach": nearest_hook(int(c["offset"], 16)) <= B_RANGE}
         for c in caves),
        key=lambda d: d["nearest_hook_dist"])
    near_caves = [c for c in ranked_caves
                  if c["nearest_hook_dist"] <= args.near]

    dead = []
    for po in prologs:
        if not has_code_ref(data, base, po):
            d = nearest_hook(po)
            if d <= args.near:
                # read 64 bytes to show it is real code, not data
                dead.append({"offset": hex(po), "nearest_hook_dist": d,
                             "head": data[po:po + 16].hex()})
    dead.sort(key=lambda d: d["nearest_hook_dist"])

    result = {"image": args.image, "hooks": [hex(h) for h in hooks],
              "caves_total": len(caves),
              "caves_near": near_caves[:30],
              "dead_code_near": dead[:40]}
    out = Path(args.out or (Path(args.image).name + ".deadcode.json"))
    out.write_text(json.dumps(result, indent=1))
    print(f"caves>={args.min_cave}B: {len(caves)} total, "
          f"{len(near_caves)} within +/-{args.near // 1024}KB of a hook")
    for c in near_caves[:15]:
        print(f"  cave {c['offset']} size={c['size']}")
    print(f"dead-code candidates near hooks: {len(dead)}")
    for d in dead[:20]:
        print(f"  func {d['offset']} dist={d['nearest_hook_dist']} head={d['head']}")
    print(f"JSON: {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
