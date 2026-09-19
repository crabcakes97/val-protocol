# ghostlock test kit (nevada) — PC side. Phone must be on adb, rooted.
# The full 5.15 payload does NOT exist yet (struct port open). This kit
# runs everything that CAN run: live profile verification + readiness.
# Run: bash preflight.sh [-s SERIAL]
adb ${1:+-s $1} wait-for-device
S=${SERIAL:-${1:-ZT4229CJG5}}
echo "== device =="
adb -s $S shell "getprop ro.product.model; uname -r"
echo "== root? =="
adb -s $S shell "su -c id"
echo "== lower kptr_restrict, verify 22 profile symbols =="
adb -s $S shell "su -c 'echo 0 > /proc/sys/kernel/kptr_restrict'" >/dev/null
adb -s $S shell "su -c cat /proc/kallsyms" | python3 /dev/fd/3 3<<'EOF'
import sys
exp={'init_task':0x02C43640,'init_cred':0x02BFD698,'init_uts_ns':0x02CC0180,'empty_zero_page':0x02D54000,'root_task_group':0x02D58AC0,'selinux_state':0x02DAAD78,'kptr_restrict':0x02AFDB24,'selinux_blob_sizes':0x021656E8,'security_hook_heads':0x02163260,'kmalloc_caches':0x021664E0,'anon_pipe_buf_ops':0x01F86BB0,'ashmem_misc':0x02C91D30,'ashmem_fops':0x02104248,'ashmem_ioctl':0x0113F330,'compat_ashmem_ioctl':0x0113F9E0,'ashmem_mmap':0x0113FA40,'ashmem_open':0x0113FD30,'ashmem_release':0x0113FDD0,'ashmem_show_fdinfo':0x0113FEF4,'nfulnl_logger':0x02B01E28,'sysctl_bootid':0x02DC6819,'system_unbound_wq':0x02B007D8}
got={}; base=None
for line in sys.stdin:
    p=line.split()
    if len(p)<3: continue
    try: a=int(p[0],16)
    except: continue
    if p[2]=='_text': base=a
    else: got.setdefault(p[2],a)
ok=[k for k,e in exp.items() if k in got and got[k]-base==e]
print('%d/22 profile symbols MATCH (text=0x%x)'%(len(ok),base or 0))
print('GO for payload build' if len(ok)==22 else 'NO-GO: re-map first')
EOF
echo "== payload presence =="
adb -s $S shell "ls -l /data/local/tmp/cve-2026-43499-root /data/local/tmp/preload.so 2>&1"
echo "== verdict: profile OK; payload build is the remaining step =="
