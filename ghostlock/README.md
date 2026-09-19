# ghostlock-test/ — PC-side test kit for the nevada GhostLock port

YOU NEED: adb on the PC, phone on adb (`adb devices` shows ZT4229CJG5),
root on the phone (Magisk `su`). The app's Ghost tab explains the same:
this exploit family needs SHELL (adb) or root context — an untrusted-app
context is the wrong place to fire it from.

Contents:
- `target.h` — nevada port header (measured symbol offsets; struct section
  UNVERIFIED — see NOTES.md before building any payload).
- `device_offsets.h` — OFFSETS_ENTRY for the offsets table.
- `NOTES.md` — how offsets were measured, what is open, references.
- `preflight.sh` — live GO/NO-GO: verifies all 22 profile symbols against
  the CURRENT boot (KASLR-independent) + checks payload presence.

Run: `bash preflight.sh` (add serial arg if multiple devices).
22/22 MATCH = profile holds on this boot; remaining step is the 5.15
payload build (struct offsets + pselect overlay), then push + run.
