#!/system/bin/sh
# factory_bootmode.sh — post-fs-data.d early-boot companion to the
# --preset bootmode-cmdline LK patch (nevada XT2615V).
#
# Why this still exists: the LK patch natively carries
# androidboot.bootmode=factory (verified in /proc/bootconfig, lands as
# ro.boot.bootmode=factory with zero userspace help), but vendor init
# forces the legacy ro.bootmode alias back to "normal" on every boot.
# This re-applies it before apps start (post-fs-data timing).
# Install: /data/adb/post-fs-data.d/factory_bootmode.sh, chmod 755.
# Remove for a fully normal stack (then ro.bootmode reads normal).
resetprop ro.bootmode factory
