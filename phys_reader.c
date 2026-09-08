/* phys_reader.c -- GKI phys-range reader (stock-kernel module path, T3).
 * No boot changes, no flashes: insmod on the RUNNING stock kernel (unsigned
 * modules load; use `insmod -f` if vermagic differs), read windows through
 * a /proc node in chunks, rmmod when done. Reboot restores everything.
 *
 * Build needs GKI headers for the EXACT running kernel
 * (5.15.180-android13-8-g9b2308ac0ad6); WITHOUT them this is a staged
 * source awaiting headers. Uses only GKI-stable APIs (ioremap, proc_create,
 * copy_to_user) to maximize layout-compat odds under `insmod -f`.
 *
 * Safety order (same binary, different insmod args):
 *   1. shared windows first (AP-reachable by design):
 *      0x8C000000+0x1360000 (cached), 0x8E000000+0x130000 (ncached)
 *   2. modem-private (0xD0000000+...) EXPECTS a stage-2 fault (PERM:0) --
 *      likely guest panic -> reboot to slot A. Your call per standing rules.
 */
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/io.h>
#include <linux/uaccess.h>
#include <linux/slab.h>

static unsigned long p_start = 0x8C000000;
static unsigned long p_len = 0x1360000;
static int p_nc;
module_param(p_start, ulong, 0444);
module_param(p_len, ulong, 0444);
module_param(p_nc, int, 0444);
MODULE_PARM_DESC(p_start, "physical start (hex)");
MODULE_PARM_DESC(p_len, "length in bytes (hex)");
MODULE_PARM_DESC(p_nc, "nonzero => ioremap_nocache");

static void __iomem *win;
static struct proc_dir_entry *dent;

static ssize_t pr_read(struct file *f, char __user *ub, size_t n, loff_t *ppos)
{
	size_t off = (size_t)*ppos, chunk;
	if (off >= p_len)
		return 0;
	if (off + n > p_len)
		n = p_len - off;
	chunk = min(n, (size_t)PAGE_SIZE);
	/* memcpy_fromio handles the __iomem pointer correctly */
	if (copy_to_user(ub, (const void __force *)((char __iomem *)win + off), chunk))
		return -EFAULT;
	*ppos += chunk;
	return chunk;
}

static const struct proc_ops pops = {
	.proc_read = pr_read,
};

static int __init pr_init(void)
{
	if (!request_mem_region(p_start, p_len, "phys_reader"))
		return -EBUSY;
	win = p_nc ? ioremap_nocache(p_start, p_len) : ioremap_cache(p_start, p_len);
	if (!win) {
		release_mem_region(p_start, p_len);
		return -ENOMEM;
	}
	dent = proc_create("phys_reader", 0444, NULL, &pops);
	if (!dent) {
		iounmap(win);
		release_mem_region(p_start, p_len);
		return -ENOMEM;
	}
	pr_info("phys_reader: %#lx +%#lx (%s)\n", p_start, p_len,
		p_nc ? "nocache" : "cached");
	return 0;
}

static void __exit pr_exit(void)
{
	remove_proc_entry("phys_reader", NULL);
	if (win)
		iounmap(win);
	release_mem_region(p_start, p_len);
}

module_init(pr_init);
module_exit(pr_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("GKI phys-range reader for modem/shared windows (staged)");
