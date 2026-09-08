#!/usr/bin/env python3
"""gz_region_parser.py -- parse GenieZone static region lists (read-only).

Targets (see hypervisor-map.md): `all_mem_region` / `oem_all_mem_region`
static map data + the live `gz_log` RKP unmap2 / trusty-share lines. Static
parse first (no device needed), live log cross-check second.

Static method: find the list-name strings in the gz payload, resolve
ADRP+ADD/ADR code xrefs to the referencing code, then read the DATA xrefs:
each region entry is expected to be (addr:u64, size:u64, prot:u32) with addr
in DRAM and size page-aligned. Anything not matching the shape is reported
as candidate bytes, never asserted. Output: JSON + summary table.
"""
from __future__ import annotations

import argparse
import json
import re
import struct
from pathlib import Path

LISTS = (b"all_mem_region", b"oem_all_mem_region")
DRAM_MIN, DRAM_MAX = 0x40000000, 0x300000000  # sanity window incl. iova shares


def str_hits(data: bytes, needle: bytes) -> list[int]:
    out, s = [], 0
    while True:
        i = data.find(needle, s)
        if i < 0:
            return out
        out.append(i)
        s = i + 1


def code_refs(data: bytes, base: int, va: int) -> list[int]:
    out = []
    for off in range(0, len(data) - 20, 4):
        w = struct.unpack_from("<I", data, off)[0]
        if (w & 0x9F000000) == 0x90000000:
            cur = base + off
            imm = (((w >> 5) & 0x7FFFF) << 2) | ((w >> 29) & 0x3)
            if imm & 0x100000:
                imm -= 0x200000
            if (cur & ~0xFFF) + imm * 0x1000 != (va & ~0xFFF):
                continue
            rd = w & 0x1F
            w2 = struct.unpack_from("<I", data, off + 4)[0]
            if (w2 & 0xFF800000) == 0x91000000 and ((w2 >> 5) & 0x1F) == rd:
                imm12 = (w2 >> 10) & 0xFFF
                if ((cur & ~0xFFF) + imm * 0x1000) + imm12 == va:
                    out.append(off)
        elif (w & 0x9F000000) == 0x10000000:
            cur = base + off
            imm = (((w >> 5) & 0x7FFFF) << 2) | ((w >> 29) & 0x3)
            if imm & 0x100000:
                imm -= 0x200000
            if cur + imm * 4 == va:
                out.append(off)
    return out


def looks_like_region(data: bytes, off: int):
    if off + 24 > len(data):
        return None
    addr, size, prot, _pad = struct.unpack_from("<QQII", data, off)
    if not (DRAM_MIN <= addr <= DRAM_MAX):
        return None
    if size == 0 or size & 0xFFF:
        return None
    if prot & 0xFFFF0000:
        return None
    return {"offset": hex(off), "addr": hex(addr), "size": hex(size),
            "prot": prot}


def scan_table(data: bytes, anchor_off: int, span: int = 0x2000) -> list[dict]:
    # The list data usually sits near its name string; scan the neighborhood
    # for consecutive region-shaped entries.
    found, run = [], []
    lo = max(0, anchor_off - span)
    for off in range(lo, min(len(data) - 24, anchor_off + span), 8):
        r = looks_like_region(data, off)
        if r:
            run.append(r)
        elif run:
            if len(run) >= 2:
                found.extend(run)
            run = []
    if len(run) >= 2:
        found.extend(run)
    return found


def parse_live_log(path: Path) -> dict:
    text = path.read_text(errors="replace")
    unmaps = re.findall(
        r"unmapping (\S+) \[SR:(\d+)\]\[([0-9a-fA-F]+)\]\[([0-9a-fA-F]+)\]"
        r"\[ipa:[0-9a-fA-F]+\]\[size:(0x[0-9a-fA-F]+)\]\[PERM:(\d+)\]", text)
    shares = sorted(set(re.findall(
        r"reg share region: iova_base=(0x[0-9a-fA-F]+) size=(0x[0-9a-fA-F]+)",
        text)))
    return {"unmaps": [
        {"victim": v, "sr": int(sr), "start": f"0x{a}", "end": f"0x{b}",
         "size": sz, "perm": int(p)} for v, sr, a, b, sz, p in unmaps],
        "share_windows": [f"{a}+{s}" for a, s in shares]}


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("image", help="gz payload (extracted or partition backup)")
    p.add_argument("--base", default="0x0", help="link base hex (gz links at 0)")
    p.add_argument("--live-log", default=None, help="gz_log_live.txt for x-check")
    p.add_argument("-o", "--out", default=None)
    args = p.parse_args()
    data = Path(args.image).read_bytes()
    base = int(args.base, 16)
    result: dict = {"image": args.image, "lists": {}}
    for name in LISTS:
        hits = str_hits(data, name)
        entry = {"str_offsets": [hex(h) for h in hits], "regions": []}
        for h in hits[:4]:
            refs = code_refs(data, base, base + h)
            entry.setdefault("refs", []).extend(hex(r) for r in refs[:6])
            entry["regions"].extend(scan_table(data, h))
        # de-dup regions by offset
        seen, uniq = set(), []
        for r in entry["regions"]:
            if r["offset"] not in seen:
                seen.add(r["offset"])
                uniq.append(r)
        entry["regions"] = uniq
        result["lists"][name.decode()] = entry
    if args.live_log:
        result["live"] = parse_live_log(Path(args.live_log))
    out = Path(args.out or (Path(args.image).name + ".gzregions.json"))
    out.write_text(json.dumps(result, indent=1))
    for lname, lent in result["lists"].items():
        print(f"{lname}: {len(lent['str_offsets'])} str hits, "
              f"{len(lent.get('refs', []))} refs, "
              f"{len(lent['regions'])} region-shaped entries")
        for r in lent["regions"][:20]:
            print(f"  {r['offset']} addr={r['addr']} size={r['size']} prot={r['prot']}")
    if "live" in result:
        n_un = len(result['live']['unmaps'])
        n_pm0 = sum(1 for u in result['live']['unmaps'] if u['perm'] == 0)
        print(f"live log: {n_un} unmap entries ({n_pm0} PERM:0); "
              f"shares={result['live']['share_windows']}")
    print(f"JSON: {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
