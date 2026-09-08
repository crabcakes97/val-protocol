#!/usr/bin/env python3
"""mkmarker.py -- build a minimal no-system boot image for slot-B tests.

Takes a GKI (or stock) boot.img, replaces/adds the ramdisk with a tiny cpio
containing OUR static /init, fixes the v4 header, and writes the result.
No flashing here -- output goes to work-nevada/gki/ for manual review, then
explicit `fastboot flash boot_b` on your terminal.

v4 layout: 4096B header + kernel + ramdisk (+ second, recovery_dtbo, dtb),
each page-aligned. GKI debug boot.img ships ramdisk_size=0; we insert ours.
"""
import argparse
import struct
import subprocess
import sys
from pathlib import Path

PAGE_DEFAULT = 4096


def read_cpio_newc(files: dict[str, tuple[bytes, int]]) -> bytes:
    """files: path -> (data, mode). Minimal newc writer, 070701."""
    out = bytearray()
    ino = 300000
    for path, (data, mode) in files.items():
        ino += 1
        namesize = len(path.encode()) + 1
        hdr = "070701%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x" % (
            ino, mode, 0, 0, 1, 0, len(data), 0, 0, 0, 0, namesize, 0)
        out += hdr.encode() + path.encode() + b"\x00"
        while len(out) % 4:
            out += b"\x00"
        out += data
        while len(out) % 4:
            out += b"\x00"
    out += ("070701%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x" % (
        ino + 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, 0)).encode()
    out += b"TRAILER!!!\x00"
    while len(out) % 4:
        out += b"\x00"
    return bytes(out)


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--in", dest="inp", required=True, help="base boot.img")
    p.add_argument("--init", required=True, help="static /init binary")
    p.add_argument("--init-name", default="init",
                   help="filename inside ramdisk (default init; use marker with rdinit=)")
    p.add_argument("--kernel", default=None,
                   help="replacement kernel file (e.g. self-compressed Image.gz)")
    p.add_argument("-o", "--out", required=True)
    p.add_argument("--fit-to", type=int, default=0,
                   help="exact partition size: trim overflow from zero padding "
                        "before the 64B AVB footer (refuses if not zeros)")
    p.add_argument("--cmdline", default="",
                   help="boot header cmdline (e.g. selinux=0 for foreign init)")
    args = p.parse_args()
    img = bytearray(Path(args.inp).read_bytes())
    assert img[:8] == b"ANDROID!", "not a boot image"
    # v4 prefix: magic8 kernel4 ramdisk4 os4 hdrsize4 reserved4 hdrver4 ...
    # page_size lives at offset 36, extra fields follow cmdline.
    ksz = struct.unpack_from("<I", img, 8)[0]
    rsz = struct.unpack_from("<I", img, 12)[0]
    hdrver = struct.unpack_from("<I", img, 28)[0]
    page = struct.unpack_from("<I", img, 36)[0]
    if page == 0:
        page = PAGE_DEFAULT
    print(f"kernel={ksz} ramdisk={rsz} page={page} hdrver={hdrver}")
    if hdrver not in (0, 4):
        print("REFUSED: only v0/v4 layout supported")
        return 2
    init = Path(args.init).read_bytes()
    ramdisk = read_cpio_newc({
        args.init_name: (init, 0o100755),
        "dev": (b"", 0o40755),
        "proc": (b"", 0o40755),
        "sys": (b"", 0o40755),
    })
    print(f"new ramdisk: {len(ramdisk)} bytes")

    def pad(n: int) -> int:
        return (n + page - 1) // page * page

    # v4: header(4096) + kernel + ramdisk + second; keep second/dtbo/dtb as-is
    # by slicing the ORIGINAL layout: find current offsets first.
    off = 4096
    k_off, k_end = off, off + ksz
    r_off = k_end
    # optional kernel replacement (must fit: new kernel <= old padded region
    # unless caller accepts layout shift; we rebuild layout identically)
    if args.kernel:
        k_new = Path(args.kernel).read_bytes()
        print(f"replacement kernel: {len(k_new)} bytes")
        ksz = len(k_new)
        k_end = k_off + ksz
        r_off = k_end
    # original ramdisk may be 0-sized; second follows at page alignment
    s_off = r_off + pad(rsz)
    rest = bytes(img[s_off:]) if s_off < len(img) else b""
    # rebuild: header + kernel + new ramdisk + padding + rest(second+...)
    out = bytearray()
    out += img[:4096]
    out += k_new if args.kernel else img[k_off:k_end]
    out += b"\x00" * (pad(ksz) - ksz)
    r_new_off = len(out)
    out += ramdisk
    out += b"\x00" * (pad(len(ramdisk)) - len(ramdisk))
    out += rest
    # fix header: ramdisk_size @12 (and kernel_size @8 if replaced)
    struct.pack_into("<I", out, 12, len(ramdisk))
    if args.kernel:
        struct.pack_into("<I", out, 8, ksz)
    if args.cmdline:
        cl = args.cmdline.encode()[:1535]
        out[44:44 + len(cl)] = cl
        out[44 + len(cl)] = 0
        print(f"cmdline: {args.cmdline}")
    if args.fit_to and len(out) > args.fit_to:
        need = len(out) - args.fit_to
        pad = bytes(out[-64 - need:-64])
        if len(pad) != need or any(pad):
            print("REFUSED: overflow region before footer is not zeros")
            return 2
        del out[-64 - need:-64]
        print(f"trimmed {need} zero-pad bytes before AVB footer")
    if args.fit_to and len(out) > args.fit_to:
        print(f"REFUSED: size {len(out)} > partition {args.fit_to}")
        return 2
    if args.fit_to and len(out) < args.fit_to:
        print(f"note: {len(out)} < partition {args.fit_to} (fastboot accepts short)")
    Path(args.out).write_bytes(bytes(out))
    print(f"wrote {args.out} ({len(out)} bytes), ramdisk @ {r_new_off}")
    print("NEXT (your terminal, slot B testbed only):")
    print("  fastboot --disable-verification flash vbmeta_b <stock-vbmeta_b>  # reversible; backup kept")
    print(f"  fastboot flash boot_b {args.out}")
    print("  fastboot set_active b  # verify twice!")
    print("  fastboot reboot bootloader  # if no system: drops to fastboot = LK alive")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
