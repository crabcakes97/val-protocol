#!/usr/bin/env python3
"""Minimal raw fastboot client (read-only wire observer + standard cmds).
Usage: fb_raw.py <command...>  (e.g. fb_raw.py oem readdump 1234)
Drains pending IN bytes first, sends one command block, logs every packet.
"""
import sys
import usb.core
import usb.util

VID, PID = 0x22B8, 0x2E80  # nevada fastboot (NOT the 2023 on 2e24)


def find_eps(dev):
    dev.set_configuration()
    cfg = dev.get_active_configuration()
    for intf in cfg:
        ep_out = ep_in = None
        for ep in intf:
            t = usb.util.endpoint_type(ep.bmAttributes)
            d = usb.util.endpoint_direction(ep.bEndpointAddress)
            if t == usb.util.ENDPOINT_TYPE_BULK:
                if d == usb.util.ENDPOINT_OUT:
                    ep_out = ep.bEndpointAddress
                else:
                    ep_in = ep.bEndpointAddress
        if ep_out and ep_in:
            return ep_out, ep_in
    raise SystemExit("no bulk pair found")


def drain(dev, ep_in):
    n = 0
    while True:
        try:
            d = dev.read(ep_in, 16384, timeout=300)
            print(f"DRAIN {len(d)}B: {bytes(d)[:64].hex()}")
            n += len(d)
        except usb.core.USBTimeoutError:
            break
        except usb.core.USBError as e:
            print("drain err:", e)
            break
    print(f"drained total {n}B")


def main():
    cmd = " ".join(sys.argv[1:]) or "oem readdump"
    dev = usb.core.find(idVendor=VID, idProduct=PID)
    if dev is None:
        raise SystemExit("device 22b8:2e80 not found")
    if dev.is_kernel_driver_active(0):
        dev.detach_kernel_driver(0)
    ep_out, ep_in = find_eps(dev)
    print(f"eps out={ep_out:#x} in={ep_in:#x}")
    for ep in (ep_in, ep_out):
        try:
            dev.clear_halt(ep)
        except Exception as e:
            print("clear_halt err:", e)
    drain(dev, ep_in)
    print(f">>> {cmd}")
    dev.write(ep_out, cmd.encode())
    total_data = 0
    for _ in range(40):
        try:
            d = bytes(dev.read(ep_in, 16384, timeout=4000))
        except usb.core.USBTimeoutError:
            print("... IN timeout, stop")
            break
        print(f"<<< {len(d)}B: {d[:80]!r}")
        total_data += len(d)
        if d.startswith((b"OKAY", b"FAIL")):
            break
    print(f"total IN {total_data}B")


if __name__ == "__main__":
    main()
