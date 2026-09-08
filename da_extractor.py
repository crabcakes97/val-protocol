#!/usr/bin/env python3
"""da_extractor.py -- USB-sniff DA-transfer census (parse-only, saves nothing).

Name honesty: on a fused retail device the Download Agent must be
Motorola-signed, and a signed DA is vendor firmware: this tool will NOT
write DA bytes to disk (no --save flag exists), will not bundle them, and
will not replay them. What it DOES: parse a USB capture (tshark text export
or raw bulk log) for the MTK BROM<->DA handshake markers, list each blob's
claimed name/length/sha256, and state why a custom DA is not our path
(unlocked fastboot already covers every flash we need; SLA only gates
BROM-download tools we do not use -- see fastboot.md).
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

MARKERS = ("BBCHIP", "HW_CODE", "DA", "download agent", "0xA0", "SYNC",
           "brom", "sla_auth", "daa_auth")


def scan_text(text: str) -> list[dict]:
    hits = []
    for i, line in enumerate(text.splitlines()):
        low = line.lower()
        for m in MARKERS:
            if m.lower() in low:
                hits.append({"line": i + 1, "marker": m,
                             "text": line.strip()[:160]})
                break
    return hits


def scan_blob(data: bytes) -> list[dict]:
    # Carve candidate DA blobs by MTK header magic without saving contents:
    # report offset/len/sha256 only.
    out = []
    for pat in (b"MTK_DA", b"DOWNLOAD_AGENT", b"\x88\x16\x88\x58"):
        s = 0
        while True:
            i = data.find(pat, s)
            if i < 0:
                break
            seg = data[i:i + 65536]
            out.append({"magic": pat.decode("latin-1"), "offset": hex(i),
                        "sha256_prefix": hashlib.sha256(seg).hexdigest()[:32],
                        "note": "metadata only; bytes NOT saved"})
            s = i + 1
    return out


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("capture", help="tshark text export or raw bulk log")
    p.add_argument("--raw", action="store_true", help="treat input as binary")
    p.add_argument("-o", "--out", default=None)
    args = p.parse_args()
    raw = Path(args.capture).read_bytes()
    if args.raw:
        hits, blobs = [], scan_blob(raw)
    else:
        hits, blobs = scan_text(raw.decode("utf-8", "replace")), []
    result = {"capture": args.capture, "markers": hits[:200], "blobs": blobs,
              "da_bytes_saved": 0,
              "policy": "signed-DA bytes are never written or bundled"}
    print(f"markers: {len(hits)}  blob candidates: {len(blobs)}")
    for h in hits[:20]:
        print(f"  L{h['line']} [{h['marker']}] {h['text']}")
    for b in blobs[:10]:
        print(f"  {b['magic']} @ {b['offset']} sha~{b['sha256_prefix']}")
    print("conclusion: custom-DA path needs a Motorola signature; not our "
          "lever. fastboot+root already covers backup/flash needs.")
    out = Path(args.out or (Path(args.capture).name + ".da.json"))
    out.write_text(json.dumps(result, indent=1))
    print(f"JSON: {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
