#SRC_URI = " \
#    git://github.com/JeffyCN/mirrors.git;protocol=https;nobranch=1;branch=${KBRANCH}; \
#"
SRC_URI = " \
    git://github.com/rockchip-linux/kernel.git;protocol=https;nobranch=1;branch=${KBRANCH}; \
"
SRC_URI += " \
    file://rk3566-t95plus.dts;subdir=git/arch/${ARCH}/boot/dts/rockchip \
    file://t95plus.dts;subdir=git/arch/${ARCH}/boot/dts/rockchip \
"
SRCREV = "${AUTOREV}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

#KBUILD_DEFCONFIG = ""
PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI += "file://t95plus_defconfig;subdir=git/arch/${ARCH}/configs/"
SRC_URI += "file://stmmac_mdio_register.patch"
#SRC_URI += "file://dmcdebug.patch"
#SRC_URI += "file://0001-jlsemi-sleep-hack.patch"
#SRC_URI += "file://jlsemiphy-fragment.cfg file://jlsemiphy.patch"
#SRC_URI += "file://resethack.patch"
