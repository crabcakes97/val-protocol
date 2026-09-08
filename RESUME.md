# RESUME — start here in a new window. Do NOT clone; work locally.

## Where everything lives (all on this machine)
- Repo (work here): `/home/cameron/kansas-modem-unlock/val-protocol`,
  branch `full-exploit-suite`. Confirm `git log --oneline -3` shows
  `a597a45` or newer. Pushing copies outward; local keeps everything.
- Phone files (pulls, analyses, key images — reboot-proof):
  `~/val-session-backup-2026-09-08/` (pulls/, analysis/, images/,
  builders/, evidence/, iomem.txt). `/tmp` copies may be gone; the
  backup dir is the truth. Pull hashes: lk_a `0b0cd33e…`,
  lk_b `ad63a4ba…`.
- Docs (read in this order): this file, then `ramdump.md` section
  18+, then `SESSION_LOG.md` resume checklist for deep history.

## Live state at handoff
- Phone: slot B fastboot (`fastboot -s ZT4229CJG5`), slot A stock.
  Slot B flagged unbootable (retry 0) — fastboot fine, never
  `fastboot reboot` on B. Second phone on bus (`22b8:2e24` 2023):
  always `-s ZT4229CJG5`.
- Live image: bulk16 build (`oem readdump` usage + OKAY confirmed).
- Works: LK-memory reads byte-exact, guards/deny, 16-line INFO dumps.
- Broken: bulk DATA pushes 0 bytes (request-struct root cause found
  in ramdump.md S18; fix staged, not yet flashed).

## Current job
Rebuild the bulk DATA send with the request-struct convention
(`tools/readdump_bulk16.py` is the workfront; shared lib
`tools/build_readdump_v1.py`). Gate-check every word with capstone,
VALID re-sign, flash `lk_b` only, single 16 KB test with
reboot-before-each. Goal: whole-RAM dump (modem second, sweep last).

## Standing orders (unchanged)
Slot A never flashed. Preloader/efuse never touched. One probe per
fresh fastboot. Old-byte gates + VALID on every image. Update
ramdump.md + push at every break. PAT from earlier chat is burned —
ask the human for a fresh token before pushing. The human owns the
buttons: Power 12 s, then Vol-Down+Power 12 s to force fastboot.
