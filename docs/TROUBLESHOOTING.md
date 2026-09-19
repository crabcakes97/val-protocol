
## DA-upload fuzzer results (2026-09-19, all negative)

Raw `0xD7` framing (`send_da` field order: BE32 addr/size/sig_len, then
payload) driven in-process after handshake + watchdog kill, Infinix
MT6835 DA1 bytes (`0x2000000`, len `0x73030`, sig `0x100`):
* framing honored: pre-status `0x0` on every well-formed header;
* `sig_len >= size` (or `size = 0`) → `0x1d18` parameter error;
* every RSA check → `0x7024`, then the device reboots (port drops);
* mutated addr (`0`, DRAM `0x40000000`, BROM-PL `0x100A00`), zero/`FF`
  payloads, flipped sig byte: all clean rejects, zero crashes/hangs.
* jump-after-reject TOCTOU disproven: `jump_da` echo fails because the
  device is already rebooting — NOP-sled + `b .` payload produced a normal
  reboot cycle, never a hang. No execution without a passing verify.

## Do NOT erase the preloader to "force BROM"

Proposed and refused: erasing preloader needs the same flash access the
DA wall blocks; BROM (`0e8d:0003`) enforces the identical DAA check with
zero public payloads for hwcode `0x1209`; and the preloader is currently
the only working comms channel (handshake, watchdog kill, fuzz lanes).
Killing it removes every remaining software path for zero gain.

