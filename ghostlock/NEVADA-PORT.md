# nevada port modifications (vs pmg110 6.6 reference source, which is NOT ours)

Reference source: pmg110-root (soralis0912), read-only in /tmp. Nothing of
it is copied here. What runs on nevada = that source + OUR target.h +
the modifications below (applied at build time, documented here).

## 1. target.h — full nevada header (this folder)
- 22 symbol offsets: MEASURED live (kallsyms, 4 KASLR slides, 22/22).
- Struct offsets: MEASURED via offprinter.ko (GKI tree + device config),
  cross-checked against live BTF (caught cap_effective 0x48->0x38).
- Memory: P0 0x40000000 (iomem-measured), VA_BITS 39, no MTE (ARMv8.2).
- MM_STRUCT_SZ 0x400 (sizeof 0x3e0 + cpumask, cacheline-rounded).

## 2. fops.c words[] — flat-waiter rewrite (THE 6.6->5.15 port)
6.6 table encodes the NESTED waiter (task@12, lock@13). 5.15-flat needs
task@8, lock@9, wake@10, prio@11, deadline@12 (same +2 anchor).
Old (nested): 2,3,4 zeros; 5 prio=1; 6 zero; 7,8,9 zeros; 10 prio=1;
11 zero; 12 task; 13 lock; 14 wake=3.
New (flat): 2,3,4 zeros; 5,6,7 zeros; 8 task; 9 lock; 10 wake=3;
11 prio=1; 12 deadline=0.
Sweep PSELECT_SHIFT for the 5.15 stack geometry (correct s = base - 2).

## 3. open calibration items
- pselect anchor/base on 5.15 stack (via shift sweep).
- KIMAGE_TEXT_BASE assumed (physmap path unaffected).
- FUTEX_HASHSIZE=2048 inferred (self-calibrating at runtime).

## 3. util.c fill_init_cred_copy — 5.15 cred image (build d71fd053)
6.6: memset 136, ones at 48-80. 5.15: memset 176, ones at every 8B in
[0x28,0x80] except 0x78 (security stays 0). Covers caps [0x28,0x50) +
fops-role slots, preserves uid=0 (memset) and usage=1.

## 4. COPY_SPLICE_READ_OFF — points at NOOP_LLSEEK (0x552590)
Symbol absent on this build; planting link-base would fault if called.
Noop is mapped + benign. Revisit if splice path proves needed.
