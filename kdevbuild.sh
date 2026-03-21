#!/bin/bash

export BL31=rk3399_bl31_v1.36.elf

make distclean
make ARCH=arm64 emb3531-rk3399_defconfig
make CROSS_COMPILE=/usr/bin/aarch64-linux-gnu- -j$(nproc)

cp -a u-boot.itb uboot.img

strings uboot.img |grep bootcmd=

ls -alh uboot.img
md5sum uboot.img

