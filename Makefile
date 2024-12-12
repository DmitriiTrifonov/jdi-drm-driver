obj-m += sharp.o
sharp-objs += src/main.o src/drm_iface.o src/params_iface.o src/ioctl_iface.o

export KROOT=/lib/modules/$(shell uname -r)/build

all:  modules

modules modules_install clean::
	@$(MAKE) -C $(KROOT) M=$(shell pwd) $@

clean::
	rm -rf   Module.symvers modules.order
