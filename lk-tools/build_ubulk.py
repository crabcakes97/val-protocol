#!/usr/bin/env python3
"""Prototype v1: borrow the `regex` dispatch slot for `readdump <hexaddr>.

Reads 256 bytes from LK-mapped memory ONLY (window-checked) and prints 16
INFO lines of hex via the 0x7C4C responder. No DATA phase, no DRAM.
Self-test: `fastboot oem readdump 0x50F00000` must echo lk.bin[0:256].

Old-byte gated on the regex row; refuses any other build. The emitted
handler is verified against an exact capstone mnemonic sequence before
the image is touched.
"""
import struct
import sys
from pathlib import Path

BASE = 0xFFFF000050F00000
CAVE = 0xCE080
RESPONDER = BASE + 0x7C4C
INFO_TAG_OFF = 0xD953D          # file off of 'INFO'
REGEX_ROW = 0x1207B0
LK_LO = BASE
LK_HI = BASE + 0x100000
DUMP_LEN = 256

# v11 allowlist: LK-PROVEN windows only. A miss denies (usage) instead of
# faulting. Kernel iomem is NOT LK's map (lesson 0x80000000): extend ONLY
# after a 256B probe of the new window completes with OKAY.
WINDOWS = (
    (0x40000000, 0x40010000),  # DRAM scratch (proven, no fault)
    # NOTE 2026-09-08: 0x48402000/0x74000000/0xC0000000 REMOVED after live
    # Data-Abort freeze (kernel System RAM != LK-mapped). Re-add ONE row
    # per probe, never in batches: a fault costs a reboot.
    (LK_LO, LK_HI),            # LK image VA (proven: cave oracle exact)
)


def movz(rd, imm16, hw=0):
    return struct.pack("<I", 0xD2800000 | (hw << 21) | (imm16 << 5) | rd)


def movk(rd, imm16, hw=0):
    return struct.pack("<I", 0xF2800000 | (hw << 21) | (imm16 << 5) | rd)


def mov64(rd, val):
    return (movz(rd, (val >> 48) & 0xFFFF, 3) + movk(rd, (val >> 32) & 0xFFFF, 2)
            + movk(rd, (val >> 16) & 0xFFFF, 1) + movk(rd, val & 0xFFFF, 0))


def add_imm64(rd, rn, imm12):
    assert 0 <= imm12 <= 0xFFF
    return struct.pack("<I", 0x91000000 | (imm12 << 10) | (rn << 5) | rd)


def subs_imm32(rd, rn, imm12):
    assert 0 <= imm12 <= 0xFFF
    return struct.pack("<I", 0x71000000 | (imm12 << 10) | (rn << 5) | rd)


def ldp_post(rt1, rt2, rn, imm_bytes):
    assert imm_bytes % 8 == 0
    imm7 = imm_bytes // 8
    assert 0 <= imm7 <= 0x7F
    return struct.pack("<I", 0xA8C00000 | (imm7 << 15) | (rt2 << 10)
                       | (rn << 5) | rt1)


def cmp_reg64(rn, rm):
    return struct.pack("<I", 0xEB000000 | (rm << 16) | (rn << 5) | 31)


def mov_reg64(rd, rn):
    return struct.pack("<I", 0xAA0003E0 | (rn << 16) | rd)


def add_reg64(rd, rn, rm):
    return struct.pack("<I", 0x8B000000 | (rm << 16) | (rn << 5) | rd)


def cmp_reg32(rn, rm):
    return struct.pack("<I", 0x6B000000 | (rm << 16) | (rn << 5) | 31)


class Asm:
    def __init__(self, base_va):
        self.base = base_va
        self.code = bytearray()
        self.labels = {}
        self.fixups = []

    def emit(self, b):
        self.code.extend(b)

    def label(self, name):
        self.labels[name] = self.base + len(self.code)

    def _br(self, kind, label):
        self.fixups.append((len(self.code), kind, label))
        self.emit(b"\x00\x00\x00\x00")

    def b(self, label):
        self._br("b", label)

    def bcond(self, cond, label):
        self._br(cond, label)

    def adrp_add(self, rd, target):
        """adrp rd,page(target); add rd,rd,#lo12. Fails if lo12 needs shift."""
        assert 0 <= (target & 0xFFF) <= 0xFFF
        self.fixups.append((len(self.code), "adrp", (rd, target & ~0xFFF)))
        self.emit(b"\x00\x00\x00\x00")
        lo = target & 0xFFF
        self.emit(struct.pack("<I", 0x91000000 | (lo << 10) | (rd << 5) | rd))

    def bl_abs(self, target):
        self.fixups.append((len(self.code), "bl", target))
        self.emit(b"\x00\x00\x00\x00")

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
                assert -(1 << 20) <= d < (1 << 20), f"adrp range {hex(d)}"
                imm = d & 0x1FFFFF
                w = 0x90000000 | ((imm & 3) << 29) | (((imm >> 2) & 0x7FFFF) << 5) | rd
            else:  # B.cond number
                tgt = self.labels[payload]
                w = 0x54000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | kind
            struct.pack_into("<I", self.code, off, w & 0xFFFFFFFF)
        return bytes(self.code)


W = lambda v: struct.pack("<I", v)  # noqa: E731
NAME_STR = b"readdump\x00"
USAGE_STR = b"usage: fastboot oem readdump <hexaddr>[+] [16k]\x00"
DENY_STR = b"deny: no window\x00"
DATA_TAG = b"DATA\x00"
LENHEX = b"00004000\x00"
EMPTY_STR = b"\x00"
USB_PAGE = 0xFFFF000051052000
OKAY_VA = BASE + 0xD4DBA
FAIL_VA = BASE + 0xFA223


def build_handler(usage_va, tbl_va, deny_va, data_va, empty_va, lenhex_va):
    a = Asm(BASE + CAVE)
    e = a.emit
    e(W(0xA9BD7BFD))  # stp x29,x30,[sp,#-0x30]!
    e(W(0x910003FD))  # mov x29,sp
    e(W(0xA9014FF4))  # stp x20,x19,[sp,#0x10]
    e(W(0xA90257F6))  # stp x22,x21,[sp,#0x20]
    e(W(0xD10143FF))  # sub sp,sp,#0x50 (line buf below frame)
    e(W(0x7100081F))  # cmp w0,#2 (argv=[cmd, addr]: house style, cf ramdump)
    a.bcond(1, "usage")  # b.ne usage
    e(W(0xAA0103F3))  # mov x19,x1 (argv)
    e(W(0xF9400429))  # ldr x9,[x1,#8] (addr string)
    e(movz(10, 0, 0))  # mov x10,#0 (acc)
    e(movz(13, 0, 0))  # mov w13,#0 (bulk flag)
    e(movz(13, 0, 0))  # mov w13,#0 (bulk flag)
    a.label("ploop")
    e(W(0x3840152B))  # ldrb w11,[x9],#1
    e(W(0x7100017F))  # cmp w11,#0
    a.bcond(0, "pdone")
    e(W(0x7100AD7F))  # cmp w11,#'+' (0x2B)
    a.bcond(0, "plus")
    e(W(0x5100C16C))  # sub w12,w11,#0x30
    e(W(0x7100259F))  # cmp w12,#9
    a.bcond(9, "digit")  # b.ls digit
    e(W(0x5101856C))  # sub w12,w11,#0x61 ('a'; uppercase rejected)
    e(W(0x7100159F))  # cmp w12,#5
    a.bcond(8, "usage")  # b.hi usage
    e(W(0x1100298C))  # add w12,w12,#10
    a.label("digit")
    e(W(0x8B0A014A))  # add x10,x10,x10 (x4 = <<4, no UBFM doubt)
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0A014A))
    e(W(0x8B0C014A))  # add x10,x10,x12
    a.b("ploop")
    a.label("plus")
    e(W(0x3940012B))  # ldrb w11,[x9] (peek: must be NUL)
    e(W(0x7100017F))  # cmp w11,#0
    a.bcond(1, "usage")  # b.ne usage
    e(W(0x5280002D))  # mov w13,#1 (bulk flag)
    a.b("pdone")
    a.label("pdone")
    # LK 28-bit shorthand 0x50Fxxxxx -> full VA; everything else raw.
    e(movz(11, 0x5000, 1))  # 0x50000000
    e(cmp_reg64(10, 11))  # cmp x10,x11
    a.bcond(3, "tbl_raw")  # b.lo tbl_raw (below LK-short: raw addr)
    e(movz(11, 0x5100, 1))  # 0x51000000
    e(cmp_reg64(10, 11))  # cmp x10,x11
    a.bcond(2, "tbl_raw")  # b.hs tbl_raw (above LK-short: raw addr)
    e(W(0xF2FFFFEA))  # movk x10,#0xFFFF,lsl#48 (LK-short -> VA)
    a.label("tbl_raw")
    # table loop: [x10, x10+255] must sit inside one (lo,hi) row.
    a.adrp_add(11, tbl_va if tbl_va else BASE)
    e(movz(12, len(WINDOWS), 0))
    a.label("tloop")
    e(ldp_post(13, 14, 11, 16))
    e(cmp_reg64(10, 13))  # cmp x10,x13 (addr vs lo)
    a.bcond(3, "tnext")  # b.lo tnext
    e(W(0x710001BF))  # cmp w13,#0 (bulk?)
    a.bcond(0, "is_info")  # b.eq is_info
    e(movz(15, 0x3FFF, 0))  # movz x15,#0x3FFF
    e(add_reg64(15, 10, 15))  # x15 = addr+0x3FFF
    a.b("end_done")
    a.label("is_info")
    e(add_imm64(15, 10, 255))  # x15 = addr+255
    a.label("end_done")
    e(cmp_reg64(15, 14))  # cmp x15,x14 (end vs hi)
    a.bcond(2, "tnext")  # b.hs tnext
    e(W(0x710001BF))  # cmp w13,#0 (dispatch)
    a.bcond(0, "line0")  # b.eq line0 (INFO path)
    a.b("bulk_go")
    a.label("tnext")
    e(subs_imm32(12, 12, 1))
    a.bcond(1, "tloop")  # b.ne tloop
    a.b("deny")
    # UNROLLED x16: no counter, no loop-back. Each block: format 16B at
    # x20, send INFO, advance x20. Straight-line: nothing to miscount.
    for _ln in range(16):
        a.label(f"line{_ln}")
        if _ln == 0:
            e(W(0xAA0A03F4))  # mov x20,x10 HERE: table-hit lands on it
        e(W(0xD10103A9))  # sub x9,x29,#0x40 (buf)
        e(W(0xD2800008))  # mov x8,#0 (col)
        a.label(f"col{_ln}")
        e(W(0x38686A8B))  # ldrb w11,[x20,x8]
        e(W(0x53047D6C))  # lsr w12,w11,#4
        e(W(0x12000D8C))  # and w12,w12,#0xF
        e(W(0x7100259F))  # cmp w12,#9
        a.bcond(9, f"hidec{_ln}")
        e(W(0x11001D8C))
        a.label(f"hidec{_ln}")
        e(W(0x1100C18C))
        e(W(0x3800152C))
        e(W(0x12000D6C))  # and w12,w11,#0xF
        e(W(0x7100259F))
        a.bcond(9, f"lodec{_ln}")
        e(W(0x11001D8C))
        a.label(f"lodec{_ln}")
        e(W(0x1100C18C))
        e(W(0x3800152C))
        e(W(0x91000508))  # add x8,x8,#1
        e(W(0xF100411F))  # cmp x8,#16
        a.bcond(1, f"col{_ln}")
        e(W(0x3900013F))  # strb wzr,[x9]
        e(W(0xD10103A1))  # sub x1,x29,#0x40
        a.adrp_add(0, BASE + INFO_TAG_OFF)
        a.bl_abs(RESPONDER)
        e(W(0x91004294))  # add x20,x20,#16

    e(W(0x52800020))  # mov w0,#1
    a.b("epilogue")
    # ---- bulk_go: snapshots -> DATA header -> ONE 16KB send -> OKAY/FAIL
    a.label("bulk_go")
    e(W(0xF81C03AA))  # stur x10,[x29,#-0x40] (snapshot addr; VERIFIED)
    a.adrp_add(0, data_va)  # x0 = 'DATA'
    a.adrp_add(1, lenhex_va)  # x1 = '00004000'
    a.bl_abs(RESPONDER)
    e(W(0xF85C03B4))  # ldur x20,[x29,#-0x40] (reload addr; VERIFIED)
    a.adrp_add(25, USB_PAGE)
    e(W(0xF9414328))  # ldr x8,[x25,#0x280] (gate-verify)
    e(W(0xF9401908))  # ldr x8,[x8,#0x30] (python-verified)
    e(mov_reg64(0, 20))  # mov x0,x20
    e(W(0xD2880001))  # movz w1,#0x4000 (gate-verify)
    e(W(0xD2827102))  # mov w2,#0x1388 (python-verified bytes 027182d2)
    e(W(0xD63F0100))  # blr x8
    e(W(0xD2880009))  # movz w9,#0x4000 (gate-verify)
    e(W(0x6B09001F))  # cmp w0,w9 (gate-verify)
    a.bcond(1, "send_fail")
    a.adrp_add(0, OKAY_VA)
    a.adrp_add(1, empty_va)
    a.bl_abs(RESPONDER)
    e(W(0x52800020))
    a.b("epilogue")
    a.label("send_fail")
    a.adrp_add(0, FAIL_VA)
    a.adrp_add(1, empty_va)
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))
    a.b("epilogue")
    a.label("deny")
    a.adrp_add(0, BASE + INFO_TAG_OFF)  # x0 = 'INFO'
    a.adrp_add(1, deny_va)  # x1 = deny string
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))  # mov w0,wzr
    a.b("epilogue")
    a.label("usage")
    a.adrp_add(0, BASE + INFO_TAG_OFF)  # x0 = 'INFO'
    a.adrp_add(1, usage_va)  # x1 = usage string
    a.bl_abs(RESPONDER)
    e(W(0x2A1F03E0))  # mov w0,wzr
    a.label("epilogue")
    e(W(0x910143FF))  # add sp,sp,#0x50
    e(W(0xA9414FF4))  # ldp x20,x19,[sp,#0x10]
    e(W(0xA94257F6))  # ldp x22,x21,[sp,#0x20]
    e(W(0xA8C37BFD))  # ldp x29,x30,[sp],#0x30
    e(W(0xD65F03C0))  # ret
    return a


EXPECTED_MNEMONICS = (
    "stp mov stp stp sub cmp b.ne mov ldr mov ldrb cmp b.eq sub cmp "
    "b.ls sub cmp b.hi add add add add add add b "
    "mov cmp b.lo mov cmp b.hs movk adrp add mov "
    "ldp cmp b.lo add cmp b.hs b subs b.ne b "
    "mov sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add sub mov ldrb lsr and cmp b.ls add add strb and cmp b.ls add add strb add cmp b.ne strb sub adrp add bl add mov b "
    "adrp add adrp add bl mov b adrp add adrp add bl mov add ldp ldp ldp ret"
).split()


def align8(v):
    return (v + 7) & ~7


NEED_OPS = {
    "ldrb w11,[x9],#1": "parse-next-char",
    "ldrb w11,[x20,x8]": "body-read (Rn MUST be x20)",
    "and w12,w12,#0xf": "hi-mask (MUST read w12)",
    "and w12,w11,#0xf": "lo-mask (MUST read w11)",
    "strb w12,[x9],#1": "hex-store",
    "strb wzr,[x9]": "nul-terminate",
    "ldr x9,[x1,#8]": "argv-load",
    "ldp x13,x14,[x11],#0x10": "window-table row load",
    "cmp x10,x13": "addr vs window-lo",
    "cmp x15,x14": "end vs window-hi",
    "subs w12,w12,#1": "table counter",
    "sub x9,x29,#0x40": "line buffer pointer",
    "movk x10,#0xffff,lsl#48": "LK-short high bits",
    "cmp w11,#0x2b": "plus-sign detect",
    "mov w13,#1": "bulk flag set",
    "ldr x8,[x25,#0x280]": "gadget struct load",
    "ldr x8,[x8,#0x30]": "bulk-send method load",
    "blr x8": "bulk-send call",
    "mov x2,#0x1388": "send timeout const",
    "mov x1,#0x4000": "chunk length const (x-form zeroes high too)",
    "mov x9,#0x4000": "expect length const",
    "cmp w0,w9": "sent-vs-asked check",
    "stur x10,[x29,#-0x40]": "addr snapshot to stack",
    "ldur x20,[x29,#-0x40]": "addr reload post-send",
}


def verify_code(code):
    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
    md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    md.detail = False
    seen = {}
    for i in md.disasm(code, BASE + CAVE):
        key = f"{i.mnemonic} {i.op_str}".replace(", ", ",").replace(" ", "")
        for want, why in NEED_OPS.items():
            w = want.replace(", ", ",").replace(" ", "")
            if key.startswith(w):
                seen[want] = seen.get(want, 0) + 1
    missing = [f"{w} ({why})" for w, why in NEED_OPS.items() if w not in seen]
    if missing:
        raise SystemExit("operand gate FAILED, missing: " + "; ".join(missing))
    print("Operand gate: " + ", ".join(f"{w} x{seen[w]}" for w in seen))
    got = [i.mnemonic for i in md.disasm(code, BASE + CAVE)]
    if got != EXPECTED_MNEMONICS:
        for n, (g, x) in enumerate(zip(got, EXPECTED_MNEMONICS)):
            flag = "" if g == x else "   <-- MISMATCH"
            print(f"{n:3d} got={g:<8} want={x:<8}{flag}")
        if len(got) != len(EXPECTED_MNEMONICS):
            print(f"length got={len(got)} want={len(EXPECTED_MNEMONICS)}")
            print("extra:", got[len(EXPECTED_MNEMONICS):])
        raise SystemExit("capstone self-test FAILED: refusing to touch image")
    print(f"Self-test: {len(got)} insns match expected sequence")


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

    data = bytearray(Path(args.container).read_bytes())
    # locate lk payload inside container via liblk
    sys.path.insert(0, str(repo))
    from liblk.image import LkImage
    import tempfile, os
    with tempfile.TemporaryDirectory() as td:
        # extract payload with the analyzer (fast, no-full-disasm)
        ad = Path(args.analysis_dir)
        lkbin = ad / "lk.bin"
        if not lkbin.is_file():
            r = subprocess.run([sys.executable, str(repo / "lk_static_analyzer.py"),
                                args.container, "-o", str(ad), "--no-full-disasm"],
                               capture_output=True, text=True)
            print(r.stdout[-1500:] if r.stdout else "")
            if r.returncode != 0:
                print(r.stderr[-2000:])
                raise SystemExit("analyzer failed")
        payload = bytearray(lkbin.read_bytes())

        # two-pass layout (adrp_add is fixed 8B so lengths are stable)
        a1 = build_handler(LK_LO, LK_LO, LK_LO, LK_LO, LK_LO, LK_LO)
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
        verify_code(code)

        # cave must be zeros
        cave = bytes(payload[CAVE:end])
        assert cave == b"\x00" * len(cave), f"cave dirty @0x{CAVE:x}"
        # regex row gate: [regex_name_va, handler 0xCDAC]
        row = bytes(payload[REGEX_ROW:REGEX_ROW + 16])
        name_va, hdl_va = struct.unpack("<QQ", row)
        rname = payload[name_va - BASE:name_va - BASE + 16].split(b"\x00")[0]
        assert rname == b"regex", f"row name is {rname!r}, refusing"
        assert hdl_va == BASE + 0xCDAC, f"row handler 0x{hdl_va:x}, refusing"
        print(f"Gate    : regex row @0x{REGEX_ROW:x} [{row.hex()}] OK")

        payload[CAVE:CAVE + len(code)] = code
        payload[name_off:name_off + 16] = NAME_STR.ljust(16, b"\x00")
        payload[usage_off:usage_off + 48] = USAGE_STR.ljust(48, b"\x00")
        payload[deny_off:deny_off + 32] = DENY_STR.ljust(32, b"\x00")
        payload[data_off:data_off + 8] = DATA_TAG.ljust(8, b"\x00")
        payload[empty_off:empty_off + 8] = EMPTY_STR.ljust(8, b"\x00")
        payload[lenhex_off:lenhex_off + 16] = LENHEX.ljust(16, b"\x00")
        payload[tbl_off:tbl_off + len(tbl)] = tbl
        print(f"Windows : {len(WINDOWS)} " +
              ", ".join(f"[0x{lo:x},0x{hi:x})" for lo, hi in WINDOWS))
        new_row = struct.pack("<QQ", BASE + name_off, BASE + CAVE)
        payload[REGEX_ROW:REGEX_ROW + 16] = new_row
        print(f"Patch   : handler {len(code)}B @0x{CAVE:x}, "
              f"name @0x{name_off:x}, usage @0x{usage_off:x}")
        print(f"Patch   : row 0x{REGEX_ROW:x} {row.hex()} -> {new_row.hex()}")

        patched_bin = Path(td) / "lk.readdump.bin"
        patched_bin.write_bytes(bytes(payload))
        out = str(Path(args.output).resolve())
        r = subprocess.run([sys.executable, str(repo / "lk_repack_signed.py"),
                            "--original-image", str(Path(args.container).resolve()),
                            "--patched-lk-bin", str(patched_bin),
                            "--output", out, "--name", "lk"],
                           capture_output=True, text=True, cwd=str(repo))
        print(r.stdout[-2500:] if r.stdout else "")
        if "Result: VALID" not in (r.stdout or ""):
            print(r.stderr[-2000:])
            raise SystemExit("repack did not verify VALID")
        print(f"Wrote   : {out}")


if __name__ == "__main__":
    main()

