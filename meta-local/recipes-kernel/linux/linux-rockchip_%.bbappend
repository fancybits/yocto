SRC_URI = "git://github.com/JeffyCN/mirrors.git;protocol=https;nobranch=1;branch=${KBRANCH}; \
           file://cgroups.cfg \
           file://rk3566-t95plus.dts;subdir=git/arch/${ARCH}/boot/dts/rockchip \
           file://t95plus.dts;subdir=git/arch/${ARCH}/boot/dts/rockchip \
           "
SRCREV = "${AUTOREV}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI += "file://stmmac_reset_delay.patch"
SRC_URI += "file://dmcdebug.patch"
SRC_URI += "file://jlsemiphy-fragment.cfg file://jlsemiphy.patch"
#SRC_URI += "file://0001-jlsemi-sleep-hack.patch"
#SRC_URI += "file://resethack.patch"
