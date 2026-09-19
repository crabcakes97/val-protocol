#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/io.h>
#include <linux/moduleparam.h>

MODULE_LICENSE("GPL");

static int ticket = 0;
module_param(ticket, int, 0444);
static int buildtag = 18;
module_param(buildtag, int, 0444);

#define SRC_PHYS 0x50F00000UL
#define DST_PHYS 0x52000000UL
#define LEN 0x10000UL

static int __init relay_init(void)
{
	void __iomem *s, *d;
	unsigned long i, k, sum = 0;

	ticket = 0x1234;
	s = __ioremap(SRC_PHYS, LEN, PAGE_KERNEL);
	if (!s)
		return -ENOMEM;
	d = __ioremap(DST_PHYS, LEN, PAGE_KERNEL);
	if (!d) {
		iounmap(s);
		return -ENOMEM;
	}
	iowrite8(0xAA, d + 0);
	iowrite8(0x55, d + 1);
	iowrite8(0x12, d + 2);
	iowrite8(0x34, d + 3);
	for (i = 4; i < LEN; i++)
		iowrite8(ioread8(s + i), d + i);
	for (k = 0; k < LEN; k++)
		sum += ioread8(d + k);
	ticket = (int)(sum & 0x7fffffff);
	iounmap(d);
	iounmap(s);
	return 0;
}

static void __exit relay_exit(void)
{
}

module_init(relay_init);
module_exit(relay_exit);
