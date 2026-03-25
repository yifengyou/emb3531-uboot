#!/bin/bash

set -xe

WORKDIR=$(pwd)
cd ${WORKDIR}

if [ -d out ]; then
	rm -rf out
fi

rm -f uboot.img extracted_fdt.dtb

make mrproper
make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- emb3531-rk3399_defconfig all -j$(nproc)

rkthings/loaderimage --pack --uboot u-boot-dtb.bin uboot.img 0x200000

ls -alh uboot.img

cd rkthings
./trust_merger trust.ini
mv trust.img ../

cd ${WORKDIR}
ls -alh ./arch/arm/dts/rk3399-emb3531.dtb
dtc -I dtb -O dts ./arch/arm/dts/rk3399-emb3531.dtb -o dts.patch

dd if=uboot.img of=extracted_fdt.dtb bs=1 skip=584776 count=11187
find . -name "*.dtb" |xargs -i md5sum {} | grep  d74889f35bb5796dfe9db1f771775e6b
md5sum extracted_fdt.dtb dtb-uboot.dtb

exit 0



