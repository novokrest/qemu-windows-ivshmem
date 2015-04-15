#!/bin/bash

TARGET_LIST="i386-softmmu arm-softmmu sparc-softmmu ppc-softmmu x86_64-softmmu mipsel-softmmu"
MIN_TARGET_LIST="i386-softmmu x86_64-softmmu"
TOP_DIR=`pwd`
QEMU_DIR=$TOP_DIR/qemu-2.1.2
BUILD_DIR=$TOP_DIR/build

cd $QEMU_DIR

./configure \
--target-list="$MIN_TARGET_LIST" \
--prefix=$BUILD_DIR \
--with-confsuffix=/Bios \
--disable-libusb \
--enable-gtk --with-gtkabi=2.0 \
--enable-guest-agent  \
--disable-werror --disable-strip $*
