#!/usr/bin/env python3
"""Minimal hello handler: proves dispatch/return without any loop."""
import struct
import sys
from pathlib import Path

sys.path.insert(0, "/tmp")
from build_readdump_v1 import Asm, movz, BASE, CAVE, RESPONDER, INFO_TAG_OFF, REGEX_ROW

NAME = b"readdump\x00"
HELLO = b"readdump alive\x00"
W = lambda v: struct.pack("<I", v)  # noqa: E731


def main():
    import argparse
    import subprocess
    ap = argparse.ArgumentParser()
    ap.add_argument("container")
    ap.add_argument("output")
    ap.add_argument("--analysis-dir", required=True)
    ap.add_argument("--repo", default="/home/cameron/kansas-modem-unlock/val-protocol")
    args = ap.parse_args()
    repo = Path(args.repo)
    sys.path.insert(0, str(repo))

    # layout: code, then string (both 8-aligned)
    a = Asm(BASE + CAVE)
    e = a.emit
    e(W(0xA9BD7BFD))  # stp x29,x30,[sp,#-0x30]!
    e(W(0x910003FD))  # mov x29,sp
    a.adrp_add(0, BASE + INFO_TAG_OFF)
    a.adrp_add(1, BASE + CAVE + 0x1000)  # placeholder
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))  # mov w0,wzr
    e(W(0xA8C37BFD))  # ldp x29,x30,[sp],#0x30
    e(W(0xD65F03C0))  # ret
    c1 = a.resolve()
    s_off = CAVE + ((len(c1) + 7) & ~7)
    n_off = s_off
    h_off = n_off + 16
    e_off = h_off + ((len(HELLO) + 7) & ~7)

    b = Asm(BASE + CAVE)
    e = b.emit
    e(W(0xA9BD7BFD))
    e(W(0x910003FD))
    b.adrp_add(0, BASE + INFO_TAG_OFF)
    b.adrp_add(1, BASE + h_off)
    b.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))
    e(W(0xA8C37BFD))
    e(W(0xD65F03C0))
    code = b.resolve()
    assert len(code) == len(c1)

    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
    md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    got = [i.mnemonic for i in md.disasm(code, BASE + CAVE)]
    want = "stp mov adrp add adrp add bl mov ldp ret".split()
    assert got == want, f"hello mismatch: {got}"
    print("Hello self-test OK:", " ".join(got))

    ad = Path(args.analysis_dir)
    payload = bytearray((ad / "lk.bin").read_bytes())
    assert bytes(payload[CAVE:e_off]) == b"\x00" * (e_off - CAVE), "cave dirty"
    row = bytes(payload[REGEX_ROW:REGEX_ROW + 16])
    name_va, hdl_va = struct.unpack("<QQ", row)
    rname = payload[name_va - BASE:name_va - BASE + 16].split(b"\x00")[0]
    assert rname == b"regex", f"row is {rname!r}"
    assert hdl_va == BASE + 0xCDAC
    print("Gate: regex row OK")
    payload[CAVE:CAVE + len(code)] = code
    payload[n_off:n_off + 16] = NAME.ljust(16, b"\x00")
    payload[h_off:h_off + len(HELLO)] = HELLO
    # row = [name ptr, handler ptr]
    payload[REGEX_ROW:REGEX_ROW + 16] = struct.pack("<QQ", BASE + n_off, BASE + CAVE)
    print(f"hello @0x{CAVE:x}, name @0x{n_off:x}, msg @0x{h_off:x}")

    import tempfile
    with tempfile.TemporaryDirectory() as td:
        pb = Path(td) / "lk.hello.bin"
        pb.write_bytes(bytes(payload))
        out = str(Path(args.output).resolve())
        r = subprocess.run([sys.executable, str(repo / "lk_repack_signed.py"),
                            "--original-image", str(Path(args.container).resolve()),
                            "--patched-lk-bin", str(pb), "--output", out, "--name", "lk"],
                           capture_output=True, text=True, cwd=str(repo))
        print(r.stdout[-800:] if r.stdout else "")
        assert "Result: VALID" in (r.stdout or ""), r.stderr[-1000:]
        print("Wrote:", out)


if __name__ == "__main__":
    main()
