#!/bin/bash
# build_kmap_all.sh -- assemble kree_map_all.S with NDK clang (host).
# Usage: bash "kree shit/build_kmap_all.sh"
# Output: "kree shit/kree_map_all" (device binary, static, _start).
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
NDK_BIN="$HOME/android-ndk-r29/toolchains/llvm/prebuilt/linux-x86_64/bin"
CC="$NDK_BIN/aarch64-linux-android35-clang"
SRC="$HERE/kree_map_all.S"
OUT="$HERE/kree_map_all"
if [ ! -x "$CC" ]; then
  echo "no NDK clang at $CC"
  echo "set CC env or install android-ndk-r29"
  exit 1
fi
# -nostdlib -static: freestanding _start, no libc (matches other probers).
# -Wl,-e,_start: entry. No capstone/gates needed (no LK image touched).
"$CC" -nostdlib -static -Wl,-e,_start -o "$OUT" "$SRC"
file "$OUT" || true
ls -l "$OUT"
echo "sha256:"; sha256sum "$OUT"
echo "push: adb push \"$OUT\" /data/local/tmp/kree_map_all"
echo 'run : adb shell su -c "sh /data/local/tmp/kree_map_run.sh once"'
