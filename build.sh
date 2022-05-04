#!/bin/bash

pushd u-boot-rockchip

export CROSS_COMPILE=aarch64-linux-gnu-
make clean && make rk3566-quartz64_defconfig && \
    ./make.sh && ./make.sh trust
if [ $? -eq 0 ]; then
    popd
    mkdir -p IMAGES
    cp u-boot-rockchip/uboot.img IMAGES/
    cp u-boot-rockchip/trust.img IMAGES/
    echo
    echo
    echo "U-Boot Image: IMAGES/uboot.img"
    echo "Trust Image: IMAGES/trust.img"
else
    echo "Build uboot failed!"
    exit 1
fi
