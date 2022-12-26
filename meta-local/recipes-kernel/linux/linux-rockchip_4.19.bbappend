FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://stmmac_reset_delay.patch"
#SRC_URI += "file://0001-remove-unrecognized-nodes.patch"

TOOLCHAIN:forcevariable = "clang"
DEPENDS:append:toolchain-clang = " clang-native clang-cross-${TARGET_ARCH}"
KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} -fuse-ld=lld ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -Wno-error=unused-but-set-variable"
KERNEL_LD:toolchain-clang = "${CCACHE}ld.lld"
KERNEL_AR:toolchain-clang = "${CCACHE}llvm-ar"
