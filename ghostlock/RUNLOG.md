# ghostlock live-fire log (nevada)

## run 1 (payload 43fd21ca, caps=0x48 WRONG)
- Setup all green: offsets matched, kernelsnitch 3/3 collisions, spray ok,
  pselect route setup ok, PI route done.
- Result: NULL-deref Oops in rt_mutex_adjust_prio_chain+0x1b0
  (panic1-console.txt). Chain walked into our sprayed page then hit NULL.
- Meaning: UAF FIRES, traversal works, one fake field is NULL that must not be.

## run 2 (payload cae381d6, caps=0x38 BTF-fixed)
- Setup green again, died mid-round-2.
- Result: reboot with EMPTY pstore (no Oops) = hard lockup (likely corrupted
  spinlock/RB tree -> deadlock with preemption off -> watchdog), not a clean panic.
- Different death than run 1: behavior is timing/layout-sensitive, as expected
  with the pselect shift still unmeasured (shift=-2 is the 6.6 value).

## prime suspects (ranked)
1. pselect waiter-word shift (-2) unmeasured on 5.15 -> overlay misplaces
   the freed waiter -> kernel reads neighbor garbage as pointers.
2. Fake pi_waiters/lock-waiters tree shape gaps.
3. KIMAGE base assumption (non-critical path only).

## next
Sweep pselect shift via env override (source patch) + verbose re-fires,
collect Oops set. Do NOT call this a port until child uid=0 twice in a row.

## re-fire shift -2 (payload cae381d6, caps fixed)
- Setup green, died mid-run, reboot.
- Result: EMPTY pstore (lockup path, same as run 2).
- Tally: Oops +0x1b0 NULL x2 (run1 -2, shift -1), silent lockup x2
  (run2, rerun -2). Death mode varies run-to-run -> timing/layout
  sensitivity, not a pure constant. Both modes = kernel walked our fakes.

## sweep results (flat table unless noted)
- -2 nested: +0x1b0 NULL x2. -2 flat: 10 clean rounds, uid 2000, no root.
- -1: +0x1b0 NULL. +1: +0x1b0 NULL. -6,-4,0 flat: clean, uid 2000.
- +2 nested: uid 9999 flicker + lockup (write NEAR-miss). +2 flat: pending.
- simple layout: instant death (wrong shape, abandoned).
- 0,1,2...: see sweep/*.log. Remaining: 3,4,5,-8,-7,-5,-3.

## write-path autopsy (root.c + fops.c + util.c, read 2026-09-10)
- W2 does NOT memcpy the cred: it swaps child->cred POINTER to the fake
  image (CRED_COPY) via a single 8B UAF write at child+0x798, then the
  child reads uid from the image (0 = root).
- uid 2000 every round = write missing (aim/race), NOT wrong constants.
- uid 9999 (nested +2) = write landed NEARBY (off-target clobber).
- Cred image is 6.6-shaped (136B, caps 48-80); 5.15 needs 176B,
  caps-eff 0x38, security 0. Fix queued (rebuild + retest).
- FOPS splice slot is 0 (COPY_SPLICE absent on 5.15): needs substitute.
- The UAF window is RACED (consumer threads + route_delay_usec, env
  tunable PSELECT_ROUTE_DELAY_USEC). Timing tune is unexplored.

## build d71fd053 (cred image 5.15 + splice->noop + flat table)
- Fire 1: died round 1 (lockup, empty pstore).
- Fire 2: 4 clean rounds uid 2000, died round 4/5 (device gone).
- Verdict: image fix is behavior-neutral so far (same family as before:
  clean walks, writes missing). No regression, no root yet.
- credimage-1.log / credimage-2.log kept in sweep/.
