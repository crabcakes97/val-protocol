#!/system/bin/sh
# factory_bootmode_postfsdata.sh — post-fs-data.d companion to the
# --preset wide-open LK stack (nevada XT2615V).
#
# Part 1 (needs LK): ro.boot.bootmode=factory already arrives natively
# via the bootmode-cmdline hook (verified in /proc/bootconfig).
# Part 2 (below): vendor init forces the legacy ro.bootmode alias back
# to "normal", so re-apply pre-app.
# Part 3 (report-locked spoof, cosmetic only): LK lockspoof covers
# fastboot `getvar securestate`; these cover the Android-side reporters
# while enforcement (flashing, root, slots) keeps working. Reversible:
# delete this file + reboot, and every label reads stock again.
# Install: /data/adb/post-fs-data.d/factory_bootmode.sh, chmod 755.
resetprop ro.bootmode factory
resetprop ro.boot.flash.locked 1
resetprop ro.boot.verifiedbootstate green
resetprop persist.motosecure.secure_lock_state 1
resetprop ro.oem_unlock_supported 0
