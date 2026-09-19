#!/usr/bin/env python3
"""btf_parse.py -- struct member offsets from raw BTF (/sys/kernel/btf/vmlinux).
Usage: btf_parse.py <btf> --want task_struct:cred,pi_blocked_on rt_mutex_waiter:task
       (comma list per struct; prints name=byte_offset). No deps.
"""
import struct
import sys

KIND_STRUCT, KIND_UNION = 4, 5


def parse(path):
    d = open(path, "rb").read()
    magic, ver, flags, hlen, toff, tlen, soff, slen = struct.unpack_from(
        "<HBBIIIII", d, 0)
    assert magic == 0xEB9F and ver == 1, (hex(magic), ver)
    types, strs = d[hlen + toff:hlen + toff + tlen], d[hlen + soff:hlen + soff + slen]

    def sname(o):
        e = strs.index(b"\x00", o)
        return strs[o:e].decode()

    structs = {}
    o = 0
    while o + 12 <= len(types):
        name_off, info, size = struct.unpack_from("<III", types, o)
        kind = (info >> 24) & 0x1F
        vlen = info & 0xFFFF
        o += 12
        if kind in (KIND_STRUCT, KIND_UNION):
            name = sname(name_off)
            mems = []
            for _ in range(vlen):
                mo, mt, moff = struct.unpack_from("<III", types, o)
                o += 12
                mems.append((sname(mo), moff // 8, mt))
            if name and name not in structs:
                structs[name] = (size, mems)
        elif kind == 1:  # INT
            o += 4
        elif kind in (3,):  # ARRAY
            o += 12
        elif kind in (6, 19):  # ENUM/ENUM64 (values only, no extra header)
            o += vlen * (8 if kind == 6 else 16)
        elif kind in (12, 13):  # FUNC (header only) / FUNC_PROTO (+params)
            o += vlen * 8 if kind == 13 else 0
        elif kind in (14,):  # VAR
            o += 4
        elif kind in (15,):  # DATASEC
            o += 4 + vlen * 12
        elif kind in (17,):  # DECL_TAG (+component_idx)
            o += 4
        elif kind in (18,):  # TYPE_TAG (header only)
            pass
    return structs


def main():
    structs = parse(sys.argv[1])
    print("structs:", len(structs))
    args = sys.argv[2:]
    if args and args[0] == "--want":
        args = args[1:]
    for spec in args:
        sname, fields = spec.split(":")
        st = structs.get(sname)
        if not st:
            print(sname, "NOT-FOUND")
            continue
        size, mems = st
        print("%s sizeof=0x%x" % (sname, size))
        want = fields.split(",")
        got = {m: off for m, off, t in mems}
        for f in want:
            print("  %s=%s" % (f, ("0x%x" % got[f]) if f in got else "MISSING"))

if __name__ == "__main__":
    main()
