/* moto g play 2026 (nevada XT2615V, MT6835 Dimensity 6100+) — 5.15.180
 *
 * Mapped LIVE from the rooted lab unit (kptr_restrict lowered to 0):
 *   python3 extract: addr - _text(live ffffffd466c00000)
 *
 * ashmem is the C driver here (drivers/staging/android/ashmem.c), same as
 * pmg110: off_ashmem_* point at ashmem_{ioctl,mmap,...} / compat_ashmem_ioctl,
 * off_ashmem_misc_fops = ashmem_misc + 0x10 (fops member).
 *
 * NOTE: 5.15 task_struct/file_operations layouts differ from the 6.6/6.12
 * layouts in the reference source — build the nevada target.h, not pmg110's.
 */

OFFSETS_ENTRY("5.15.180-android13-8-00018-g9b2308ac0ad6-ab14563692",  /* W1WNS36.18-111-3 */
  .layout="nevada-5.15",
  .off_init_task=0x02C43640, .off_init_cred=0x02BFD698, .off_init_uts_ns=0x02CC0180,
  .off_empty_zero_page=0x02D54000, .off_root_task_group=0x02D58AC0,
  .off_selinux_enforcing=0x02DAAD78, .off_kptr_restrict=0x02AFDB24,
  .off_selinux_blob_sizes=0x021656E8, .off_security_hook_heads=0x02163260,
  .off_kmalloc_caches=0x021664E0, .off_anon_pipe_buf_ops=0x01F86BB0,
  .off_ashmem_misc_fops=0x02C91D40, .off_ashmem_fops=0x02104248,
  .off_ashmem_ioctl=0x0113F330, .off_ashmem_compat_ioctl=0x0113F9E0,
  .off_ashmem_mmap=0x0113FA40, .off_ashmem_open=0x0113FD30,
  .off_ashmem_release=0x0113FDD0, .off_ashmem_show_fdinfo=0x0113FEF4,
  .off_configfs_read_iter=0x00677624, .off_configfs_bin_write_iter=0x00678148,
  .off_copy_splice_read=0,  /* absent from this build's kallsyms: re-derive */
  .off_noop_llseek=0x00552590,
  .off_cap_capable_active=0,  /* no security_hook_active_* on this 5.15 build */
  .off_slide_nfulnl_logger=0x02B01E28, .off_slide_loggers_0_1=0x02B01C78,
  .off_slide_boot_id=0x02DC6819,
),
