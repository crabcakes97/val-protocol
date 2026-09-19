# service.sh snippet -- auto-resume kree mapper after crashes/reboots.
# Magisk module only. Drop this file as service.sh in a module dir
# (fresh id per install, per standing orders), mapper + scripts already
# in /data/local/tmp (survives module ops, NOT factory reset).
# Boot stall risk: mapper is CPU-light (2ms pacing) but runs for hours;
# boot-time start delays boot_complete. Prefer manual rerun unless you
# want full automation. If used: starts detached, logs to kmap.log.
MODDIR=${0%/*}
LOG=/data/local/tmp/kmap.log
# wait for boot completed, capped 10 min, 5s steps (no for-loop)
n=0
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 5
  n=$((n + 1))
  if [ "$n" -gt 120 ]; then exit 0; fi
done
sleep 30
# only resume if prog exists and not DONE
if [ -f /data/local/tmp/kmap.prog ]; then
  PH=$(od -A n -t u4 -j 0 -N 4 /data/local/tmp/kmap.prog 2>/dev/null)
  case "$PH" in
    *99*) exit 0;;
  esac
  echo "--- auto-resume $(date) ---" >> $LOG
  sh /data/local/tmp/kree_map_run.sh once >> $LOG 2>&1 &
fi
