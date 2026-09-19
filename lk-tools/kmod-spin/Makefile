obj-m += spin.o
all:
	make -C $(KDIR) M=$(PWD) ARCH=arm64 LLVM=1 modules
clean:
	make -C $(KDIR) M=$(PWD) clean
