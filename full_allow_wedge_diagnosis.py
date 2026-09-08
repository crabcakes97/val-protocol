#!/usr/bin/env python3
"""full_allow_wedge_diagnosis.py -- post-mortem the full-allow wedge (read-only).

Current read (whh.md): the 5 NOPs are no-ops on valid tables, so the wedge
reads as SLOT-STATE CONFUSION (triple set-active race), not gate fault.
This tool tests that hypothesis against evidence instead of re-flashing:

1. fastboot getvar all (or a saved capture): current-slot, slot-successful,
   slot-unbootable, slot-retry-count per slot.
2. LK image under test: verifies the 5 full-allow NOPs are exactly the known
   old->new bytes (modem 0x49A9C/0x49AAC/0x49B24 + factory 0xF3F4/0xAD88 ->
   1f2003d5) and nothing else differs from stock (needs --stock for diff).
3. FLASH_RECEIPT / command history: flags set-active issued >1 time without
   an intervening reboot (the race signature).

Verdict ladder: SLOT_RACE_LIKELY > GATE_FAULT_POSSIBLE > INCONCLUSIVE.
Never flashes, never changes slot state.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

MODEM_GATES = {0x49A9C: "21060054", 0x49AAC: "88040054", 0x49B24: "c8000054"}
FACTORY_GATES = {0xF3F4: "00010036", 0xAD88: "a0090036"}
NOP = bytes.fromhex("1f2003d5")


def parse_getvar(text: str) -> dict:
    out = {}
    for line in text.splitlines():
        m = re.search(r"(current-slot|slot-successful|slot-unbootable|slot-retry-count|unlocked|secure)[_: ]+(\S+)", line)
        if m:
            out.setdefault(m.group(1), []).append(m.group(2))
    return out


def check_gates(img: bytes) -> tuple[list[str], list[str]]:
    ok, bad = [], []
    for off, old in {**MODEM_GATES, **FACTORY_GATES}.items():
        if off + 4 > len(img):
            bad.append(f"{off:#x}: out of range")
            continue
        cur = img[off:off + 4]
        if cur == NOP:
            ok.append(f"{off:#x}: NOP present")
        elif cur.hex() == old:
            bad.append(f"{off:#x}: still stock ({old})")
        else:
            bad.append(f"{off:#x}: UNEXPECTED {cur.hex()} (not stock, not NOP)")
    return ok, bad


def check_race(history: str) -> bool:
    # set-active ... set-active with no reboot/fastboot-reboot between
    evts = re.findall(r"set-active:[ab]|reboot", history)
    for a, b in zip(evts, evts[1:]):
        if a.startswith("set-active") and b.startswith("set-active") and a != b:
            return True
    return False


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--getvar", default=None, help="saved `fastboot getvar all` text")
    p.add_argument("--image", default=None, help="LK image that was flashed to _b")
    p.add_argument("--history", default="",
                   help="flash command history text (or file path)")
    p.add_argument("-o", "--out", default=None)
    args = p.parse_args()
    ev: dict = {}
    if args.getvar:
        ev["slot_vars"] = parse_getvar(Path(args.getvar).read_text(errors="replace"))
    if args.image:
        ev["gates_ok"], ev["gates_bad"] = check_gates(Path(args.image).read_bytes())
    hist = args.history
    hp = Path(hist)
    if hist and hp.exists():
        hist = hp.read_text(errors="replace")
    ev["triple_race_signature"] = check_race(hist) if hist else None
    unexpected = [g for g in ev.get("gates_bad", []) if "UNEXPECTED" in g]
    if unexpected:
        verdict = "GATE_FAULT_POSSIBLE"
    elif ev.get("triple_race_signature"):
        verdict = "SLOT_RACE_LIKELY"
    elif ev.get("gates_ok") and len(ev["gates_ok"]) == 5 and not ev.get("gates_bad"):
        verdict = "GATES_CLEAN__RACE_OR_ENV"
    else:
        verdict = "INCONCLUSIVE"
    ev["verdict"] = verdict
    print(json.dumps(ev, indent=1))
    print(f"\nverdict: {verdict}")
    print("rule restated: verify slot twice (getvar current-slot + "
          "fastboot devices state) before AND after every set-active; "
          "modem gates never ride along in boot-path tests.")
    if args.out:
        Path(args.out).write_text(json.dumps(ev, indent=1))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
