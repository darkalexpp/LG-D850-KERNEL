#! /bin/bash
clear

LANG=C

# build dependencies
# libncurses5-dev build-essential zip git-core lib32stdc++6 lib32z1 lib32z1-dev
# -----------------------------------
# folder structure
#------------------------------------
#	root (contains kernel source and these directories as well)
#		/TOOLCHAIN
#			/linaro-4.8
#		/WORKING_DIR 

#		/READY_KERNEL
#------------------------------------
# define variables
#------------------------------------
TODAY=`date '+%Y%m%d'`;

##NAME=Alex-$(grep "CONFIG_LOCALVERSION=" arch/arm/configs/g3-att-pref_defconfig | cut -c 23-28);

export PATH=$PATH:tools/lz4demo
echo #######################################
echo Generando opciones de Compilacion...
echo #######################################
echo .
make alex_d850_defconfig
echo .
echo #######################################
echo Compilando kernel...
echo #######################################
echo .
make ARCH=arm CROSS_COMPILE=TOOLCHAIN/linaro-4.8/bin/arm-eabi- zImage-dtb -j4
echo .
echo Output: arch/arm/boot/zImage-dtb 

