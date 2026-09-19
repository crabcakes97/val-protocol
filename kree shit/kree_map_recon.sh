#!/system/bin/sh
# kree_map_recon.sh -- on-device inventory: EVERYTHING, not just picked set.
# Runs as root (su -c). Toybox-safe: while-read loops only, no for-loops,
# no parens in grep patterns. Writes to /data/local/tmp/kmap/ (persists
# across reboots; /tmp on host does NOT).
#
# Outputs:
#   kmap.svcs      service names, one per line (mapper PH6 reads this)
#   recon_dev.txt  /dev listing + open-relevant nodes
#   recon_iomem.txt System RAM windows from /proc/iomem
#   recon_libs.txt  geniezone service strings found in vendor libs
#   recon_ipi.txt   audio_ipi node + ioctl surface note
#   recon_sys.txt   slot, selinux, build, gz_test menu
#   recon_dmesg.txt dmesg KREE lines at recon time
OUT=/data/local/tmp
mkdir -p $OUT/kmap
R=$OUT/kmap
echo "--- recon start ---"
date > $R/recon_date.txt
getprop ro.boot.slot_suffix > $R/recon_slot.txt
getenforce > $R/recon_selinux.txt 2>&1
uname -a > $R/recon_uname.txt 2>&1
# /dev inventory: every char node that looks IPC-related, plus full ls
ls -l /dev > $R/recon_dev_all.txt 2>&1
ls -l /dev | grep gz > $R/recon_dev_gz.txt 2>&1
ls -l /dev/audio_ipi /dev/gz_kree /dev/trusty-ipc-dev0 /dev/mobicore-user /dev/ccci* 2>&1 > $R/recon_dev.txt
# iomem System RAM windows (world-readable, no restriction)
cat /proc/iomem > $R/recon_iomem_full.txt 2>&1
grep "System RAM" /proc/iomem > $R/recon_iomem.txt 2>&1
# service strings from vendor libs: fixed-string grep, no regex parens
# toybox grep supports -a -o -e; keep patterns paren-free
grep -a -o -e "com.mediatek.geniezone[a-z._]*" /vendor/lib64/libgz_uree.so 2>/dev/null | sort -u > $R/recon_libs_uree.txt
ls /vendor/lib64 > $R/recon_vendor_lib64.txt 2>&1
# scan every vendor64 lib for geniezone service names, capped output
> $R/recon_libs.txt
cat $R/recon_libs_uree.txt >> $R/recon_libs.txt 2>/dev/null
find /vendor/lib64 -name "*.so" 2>/dev/null | while read f; do
  grep -a -o -e "com.mediatek.geniezone[a-z._]*" "$f" 2>/dev/null
done | sort -u >> $R/recon_libs.txt 2>/dev/null
sort -u $R/recon_libs.txt -o $R/recon_libs.txt 2>/dev/null
# build mapper service file: libs list minus blanks, keep echo-free lines
grep -v "^$" $R/recon_libs.txt 2>/dev/null | sort -u > $OUT/kmap.svcs
echo "svcs:"; cat $OUT/kmap.svcs 2>/dev/null
# audio_ipi surface
ls -l /dev/audio_ipi > $R/recon_ipi.txt 2>&1
# driver self-test menu: read only, NEVER write 4 = abort
cat /sys/class/misc/gz_kree/gz_test 2>&1 | head -n 30 > $R/recon_gztest.txt
# ccci modem layout if present
cat /proc/ccci_dump 2>/dev/null | head -n 80 > $R/recon_ccci.txt
ls /dev/ccci* 2>&1 >> $R/recon_ccci.txt
# dmesg KREE lines at recon time
dmesg 2>/dev/null | grep KREE | tail -n 100 > $R/recon_dmesg.txt
echo "--- recon done ---"
ls -l $R
