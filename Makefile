#Simple wrapper for QEMU's Makefile

QEMU_DIR = qemu-2.1.2

all:
	$(MAKE) -C $(QEMU_DIR) QEMU_DGFLAGS=" "

install:
	$(MAKE) -C $(QEMU_DIR) install

clean:
	$(MAKE) -C $(QEMU_DIR) clean

.PHONY: all install clean