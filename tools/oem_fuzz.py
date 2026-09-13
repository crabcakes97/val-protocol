#!/usr/bin/env python3
"""oem fuzz v1 (read-only): enumerate fastboot oem/getvar surface for
hidden subcommands, crashes (hang/drop/reboot), and new strings.
Discipline: one command per fresh state, 15s timeout, Send of stock
client only (no DATA), reboot-or-stop on wedge. NEVER sends: lock,
unlock, cid_prov_req, off-mode-charge, fb_mode_set/clear with args,
config <name> <value> writes, hwid add/remove, partition writes.
Usage: python3 oem_fuzz.py [--slot ZT4229CJG5] [--out fuzz1.jsonl]
"""
import argparse
import json
import subprocess
import sys
import time

SER = "ZT4229CJG5"

BARE = [
    ["oem", "help"],
    ["oem", "ramdump"],
    ["oem", "config", "bootmode"],
    ["oem", "config", "console"],
    ["oem", "config", "enable_fulldump"],
    ["oem", "config", "factory_kill_timeout"],
    ["oem", "config", "carrier"],
    ["oem", "config", "battery"],
    ["oem", "hw"],
    ["oem", "hwid"],
    ["oem", "fb_mode_set"],
    ["oem", "show_screen"],
    ["oem", "partition"],
    ["oem", "read_sv"],
    ["oem", "get_unlock_data"],
    ["oem", "readdump"],
]

MUT_NAMES = [
    "",
    "A" * 64,
    "A" * 256,
    "%s",
    "%x%x%x",
    "%n",
    "../utags",
    "bootmode ",
    " BOOTMODE",
    "BootMode",
    "config",
    "mmi,factory-cable",
    "enable_fulldump\x00extra",
    "factory_kill_timeout ",
]

GETVARS = [
    "all",
    "current-slot",
    "version-bootloader",
    "serialno",
    "unlocked",
    "foo",
    "%s",
]


def run(args, timeout=15):
    cmd = ["fastboot", "-s", SER] + args
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        out = (r.stdout or "") + (r.stderr or "")
        return {"rc": r.returncode, "out": out[:2000], "timeout": False}
    except subprocess.TimeoutExpired as e:
        out = ((e.stdout or b"") + (e.stderr or b"")).decode("utf-8", "replace")[:2000]
        return {"rc": None, "out": out, "timeout": True}


def alive():
    r = run(["getvar", "current-slot"], timeout=10)
    return (not r["timeout"]) and "current-slot:" in r["out"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default="fuzz1.jsonl")
    args = ap.parse_args()
    cases = []
    for c in BARE:
        cases.append(("bare", c))
    for n in MUT_NAMES:
        cases.append(("mut", ["oem", "config", n]))
    for g in GETVARS:
        cases.append(("getvar", ["getvar", g]))
    print(f"cases: {len(cases)} device={SER}")
    if not alive():
        print("device not answering; replug/buttons first")
        return 2
    hits = 0
    with open(args.out, "w") as f:
        for i, (kind, c) in enumerate(cases):
            label = " ".join(c)
            r = run(c)
            lines = [l for l in r["out"].splitlines() if "(bootloader)" in l]
            anomaly = ""
            if r["timeout"]:
                anomaly = "TIMEOUT"
            elif "FAILED" in r["out"] and "not a supported" not in r["out"] \
                    and "not supported" not in r["out"] and "no such utag" not in r["out"]:
                anomaly = "FAIL-OTHER"
            rec = {"i": i, "kind": kind, "cmd": label, "rc": r["rc"],
                   "timeout": r["timeout"], "nlines": len(lines),
                   "anomaly": anomaly,
                   "sample": lines[:4]}
            f.write(json.dumps(rec) + "\n")
            f.flush()
            flag = f"  <-- {anomaly}" if anomaly else ""
            print(f"[{i:02d}] {label:42s} rc={r['rc']} lines={len(lines)}{flag}")
            if anomaly == "TIMEOUT":
                time.sleep(3)
                if not alive():
                    print("WEDGE: device stopped answering, stopping (replug + buttons)")
                    break
                print("recovered after timeout, continuing")
            hits += 1
            time.sleep(0.7)
    print(f"done {hits}/{len(cases)} -> {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
