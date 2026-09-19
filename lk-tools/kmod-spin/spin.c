#include <linux/init.h>
#include <linux/module.h>
#include <linux/panic.h>
MODULE_LICENSE("GPL");
static int __init spin_init(void)
{
	panic("SPINMARKER");
	return 0;
}
static void __exit spin_exit(void)
{
}
module_init(spin_init);
module_exit(spin_exit);
