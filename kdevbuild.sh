#!/bin/bash
#

set -xe


make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- emb3531-rk3399_defconfig all O=out

rkthings/loaderimage --pack --uboot out/u-boot-dtb.bin out/uboot.img 0x200000


exit 0

make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- firefly-rk3399_defconfig all O=out

rkthings/loaderimage --pack --uboot out/u-boot-dtb.bin out/uboot.img 0x200000


