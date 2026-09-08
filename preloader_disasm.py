#!/usr/bin/env python3
"""preloader_disasm.py -- static disassembly of the Preloader image (read-only).

Preloader is BROM-verified (closed with receipts: SLA sbc_en=1,
img_auth_required=1). This tool only READS a backup (e.g. preloader_a.bin
from dump_all_bootchain.py): header/magic census, string table of security
anchors (SLA/DAA, cert vfy, brom-cmd, download-agent), vector table dump,
and capstone disassembly around the verify call sites (--around) or full
(--full-disasm to file). It never writes, never signs, never prints flash
commands for preloader (NO SLOT EXISTS for preloader -- there is no safety
net, so no flash path is offered at all).
"""
from __future__ import annotations

import argparse
import struct
from pathlib import Path

ANCHORS = (b"sla", b"daa", b"cert vfy", b"img_auth", b"brom", b"download agent",
           b"sec_boot", b"anti-rollback", b"DA_", b"SLA_")

try:
    from capstone import CS_ARCH_ARM, CS_ARCH_ARM64, CS_MODE_ARM, \
        CS_MODE_LITTLE_ENDIAN, Cs
except ImportError:
    Cs = None


def str_hits(data: bytes) -> dict[bytes, list[int]]:
    out = {}
    for a in ANCHORS:
        hits, s = [], 0
        blob = data.lower()
        while True:
            i = blob.find(a.lower(), s)
            if i < 0:
                break
            hits.append(i)
            s = i + 1
        if hits:
            out[a] = hits
    return out


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("image", help="preloader backup (read-only input)")
    p.add_argument("--arch", default="auto", choices=("auto", "arm64", "arm32"))
    p.add_argument("--around", default="",
                   help="comma-separated file offsets hex to disassemble +/-256B")
    p.add_argument("--full-disasm", default=None, help="write full disasm to file")
    args = p.parse_args()
    data = Path(args.image).read_bytes()
    print(f"image: {args.image} ({len(data)} bytes)")
    print(f"head: {data[:32].hex()}  magic32={struct.unpack_from('<I', data, 0)[0]:#x}")
    hits = str_hits(data)
    for a, offs in hits.items():
        print(f"anchor {a!r}: {len(offs)} hits e.g. {[hex(o) for o in offs[:5]]}")
    if Cs is None:
        print("capstone missing: pip install capstone==5.* for disassembly")
        return 0
    arch = args.arch
    if arch == "auto":
        arch = "arm64"  # MT6835 EL3-adjacent stages; override with --arch arm32
    md = Cs(CS_ARCH_ARM64 if arch == "arm64" else CS_ARCH_ARM,
            CS_MODE_LITTLE_ENDIAN if arch == "arm64" else CS_MODE_ARM)
    for tok in (t for t in args.around.split(",") if t.strip()):
        off = int(tok, 16)
        lo = max(0, off - 256)
        print(f"--- disasm around {off:#x} ({arch}) ---")
        for insn in md.disasm(data[lo:off + 256], lo):
            mark = " <--" if insn.address == off else ""
            print(f"  {insn.address:#x} {insn.mnemonic:10s} {insn.op_str}{mark}")
    if args.full_disasm:
        with open(args.full_disasm, "w") as f:
            for insn in md.disasm(data, 0):
                f.write(f"{insn.address:#x} {insn.mnemonic} {insn.op_str}\n")
        print(f"full disasm: {args.full_disasm}")
    print("\nread-only done. No flash path exists for preloader by design.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
