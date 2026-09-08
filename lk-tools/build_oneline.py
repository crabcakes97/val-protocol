#!/usr/bin/env python3
"""One fixed 16-byte hex line, no loop, no counter, no parse.
Reads its own NAME string (self-verifying: must print 72656164...)."""
import struct
import sys
from pathlib import Path

sys.path.insert(0, "/tmp")
from build_readdump_v1 import Asm, movz, mov64, BASE, CAVE, RESPONDER, INFO_TAG_OFF, REGEX_ROW

NAME = b"readdump\x00"
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

    a = Asm(BASE + CAVE)
    e = a.emit
    e(W(0xA9BD7BFD))  # stp x29,x30,[sp,#-0x30]!
    e(W(0x910003FD))  # mov x29,sp
    e(W(0xA9014FF4))  # stp x20,x19,[sp,#0x10]
    e(W(0xD10143FF))  # sub sp,sp,#0x50
    # x20 = NAME string VA (filled below)
    e(mov64(20, BASE + CAVE + 0x1000))  # placeholder
    e(W(0xD10103A9))  # sub x9,x29,#0x40 (buf)
    e(W(0xD2800008))  # mov x8,#0
    a.label("col")
    e(W(0x38686A8B))  # ldrb w11,[x20,x8]
    e(W(0x53047D6C))  # lsr w12,w11,#4
    e(W(0x12000D8C))  # and w12,w12,#0xF
    e(W(0x7100259F))  # cmp w12,#9
    a.bcond(9, "hi_dec")
    e(W(0x11001D8C))
    a.label("hi_dec")
    e(W(0x1100C18C))
    e(W(0x3800152C))
    e(W(0x12000D6C))  # and w12,w11,#0xF
    e(W(0x7100259F))
    a.bcond(9, "lo_dec")
    e(W(0x11001D8C))
    a.label("lo_dec")
    e(W(0x1100C18C))
    e(W(0x3800152C))
    e(W(0x91000508))  # add x8,x8,#1
    e(W(0xF100411F))  # cmp x8,#16
    a.bcond(1, "col")
    e(W(0x3900013F))  # strb wzr,[x9]
    e(W(0xD10103A1))  # sub x1,x29,#0x40
    a.adrp_add(0, BASE + INFO_TAG_OFF)
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))  # mov w0,wzr
    e(W(0x910143FF))  # add sp,sp,#0x50
    e(W(0xA9414FF4))  # ldp x20,x19,[sp,#0x10]
    e(W(0xA8C37BFD))  # ldp x29,x30,[sp],#0x30
    e(W(0xD65F03C0))  # ret
    c1 = a.resolve()
    n_off = CAVE + ((len(c1) + 7) & ~7)

    # rebuild with real NAME va
    b = Asm(BASE + CAVE)
    e = b.emit
    e(W(0xA9BD7BFD))
    e(W(0x910003FD))
    e(W(0xA9014FF4))
    e(W(0xD10143FF))
    e(mov64(20, BASE + n_off))
    e(W(0xD10103A9))
    e(W(0xD2800008))
    b.label("col")
    e(W(0x38686A8B))
    e(W(0x53047D6C))
    e(W(0x12000D8C))
    e(W(0x7100259F))
    b.bcond(9, "hi_dec")
    e(W(0x11001D8C))
    b.label("hi_dec")
    e(W(0x1100C18C))
    e(W(0x3800152C))
    e(W(0x12000D6C))
    e(W(0x7100259F))
    b.bcond(9, "lo_dec")
    e(W(0x11001D8C))
    b.label("lo_dec")
    e(W(0x1100C18C))
    e(W(0x3800152C))
    e(W(0x91000508))
    e(W(0xF100411F))
    b.bcond(1, "col")
    e(W(0x3900013F))
    e(W(0xD10103A1))
    b.adrp_add(0, BASE + INFO_TAG_OFF)
    b.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))
    e(W(0x910143FF))
    e(W(0xA9414FF4))
    e(W(0xA8C37BFD))
    e(W(0xD65F03C0))
    code = b.resolve()
    assert len(code) == len(c1)

    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
    md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    got = [i.mnemonic for i in md.disasm(code, BASE + CAVE)]
    want = ("stp mov stp sub mov movk movk movk sub mov ldrb lsr and "
            "cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne "
            "strb sub adrp add bl mov add ldp ldp ret").split()
    # adjust: mov64 renders mov,movk,movk,movk
    assert got == want, f"mismatch:\n{got}"
    print("oneline self-test OK")

    ad = Path(args.analysis_dir)
    payload = bytearray((ad / "lk.bin").read_bytes())
    end = n_off + 16
    assert bytes(payload[CAVE:end]) == b"\x00" * (end - CAVE), "cave dirty"
    row = bytes(payload[REGEX_ROW:REGEX_ROW + 16])
    name_va, hdl_va = struct.unpack("<QQ", row)
    assert payload[name_va - BASE:name_va - BASE + 5] == b"regex"
    assert hdl_va == BASE + 0xCDAC
    payload[CAVE:CAVE + len(code)] = code
    payload[n_off:n_off + 16] = NAME.ljust(16, b"\x00")
    payload[REGEX_ROW:REGEX_ROW + 16] = struct.pack("<QQ", BASE + n_off, BASE + CAVE)
    print(f"one-liner @0x{CAVE:x}, name @0x{n_off:x}")

    import tempfile
    with tempfile.TemporaryDirectory() as td:
        pb = Path(td) / "lk.one.bin"
        pb.write_bytes(bytes(payload))
        out = str(Path(args.output).resolve())
        r = subprocess.run([sys.executable, str(repo / "lk_repack_signed.py"),
                            "--original-image", str(Path(args.container).resolve()),
                            "--patched-lk-bin", str(pb), "--output", out, "--name", "lk"],
                           capture_output=True, text=True, cwd=str(repo))
        assert "Result: VALID" in (r.stdout or ""), r.stderr[-1000:]
        print("Wrote:", out)


if __name__ == "__main__":
    main()
