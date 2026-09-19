#!/usr/bin/env python3
"""valbridge_pull.py -- host half of VALBRIDGE: pull LK readdump jobs in fastboot.

Flow (phone starts in Android, rooted, jobs saved by VALBRIDGE app):
  1. adb pull /sdcard/valbridge/jobs.txt
  2. adb reboot bootloader, wait for fastboot
  3. per job line:  ADDR+ TAG  -> fb_dump.py DATA 16K pull -> out/TAG.bin
                    ADDR INFO.. -> distro fastboot INFO check, log only
  4. fastboot reboot, wait for adb, push results to /sdcard/valbridge/out/

Jobs: lowercase hex, no 0x (readdump rules). DATA addrs must be in the
flashed LK window table or the board faults (reboot-grade, slot A safe);
unlabeled/denied pulls are logged + skipped, sweep continues.

Usage:
  python lk-tools/valbridge_pull.py [--serial ZT4229CJG5] [--lk lk.bin]
      [--jobs jobs.txt] [--out out/]
  --lk: optional reference LK image; cave/lk pulls are byte-compared.
Needs: adb + fastboot in PATH, pyusb (for fb_dump.py), slot B readdump LK.
"""
import argparse
import os
import re
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
FBDUMP = os.path.join(HERE, "fb_dump.py")
DEV_JOBS = "/sdcard/valbridge/jobs.txt"
DEV_OUT = "/sdcard/valbridge/out"

JOB_RE = re.compile(r"^([0-9a-f]+)(\+?)\s+(\S+)\s*$")


def run(cmd, timeout=120):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
    return p.returncode, (p.stdout or "") + (p.stderr or "")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--serial", default="ZT4229CJG5")
    ap.add_argument("--lk", default=None)
    ap.add_argument("--jobs", default="jobs.txt")
    ap.add_argument("--out", default="out")
    a = ap.parse_args()
    S = a.serial
    os.makedirs(a.out, exist_ok=True)

    print("== 1. pull jobs ==")
    rc, o = run(["adb", "-s", S, "pull", DEV_JOBS, a.jobs])
    print(o[-2000:])
    if rc != 0 or not os.path.exists(a.jobs):
        sys.exit("jobs pull failed; save jobs in VALBRIDGE first")
    jobs = []
    for line in open(a.jobs):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        m = JOB_RE.match(line)
        if not m:
            print("skip malformed:", line)
            continue
        jobs.append((m.group(1), m.group(2) == "+", m.group(3)))
    print(f"{len(jobs)} jobs")

    lk = None
    if a.lk and os.path.exists(a.lk):
        lk = open(a.lk, "rb").read()
        print(f"ref LK {len(lk)}B")

    print("== 2. reboot bootloader ==")
    run(["adb", "-s", S, "reboot", "bootloader"])
    for _ in range(60):
        rc, o = run(["fastboot", "-s", S, "getvar", "current-slot"])
        if "current-slot: b" in o or "current-slot:b" in o.replace(" ", ""):
            break
        time.sleep(2)
    rc, o = run(["fastboot", "-s", S, "getvar", "current-slot"])
    print(o.strip()[-500:])
    if "b" not in o:
        sys.exit("slot is not b; abort (slot A NEVER flashed)")

    print("== 3. pulls ==")
    ok = deny = fail = 0
    for addr, is_data, tag in jobs:
        if not is_data:
            rc, o = run(["fastboot", "-s", S, "oem", "readdump", addr])
            n = o.count("INFO")
            print(f"INFO {addr} {tag}: {n} lines rc={rc}")
            open(os.path.join(a.out, tag + ".info.txt"), "w").write(o)
            ok += 1
            continue
        dest = os.path.join(a.out, tag + ".bin")
        rc, o = run([sys.executable, FBDUMP, "oem", "readdump", addr + "+",
                     dest], timeout=60)
        tail = o.strip().splitlines()[-3:] if o.strip() else []
        print(f"DATA {addr}+ {tag}: rc={rc} {' | '.join(tail)}")
        if os.path.exists(dest) and os.path.getsize(dest) == 16384:
            ok += 1
            if lk and tag.startswith("lk-"):
                try:
                    n = int(tag.split("-")[1])
                    want = lk[n * 0x4000:(n + 1) * 0x4000]
                    got = open(dest, "rb").read()
                    print("  verify:", "EXACT" if got == want else "DIFF!")
                except Exception as e:
                    print("  verify skip:", e)
        elif "deny" in o.lower() or "DENY" in o:
            deny += 1
        else:
            fail += 1
            rc2, o2 = run(["fastboot", "-s", S, "reboot", "bootloader"])
            time.sleep(8)  # fault drained; channel fresh
    print(f"== done: ok={ok} deny={deny} fail={fail} ==")

    print("== 4. reboot system + push results ==")
    run(["fastboot", "-s", S, "reboot"])
    run(["adb", "-s", S, "wait-for-device"], timeout=180)
    time.sleep(5)
    run(["adb", "-s", S, "shell", "su -c 'mkdir -p " + DEV_OUT + "'"])
    for f in sorted(os.listdir(a.out)):
        run(["adb", "-s", S, "push", os.path.join(a.out, f),
             DEV_OUT + "/" + f])
    print("results on device at", DEV_OUT, "-- open VALBRIDGE > Results")


if __name__ == "__main__":
    main()
