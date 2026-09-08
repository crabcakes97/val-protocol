#!/usr/bin/env python3
"""bl2_ext_patcher.py -- static analysis + gated patch builder for bl2_ext images.

Stage: BL2-ext (EL3-adjacent early boot). WRONG BYTES HERE BRICK PAST
FASTBOOT: bl2_ext has NO A/B safety net on the flash path itself (a bad
bl2_ext_b still boots slot A fine, but a confused slot state can wedge you).
Standing rules apply twice here:

- Report-only by default. --apply needs --unsafe AND explicit --old-bytes
  (unknown build = instant refuse; there is NO known-build table yet because
  bl2_ext was verified, never patched: boot logs show
  `bl2_ext cert vfy -> ok`, sbc_en=1, img_auth_required=1).
- Any flash command printed names bl2_ext_b ONLY. Preloader/efuse/fuses are
  never named. Output is trimmed to the exact input size, re-signed with
  tools/sign_mtk_cert.py, re-verified with tools/verify_mtk_image.py
  (Result must be VALID or the artifact is deleted).
- This tool NEVER flashes. It prints the commands for you to run by hand.

Method (fenrir-style): locate `sec_get_vfy_policy` (or the bl2_ext cert-verify
log anchor), resolve its function entry via ADRP+ADD/ADR xrefs + prologue
backscan, and replace the entry with `mov w0, #0; ret`
(00 00 80 52 | C0 03 5F D6) so the policy check reports "verify OK, no
enforcement". 8 bytes, old-byte gated.
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
SLOT = "b"  # hardcoded testbed slot; slot A is never named
FORBIDDEN_TARGETS = ("preloader", "efuse", "seccfg", "nvram", "nvdata",
                     "bl2_ext_a", "lk_a", "gz_a", "md1img_a")
PATCH_INSN_HEX = "00008052c0035fd6"  # mov w0,#0; ret (8 bytes)
ANCHORS = (b"sec_get_vfy_policy", b"bl2_ext cert vfy", b"img_auth_required",
           b"cert vfy", b"sbc_en")

try:
    from capstone import CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN, Cs
except ImportError:
    Cs = None


def refuse(msg: str) -> int:
    print(f"REFUSED: {msg}")
    return 2


def find_strings(data: bytes) -> dict[bytes, list[int]]:
    out: dict[bytes, list[int]] = {}
    for a in ANCHORS:
        hits, start = [], 0
        while True:
            i = data.find(a, start)
            if i < 0:
                break
            hits.append(i)
            start = i + 1
        if hits:
            out[a] = hits
    return out


def adrp_add_refs(data: bytes, base: int, va: int) -> list[int]:
    out = []
    for off in range(0, len(data) - 20, 4):
        w = struct.unpack_from("<I", data, off)[0]
        if (w & 0x9F000000) != 0x90000000:
            continue
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
            if (w2 >> 22) & 0x3 == 1:
                imm12 <<= 12
            if ((cur & ~0xFFF) + imm * 0x1000) + imm12 == va:
                out.append(off)
    return out


def func_entry_backscan(data: bytes, ref_off: int) -> int | None:
    # Walk back for AArch64 prologue: STP x29,x30,[sp,#..]! is f8/f9-pattern;
    # accept PACBTI `hint` or plain `stp`. Cap at 4KB.
    if Cs is None:
        return None
    md = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)
    md.detail = False
    start = max(0, ref_off - 4096) & ~3
    code = data[start:ref_off]
    entry = None
    for insn in md.disasm(code, start):
        m = insn.mnemonic
        if m in ("stp", "sub", "pacibsp", "hint") and "sp" in insn.op_str:
            entry = insn.address
    return entry


def cmd_report(args) -> int:
    data = Path(args.image).read_bytes()
    print(f"image: {args.image} ({len(data)} bytes, "
          f"sha256 {hashlib.sha256(data).hexdigest()[:16]}...)")
    print(f"container magic: {data[:4].hex()} "
          f"({'MTK 0x58881688' if data[:4] == bytes.fromhex('88168858') else 'raw?'})")
    hits = find_strings(data)
    if not hits:
        print("no verify-policy anchors found; unknown layout -> refuse patch.")
        return 0
    base = int(args.base, 16)
    for anchor, offs in hits.items():
        print(f"anchor {anchor!r}: {[hex(o) for o in offs[:6]]}")
        for o in offs[:3]:
            refs = adrp_add_refs(data, base, base + o)
            print(f"  str@{o:#x} refs: {[hex(r) for r in refs[:6]]}")
            for r in refs[:2]:
                e = func_entry_backscan(data, r)
                print(f"    ref@{r:#x} candidate entry: "
                      f"{hex(e) if e is not None else 'unresolved (need capstone)'}")
    print("\nreport-only: no bytes changed. To build a patch you must supply "
          "--apply --unsafe --old-bytes <8B-hex-at-entry> after confirming "
          "the entry disassembles to the verify-policy function.")
    return 0


def cmd_apply(args) -> int:
    if not args.unsafe:
        return refuse("--apply needs --unsafe (you own the brick risk)")
    if not args.old_bytes or len(args.old_bytes) != 16:
        return refuse("--old-bytes <16 hex chars> from YOUR image entry required")
    data = bytearray(Path(args.image).read_bytes())
    entry = int(args.entry, 16)
    old = bytes.fromhex(args.old_bytes)
    if bytes(data[entry:entry + 8]) != old:
        return refuse(f"old-byte mismatch at {entry:#x}: found "
                      f"{bytes(data[entry:entry+8]).hex()}, expected {args.old_bytes}")
    data[entry:entry + 8] = bytes.fromhex(PATCH_INSN_HEX)
    tmp = Path(args.out)
    tmp.write_bytes(bytes(data))
    # re-sign CERT2
    r = subprocess.run([sys.executable, str(HERE / "tools" / "sign_mtk_cert.py"),
                        "-w", str(tmp), "-o", str(tmp)], capture_output=True, text=True)
    print(r.stdout[-2000:])
    if r.returncode != 0:
        print(r.stderr[-2000:])
        return refuse("re-sign failed; artifact left unsigned on disk, NOT flashable")
    # exact-size trim (CERT2 insert grows the file; partitions are exact-fit)
    raw = tmp.read_bytes()
    if len(raw) > len(data):
        raw = raw[:len(data)] if all(b == 0 for b in raw[len(data):]) else raw
        if len(raw) != len(data):
            return refuse("re-signed image larger than partition and padding "
                          "is not trimmable; refusing to emit")
        tmp.write_bytes(raw)
    v = subprocess.run([sys.executable, str(HERE / "tools" / "verify_mtk_image.py"),
                        str(tmp)], capture_output=True, text=True)
    print(v.stdout[-2000:])
    if "VALID" not in v.stdout:
        tmp.unlink(missing_ok=True)
        return refuse("verify did not report VALID; artifact deleted")
    print(f"\nWROTE {tmp} ({len(raw)} bytes, VALID). Flash INACTIVE slot only:")
    print(f"  fastboot flash bl2_ext_{SLOT} {tmp}")
    print(f"  fastboot --set-active={SLOT}")
    print(f"  fastboot reboot bootloader   # PASS = fastboot answers")
    print(f"  fastboot --set-active=a      # home on any doubt")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("image", help="bl2_ext partition image (backup, never live)")
    p.add_argument("--base", default="0x0", help="payload link base hex")
    p.add_argument("--apply", action="store_true")
    p.add_argument("--unsafe", action="store_true")
    p.add_argument("--entry", default="0x0", help="function entry file offset hex")
    p.add_argument("--old-bytes", default="", help="16 hex chars expected at entry")
    p.add_argument("--out", default="/tmp/bl2_ext_patched.img")
    args = p.parse_args()
    for t in FORBIDDEN_TARGETS:
        if t in args.out:
            return refuse(f"output path names forbidden target {t}")
    if args.apply:
        return cmd_apply(args)
    return cmd_report(args)


if __name__ == "__main__":
    raise SystemExit(main())
