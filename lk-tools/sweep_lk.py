#!/usr/bin/env python3
"""Sweep LK's mapped 1MB via readdump+16K: 64 calls, concat, verify.
Usage: sweep_lk.py <outdir>
Stops cold on first short read (never hammer a wedged board).
"""
import subprocess
import sys
import time
from pathlib import Path

BASE = 0xFFFF000050F00000
CHUNK = 0x4000
N = 64
_HERE = Path(__file__).resolve().parent
REF = Path(sys.argv[2]) if len(sys.argv) > 2 else None  # optional lk.bin for verify

outdir = Path(sys.argv[1])
outdir.mkdir(parents=True, exist_ok=True)

for k in range(N):
    addr = BASE + k * CHUNK
    arg = f"{addr:016x}+"
    part = outdir / f"part_{k:02d}.bin"
    r = subprocess.run(
        [sys.executable, str(_HERE / "fb_dump.py"), "oem", "readdump", arg, str(part)],
        capture_output=True, text=True, timeout=120,
    )
    tail = (r.stdout or "")[-200:]
    ok = part.exists() and part.stat().st_size == CHUNK and "okay=True" in tail
    print(f"[{k:02d}/63] {arg} {part.stat().st_size if part.exists() else -1}B {'OK' if ok else 'FAIL'}", flush=True)
    if not ok:
        print("--- stdout ---"); print(tail)
        print("--- stderr ---"); print((r.stderr or "")[-500:])
        raise SystemExit(f"stopping at chunk {k}")
    time.sleep(1)

blob = bytearray()
for k in range(N):
    blob += (outdir / f"part_{k:02d}.bin").read_bytes()
(outdir / "lk_1mb.bin").write_bytes(bytes(blob))
print(f"swept {len(blob)}B -> {outdir / 'lk_1mb.bin'}")

if REF is None:
    print("no reference lk.bin given; skipping verify (usage: sweep_lk.py OUTDIR [LK.BIN])")
else:
    ref = open(REF, "rb").read()[: len(blob)]
    diffs = sum(1 for a, b in zip(blob, ref) if a != b)
    print(f"vs file payload: {diffs}/{len(blob)} differ ({100*diffs/len(blob):.2f}%)")
