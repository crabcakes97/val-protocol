#!/usr/bin/env python3
"""fb_min: minimal fastboot client. Open like the distro does (claim only,
no resets), write exact command bytes, print every IN packet.
Usage: fb_min.py <command...>
"""
import sys
import usb.core
import usb.util

VID, PID = 0x22B8, 0x2E80

cmd = " ".join(sys.argv[1:]) or "oem readdump"

dev = usb.core.find(idVendor=VID, idProduct=PID)
if dev is None:
    raise SystemExit("device not found")
try:
    if dev.is_kernel_driver_active(0):
        dev.detach_kernel_driver(0)
except Exception as e:
    print("detach:", e)
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
print(f"eps out={ep_out:#x} in={ep_in:#x}", flush=True)
print(">>>", cmd, flush=True)
n = dev.write(ep_out, cmd.encode())
print(f"wrote {n}B", flush=True)
for i in range(12):
    try:
        d = bytes(dev.read(ep_in, 512, timeout=3000))
    except Exception as e:
        print(f"read{i}: {type(e).__name__}", flush=True)
        break
    print(f"<<< {len(d)}B: {d[:96]!r}", flush=True)
    if d.startswith((b"OKAY", b"FAIL")):
        break
usb.util.release_interface(dev, 0)
