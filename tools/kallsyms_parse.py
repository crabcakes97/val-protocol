#!/usr/bin/env python3
"""kallsyms_parse.py -- full static kallsyms recovery from raw arm64 Image.
Handles CONFIG_KALLSYMS_BASE_RELATIVE (u32 addrs). Steps:
 1. token_index (256 u16) -> token_table + token list
 2. markers walk-back -> mstart, marks[] -> num range
 3. addresses run + num_syms int consistency -> num, addrs[]
 4. names_start search (decode must land exactly on mstart) -> names[]
 5. report: num_syms, _text link, wanted symbols, file offsets.
Usage: kallsyms_parse.py <Image> [--want a,b,c] [--symtab out.txt]
"""
import struct
import sys

def u16(d, o): return struct.unpack_from("<H", d, o)[0]
def u32(d, o): return struct.unpack_from("<I", d, o)[0]

WANT_DEFAULT = ("_text,_stext,init_task,init_cred,remove_waiter,"
    "rt_mutex_start_proxy_lock,selinux_state,ashmem_ioctl").split(",")

def find_token_index(d):
    out = []
    for o in range(0, len(d) - 512, 2):
        if d[o] != 0 or d[o + 1] != 0:
            continue
        ok, prev = True, 0
        for i in range(256):
            v = u16(d, o + i * 2)
            if v < prev or v > 70000:
                ok = False
                break
            prev = v
        if ok and prev > 256:
            out.append(o)
    return out

def main():
    img = sys.argv[1]
    want = WANT_DEFAULT[:]
    tab = None
    a = sys.argv[2:]
    while a:
        if a[0] == "--want":
            want = a[1].split(",")
            a = a[2:]
        elif a[0] == "--symtab":
            tab = a[1]
            a = a[2:]
        else:
            a = a[1:]
    d = open(img, "rb").read()
    n = len(d)
    print("size", n, flush=True)
    tok = None
    for idx in find_token_index(d)[:24]:
        tidx = [u16(d, idx + i * 2) for i in range(256)]
        tsize, tstart = tidx[-1], idx - tidx[-1]
        if tstart < 0:
            continue
        table = d[tstart:idx]
        good = sum(1 for b in table if 97 <= b <= 122 or b in b"0123456789_.")
        if good < len(table) * 0.6:
            continue
        toks = [table[tidx[i]:tidx[i + 1]] for i in range(255)]
        # markers walk-back
        marks, o, prev = [], tstart - 4, 1 << 32
        while o > 0 and len(marks) < 30000:
            v = u32(d, o)
            if v >= prev or (marks and prev - v > 500000):
                break
            marks.append(v)
            prev = v
            o -= 4
        marks.reverse()
        if not marks or marks[0] != 0 or len(marks) < 10:
            continue
        mstart = o + 4
        nmarks = len(marks)
        nlo, nhi = (nmarks - 1) * 256 + 1, nmarks * 256
        print("idx=0x%x tsize=%d nmarks=%d num_range=[%d,%d] mstart=0x%x" %
              (idx, tsize, nmarks, nlo, nhi, mstart), flush=True)
        if tok is None or nmarks > tok[4]:
            tok = (idx, tsize, tstart, mstart, nmarks, marks, toks)
    if tok is None:
        print("no token table found")
        return
    idx, tsize, tstart, mstart, nmarks, marks, toks = tok
    # ---- pass 2: coarse-step scan for (u32-run, count) pairs ----
    print("scanning address runs...", flush=True)
    best = []
    step = 4096
    mv = memoryview(d)
    def get(o): return struct.unpack_from("<I", mv, o)[0]
    o = 0
    while o < n - 4:
        if get(o) < 0x4000000:
            # expand edges (capped: kallsyms won't exceed 300k entries)
            lo = o
            while lo - 4 >= 0 and get(lo - 4) < 0x4000000 and (o - lo) < 0x130000:
                lo -= 4
            hi = o
            while hi + 4 < n and get(hi + 4) < 0x4000000 and (hi - o) < 0x130000:
                hi += 4
            cnt = (hi + 4 - lo) // 4
            if 20000 < cnt < 300000 and hi + 8 <= n and get(hi + 4) == cnt:
                best.append((lo, cnt))
            o = hi + 8
        else:
            o += step
    print("run+count pairs:", [(hex(x), c) for x, c in best[:8]], flush=True)

if __name__ == "__main__":
    main()
