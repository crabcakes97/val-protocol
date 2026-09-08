# RESUME — paste this into a new window to continue the ramdump project

> Continue the val-protocol ramdump project. Repo is at
> `/home/cameron/kansas-modem-unlock/val-protocol`, branch
> `full-exploit-suite` (freshly pushed, pull first). Read `ramdump.md`
> section 18+ and `SESSION_LOG.md` resume checklist, then verify live
> state: `fastboot -s ZT4229CJG5 devices` + `getvar current-slot`
> (expect slot B fastboot).
>
> Current job: rebuild the bulk DATA send in `/tmp/build_bulk16.py`
> using the request-struct calling convention (details in ramdump.md
> section 18 — the USB vtable method takes a request struct, not raw
> buf/len). Gate-check every word with capstone, VALID re-sign, flash
> `lk_b` only, single 16 KB test with reboot-before-each.
> Standing orders: slot A never flashed, one probe per fresh fastboot,
> always `-s ZT4229CJG5`, update ramdump.md + push at every break.
>
> Goal is whole-RAM dump (modem second, full sweep last). The human
> owns the buttons: Power 12 s, then Vol-Down+Power 12 s to force
> fastboot when the board wedges. PAT from earlier chat is burned —
> do NOT reuse it; ask for a fresh token before pushing.

## Live state at handoff (2026-09-08, slot B fastboot, healthy)
- Live image: bulk16 build (`oem readdump` usage + OKAY confirmed).
- Works: LK-memory reads byte-exact, guards/deny, 16-line INFO dumps.
- Broken: bulk DATA pushes 0 bytes (request-struct root cause found).
- Untested: fixed bulk send; modem windows; full sweep.
