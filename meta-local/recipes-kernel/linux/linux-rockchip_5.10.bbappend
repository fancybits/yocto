FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://stmmac_reset_delay_5x.patch"
SRC_URI += "file://stmmac_tool.patch"
