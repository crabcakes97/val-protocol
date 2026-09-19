#!/system/bin/sh
# kree_map_run.sh -- run mapper with crash/reboot logging. Root required.
# One push, one pull when done. Resumes automatically after reboots.
#
# Layout (all on device, persistent):
#   /data/local/tmp/kree_map_all   the mapper binary
#   /data/local/tmp/kmap.log       appended mapper stdout (fsync per line)
#   /data/local/tmp/kmap.prog      12B progress: phase,svc,sub
#   /data/local/tmp/kmap.svcs      recon service list (PH6)
#   /data/local/tmp/kmap/          recon outputs + per-boot crash bundles
#   /data/local/tmp/kmap/crash-*.txt
#
# Crash logic: mapper fsyncs every log line and saves prog every 256
# tries + every phase/service change. If this script starts and prog
# exists with phase != 99, the previous boot ended mid-sweep: could be
# panic, watchdog reboot, or bus stall. It saves:
#   last_kmsg, pstore bundle, dmesg tail, prog copy, log tail
# then resumes the mapper (which re-creates sessions and continues).
#
# Usage (root shell on device):
#   su -c "sh /data/local/tmp/kree_map_run.sh once"
#     runs until exit/reboot. Rerun after every reboot to continue.
#   su -c "sh /data/local/tmp/kree_map_run.sh status"
#     prints prog + log tail without running.
#   su -c "sh /data/local/tmp/kree_map_run.sh pack"
#     tars kmap dir to /sdcard/kmap-BOOTID.tgz for single pull.
OUT=/data/local/tmp
BIN=$OUT/kree_map_all
LOG=$OUT/kmap.log
PROG=$OUT/kmap.prog
CB=$OUT/kmap
BOOT=$(cat /proc/sys/kernel/random/boot_id 2>/dev/null)
STAMP=$(date +%Y%m%d-%H%M%S 2>/dev/null)
cmd="$1"
status() {
  echo "== prog =="
  od -A d -t u4 $PROG 2>/dev/null || echo "no prog yet"
  echo "== log tail =="
  tail -n 15 $LOG 2>/dev/null || echo "no log yet"
  echo "== boot =="
  echo "$BOOT"
}
pack() {
  F=/sdcard/kmap-$STAMP.tgz
  tar -czf $F -C $OUT kmap.log kmap.prog kmap.svcs kmap 2>/dev/null
  echo "packed $F"
  ls -l $F
}
save_crash() {
  mkdir -p $CB
  C=$CB/crash-$STAMP.txt
  echo "boot $BOOT date $STAMP" > $C
  echo "-- prog --" >> $C
  od -A d -t u4 $PROG 2>>$C || echo "no prog" >> $C
  echo "-- log tail 40 --" >> $C
  tail -n 40 $LOG 2>>$C || echo "no log" >> $C
  echo "-- last_kmsg tail 60 --" >> $C
  cat /proc/last_kmsg 2>/dev/null | tail -n 60 >> $C
  echo "-- pstore --" >> $C
  ls -l /sys/fs/pstore/ 2>>$C
  cat /sys/fs/pstore/* 2>/dev/null | tail -n 80 >> $C
  echo "-- dmesg tail 60 --" >> $C
  dmesg 2>/dev/null | tail -n 60 >> $C
  # standalone copies for forensics
  cat /proc/last_kmsg 2>/dev/null > $CB/last_kmsg-$STAMP.txt
  dmesg 2>/dev/null > $CB/dmesg-$STAMP.txt
  echo "saved $C"
}
case "$cmd" in
  status) status; exit 0;;
  pack) pack; exit 0;;
  once) ;;
  *) echo "usage: $0 once|status|pack"; exit 1;;
esac
mkdir -p $CB
# recon first if service list missing
if [ ! -f $OUT/kmap.svcs ]; then
  echo "no kmap.svcs: running recon"
  sh $OUT/kree_map_recon.sh
fi
# crash detect: prog exists and phase != 99
if [ -f $PROG ]; then
  PH=$(od -A n -t u4 -j 0 -N 4 $PROG 2>/dev/null)
  echo "resume prog phase=$PH"
  case "$PH" in
    *99*) echo "already DONE, not rerunning"; status; exit 0;;
    *) save_crash;;
  esac
else
  echo "fresh start"
fi
echo "--- mapper start $STAMP ---" >> $LOG
chmod 755 $BIN
$BIN >> $LOG 2>&1
RC=$?
echo "--- mapper exit rc=$RC $STAMP ---" >> $LOG
sync
echo "exit $RC (reboot returns here only after YOU rerun; use status/pack)"
status
