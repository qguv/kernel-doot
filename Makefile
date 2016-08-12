# Kernel module Makefile
# adapted from http://www.tldp.org/LDP/lkmpg/2.6/html/x181.html

CONFIG_MODULE_SIG=n
KERNEL_VERSION ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KERNEL_VERSION)/build

obj-m += doot.o

.PHONY: all clean

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean

install: all
	mkdir -p /usr/local/share/skeltal/
	install doot.png /usr/local/share/skeltal/doot.png
	install doot.jpg /usr/local/share/skeltal/doot.jpg
	install doot.svg /usr/local/share/skeltal/doot.svg
	install doot_black.gif /usr/local/share/skeltal/doot_black.gif
	insmod doot.ko

remove:
	rm -rf /usr/local/share/skeltal
	rmmod doot || echo -n
