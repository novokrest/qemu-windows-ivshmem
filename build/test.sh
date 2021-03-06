#!/bin/bash

QEMU_DISTR=$1
RESOURCE_DIR=C:/GuestFS/appliance

echo $QEMU_DISTR

$QEMU_DISTR \
    -L Bios \
    -m 500 \
    -no-reboot \
    -rtc driftfix=slew \
    -kernel $RESOURCE_DIR/kernel \
    -initrd $RESOURCE_DIR/initrd \
    -drive file=$RESOURCE_DIR/disk.img,cache=writeback,format=raw,id=hd0,if=none \
    -device virtio-blk-pci,drive=hd0 \
    -drive file=$RESOURCE_DIR/root,snapshot=on,id=appliance,cache=unsafe,if=none \
    -device virtio-blk-pci,drive=appliance \
    -device virtio-serial-pci \
    -serial stdio \
    -chardev socket,host=localhost,port=7777,id=channel0 \
    -device virtserialport,chardev=channel0,name=org.libguestfs.channel.0 \
    -device ivshmem,size=128,shm=GuestfsShm \
    -append 'panic=1 console=ttyS0 udevtimeout=6000 udev.event-timeout=6000 no_timer_check acpi=off printk.time=1 cgroup_disable=memory root=/dev/vdb selinux=0 guestfs_verbose=1 guestfs_shm=1 guestfs_shm_size=128 TERM=xterm'
