#!/bin/bash
# sweep.sh -- PSELECT_SHIFT calibration sweep (nevada ghostlock).
# Usage: bash sweep.sh -1 0 1   (shifts to try; -2 already panicked twice)
# Each shift: run payload, log to sweep/shift<N>.log, detect reboot via
# boot_id, pull tagged pstore on panic. Reboot-grade only, slot A safe.
S=${SERIAL:-ZT4229CJG5}
OUT=$(cd "$(dirname "$0")" && pwd)/sweep
GOOD=${GOOD_SHA:-d71fd0532cb01142634661c890302a1888b3436c33b43b37323ea6867eff87b5}
LOCAL_SO=${LOCAL_SO:-/tmp/pmg110/out/preload-nevada.so}
mkdir -p "$OUT"
check_payload() {
  local h=$(adb -s $S shell "sha256sum /data/local/tmp/preload.so 2>/dev/null" | cut -d' ' -f1)
  if [ "$h" != "$GOOD" ]; then
    echo "payload hash BAD ($h) -- repushing (reboots corrupt /data/local/tmp)"
    adb -s $S push "$LOCAL_SO" /data/local/tmp/preload.so 2>&1 | tail -n 1
    h=$(adb -s $S shell "sha256sum /data/local/tmp/preload.so 2>/dev/null" | cut -d' ' -f1)
    [ "$h" = "$GOOD" ] || { echo "REPUSH FAILED"; return 1; }
  fi
  echo "payload hash OK"
}
for sh in "$@"; do
  echo "=== SHIFT $sh ==="
  adb -s $S wait-for-device >/dev/null 2>&1
  sleep 5
  BEFORE=$(adb -s $S shell "cat /proc/sys/kernel/random/boot_id" 2>/dev/null)
  check_payload || continue
  timeout 150 adb -s $S shell "PSELECT_SHIFT=$sh LD_PRELOAD=/data/local/tmp/preload.so /system/bin/true" > "$OUT/shift$sh.log" 2>&1
  echo "run rc=$?"
  grep -a -m2 -E "child uid|child is root|uid=0" "$OUT/shift$sh.log" || true
  tail -n 2 "$OUT/shift$sh.log"
  sleep 15
  AFTER=$(adb -s $S shell "cat /proc/sys/kernel/random/boot_id" 2>/dev/null)
  if [ "$BEFORE" != "$AFTER" ]; then
    echo "REBOOTED during shift $sh"
    adb -s $S wait-for-device >/dev/null 2>&1
    for i in $(seq 1 60); do
      B=$(adb -s $S shell "getprop sys.boot_completed 2>/dev/null" | tr -d '\r')
      [ "$B" = "1" ] && break
      sleep 5
    done
    sleep 20
    adb -s $S shell "su -c 'cat /sys/fs/pstore/console-ramoops-0'" > "$OUT/panic-shift$sh.txt" 2>/dev/null
    grep -a -m2 -E "Unable to handle|pc :" "$OUT/panic-shift$sh.txt" || echo "(no oops logged)"
  else
    echo "no reboot"
  fi
done
echo ALLDONE
