#!/bin/bash
#

set -xe

WORKDIR=$(pwd)
cd ${WORKDIR}

make V= ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- menuconfig

exit 0
