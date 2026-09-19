#!/usr/bin/env python3
"""offread.py -- read module_param init values from an unloaded .ko.
Each off_* is an int in .data; locate via nm (__param_off_*) and dump.
Usage: offread.py offprinter.ko
"""
import re
import struct
import subprocess
import sys

ko = sys.argv[1]
nm = subprocess.run(["nm", ko], capture_output=True, text=True).stdout
syms = {}
for line in nm.splitlines():
    m = re.match(r"([0-9a-f]+) ([dDrRbB]) ((?:off|sz)_\w+)", line)
    if m:
        syms[m.group(3)] = (int(m.group(1), 16), m.group(2))
segs = subprocess.run(["readelf", "-S", "-W", ko],
                      capture_output=True, text=True).stdout
sec = {}
for line in segs.splitlines():
    m = re.match(r"\s*\[\s*\d+\]\s+(\.\S+)\s+\w+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)", line)
    if m:
        sec[m.group(1)] = (int(m.group(2), 16), int(m.group(3), 16),
                           int(m.group(4), 16))
d = open(ko, "rb").read()


def vaddr_sec(va, typ):
    want = ".rodata" if typ in "rR" else ".data" if typ in "dD" else ".bss"
    for name, (addr, off, sz) in sec.items():
        if name == want or name.startswith(want + "."):
            if addr <= va < addr + sz:
                return name, off + (va - addr)
    return None, None


vals = {}
for sym, (va, typ) in sorted(syms.items(), key=lambda kv: kv[1][0]):
    if typ in "bB":
        vals[sym] = 0  # zero-init statics live in .bss: value IS 0
        continue
    name, fo = vaddr_sec(va, typ)
    if fo is None:
        continue
    vals[sym] = struct.unpack_from("<i", d, fo)[0]
for k in sorted(vals):
    print("%s=0x%x (%d)" % (k, vals[k] & 0xFFFFFFFF, vals[k]))
