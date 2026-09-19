/* offprinter.c -- compile-time struct offsets for the nevada ghostlock port.
 * Built against the DEVICE config (nevada.config.gz) so layouts match the
 * running 5.15.180 kernel. Values are read from the .ko WITHOUT loading:
 * each is a module_param init value; parse with tools/offread.py.
 * Loading is ALSO safe (read-only params, no hooks) but unnecessary.
 */
#include <linux/module.h>
#include <linux/sched.h>
#include <linux/cred.h>
#include <linux/mm_types.h>
#include <linux/futex.h>
#include <linux/rtmutex.h>
#include <linux/pipe_fs_i.h>
#include <linux/fs.h>
#include <linux/mm.h>

#define OFF(n, t, m) static int off_##n = offsetof(struct t, m); \
	module_param(off_##n, int, 0444)

/* rt_mutex_waiter — GKI-tree (flat) layout. If live BTF shows the nested
 * (rt_waiter_node) shape instead, rebuild with -DWAITER_NESTED (below). */
#include <linux/rtmutex.h>
/* full waiter definition is kernel-private; absolute include is ugly but
 * exact (same tree the module builds against). */
#include "/home/cameron/gki/common/kernel/locking/rtmutex_common.h"
OFF(waiter_tree_entry, rt_mutex_waiter, tree_entry);
OFF(waiter_pi_tree_entry, rt_mutex_waiter, pi_tree_entry);
OFF(waiter_task, rt_mutex_waiter, task);
OFF(waiter_lock, rt_mutex_waiter, lock);
OFF(waiter_wake_state, rt_mutex_waiter, wake_state);
OFF(waiter_prio, rt_mutex_waiter, prio);
OFF(waiter_deadline, rt_mutex_waiter, deadline);
/* task_struct */
OFF(task_usage, task_struct, usage);
OFF(task_prio, task_struct, prio);
OFF(task_normal_prio, task_struct, normal_prio);
OFF(task_group, task_struct, sched_task_group);
OFF(task_pi_lock, task_struct, pi_lock);
OFF(task_pi_waiters, task_struct, pi_waiters);
OFF(task_pi_top_task, task_struct, pi_top_task);
OFF(task_pi_blocked_on, task_struct, pi_blocked_on);
OFF(task_pid, task_struct, pid);
OFF(task_tgid, task_struct, tgid);
OFF(task_real_parent, task_struct, real_parent);
OFF(task_atomic_flags, task_struct, atomic_flags);
OFF(task_real_cred, task_struct, real_cred);
OFF(task_cred, task_struct, cred);
OFF(task_comm, task_struct, comm);
OFF(task_tasks, task_struct, tasks);
OFF(task_seccomp, task_struct, seccomp);
OFF(task_mm, task_struct, mm);
/* cred */
OFF(cred_uid, cred, uid);
OFF(cred_cap_inheritable, cred, cap_inheritable);
OFF(cred_security, cred, security);
/* mm_struct */
OFF(mm_owner, mm_struct, owner);
/* pipe_inode_info */
OFF(pipe_head, pipe_inode_info, head);
OFF(pipe_bufs, pipe_inode_info, bufs);
/* file_operations */
OFF(fops_owner, file_operations, owner);
OFF(fops_llseek, file_operations, llseek);
OFF(fops_read_iter, file_operations, read_iter);
OFF(fops_unlocked_ioctl, file_operations, unlocked_ioctl);
OFF(fops_compat_ioctl, file_operations, compat_ioctl);
OFF(fops_mmap, file_operations, mmap);
OFF(fops_open, file_operations, open);
OFF(fops_release, file_operations, release);
OFF(fops_splice_read, file_operations, splice_read);
OFF(fops_show_fdinfo, file_operations, show_fdinfo);
/* sizes */
static int sz_task = sizeof(struct task_struct);
module_param(sz_task, int, 0444);
static int sz_mm = sizeof(struct mm_struct);
module_param(sz_mm, int, 0444);
static int sz_pipe = sizeof(struct pipe_inode_info);
module_param(sz_pipe, int, 0444);
static int sz_page = sizeof(struct page);
module_param(sz_page, int, 0444);
static int sz_fops = sizeof(struct file_operations);
module_param(sz_fops, int, 0444);
static int sz_waiter = sizeof(struct rt_mutex_waiter);
module_param(sz_waiter, int, 0444);
static int sz_cred = sizeof(struct cred);
module_param(sz_cred, int, 0444);

MODULE_LICENSE("GPL");
