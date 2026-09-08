#!/usr/bin/env python3
"""Bulk readdump builder: INFO-hex (argc==2, proven) + DATA bulk (argc==3).

`readdump <addr> <len>`: window check [addr,addr+len) -> DATA%08x header
via responder -> 16KB raw chunks via USB vtable -> OKAY. Same regex slot,
same gates, VALID re-sign. len in [1, 0x100000].
"""
import struct
import sys
from pathlib import Path

sys.path.insert(0, "/tmp")
from build_readdump_v1 import (
    Asm, movz, movk, mov64, add_imm64, cmp_reg64, subs_imm32, ldp_post,
    BASE, CAVE, RESPONDER, INFO_TAG_OFF, REGEX_ROW, align8, WINDOWS,
    LK_LO, LK_HI,
)

USB_PAGE = 0xFFFF000051052000
USB_STRUCT_OFF = 0x280
USB_SEND_OFF = 0x30
USB_TIMEOUT = 0x1388
CHUNK = 0x4000
MAXLEN = 0x100000
OKAY_VA = BASE + 0xD4DBA
FAIL_VA = BASE + 0xFA223

W = lambda v: struct.pack("<I", v)  # noqa: E731
NAME_STR = b"readdump\x00"
USAGE_STR = b"usage: fastboot oem readdump <hexaddr> [hexlen] [bulk]\x00"
DENY_STR = b"deny: no window\x00"
DATA_TAG = b"DATA\x00"
EMPTY_STR = b"\x00"


def sub_reg64(rd, rn, rm):
    return struct.pack("<I", 0xCB000000 | (rm << 16) | (rn << 5) | rd)


def cmp_reg32(rn, rm):
    return struct.pack("<I", 0x6B000000 | (rm << 16) | (rn << 5) | 31)


def sub_imm64(rd, rn, imm12):
    assert 0 <= imm12 <= 0xFFF
    return struct.pack("<I", 0xD1000000 | (imm12 << 10) | (rn << 5) | rd)


def add_reg64(rd, rn, rm):
    return struct.pack("<I", 0x8B000000 | (rm << 16) | (rn << 5) | rd)


class Asm2(Asm):
    def cbnz(self, rt, label):
        self.fixups.append((len(self.code), "cbnz", (rt, label)))
        self.emit(b"\x00\x00\x00\x00")

    def resolve(self):
        for off, kind, payload in self.fixups:
            pc = self.base + off
            if kind == "cbnz":
                rt, label = payload
                tgt = self.labels[label]
                w = 0xB5000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | rt
                struct.pack_into("<I", self.code, off, w & 0xFFFFFFFF)
                continue
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
                # base Asm.bcond stores the raw int cond
                cond = int(kind)
                tgt = self.labels[payload]
                w = 0x54000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | cond
            struct.pack_into("<I", self.code, off, w & 0xFFFFFFFF)
        return bytes(self.code)


def emit_parse(a, src_reg, acc_reg, ok_label, fail_label, tag):
    """Hex parse: x(src) -> x(acc). Jumps ok/fail. Clobbers w11/w12."""
    e = a.emit
    e(movz(acc_reg, 0, 0))
    a.label(f"ploop_{tag}")
    e(struct.pack("<I", 0x38400400 | (1 << 12) | (src_reg << 5) | 11))  # ldrb post-idx
    e(W(0x7100017F))  # cmp w11,#0
    a.bcond(0, f"pdone_{tag}")
    e(W(0x5100C16C))  # sub w12,w11,#0x30
    e(W(0x7100259F))
    a.bcond(9, f"digit_{tag}")
    e(W(0x5101856C))  # sub 'a'
    e(W(0x7100159F))
    a.bcond(8, fail_label)
    e(W(0x1100298C))
    a.label(f"digit_{tag}")
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(struct.pack("<I", 0x8B000000 | (12 << 16) | (acc_reg << 5) | acc_reg))
    a.b(f"ploop_{tag}")
    a.label(f"pdone_{tag}")


def mov_reg64(rd, rn):
    return struct.pack("<I", 0xAA0003E0 | (rn << 16) | rd)


def build_handler(usage_va, tbl_va, deny_va, data_va, empty_va):
    a = Asm2(BASE + CAVE)
    e = a.emit
    e(W(0xA9BD7BFD))  # stp x29,x30,[sp,#-0x30]!
    e(W(0x910003FD))  # mov x29,sp
    e(W(0xA9014FF4))  # stp x20,x19,[sp,#0x10]
    e(W(0xA90257F6))  # stp x22,x21,[sp,#0x20]
    e(W(0xA9035FF4))  # stp x24,x23,[sp,#0x30]
    e(W(0xA9045FF6))  # stp x26,x25,[sp,#0x40]
    e(W(0xD101C3FF))  # sub sp,sp,#0x70
    e(W(0xAA0103F3))  # mov x19,x1 (argv)
    e(W(0x7100081F))  # cmp w0,#2 (argc<2 => argv[1] invalid: deny FIRST)
    a.bcond(3, "usage")  # b.lo usage (MUST precede any parse!)
    e(struct.pack("<I", 0xF9400000 | (1 << 10) | (1 << 5) | 9))  # ldr x9,[x1,#8]
    emit_parse(a, 9, 10, "ok_a", "usage", "a")  # addr -> x10
    # window check shared by both paths happens per-path (len differs)
    e(W(0x7100081F))  # cmp w0,#2
    a.bcond(0, "info_path")  # b.eq info (argc==2)
    e(W(0x71000C1F))  # cmp w0,#3
    a.bcond(1, "usage")  # b.ne usage (argc==3 required for bulk)
    # ---- bulk: parse len argv[2] -> x16 ----
    e(struct.pack("<I", 0xF9400000 | (2 << 10) | (19 << 5) | 9))  # ldr x9,[x19,#16]
    emit_parse(a, 9, 16, "ok_l", "usage", "l")
    e(W(0xF100021F))  # cmp x16,#0
    a.bcond(0, "usage")  # b.eq usage (len 0)
    e(mov64(11, MAXLEN))
    e(cmp_reg64(16, 11))
    a.bcond(8, "usage")  # b.hi usage (len > 1MB)
    # ---- LK-short detect + table check on [x10, x10+x16-1] ----
    e(movz(11, 0x5000, 1))
    e(cmp_reg64(10, 11))
    a.bcond(3, "tbl_raw")
    e(movz(11, 0x5100, 1))
    e(cmp_reg64(10, 11))
    a.bcond(2, "tbl_raw")
    e(W(0xF2FFFFEA))  # movk x10,#0xFFFF,lsl#48
    a.label("tbl_raw")
    a.adrp_add(11, tbl_va if tbl_va else BASE)
    e(movz(12, len(WINDOWS), 0))
    a.label("tloop")
    e(ldp_post(13, 14, 11, 16))
    e(cmp_reg64(10, 13))
    a.bcond(3, "tnext")
    e(sub_imm64(15, 16, 1))  # x15 = len-1
    e(add_reg64(15, 10, 15))  # x15 = addr+len-1
    e(cmp_reg64(15, 14))
    a.bcond(2, "tnext")
    a.b("bulk_go")
    a.label("tnext")
    e(subs_imm32(12, 12, 1))
    a.bcond(1, "tloop")
    a.b("deny")
    # ---- bulk_go: DATA header (8 hex of len) ----
    a.label("bulk_go")
    e(mov_reg64(24, 10))  # SNAPSHOT addr (x10 dies at first bl)
    e(mov_reg64(26, 16))  # SNAPSHOT len (x16 dies at first bl)
    e(W(0xF81B83BA))  # str x26,[x29,#-0x50] (len bytes)
    e(W(0xD10143B4))  # sub x20,x29,#0x50 (len slot addr)
    e(W(0xD10143A9))  # sub x9,x29,#0x50 (header buf)
    e(W(0xD2800008))  # mov x8,#0
    a.label("hcol")
    e(W(0x38686A8B))  # ldrb w11,[x20,x8]
    e(W(0x53047D6C))  # lsr w12,w11,#4
    e(W(0x12000D8C))  # and w12,w12,#0xF
    e(W(0x7100259F))  # cmp w12,#9
    a.bcond(9, "hdec")
    e(W(0x11001D8C))  # add w12,w12,#7
    a.label("hdec")
    e(W(0x1100C18C))  # add w12,w12,#0x30
    e(W(0x3800152C))  # strb w12,[x9],#1
    e(W(0x12000D6C))  # and w12,w11,#0xF
    e(W(0x7100259F))  # cmp w12,#9
    a.bcond(9, "ldec")
    e(W(0x11001D8C))  # add w12,w12,#7
    a.label("ldec")
    e(W(0x1100C18C))  # add w12,w12,#0x30
    e(W(0x3800152C))  # strb w12,[x9],#1
    e(W(0x91000508))  # add x8,x8,#1
    e(W(0xF100111F))  # cmp x8,#4
    a.bcond(1, "hcol")  # b.ne hcol
    e(W(0x3900013F))  # strb wzr,[x9]
    e(W(0xD10143A9))  # sub x1,x29,#0x50 (header buf)
    a.adrp_add(0, data_va)  # x0 = 'DATA' tag
    a.bl_abs(RESPONDER)
    # ---- raw chunk loop ----
    e(mov_reg64(20, 24))  # mov x20,x24 (src ptr)
    e(mov_reg64(22, 26))  # mov x22,x26 (remaining)
    e(movz(23, CHUNK, 0))  # mov x23,#0x4000
    a.label("cloop")
    e(cmp_reg64(22, 23))
    a.bcond(3, "c_rem")  # b.lo c_rem
    e(mov_reg64(24, 23))
    a.b("c_go")
    a.label("c_rem")
    e(mov_reg64(24, 22))
    a.label("c_go")
    a.adrp_add(25, USB_PAGE)
    e(W(0xF9414328))  # ldr x8,[x25,#0x280] (gadget struct)
    e(W(0xF9401908))  # ldr x8,[x8,#0x30] (bulk-send method)
    e(mov_reg64(0, 20))  # mov x0,x20 (buf)
    e(W(0x2A1803E1))  # mov w1,w24 (len)
    e(W(0xD2A27102))  # mov w2,#0x1388 (timeout)
    e(W(0xD63F0100))  # blr x8
    e(cmp_reg32(0, 24))  # cmp w0,w24 (sent vs asked)
    a.bcond(1, "send_fail")  # b.ne send_fail
    e(add_reg64(20, 20, 24))  # add x20,x20,x24
    e(sub_reg64(22, 22, 24))  # sub x22,x22,x24
    a.cbnz(22, "cloop")
    a.adrp_add(0, OKAY_VA)  # x0 = 'OKAY'
    a.adrp_add(1, empty_va)  # x1 = ""
    a.bl_abs(RESPONDER)
    e(W(0x52800020))  # mov w0,#1
    a.b("epilogue")
    a.label("send_fail")
    a.adrp_add(0, FAIL_VA)  # x0 = 'FAIL'
    a.adrp_add(1, empty_va)
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))  # mov w0,wzr
    a.b("epilogue")
    # ---- info_path: 16 unrolled INFO-hex blocks (proven shape) ----
    a.label("info_path")
    e(mov_reg64(20, 10))  # mov x20,x10 (read ptr)
    for _ln in range(16):
        a.label(f"iline{_ln}")
        e(W(0xD10103A9))  # sub x9,x29,#0x40 (buf)
        e(W(0xD2800008))  # mov x8,#0
        a.label(f"icol{_ln}")
        e(W(0x38686A8B))  # ldrb w11,[x20,x8]
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
        e(W(0x91004294))  # add x20,x20,#16
    e(W(0x52800020))  # mov w0,#1
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
    e(W(0x9101C3FF))  # add sp,sp,#0x70
    e(W(0xA9414FF4))  # ldp x20,x19,[sp,#0x10]
    e(W(0xA94257F6))  # ldp x22,x21,[sp,#0x20]
    e(W(0xA9435FF4))  # ldp x24,x23,[sp,#0x30]
    e(W(0xA9445FF6))  # ldp x26,x25,[sp,#0x40]
    e(W(0xA8C37BFD))  # ldp x29,x30,[sp],#0x30
    e(W(0xD65F03C0))  # ret
    return a


NEED_OPS = {
    "ldr x9,[x1,#8]": "argv-load",
    "ldrb w11,[x9],#1": "parse-next-char",
    "ldr x9,[x19,#0x10]": "argv2-load",
    "ldp x13,x14,[x11],#0x10": "window-table row",
    "cmp x10,x13": "addr vs lo",
    "cmp x15,x14": "end vs hi",
    "subs w12,w12,#1": "table counter",
    "movk x10,#0xffff,lsl#48": "LK-short high",
    "ldr x8,[x25,#0x280]": "gadget struct load",
    "ldr x8,[x8,#0x30]": "bulk-send method load",
    "blr x8": "bulk-send call",
    "cmp w0,w24": "sent-vs-asked check",
    "cbnz x22,": "chunk loop-back",
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

    a1 = build_handler(LK_LO, LK_LO, LK_LO, LK_LO, LK_LO)
    c1 = a1.resolve()
    name_off = align8(CAVE + len(c1))
    usage_off = name_off + 16
    deny_off = usage_off + 64
    data_off = deny_off + 32
    empty_off = data_off + 8
    tbl_off = align8(empty_off + 8)
    tbl = b"".join(struct.pack("<QQ", lo, hi) for lo, hi in WINDOWS)
    end = tbl_off + len(tbl)
    assert end - CAVE <= 0xF84, f"does not fit cave: {end - CAVE:#x}"
    code = build_handler(BASE + usage_off, BASE + tbl_off, BASE + deny_off,
                         BASE + data_off, BASE + empty_off).resolve()
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
    print(f"Gate: regex row OK; strings @0x{name_off:x}/0x{usage_off:x}/"
          f"0x{deny_off:x}/0x{data_off:x}, table @0x{tbl_off:x}")

    payload[CAVE:CAVE + len(code)] = code
    payload[name_off:name_off + 16] = NAME_STR.ljust(16, b"\x00")
    payload[usage_off:usage_off + 64] = USAGE_STR.ljust(64, b"\x00")
    payload[deny_off:deny_off + 32] = DENY_STR.ljust(32, b"\x00")
    payload[data_off:data_off + 8] = DATA_TAG.ljust(8, b"\x00")
    payload[empty_off:empty_off + 8] = EMPTY_STR.ljust(8, b"\x00")
    payload[tbl_off:tbl_off + len(tbl)] = tbl
    payload[REGEX_ROW:REGEX_ROW + 16] = struct.pack("<QQ", BASE + name_off, BASE + CAVE)

    import tempfile
    with tempfile.TemporaryDirectory() as td:
        pb = Path(td) / "lk.bulk.bin"
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
