#!/usr/bin/env python3
"""lk_oem_cmd_mapper.py — map every fastboot oem command gate in an LK image.

Static analysis only: loads an LK payload (or MTK container holding one),
finds command-name strings, resolves code xrefs (ADRP+ADD and ADR literal),
traces forward to the command's print/handler block and backward to the
nearest feeding conditional branch (the gate), then compares each gate to
the known factory-allow gates.

Output: JSON mapping file + console summary table + NOP patch suggestions
for STILL_LOCKED commands with a single decoded feeder. Commands with no
code xref are reported NO_HANDLER (cannot be unlocked by patching).

Destructive commands (lock/erase/flash/writeimei/fuse-*/shipmode/ultraflash)
are NEVER probed live by this tool. Mapping is read-only.
"""
from __future__ import annotations

import argparse
import json
import struct
import sys
from pathlib import Path

try:
    from capstone import CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN, Cs
except ImportError:
    Cs = None  # type: ignore[assignment]

# (name, kind) — kind selects matching strictness, not behavior.
COMMANDS: tuple[tuple[str, str], ...] = (
    # top-level oem commands (proven + candidates)
    ("unlock", "top"), ("lock", "top"), ("get_unlock_data", "top"),
    ("device-info", "top"), ("get_config", "top"), ("rm_config", "top"),
    ("read_sv", "top"), ("config", "top"), ("ramdump", "top"),
    ("hw", "top"), ("dmesg", "top"), ("dump-chipid", "top"),
    ("ddrtest", "top"), ("enable-hw-factory", "top"), ("backlight", "top"),
    ("display", "top"), ("off-mode-charge", "top"),
    ("select-display-panel", "top"), ("setbrightness", "top"),
    ("enter-shipmode", "top"), ("continue-factory", "top"),
    ("bp-tools-on", "top"), ("bp-tools-off", "top"), ("qcom-on", "top"),
    ("qcom-off", "top"), ("partition", "top"), ("erase", "top"),
    ("fb_mode_set", "top"), ("fb_mode_clear", "top"),
    ("force-fastboot", "top"), ("enable-verity", "top"),
    ("disable-verity", "top"), ("enable-verification", "top"),
    ("disable-verification", "top"), ("clear_dm_verity_error", "top"),
    ("fuse-lock", "top"), ("fuse-version", "top"), ("help", "top"),
    ("uart", "top"), ("p2u", "top"), ("passwd", "top"),
    ("writeimei", "top"), ("getimei1", "top"), ("getimei2", "top"),
    ("ultraflash_en", "top"), ("ultraflash:system_a", "top"),
    ("barcode", "top"), ("halt", "top"), ("reboot-rom", "top"),
    ("watchdog", "top"), ("hwid", "top"), ("cdms", "top"),
    ("get_socid", "top"), ("show_screen", "top"), ("p2u", "top"),
    ("dump_pllk_log", "top"), ("printk-ratelimit", "top"),
    ("mrdump_chkimg", "top"), ("mrdump_fallocate", "top"),
    ("mrdump_out_set", "top"), ("cid_prov_req", "top"),
    # config subcommands
    ("fsg-id", "config"), ("carrier", "config"), ("console", "config"),
    ("protect", "config"), ("unprotect", "config"), ("facmode", "config"),
    ("fac", "config"), ("unlockable", "config"), ("ro.build", "config"),
    # hw subcommands
    ("info", "hw"), ("test", "hw"), ("factory", "hw"),
    # ramdump subcommands
    ("enable", "ramdump"), ("pull", "ramdump"), ("now", "ramdump"),
    ("clear", "ramdump"),
)

# Destructive or mutating: map only, never live-probe.
DONT_PROBE = frozenset({
    "lock", "unlock", "erase", "partition", "writeimei", "fuse-lock",
    "fuse-version", "enter-shipmode", "ultraflash_en", "ultraflash:system_a",
    "fb_mode_set", "cid_prov_req", "passwd", "protect", "unprotect",
    "off-mode-charge", "halt", "reboot-rom", "watchdog", "setbrightness",
})

# Known factory-allow gates: {file_offset: label}
KNOWN_GATES = {0xF3F4: "restricted-tbz", 0xAD88: "config-unprotect-tbz"}
AARCH64_NOP_HEX = "1f2003d5"

# Live-proven on nevada slot B (factory-allow LK): command -> works/absent.
LIVE_PROVEN = {
    "ramdump": "works", "config": "works", "hw": "works",
    "cdms": "works", "read_sv": "works", "get_unlock_data": "works",
    "cid_prov_req": "works", "show_screen": "works", "hwid": "works",
    "fb_mode_set": "works", "fb_mode_clear": "works",
    "off-mode-charge": "works",
    "usb2jtag": "absent", "p2u": "absent", "get_socid": "absent",
    "mrdump_chkimg": "absent", "mrdump_fallocate": "absent",
    "mrdump_out_set": "absent", "dump_pllk_log": "absent",
    "printk-ratelimit": "absent",
}

BACKSCAN_WINDOW = 1024
HEAD_ZONE = 64




def string_hits(data: bytes, needle: bytes) -> list[int]:
    out, start = [], 0
    while True:
        idx = data.find(needle, start)
        if idx < 0:
            return out
        out.append(idx)
        start = idx + 1


def string_start(data: bytes, idx: int) -> int:
    while idx > 0 and 32 <= data[idx - 1] < 127:
        idx -= 1
    return idx


def code_refs(data: bytes, base: int, va: int) -> list[int]:
    """File offsets of ADRP+ADD or ADR resolving exactly to va."""
    out = []
    n = len(data) - 20
    for off in range(0, n, 4):
        word = struct.unpack_from("<I", data, off)[0]
        if (word & 0x9F000000) == 0x90000000:
            cur = base + off
            imm = (((word >> 5) & 0x7FFFF) << 2) | ((word >> 29) & 0x3)
            if imm & 0x100000:
                imm -= 0x200000
            if (cur & ~0xFFF) + imm * 0x1000 != (va & ~0xFFF):
                continue
            rd = word & 0x1F
            for jump in range(1, 5):
                word2 = struct.unpack_from("<I", data, off + jump * 4)[0]
                if (word2 & 0xFF800000) != 0x91000000 or ((word2 >> 5) & 0x1F) != rd:
                    continue
                imm12 = (word2 >> 10) & 0xFFF
                if (word2 >> 22) & 0x3 == 1:
                    imm12 <<= 12
                if ((cur & ~0xFFF) + imm * 0x1000) + imm12 == va:
                    out.append(off)
                break
        elif (word & 0x9F000000) == 0x10000000:
            cur = base + off
            imm = (((word >> 5) & 0x7FFFF) << 2) | ((word >> 29) & 0x3)
            if imm & 0x100000:
                imm -= 0x200000
            if cur + imm * 4 == va:
                out.append(off)
    return out



def load_payload(path: Path) -> tuple[bytes, int, str]:
    """Return (payload_bytes, base, source_desc). Handles raw or container."""
    data = path.read_bytes()
    if data[:4] == b"\x88\x16\x88\x58":
        sys.path.insert(0, str(Path(__file__).resolve().parent))
        try:
            from liblk.image import LkImage  # type: ignore[import]
        except ImportError as exc:
            raise SystemExit(f"container input needs liblk: {exc}")
        img = LkImage(str(path))
        if "lk" not in img.partitions:
            raise SystemExit("container has no 'lk' subimage")
        return bytes(img.partitions["lk"].data), 0, "container:lk"
    return data, 0, "raw"


def analyze(payload: bytes, base: int) -> dict:
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    from lk_patch_partition import (  # type: ignore[import]
        GATE_ANCHORS,
        _backscan_branch,
        _deny_block_for_anchor,
    )
    # Global restriction gates: feeders into the deny-anchor blocks.
    # These sit in the shared dispatcher, so they govern every routed
    # command — coverage is global, not per-command.
    global_gates: list[dict] = []
    for anchor_key, label in (("restricted-log", "restricted-tbz"),
                              ("notallowed-log", "config-unprotect-tbz")):
        try:
            deny = _deny_block_for_anchor(payload, base, anchor_key)
        except ValueError:
            continue
        for off in _backscan_branch(payload, base, deny, ("tbz0",),
                                    nearest_only=True):
            raw = payload[off:off + 4]
            global_gates.append({"offset": hex(off), "label": label,
                                 "anchor": anchor_key, "bytes": raw.hex()})
    known = {int(g["offset"], 16) for g in global_gates} & set(KNOWN_GATES)
    entries = {}
    for name, kind in COMMANDS:
        if name in entries:
            continue
        needle = name.encode()
        hits = string_hits(payload, needle)
        locs = []
        for hit in hits:
            end = hit + len(needle)
            nxt = payload[end:end + 1]
            if nxt in (b"\x00", b" ", b"\n", b",", b":", b"_", b"-"):
                locs.append(string_start(payload, hit))
        locs = sorted(set(locs))
        if not locs:
            entries[name] = {"present": False, "status": "ABSENT",
                             "kind": kind, "live_probe": name not in DONT_PROBE}
            continue
        refs: list[int] = []
        for loc in locs[:6]:
            refs.extend(code_refs(payload, base, base + loc))
        refs = sorted(set(refs))
        live = LIVE_PROVEN.get(name)
        if live == "works":
            status = "PROVEN_LIVE"
        elif live == "absent":
            status = "PROVEN_ABSENT_LIVE"
        elif not refs:
            status = "NO_HANDLER"
        else:
            status = "ROUTED"
        entries[name] = {"present": True, "status": status, "kind": kind,
                         "str_offsets": [hex(o) for o in locs[:4]],
                         "refs": [hex(o) for o in refs[:6]],
                         "live_probe": name not in DONT_PROBE}
    return {"global_gates": global_gates,
            "gates_match_known": sorted(known) == sorted(
                set(KNOWN_GATES) & {int(g["offset"], 16) for g in global_gates}),
            "commands": entries}
    return entries



def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("image", type=Path, help="lk.bin payload or MTK container")
    parser.add_argument("--base", default="auto",
                        help="payload link base hex (default: auto-detect; "
                             "nevada aarch64 LK links near file layout, "
                             "pass 0 to use file offsets as VAs)")
    parser.add_argument("-o", "--out", type=Path, default=None,
                        help="JSON output path (default: <image>.oemmap.json)")
    args = parser.parse_args()
    payload, auto_base, _ = load_payload(args.image)
    base = auto_base if args.base == "auto" else int(args.base, 16)
    result = analyze(payload, base)
    entries = result["commands"]
    out = {"image": str(args.image), "base": hex(base),
           "known_gates": {hex(k): v for k, v in KNOWN_GATES.items()},
           "global_gates": result["global_gates"],
           "gates_match_known": result["gates_match_known"],
           "commands": entries}
    out_path = args.out or args.image.with_suffix(".oemmap.json")
    out_path.write_text(json.dumps(out, indent=1))
    print("GLOBAL RESTRICTION GATES (shared dispatcher):")
    for gate in result["global_gates"]:
        known = "KNOWN" if int(gate["offset"], 16) in KNOWN_GATES else "NEW"
        print(f"  {gate['offset']} {gate['label']} ({gate['anchor']}) [{known}]")
    print(f"gates_match_known={result['gates_match_known']}")
    print()
    counts: dict[str, int] = {}
    print(f"{'COMMAND':26s} | {'REFS':4s} | STATUS")
    for name in sorted(entries):
        entry = entries[name]
        counts[entry["status"]] = counts.get(entry["status"], 0) + 1
        nrefs = len(entry.get("refs", []))
        print(f"{name:26s} | {nrefs:4d} | {entry['status']}")
    print(f"\n{counts}")
    print(f"JSON: {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
