#!/usr/bin/env python3
"""readdump LADDER rung A: b19 + skip all stub calls (header built, OKAY).
b18's header-via-7E00 crashed: +0x30 wants the request struct).
`readdump <hexaddr>` INFO-hex + `readdump <hexaddr>+` 16KB DATA dump.

Bulk v3: 12B DATA header via bulk stub 0x7E24, ONE 16KB send via 7E24,
flush via 0x7E34 -- all raw (buf,len), no struct, no F8DEF4. Host parses
wire content so the method is LK-side only. No loops except col loops.
"""
import struct
import sys
from pathlib import Path

sys.path.insert(0, "/tmp")
from build_readdump_v1 import (
    Asm, movz, movk, mov64, add_imm64, cmp_reg64, subs_imm32, ldp_post,
    BASE, CAVE, RESPONDER, INFO_TAG_OFF, REGEX_ROW, align8, WINDOWS,
    LK_LO,
)

USB_PAGE = 0xFFFF000051052000
OKAY_VA = BASE + 0xD4DBA
FAIL_VA = BASE + 0xFA223

W = lambda v: struct.pack("<I", v)  # noqa: E731
NAME_STR = b"readdump\x00"
USAGE_STR = b"usage: fastboot oem readdump <hexaddr>[+] [16k]\x00"
DENY_STR = b"deny: no window\x00"
DATA_TAG = b"DATA\x00"
LENHEX = b"00004000\x00"
EMPTY_STR = b"\x00"


def mov_reg64(rd, rn):
    return struct.pack("<I", 0xAA0003E0 | (rn << 16) | rd)


def add_reg64(rd, rn, rm):
    return struct.pack("<I", 0x8B000000 | (rm << 16) | (rn << 5) | rd)


def cmp_reg32(rn, rm):
    return struct.pack("<I", 0x6B000000 | (rm << 16) | (rn << 5) | 31)


class Asm2(Asm):
    def resolve(self):
        for off, kind, payload in self.fixups:
            pc = self.base + off
            if kind == "b":
                tgt = self.labels[payload]
                w = 0x14000000 | (((tgt - pc) // 4) & 0x3FFFFFF)
            elif kind == "bl":
                w = 0x94000000 | (((payload - pc) // 4) & 0x3FFFFFF)
            elif kind == "adrp":
                rd, page = payload
                d = (page - (pc & ~0xFFF)) // 0x1000
                assert -(1 << 20) <= d < (1 << 20)
                imm = d & 0x1FFFFF
                w = 0x90000000 | ((imm & 3) << 29) | (((imm >> 2) & 0x7FFFF) << 5) | rd
            elif isinstance(kind, str) and kind.startswith("cbz"):
                rt = int(kind.split("_")[1])
                tgt = self.labels[payload]
                w = 0xB4000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | rt
            else:
                cond = int(kind)
                tgt = self.labels[payload]
                w = 0x54000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | cond
            struct.pack_into("<I", self.code, off, w & 0xFFFFFFFF)
        return bytes(self.code)


def build_handler(usage_va, tbl_va, deny_va, data_va, empty_va, lenhex_va):
    a = Asm2(BASE + CAVE)
    e = a.emit
    # prologue: proven 2-pair + 0x50 frame
    e(W(0xA9BD7BFD))
    e(W(0x910003FD))
    e(W(0xA9014FF4))
    e(W(0xA90257F6))
    e(W(0xD10143FF))
    e(W(0xAA0103F3))  # mov x19,x1 (argv)
    e(W(0x7100081F))  # cmp w0,#2
    a.bcond(3, "usage")  # b.lo usage (need argv[1])
    e(W(0xF9400429))  # ldr x9,[x1,#8]
    e(movz(10, 0, 0))
    e(movz(16, 0, 0))  # bulk flag in x16 (x13/x14 die in table ldp!)
    a.label("ploop")
    e(W(0x3840152B))  # ldrb w11,[x9],#1 (VERIFIED post-index)
    e(W(0x7100017F))
    a.bcond(0, "pdone")
    e(W(0x7100AD7F))  # cmp w11,#'+'
    a.bcond(0, "plus")
    e(W(0x5100C16C))
    e(W(0x7100259F))
    a.bcond(9, "digit")
    e(W(0x5101856C))
    e(W(0x7100159F))
    a.bcond(8, "usage")
    e(W(0x1100298C))
    a.label("digit")
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0C014A))
    a.b("ploop")
    a.label("plus")
    e(W(0x3940012B))  # ldrb w11,[x9] (peek; VERIFIED word)
    e(W(0x7100017F))
    a.bcond(1, "usage")
    e(W(0x52800030))  # mov w16,#1 (bulk flag; render-verified)
    a.label("pdone")
    e(movz(11, 0x5000, 1))
    e(cmp_reg64(10, 11))
    a.bcond(3, "tbl_raw")
    e(movz(11, 0x5100, 1))
    e(cmp_reg64(10, 11))
    a.bcond(2, "tbl_raw")
    e(W(0xF2FFFFEA))  # movk x10 high (gate-verified)
    a.label("tbl_raw")
    a.adrp_add(11, tbl_va if tbl_va else BASE)
    e(movz(12, len(WINDOWS), 0))
    a.label("tloop")
    e(ldp_post(13, 14, 11, 16))
    e(cmp_reg64(10, 13))
    a.bcond(3, "tnext")
    # end select: bulk? +0x3FFF : +255 (flag in x16 -- table ldp ate x13)
    e(W(0xF100021F))  # cmp x16,#0 (render-verified)
    a.bcond(0, "is_info")
    e(movz(15, 0x3FFF, 0))
    e(add_reg64(15, 10, 15))
    a.b("end_done")
    a.label("is_info")
    e(add_imm64(15, 10, 255))
    a.label("end_done")
    e(cmp_reg64(15, 14))
    a.bcond(2, "tnext")
    a.b("dispatch")
    a.label("tnext")
    e(subs_imm32(12, 12, 1))
    a.bcond(1, "tloop")
    a.b("deny")
    a.label("dispatch")
    e(W(0xF100021F))  # cmp x16,#0 (flag survived table loop in x16)
    a.bcond(0, "info_path")
    a.b("bulk_go")
    # info: 16 unrolled blocks
    a.label("info_path")
    e(mov_reg64(20, 10))
    for _ln in range(16):
        a.label(f"iline{_ln}")
        e(W(0xD10103A9))
        e(W(0xD2800008))
        a.label(f"icol{_ln}")
        e(W(0x38686A8B))
        e(W(0x53047D6C))
        e(W(0x12000D8C))
        e(W(0x7100259F))
        a.bcond(9, f"ihidec{_ln}")
        e(W(0x11001D8C))
        a.label(f"ihidec{_ln}")
        e(W(0x1100C18C))
        e(W(0x3800152C))
        e(W(0x12000D6C))
        e(W(0x7100259F))
        a.bcond(9, f"ilodec{_ln}")
        e(W(0x11001D8C))
        a.label(f"ilodec{_ln}")
        e(W(0x1100C18C))
        e(W(0x3800152C))
        e(W(0x91000508))
        e(W(0xF100411F))
        a.bcond(1, f"icol{_ln}")
        e(W(0x3900013F))
        e(W(0xD10103A1))
        a.adrp_add(0, BASE + INFO_TAG_OFF)
        a.bl_abs(RESPONDER)
        e(W(0x91004294))
    e(W(0x52800020))
    a.b("epilogue")
    # bulk: snapshots -> header -> ONE 16KB send -> OKAY/FAIL
    # TRANSPORT v3 (raw-only): +0x30 takes a REQUEST STRUCT (S18), so the
    # 7E00 control stub is OFF LIMITS for raw bufs (b18 header crashed).
    # eMMC's loop proves +0x40 (stub 7E24) takes raw (buf,len). Wire
    # format is content-parsed by the host, so the 12B DATA header goes
    # out via 7E24 too, then 16KB data via 7E24, then 7E34 flush.
    a.label("bulk_go")
    e(W(0xF81C03AA))  # stur x10,[x29,#-0x40] (snapshot addr; VERIFIED)
    # header: "DATA"+"00004000" built CONTIGUOUS at [x29-0x50] (12B, one
    # packet -- responder would split tag+text and break the host parse).
    a.adrp_add(11, data_va)  # x11 = 'DATA'
    e(W(0xB940016B))  # ldr w11,[x11] (load "DATA"; VERIFIED)
    e(W(0xB81B03AB))  # stur w11,[x29,#-0x50] (python-built+rendered)
    a.adrp_add(11, lenhex_va)  # x11 = '00004000'
    e(W(0xB940016B))  # ldr w11,[x11]
    e(W(0xB81B43AB))  # stur w11,[x29,#-0x4C] (python-built+rendered)
    e(W(0xB940056B))  # ldr w11,[x11,#4] (python-built+rendered)
    e(W(0xB81B83AB))  # stur w11,[x29,#-0x48] (python-built+rendered)
    # LADDER rung A: header built, NO stub calls -- straight to OKAY.
    # Expect: OKAY + alive. (If THIS crashes, the model is broken.)
    a.b("bulk_ok")
    # header send via bulk stub 7E24 (x0=buf, w1=len): same raw path as
    # data (host parses wire content; method is LK-side only).
    e(W(0xD10143A0))  # sub x0,x29,#0x50 (render-verified)
    e(W(0x52800181))  # mov w1,#0xc (render-verified)
    a.bl_abs(BASE + 0x7E24)
    e(W(0x7100001F))  # cmp w0,#0 (render-verified; <0 == error bit31)
    a.bcond(0xB, "send_fail")  # b.lt fail
    # data send via bulk stub 7E24 (x0=buf, w1=len). Proven pattern:
    # eMMC loop body (mov x0,x25; mov w1,w26; bl 7E24; tbnz w0,#31 fail).
    e(W(0xF85C03B4))  # ldur x20,[x29,#-0x40] (reload addr; VERIFIED)
    e(W(0xAA1403E0))  # mov x0,x20 (render-verified)
    e(W(0xD2880001))  # mov x1,#0x4000 (render-verified)
    a.bl_abs(BASE + 0x7E24)
    e(W(0x7100001F))  # cmp w0,#0 (render-verified)
    a.bcond(0xB, "send_fail")  # b.lt fail
    # flush/status via stub 7E34 (no args; eMMC calls it before each send
    # after the first, plus once after the loop; returns w0 status).
    # LADDER rung A skips everything below (bulk_ok) -- this trio is
    # dead code here, executed in rung B.
    a.label("bulk_flush")
    a.bl_abs(BASE + 0x7E34)
    e(W(0x7100001F))  # cmp w0,#0
    a.bcond(0xB, "send_fail")  # b.lt fail
    a.label("bulk_ok")
    a.adrp_add(0, OKAY_VA)
    a.adrp_add(1, empty_va)
    a.bl_abs(RESPONDER)
    e(W(0x52800020))
    a.b("epilogue")
    e(W(0x52800020))
    a.b("epilogue")
    a.label("send_fail")
    a.adrp_add(0, FAIL_VA)
    a.adrp_add(1, empty_va)
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))
    a.b("epilogue")
    a.label("deny")
    a.adrp_add(0, BASE + INFO_TAG_OFF)
    a.adrp_add(1, deny_va)
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))
    a.b("epilogue")
    a.label("usage")
    a.adrp_add(0, BASE + INFO_TAG_OFF)
    a.adrp_add(1, usage_va)
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))
    a.label("epilogue")
    e(W(0x910143FF))
    e(W(0xA9414FF4))
    e(W(0xA94257F6))
    e(W(0xA8C37BFD))
    e(W(0xD65F03C0))
    return a


NEED_OPS = {
    "ldr x9,[x1,#8]": "argv-load",
    "ldrb w11,[x9],#1": "parse-next-char",
    "cmp w11,#0x2b": "plus detect",
    "mov x16,#0": "bulk flag init",
    "mov w16,#1": "bulk flag set",
    "cmp x16,#0": "bulk select",
    "ldp x13,x14,[x11],#0x10": "window row",
    "cmp x10,x13": "addr vs lo",
    "cmp x15,x14": "end vs hi",
    "subs w12,w12,#1": "table counter",
    "movk x10,#0xffff,lsl#48": "LK-short high",
    "stur x10,[x29,#-0x40]": "addr snapshot",
    "ldur x20,[x29,#-0x40]": "addr reload",
    "stur w11,[x29,#-0x50]": "header word 0",
    "stur w11,[x29,#-0x4c]": "header word 1",
    "stur w11,[x29,#-0x48]": "header word 2",
    "ldr w11,[x11,#4]": "lenhex second word",
    "sub x0,x29,#0x50": "header buf ptr",
    "mov w1,#0xc": "header len",
    "mov x0,x20": "bulk buf",
    "mov x1,#0x4000": "chunk len",
    "cmp w0,#0": "status check",
    "and w12,w12,#0xf": "hi-mask",
    "and w12,w11,#0xf": "lo-mask",
    "strb w12,[x9],#1": "hex-store",
}


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

    ad = Path(args.analysis_dir)
    payload = bytearray((ad / "lk.bin").read_bytes())
    z = LK_LO
    a1 = build_handler(z, z, z, z, z, z)
    c1 = a1.resolve()
    name_off = align8(CAVE + len(c1))
    usage_off = name_off + 16
    deny_off = usage_off + 64
    data_off = deny_off + 32
    empty_off = data_off + 8
    lenhex_off = empty_off + 8
    tbl_off = align8(lenhex_off + 16)
    tbl = b"".join(struct.pack("<QQ", lo, hi) for lo, hi in WINDOWS)
    end = tbl_off + len(tbl)
    assert end - CAVE <= 0xF84, f"does not fit cave: {end - CAVE:#x}"
    code = build_handler(BASE + usage_off, BASE + tbl_off, BASE + deny_off,
                         BASE + data_off, BASE + empty_off,
                         BASE + lenhex_off).resolve()
    assert len(code) == len(c1), "layout unstable"

    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
    md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    text = " ".join(f"{i.mnemonic} {i.op_str}" for i in md.disasm(code, BASE + CAVE))
    norm = lambda s: s.replace(", ", ",").replace(" ", "")
    missing = [w for w in NEED_OPS if norm(w) not in norm(text)]
    if missing:
        raise SystemExit("operand gate FAILED, missing: " + "; ".join(missing))
    print(f"Operand gate OK ({len(code)}B code)")

    cave = bytes(payload[CAVE:end])
    assert cave == b"\x00" * len(cave), f"cave dirty @0x{CAVE:x}"
    row = bytes(payload[REGEX_ROW:REGEX_ROW + 16])
    name_va, hdl_va = struct.unpack("<QQ", row)
    rname = payload[name_va - BASE:name_va - BASE + 16].split(b"\x00")[0]
    assert rname == b"regex", f"row name is {rname!r}, refusing"
    assert hdl_va == BASE + 0xCDAC, f"row handler 0x{hdl_va:x}, refusing"
    print(f"Gate OK; strings name@0x{name_off:x} usage@0x{usage_off:x} "
          f"table@0x{tbl_off:x}")

    payload[CAVE:CAVE + len(code)] = code
    payload[name_off:name_off + 16] = NAME_STR.ljust(16, b"\x00")
    payload[usage_off:usage_off + 64] = USAGE_STR.ljust(64, b"\x00")
    payload[deny_off:deny_off + 32] = DENY_STR.ljust(32, b"\x00")
    payload[data_off:data_off + 8] = DATA_TAG.ljust(8, b"\x00")
    payload[empty_off:empty_off + 8] = EMPTY_STR.ljust(8, b"\x00")
    payload[lenhex_off:lenhex_off + 16] = LENHEX.ljust(16, b"\x00")
    payload[tbl_off:tbl_off + len(tbl)] = tbl
    payload[REGEX_ROW:REGEX_ROW + 16] = struct.pack("<QQ", BASE + name_off, BASE + CAVE)

    import tempfile
    with tempfile.TemporaryDirectory() as td:
        pb = Path(td) / "lk.bulk16.bin"
        pb.write_bytes(bytes(payload))
        out = str(Path(args.output).resolve())
        r = subprocess.run([sys.executable, str(repo / "lk_repack_signed.py"),
                            "--original-image", str(Path(args.container).resolve()),
                            "--patched-lk-bin", str(pb), "--output", out, "--name", "lk"],
                           capture_output=True, text=True, cwd=str(repo))
        print(r.stdout[-1200:] if r.stdout else "")
        assert "Result: VALID" in (r.stdout or ""), r.stderr[-1000:]
        print("Wrote:", out)


if __name__ == "__main__":
    main()
