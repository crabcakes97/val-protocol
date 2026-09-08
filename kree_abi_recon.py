#!/usr/bin/env python3
"""kree_abi_recon.py -- extract KREE ioctl numbers + share structs (read-only).

Input: vendor TEE libs pulled live via root (libgz_uree.so, libTEECommon.so,
libMcClient.so). Method: disassemble with capstone, find ioctl@PLT call
sites, backscan for w1 immediate loads (movz/movn/orr-lsl) to recover the
_IOWR numbers; list /dev node strings, TEEC/UREE op strings. Output: JSON +
table that feeds kree_ioctl_explorer.c (--attempt-share uses THESE numbers,
never guessed ones). Never touches the device.
"""
from __future__ import annotations

import argparse
import json
import struct
import subprocess
from pathlib import Path

try:
    from capstone import CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN, Cs
    HAVE_CS = True
except ImportError:
    HAVE_CS = False


def plt_targets(lib: Path) -> dict[int, str]:
    """GOT slot addr -> symbol name via readelf relocations."""
    out: dict[int, str] = {}
    try:
        r = subprocess.run(["readelf", "-rW", str(lib)], capture_output=True,
                           text=True, timeout=60)
    except FileNotFoundError:
        return out
    for line in r.stdout.splitlines():
        parts = line.split()
        if len(parts) >= 5 and "ioctl" in parts[4]:
            try:
                out[int(parts[0], 16)] = parts[4]
            except ValueError:
                pass
    return out


def exec_sections(lib: Path) -> list[tuple[bytes, int]]:
    """All SHF_EXECINSTR sections (.plt + .text): (bytes, vaddr)."""
    blob = lib.read_bytes()
    r = subprocess.run(["readelf", "-SW", str(lib)], capture_output=True,
                       text=True, timeout=60)
    out = []
    for line in r.stdout.splitlines():
        if "] .plt " in line or "] .text " in line:
            p = line.split()
            addr, off, size = int(p[3], 16), int(p[4], 16), int(p[5], 16)
            out.append((blob[off:off + size], addr))
    if not out:
        raise SystemExit(f"no exec sections in {lib}")
    return out


def text_section(lib: Path) -> tuple[bytes, int]:
    r = subprocess.run(["readelf", "-SW", str(lib)], capture_output=True,
                       text=True, timeout=60)
    for line in r.stdout.splitlines():
        if "] .text " in line:
            p = line.split()
            addr, off, size = int(p[3], 16), int(p[4], 16), int(p[5], 16)
            return lib.read_bytes()[off:off + size], addr
    raise SystemExit(f"no .text in {lib}")


def w1_imm_backscan(code: bytes, base: int, call_va: int) -> str:
    """Track w1 immediate in the ~20 insns before the ioctl BL."""
    if not HAVE_CS:
        return "capstone-missing"
    md = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)
    start = max(base, call_va - 84) - base
    insns = list(md.disasm(code[start:call_va - base], base + start))
    w1: int | None = None
    for ins in insns:
        op = ins.op_str
        if ins.mnemonic in ("movz", "movn", "mov") and op.startswith("w1"):
            try:
                imm = op.split("#")[1].split(",")[0].strip()
                val = int(imm, 0)
                if "lsl" in op:
                    val <<= int(op.split("lsl")[1].strip().lstrip("# "))
                w1 = (~val & 0xFFFFFFFF) if ins.mnemonic == "movn" else val
            except (IndexError, ValueError):
                pass
        elif ins.mnemonic == "orr" and op.startswith("w1, w1"):
            try:
                w1 = (w1 or 0) | int(op.split("#")[1].split(",")[0], 0)
            except (IndexError, ValueError):
                pass
    return hex(w1) if w1 is not None else "reg-built?"


def dev_strings(lib: Path) -> list[str]:
    blob = lib.read_bytes()
    out: list[str] = []
    for needle in (b"/dev/gz_kree", b"/dev/trusty-ipc", b"/dev/mobicore",
                   b"TZCMD", b"MEM_SHAREDMEM", b"UREE_", b"TEEC_"):
        s, hits = 0, []
        while True:
            i = blob.find(needle, s)
            if i < 0:
                break
            end = blob.find(b"\x00", i)
            try:
                hits.append(blob[i:end if end > 0 else i + 64].decode("latin-1"))
            except UnicodeDecodeError:
                pass
            s = i + 1
            if len(hits) > 8:
                break
        out.extend(sorted(set(hits))[:8])
    return out


def plt_stubs_for_got(code: bytes, base: int, got_va: int) -> list[int]:
    """Two-hop: ADRP(page of GOT) + LDR [base,#off] landing on got_va."""
    stubs = []
    for off in range(0, len(code) - 8, 4):
        w = struct.unpack_from("<I", code, off)[0]
        if (w & 0x9F000000) != 0x90000000:
            continue
        cur = base + off
        imm = (((w >> 5) & 0x7FFFF) << 2) | ((w >> 29) & 0x3)
        if imm & 0x100000:
            imm -= 0x200000
        page = (cur & ~0xFFF) + imm * 0x1000
        if page != (got_va & ~0xFFF):
            continue
        rd = w & 0x1F
        w2 = struct.unpack_from("<I", code, off + 4)[0]
        # LDR Xt,[Xn,#off] (64-bit, unsigned imm): dest may be x17 while
        # the ADRP base is x16 (standard AArch64 PLT shape).
        if (w2 & 0xFFC00000) == 0xF9400000 and ((w2 >> 5) & 0x1F) == rd:
            if page + (((w2 >> 10) & 0xFFF) << 3) == got_va:
                stubs.append(cur)
    return stubs


def defined_funcs(lib: Path) -> list[tuple[int, int, str]]:
    """(start, end, name) of defined GLOBAL FUNCs via readelf --dyn-syms."""
    out = []
    try:
        r = subprocess.run(["readelf", "--dyn-syms", "-W", str(lib)],
                           capture_output=True, text=True, timeout=60)
    except FileNotFoundError:
        return out
    for line in r.stdout.splitlines():
        p = line.split()
        if len(p) >= 8 and p[3] == "FUNC" and p[6] != "UND" and p[7] != "Section":
            try:
                val, size = int(p[1], 16), int(p[2])
            except ValueError:
                continue
            if val and size:
                out.append((val, val + size, p[7].split("@")[0]))
    return out


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("libs", nargs="+", help="pulled .so files")
    p.add_argument("-o", "--out", default="/tmp/opencode/kree/kree_abi.json")
    args = p.parse_args()
    result: dict = {"libs": {}}
    for libname in args.libs:
        lib = Path(libname)
        exec_secs = exec_sections(lib)
        code, base = text_section(lib)
        rel = plt_targets(lib)
        # BL targets are PLT stubs, not GOT slots: resolve both hops.
        # Stubs live in .plt, callers in .text -- search every exec section.
        stub_names: dict[int, str] = {}
        for got_va, name in rel.items():
            for sbytes, sbase in exec_secs:
                for stub in plt_stubs_for_got(sbytes, sbase, got_va):
                    stub_names[stub] = name
        ioctl_sites = []
        for off in range(0, len(code) - 4, 4):
            w = struct.unpack_from("<I", code, off)[0]
            if (w & 0xFC000000) != 0x94000000:  # BL
                continue
            imm = w & 0x3FFFFFF
            if imm & 0x2000000:
                imm -= 0x4000000
            tgt = base + off + imm * 4
            name = stub_names.get(tgt, "")
            if "ioctl" in name:
                call_va = base + off
                ioctl_sites.append({"call": hex(call_va),
                                    "w1": w1_imm_backscan(code, base, call_va)})
        result["libs"][lib.name] = {
            "text_base": hex(base), "text_size": len(code),
            "ioctl_got_slots": {hex(k): v for k, v in rel.items()},
            "ioctl_plt_stubs": sorted(hex(s) for s in stub_names),
            "ioctl_call_sites": ioctl_sites[:20],
            "strings": dev_strings(lib),
        }
        funcs = defined_funcs(lib)

        def owner(va: int) -> str:
            v = int(va, 16)
            for s, e, n in funcs:
                if s <= v < e:
                    return n
            return "?"
        for c in result["libs"][lib.name]["ioctl_call_sites"]:
            c["in"] = owner(c["call"])
    out = Path(args.out)
    out.write_text(json.dumps(result, indent=1))
    for lname, lent in result["libs"].items():
        print(f"== {lname} ==")
        print(f"  ioctl GOT slots: {lent['ioctl_got_slots']}")
        for c in lent["ioctl_call_sites"]:
            print(f"  ioctl BL @ {c['call']} w1={c['w1']} in {c.get('in', '?')}")
        for s in lent["strings"][:16]:
            print(f"  str: {s}")
    print(f"JSON: {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
