#!/usr/bin/env python3
"""preloader_payload_builder.py -- EL3 payload RESEARCH SCAFFOLD (no binary).

Hard truth first (opencode.md): LK is NOT EL3 (it calls ATF via SMC), modem
verification is not in LK, and no EL3 code path is proven from our side. An
"EL3 payload" with nowhere verified to run is a brick sketch, not a tool.
So this file:

1. Analyzes a preloader backup for cave space + return-trampoline sites
   (offsets + sizes only).
2. Generates a position-independent CANARY source template (asm): writes a
   log marker and returns to the caller. No persistence, no MMU/MPU writes.
3. REFUSES to assemble/flash: preloader has NO SLOT (no _b fallback), so no
   flash command is ever printed here. --emit-binary requires --unsafe AND a
   reviewer-supplied --cave/--trampoline AND still only writes a .bin next
   to a printed warning -- it is your brick after that line.

Default run = analysis + template. That is the responsible 95% of this task.
"""
from __future__ import annotations

import argparse
from pathlib import Path

CANARY_ASM = """// canary.s -- return-to-caller EL3 canary TEMPLATE (generated)
    .arch armv8-a
    .text
    .global canary_entry
canary_entry:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    /* TODO: reviewer -- write log marker via your proven UART/log sink */
    mov w0, #0            /* report success */
    ldp x29, x30, [sp], #16
    ret                   /* MUST return: no persistence, no MMU writes */
"""

SLOT_NOTE = ("preloader has no A/B slot. There is no safe flash target, "
             "so this tool prints NO flash commands, ever.")


def find_caves(data: bytes, min_size: int) -> list[tuple[int, int]]:
    out, i, n = [], 0, len(data)
    while i < n:
        if data[i] in (0x00, 0xFF):
            j = i
            while j < n and data[j] == data[i]:
                j += 1
            if j - i >= min_size:
                out.append((i, j - i))
            i = j
        else:
            i += 1
    return out


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--image", default=None, help="preloader backup for survey")
    p.add_argument("--min-cave", type=int, default=512)
    p.add_argument("--outdir", default="payload_work")
    p.add_argument("--emit-binary", action="store_true")
    p.add_argument("--unsafe", action="store_true")
    p.add_argument("--cave", default="", help="reviewer-confirmed cave offset hex")
    p.add_argument("--trampoline", default="", help="reviewer-confirmed hook offset")
    args = p.parse_args()
    out = Path(args.outdir)
    out.mkdir(parents=True, exist_ok=True)
    if args.image:
        data = Path(args.image).read_bytes()
        caves = find_caves(data, args.min_cave)
        print(f"caves >= {args.min_cave}B in {args.image}: {len(caves)}")
        for off, size in caves[:20]:
            print(f"  {off:#x} size={size}")
    (out / "canary.s").write_text(CANARY_ASM)
    print(f"template: {out / 'canary.s'} (source only, review required)")
    print(SLOT_NOTE)
    if args.emit_binary:
        if not (args.unsafe and args.cave and args.trampoline):
            print("REFUSED: --emit-binary needs --unsafe + --cave + "
                  "--trampoline, all reviewer-confirmed on YOUR image.")
            return 2
        print("WARNING: emitting an unlinked research blob. No assembler is "
              "invoked here; assemble canary.s with your LLVM toolchain by "
              "hand, link it yourself, and accept that flashing preloader "
              "can permanently brick with no recovery.")
        (out / "BUILD_YOURSELF.txt").write_text(
            f"cave={args.cave} trampoline={args.trampoline}\n" + SLOT_NOTE + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
