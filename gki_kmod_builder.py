#!/usr/bin/env python3
"""gki_kmod_builder.py -- generate a GKI phys-range reader module (no build).

Proven possible, not yet done: unsigned kmods load on nevada
(CONFIG_MODULE_SIG_FORCE off, modules_disabled=0), kernel
5.15.180-android13-8-g9b2308ac0ad6. Full GKI source sync = hours; this tool
does NOT sync or compile. It (1) validates requested ranges against a
/proc/iomem map (local file or adb-pulled), refusing modem-private
0xD0000000+135MB by default (stage-2 PERM:0 -- read faults may panic; needs
--include-modem-private with explicit ack), and (2) writes the module source
+ Makefile + exact repo-sync/build recipe. insmod happens on YOUR terminal,
on the SLOT B boot, never from this tool.
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path

GKI_TAG = "5.15.180-android13-8-g9b2308ac0ad6"
MODEM_PHYS, MODEM_SIZE = 0xD0000000, 135 * 1024 * 1024
SLOT = "b"

MODULE_C = r'''// phys_reader.c -- chunked physical-range reader (generated)
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/io.h>
#include <linux/uaccess.h>
static unsigned long p_start = CONFIG_PHYS_START;
static unsigned long p_len = CONFIG_PHYS_LEN;
module_param(p_start, ulong, 0444);
module_param(p_len, ulong, 0444);
static void __iomem *win;
static ssize_t pread(struct file *f, char __user *ub, size_t n, loff_t *ppos)
{
    size_t off = (size_t)*ppos, chunk;
    if (off >= p_len) return 0;
    if (off + n > p_len) n = p_len - off;
    chunk = min(n, (size_t)PAGE_SIZE);
    if (copy_to_user(ub, (char __iomem *)win + off, chunk)) return -EFAULT;
    *ppos += chunk;
    return chunk;
}
static const struct proc_ops pops = { .proc_read = pread };
static int __init init_mod(void)
{
    if (!request_mem_region(p_start, p_len, "phys_reader")) return -EBUSY;
    win = ioremap_cache(p_start, p_len);
    if (!win) { release_mem_region(p_start, p_len); return -ENOMEM; }
    proc_create("phys_reader", 0444, NULL, &pops);
    pr_info("phys_reader: %#lx +%#lx\n", p_start, p_len);
    return 0;
}
static void __exit exit_mod(void)
{
    remove_proc_entry("phys_reader", NULL);
    if (win) iounmap(win);
    release_mem_region(p_start, p_len);
}
module_init(init_mod); module_exit(exit_mod);
MODULE_LICENSE("GPL");
'''

MAKEFILE = '''KDIR ?= $(HOME)/gki/android13-8/out
obj-m := phys_reader.o
all:; $(MAKE) -C $(KDIR) M=$(PWD) modules
'''


def parse_iomem(text: str) -> list[tuple[int, int, str]]:
    out = []
    for line in text.splitlines():
        m = re.match(r"\s*([0-9a-f]+)-([0-9a-f]+)\s*:\s*(.+)", line)
        if m:
            out.append((int(m.group(1), 16), int(m.group(2), 16), m.group(3).strip()))
    return out


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--iomem", required=True, help="/proc/iomem file (or adb pull)")
    p.add_argument("--range", action="append", default=[],
                   help="start+size hex, e.g. 0x8c000000+0x1360000 (repeatable)")
    p.add_argument("--include-modem-private", action="store_true")
    p.add_argument("-o", "--outdir", default="gki_mod")
    args = p.parse_args()
    regions = parse_iomem(Path(args.iomem).read_text(errors="replace"))
    ram = [(s, e) for s, e, n in regions if n == "System RAM"]
    if not ram:
        print("REFUSED: no System RAM lines in iomem map")
        return 2
    req = []
    for r in args.range:
        m = re.match(r"(0x[0-9a-fA-F]+)\+(0x[0-9a-fA-F]+|\d+)", r)
        if not m:
            print(f"REFUSED: bad --range {r!r}")
            return 2
        s, ln = int(m.group(1), 16), int(m.group(2), 0)
        touches_modem = s < MODEM_PHYS + MODEM_SIZE and s + ln > MODEM_PHYS
        if touches_modem and not args.include_modem_private:
            print(f"REFUSED: range {r} touches modem-private "
                  f"{MODEM_PHYS:#x}+{MODEM_SIZE // 1048576}MB (stage-2 PERM:0); "
                  f"re-run with --include-modem-private if you accept the panic risk")
            return 2
        if not any(s >= a and s + ln - 1 <= b for a, b in ram):
            print(f"REFUSED: range {r} outside System RAM windows")
            return 2
        req.append((s, ln))
    if not req:
        print("no --range given; printing recipe only.")
    out = Path(args.outdir)
    out.mkdir(parents=True, exist_ok=True)
    src = MODULE_C.replace("CONFIG_PHYS_START", hex(req[0][0]) if req else "0x0")
    src = src.replace("CONFIG_PHYS_LEN", hex(req[0][1]) if req else "0x0")
    (out / "phys_reader.c").write_text(src)
    (out / "Makefile").write_text(MAKEFILE)
    print(f"wrote {out}/phys_reader.c + Makefile")
    print("--- recipe (multi-hour sync, run yourself) ---")
    print("  repo init -u https://android.googlesource.com/kernel/manifest "
          "-b common-android13-8 --depth=1")
    print(f"  # checkout tag containing {GKI_TAG}; BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh")
    print(f"  make -C ~/gki/android13-8/out M=$PWD KDIR=... modules  # in {out}/")
    print(f"  # boot SLOT {SLOT} first, then on YOUR terminal:")
    print("  adb push phys_reader.ko /data/local/tmp/ && "
          "adb shell 'su -c \"insmod /data/local/tmp/phys_reader.ko\"'")
    print("  adb shell 'su -c \"dd if=/proc/phys_reader ...\"'  # chunked reads")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
