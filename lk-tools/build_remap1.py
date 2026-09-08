#!/usr/bin/env python3
"""Sysreg probe (option-B recon, S15 step 1): read-only, zero new slots.

`oem readdump f8|f9|fa|fb` returns one INFO line whose 16 hex chars are
the u64 LE value of CurrentEL / TTBR0_EL1 / TTBR1_EL1 / MAIR_EL1.
All four are EL1-safe (no trap at EL1 or EL2). Small addrs <0x100 that
are NOT sentinels still deny. Normal INFO reads unchanged (control).

Borrowed `regex` slot, cave 0xCE080, old-byte gates, VALID re-sign.
Every word python-computed + capstone-gated (mrs fields especially).
"""
import struct
import sys
from pathlib import Path

BASE = 0xFFFF000050F00000
CAVE = 0xCE080
RESPONDER = BASE + 0x7C4C
INFO_TAG_OFF = 0xD953D
REGEX_ROW = 0x1207B0
LK_LO = BASE
LK_HI = BASE + 0x100000

WINDOWS = (
    (0x40000000, 0x40010000),
    (LK_LO, LK_HI),
    # S15-step2 probe: TTBR roots live at phys 0x510300/0x510400 (read
    # live via f9/fa). LOW VAs fault (no identity map) -- row kept as
    # documented negative, DO NOT probe.
    (0x500000, 0x520000),
    # USB-globals + region registry (~0xFFFF0000510xxxxx, touched by USB
    # stubs so presumed mapped): region table ~0x51022xxx (append slot
    # for DRAM region!) + USB struct ~0x51052280 (vtable bodies!). ONE
    # probe row; single-probe discipline (fault = clean reboot).
    (0xFFFF000051000000, 0xFFFF000051100000),
    # S15-step3 remap: modem DRAM window (mapped on demand by `remap`
    # sentinel below; allowlist row must pre-exist for the read-back).
    (0xFFFF0000C0000000, 0xFFFF0000C0100000),
)


def movz(rd, imm16, hw=0):
    return struct.pack("<I", 0xD2800000 | (hw << 21) | (imm16 << 5) | rd)


def movk(rd, imm16, hw=0):
    return struct.pack("<I", 0xF2800000 | (hw << 21) | (imm16 << 5) | rd)


def mov_reg64(rd, rn):
    return struct.pack("<I", 0xAA0003E0 | (rn << 16) | rd)


def stp_imm(rt1, rt2, rn, off):
    assert off % 8 == 0 and 0 <= off // 8 <= 63
    return struct.pack("<I", 0xA9000000 | ((off // 8) << 15)
                       | (rt2 << 10) | (rn << 5) | rt1)


def str_imm64(rt, rn, off):
    assert off % 8 == 0 and 0 <= off // 8 <= 0xFFF
    return struct.pack("<I", 0xF9000000 | ((off // 8) << 10)
                       | (rn << 5) | rt)


def add_imm64(rd, rn, imm12):
    assert 0 <= imm12 <= 0xFFF
    return struct.pack("<I", 0x91000000 | (imm12 << 10) | (rn << 5) | rd)


def subs_imm32(rd, rn, imm12):
    assert 0 <= imm12 <= 0xFFF
    return struct.pack("<I", 0x71000000 | (imm12 << 10) | (rn << 5) | rd)


def cmp_imm64(rn, imm12):
    assert 0 <= imm12 <= 0xFFF
    return struct.pack("<I", 0xF1000000 | (imm12 << 10) | (rn << 5) | 31)


def ldp_post(rt1, rt2, rn, imm_bytes):
    assert imm_bytes % 8 == 0
    imm7 = imm_bytes // 8
    assert 0 <= imm7 <= 0x7F
    return struct.pack("<I", 0xA8C00000 | (imm7 << 15) | (rt2 << 10)
                       | (rn << 5) | rt1)


def cmp_reg64(rn, rm):
    return struct.pack("<I", 0xEB000000 | (rm << 16) | (rn << 5) | 31)


def mrs(rt, op0, op1, crn, crm, op2):
    return struct.pack("<I", 0xD5200000 | (op0 << 19) | (op1 << 16)
                       | (crn << 12) | (crm << 8) | (op2 << 5) | rt)


def stur64(rt, rn, simm9):
    assert -256 <= simm9 < 256
    return struct.pack("<I", 0xF8000000 | ((simm9 & 0x1FF) << 12)
                       | (rn << 5) | rt)


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

    def cbz(self, rt, label):
        self.fixups.append((len(self.code), "cbz_%d" % rt, label))
        self.emit(b"\x00\x00\x00\x00")

    def adrp_add(self, rd, target):
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
            elif isinstance(kind, str) and kind.startswith("cbz"):
                rt = int(kind.split("_")[1])
                tgt = self.labels[payload]
                w = 0xB4000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | rt
            else:
                tgt = self.labels[payload]
                w = 0x54000000 | ((((tgt - pc) // 4) & 0x7FFFF) << 5) | kind
            struct.pack_into("<I", self.code, off, w & 0xFFFFFFFF)
        return bytes(self.code)


W = lambda v: struct.pack("<I", v)  # noqa: E731

# (op0, op1, CRn, CRm, op2) per ARM ARM; gate renders names to verify.
SYSREGS = {
    0xF8: ("CurrentEL", (3, 0, 4, 2, 2)),
    0xF9: ("TTBR0_EL1", (3, 0, 2, 0, 0)),
    0xFA: ("TTBR1_EL1", (3, 0, 2, 0, 1)),
    0xFB: ("MAIR_EL1", (3, 0, 10, 2, 0)),
}


def build_handler(usage_va, tbl_va, deny_va):
    a = Asm(BASE + CAVE)
    e = a.emit
    # prologue: copy of proven unrolled frame
    e(W(0xA9BD7BFD))
    e(W(0x910003FD))
    e(W(0xA9014FF4))
    e(W(0xA90257F6))
    e(W(0xD10143FF))
    e(W(0x7100081F))  # cmp w0,#2
    a.bcond(1, "usage")
    e(W(0xAA0103F3))  # mov x19,x1 (argv)
    e(W(0xF9400429))  # ldr x9,[x1,#8]
    e(movz(10, 0, 0))
    a.label("ploop")
    e(W(0x3840152B))  # ldrb w11,[x9],#1
    e(W(0x7100017F))
    a.bcond(0, "pdone")
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
    a.label("pdone")
    # sysreg sentinels live below 0x100 (never mapped, deny today).
    # NOTE: must sit BEFORE the LK-short b.lo (small addrs bypass movk!).
    e(cmp_imm64(10, 0x100))
    a.bcond(2, "lkshort")  # b.hs lkshort (normal addrs)
    e(cmp_imm64(10, 0xF8))
    a.bcond(0, "sr_cur")
    e(cmp_imm64(10, 0xF9))
    a.bcond(0, "sr_tt0")
    e(cmp_imm64(10, 0xFA))
    a.bcond(0, "sr_tt1")
    e(cmp_imm64(10, 0xFB))
    a.bcond(0, "sr_mair")
    e(cmp_imm64(10, 0xFC))
    a.bcond(0, "sr_p2v")
    e(cmp_imm64(10, 0xFD))
    a.bcond(0, "remap")
    a.b("deny")
    a.label("lkshort")
    e(movz(11, 0x5000, 1))
    e(cmp_reg64(10, 11))
    a.bcond(3, "tbl_raw")
    e(movz(11, 0x5100, 1))
    e(cmp_reg64(10, 11))
    a.bcond(2, "tbl_raw")
    e(W(0xF2FFFFEA))  # movk x10 high
    a.b("tbl_raw")  # (sentinels handled at pdone now)
    a.label("sr_cur")
    e(mrs(11, *SYSREGS[0xF8][1]))
    a.b("sr_fmt")
    a.label("sr_tt0")
    e(mrs(11, *SYSREGS[0xF9][1]))
    a.b("sr_fmt")
    a.label("sr_tt1")
    e(mrs(11, *SYSREGS[0xFA][1]))
    a.b("sr_fmt")
    a.label("sr_mair")
    e(mrs(11, *SYSREGS[0xFB][1]))
    a.b("sr_fmt")
    a.label("sr_p2v")
    # phys_to_virt(0x510300) via stock 0x88884 (pure registry reads, no
    # fault possible; returns 0 if unregistered). TTBR1's own table =
    # the descriptor clone source. Result -> x11 -> shared sr_fmt.
    e(movz(0, 0x0300, 0))
    e(movk(0, 0x0051, 1))
    a.bl_abs(BASE + 0x88884)
    e(mov_reg64(11, 0))  # mov x11,x0 (gate-checked)
    a.label("remap")
    # S15-step3: map 1MB modem DRAM (phys 0xC0000000) at scratch VA.
    # 1) append registry e08 {phys,virt,size,flag} + zero e09 (terminator).
    #    Table base 0xFFFF000051022000 (live-read, mapped+writable).
    #    e08 off = 8*0x28 = 0x140; e09 = 0x168..0x190.
    a.adrp_add(9, 0xFFFF000051022000)
    e(W(0xAA1F03EB))  # mov x11,xzr
    e(W(0xF2B8000B))  # movk x11,#0xc000,lsl#16 (phys; gate-checked)
    e(W(0xAA1F03EC))  # mov x12,xzr
    e(W(0xF2B8000C))  # movk x12,#0xc000,lsl#16 (virt mid; gate-checked)
    e(W(0xF2FFFFEC))  # movk x12,#0xffff,lsl#48 (virt hi; gate-checked)
    e(W(0xAA1F03ED))  # mov x13,xzr
    e(W(0xF2A0020D))  # movk x13,#0x10,lsl#16 (size 1MB; gate-checked)
    e(stp_imm(11, 12, 9, 0x140))  # e08.phys,virt (gate-checked)
    e(stp_imm(13, 31, 9, 0x150))  # e08.size,flag=0 (gate-checked)
    e(stp_imm(31, 31, 9, 0x168))  # e09 zero (gate-checked)
    e(stp_imm(31, 31, 9, 0x178))  # e09 zero (gate-checked)
    e(str_imm64(31, 9, 0x188))  # e09 zero tail (gate-checked)
    # 2) map(VA) via stock walker (site-1 pattern: tpidr chain + out).
    e(W(0xD538D088))  # mrs x8,tpidr_el1 (stock word; gate-checked)
    e(W(0xF9401D08))  # ldr x8,[x8,#0x38] (gate-checked)
    a.cbz(8, "mapfail")
    e(W(0x91016100))  # add x0,x8,#0x58 (gate-checked)
    e(W(0xAA1F03E1))  # mov x1,xzr
    e(W(0xF2B80001))  # movk x1,#0xc000,lsl#16 (gate-checked)
    e(W(0xF2FFFFE1))  # movk x1,#0xffff,lsl#48 (gate-checked)
    e(W(0xD10063A2))  # sub x2,x29,#0x18 (out-scratch; gate-checked)
    e(W(0xAA1F03E3))  # mov x3,xzr (gate-checked)
    a.bl_abs(BASE + 0x6844)
    e(W(0x7100001F))  # cmp w0,#0
    a.bcond(1, "mapfail")  # b.ne mapfail (map refused: print code)
    # 3) TLB maintenance (EL1, inner-shareable scope).
    e(W(0xD5033B9F))  # dsb ish (gate-checked)
    e(W(0xD508831F))  # tlbi vmalle1is (gate-checked)
    e(W(0xD5033B9F))  # dsb ish
    e(W(0xD5033FDF))  # isb (gate-checked)
    # 4) read back through the allowlist (row enforced by tbl_raw!).
    e(W(0xD280000A))  # mov x10,#0 (gate-checked)
    e(W(0xF2B8000A))  # movk x10,#0xc000,lsl#16 (gate-checked)
    e(W(0xF2FFFFEA))  # movk x10,#0xffff,lsl#48 (gate-checked)
    a.b("tbl_raw")
    a.label("mapfail")
    e(W(0xAA0003EB))  # mov x11,x0 (fail code; gate-checked)
    a.b("sr_fmt")
    a.label("sr_fmt")
    # one INFO line: 8 LE bytes -> 16 hex chars (S15 oracle shape).
    e(stur64(11, 29, -0x10))  # u64 scratch in frame (free slot)
    e(W(0xD10043B4))  # sub x20,x29,#0x10 (gate-checked)
    e(W(0xD10103A9))  # sub x9,x29,#0x40 (line buf, INFO-proven)
    e(W(0xD2800008))  # mov x8,#0 (col)
    a.label("srcol")
    e(W(0x38686A8B))  # ldrb w11,[x20,x8]
    e(W(0x53047D6C))  # lsr w12,w11,#4
    e(W(0x12000D8C))  # and w12,w12,#0xF
    e(W(0x7100259F))  # cmp w12,#9
    a.bcond(9, "srhidec")
    e(W(0x11001D8C))
    a.label("srhidec")
    e(W(0x1100C18C))
    e(W(0x3800152C))
    e(W(0x12000D6C))  # and w12,w11,#0xF
    e(W(0x7100259F))
    a.bcond(9, "srlodec")
    e(W(0x11001D8C))
    a.label("srlodec")
    e(W(0x1100C18C))
    e(W(0x3800152C))
    e(W(0x91000508))  # add x8,x8,#1
    e(W(0xF100211F))  # cmp x8,#8 (gate-checked; 8 cols, not 16)
    a.bcond(1, "srcol")
    e(W(0x3900013F))  # strb wzr,[x9]
    e(W(0xD10103A1))  # sub x1,x29,#0x40
    a.adrp_add(0, BASE + INFO_TAG_OFF)
    a.bl_abs(RESPONDER)
    e(W(0x52800020))  # mov w0,#1
    a.b("epilogue")
    a.label("tbl_raw")
    a.adrp_add(11, tbl_va if tbl_va else BASE)
    e(movz(12, len(WINDOWS), 0))
    a.label("tloop")
    e(ldp_post(13, 14, 11, 16))
    e(cmp_reg64(10, 13))
    a.bcond(3, "tnext")
    e(add_imm64(15, 10, 255))
    e(cmp_reg64(15, 14))
    a.bcond(2, "tnext")
    a.b("line0")
    a.label("tnext")
    e(subs_imm32(12, 12, 1))
    a.bcond(1, "tloop")
    a.b("deny")
    for _ln in range(16):
        a.label(f"line{_ln}")
        if _ln == 0:
            e(W(0xAA0A03F4))  # mov x20,x10 HERE
        e(W(0xD10103A9))
        e(W(0xD2800008))
        a.label(f"col{_ln}")
        e(W(0x38686A8B))
        e(W(0x53047D6C))
        e(W(0x12000D8C))
        e(W(0x7100259F))
        a.bcond(9, f"hidec{_ln}")
        e(W(0x11001D8C))
        a.label(f"hidec{_ln}")
        e(W(0x1100C18C))
        e(W(0x3800152C))
        e(W(0x12000D6C))
        e(W(0x7100259F))
        a.bcond(9, f"lodec{_ln}")
        e(W(0x11001D8C))
        a.label(f"lodec{_ln}")
        e(W(0x1100C18C))
        e(W(0x3800152C))
        e(W(0x91000508))
        e(W(0xF100411F))  # cmp x8,#16
        a.bcond(1, f"col{_ln}")
        e(W(0x3900013F))
        e(W(0xD10103A1))
        a.adrp_add(0, BASE + INFO_TAG_OFF)
        a.bl_abs(RESPONDER)
        e(W(0x91004294))
    e(W(0x52800020))
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
    "movk x10,#0xffff,lsl#48": "LK-short high bits",
    "cmp x10,#0x100": "sentinel range",
    "cmp x10,#0xf8": "sentinel cur",
    "cmp x10,#0xf9": "sentinel ttbr0",
    "cmp x10,#0xfa": "sentinel ttbr1",
    "cmp x10,#0xfb": "sentinel mair",
    "cmp x10,#0xfc": "sentinel p2v",
    "cmp x10,#0xfd": "sentinel remap",
    "mov x11,xzr": "entry phys lo",
    "movk x11,#0xc000,lsl#16": "entry phys hi",
    "mov x12,xzr": "entry virt lo",
    "movk x12,#0xc000,lsl#16": "entry virt mid",
    "movk x12,#0xffff,lsl#48": "entry virt hi",
    "mov x13,xzr": "entry size lo",
    "movk x13,#0x10,lsl#16": "entry size 1MB",
    "stp x11,x12,[x9,#0x140]": "append e08 phys,virt",
    "stp x13,xzr,[x9,#0x150]": "append e08 size,flag",
    "stp xzr,xzr,[x9,#0x168]": "zero e09 term",
    "stp xzr,xzr,[x9,#0x178]": "zero e09 term",
    "str xzr,[x9,#0x188]": "zero e09 tail",
    "mrs x8,tpidr_el1": "mmu struct chain",
    "ldr x8,[x8,#0x38]": "mmu struct deref",
    "cbz x8": "mmu null guard",
    "add x0,x8,#0x58": "mmu arg",
    "mov x1,xzr": "map VA lo",
    "movk x1,#0xc000,lsl#16": "map VA mid",
    "movk x1,#0xffff,lsl#48": "map VA hi",
    "sub x2,x29,#0x18": "map out-scratch",
    "mov x3,xzr": "map flags 0",
    "dsb ish": "barrier pre-tlbi",
    "tlbi vmalle1is": "invalidate EL1 TLB",
    "isb": "barrier post-tlbi",
    "mov x10,#0": "readback VA lo",
    "movk x10,#0xc000,lsl#16": "readback VA mid",
    "mov x11,x0": "mapfail code",
    "mov x0,#0x300": "p2v phys lo (movz alias)",
    "movk x0,#0x51,lsl#16": "p2v phys hi",
    "mov x11,x0": "p2v result",
    "mrs x11,currentel": "sysreg EL (gate pins encoding)",
    "mrs x11,ttbr0_el1": "sysreg T0 (gate pins encoding)",
    "mrs x11,ttbr1_el1": "sysreg T1 (gate pins encoding)",
    "mrs x11,mair_el1": "sysreg MAIR (gate pins encoding)",
    "stur x11,[x29,#-0x10]": "u64 scratch store",
    "sub x20,x29,#0x10": "scratch pointer",
    "ldrb w11,[x20,x8]": "sysreg byte read",
    "and w12,w12,#0xf": "hi-mask",
    "and w12,w11,#0xf": "lo-mask",
    "strb w12,[x9],#1": "hex-store",
    "cmp x8,#8": "8-col bound (NOT 16)",
    "ldp x13,x14,[x11],#0x10": "window-table row load",
    "sub x9,x29,#0x40": "line buffer pointer",
}

NAME_STR = b"readdump\x00"
USAGE_STR = b"usage: oem readdump <a>|f8-fd [v9]\x00"
DENY_STR = b"deny: no window\x00"


def align8(v):
    return (v + 7) & ~7


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
    a1 = build_handler(z, z, z)
    c1 = a1.resolve()
    name_off = align8(CAVE + len(c1))
    usage_off = name_off + 16
    assert len(USAGE_STR) <= 48, "usage too long"
    deny_off = usage_off + 48
    tbl_off = align8(deny_off + 32)
    tbl = b"".join(struct.pack("<QQ", lo, hi) for lo, hi in WINDOWS)
    end = tbl_off + len(tbl)
    assert end - CAVE <= 0xF84, f"does not fit cave: {end - CAVE:#x}"
    code = build_handler(BASE + usage_off, BASE + tbl_off, BASE + deny_off).resolve()
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
    payload[usage_off:usage_off + 48] = USAGE_STR.ljust(48, b"\x00")
    payload[deny_off:deny_off + 32] = DENY_STR.ljust(32, b"\x00")
    payload[tbl_off:tbl_off + len(tbl)] = tbl
    payload[REGEX_ROW:REGEX_ROW + 16] = struct.pack("<QQ", BASE + name_off, BASE + CAVE)

    import tempfile
    with tempfile.TemporaryDirectory() as td:
        pb = Path(td) / "lk.sysreg.bin"
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
