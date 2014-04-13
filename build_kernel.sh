#!/bin/bash
TOOLCHAINPATH=/home/moon/toolchain/linaro-4.7.4/bin
export ARCH=arm
export CROSS_COMPILE=$TOOLCHAINPATH/arm-gnueabi-

make u1_kor_skt_defconfig
make -j15
cp arch/arm/boot/zImage zImage
rm -rf modules/*
find -name '*.ko' -exec cp -av {} modules \;
        for i in modules/*; do $TOOLCHAINPATH/arm-gnueabi-strip --strip-unneeded $i;done;\
