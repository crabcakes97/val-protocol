#!/usr/bin/env python3
"""fb_dump: custom readdump DATA client. Speaks raw fastboot USB, expects
our protocol: [DATA00004000][16384 raw][OKAY]. Saves payload to file.
Usage: fb_dump.py <oem-args...> <outfile>  (last arg = outfile)
"""
import sys
import usb.core
import usb.util

VID, PID = 0x22B8, 0x2E80

*cmd_parts, outfile = sys.argv[1:]
cmd = " ".join(cmd_parts)


def main():
    dev = usb.core.find(idVendor=VID, idProduct=PID)
    if dev is None:
        raise SystemExit("device not found")
    try:
        if dev.is_kernel_driver_active(0):
            dev.detach_kernel_driver(0)
    except Exception:
        pass
    usb.util.claim_interface(dev, 0)
    cfg = dev.get_active_configuration()
    ep_out = ep_in = None
    for intf in cfg:
        for ep in intf:
            if usb.util.endpoint_type(ep.bmAttributes) == usb.util.ENDPOINT_TYPE_BULK:
                if usb.util.endpoint_direction(ep.bEndpointAddress) == usb.util.ENDPOINT_OUT:
                    ep_out = ep.bEndpointAddress
                else:
                    ep_in = ep.bEndpointAddress
    if ep_out is None or ep_in is None:
        raise SystemExit("no bulk pair")
    # drain leftovers
    while True:
        try:
            dev.read(ep_in, 65536, timeout=200)
        except Exception:
            break
    print(">>>", cmd)
    dev.write(ep_out, cmd.encode())
    payload = bytearray()
    data_want = 0
    got_okay = False
    for _ in range(60):
        try:
            d = bytes(dev.read(ep_in, 65536, timeout=5000))
        except Exception as e:
            print("IN end:", type(e).__name__, e)
            break
        print(f"<<< {len(d)}B head={d[:24]!r}")
        if data_want:
            take = min(len(d), data_want)
            payload += d[:take]
            data_want -= take
            d = d[take:]
            if data_want == 0:
                print(f"DATA complete: {len(payload)}B")
            if not d:
                continue
        if d.startswith(b"DATA") and len(d) >= 12:
            try:
                data_want = int(d[4:12], 16)
                print(f"DATA header: want {data_want}B")
            except ValueError:
                print("DATA header unparseable!")
            rest = d[12:]
            if data_want and rest:
                take = min(len(rest), data_want)
                payload += rest[:take]
                data_want -= take
        elif d.startswith(b"OKAY"):
            got_okay = True
            print("OKAY")
            break
        elif d.startswith(b"FAIL"):
            print("FAIL:", d)
            break
        elif d.startswith(b"INFO"):
            pass
        else:
            payload += d
    print(f"payload {len(payload)}B okay={got_okay}")
    if payload:
        open(outfile, "wb").write(bytes(payload))
        print("wrote", outfile)


if __name__ == "__main__":
    main()
