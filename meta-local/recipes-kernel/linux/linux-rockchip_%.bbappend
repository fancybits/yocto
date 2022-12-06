SRC_URI = "git://github.com/rockchip-linux/kernel.git;protocol=https;nobranch=1;branch=${KBRANCH}; \
           file://cgroups.cfg \
           file://rk3566-t95plus.dts;subdir=git/arch/${ARCH}/boot/dts/rockchip \
           "
SRCREV = "${AUTOREV}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGE_ARCH = "${MACHINE_ARCH}"
