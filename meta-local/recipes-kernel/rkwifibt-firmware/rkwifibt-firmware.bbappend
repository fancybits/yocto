FW := "git/firmware/broadcom/LG642"
SRC_URI += " \
    file://fw_bcm43342_ag.bin;subdir=${FW} \
    file://fw_bcm43342_ag_apsta.bin;subdir=${FW} \
    file://fw_bcm43342_ag_p2p.bin;subdir=${FW} \
    file://nvram_bcm43342.txt;subdir=${FW} \
"

FILESEXTRAPATHS:prepend := "${THISDIR}/firmware:"

do_install:append() {
	ln -rsf ${D}/lib/firmware/nvram_bcm43342.txt ${D}/lib/firmware/nvram.txt
	ln -rsf ${D}/lib/firmware/fw_bcm43342_ag.bin ${D}/lib/firmware/fw_bcmdhd.bin
    echo ccode=US > ${D}/lib/firmware/config.txt
}

#PACKAGES =+ " \
#    ${PN}-lg642-wifi \
#"
#
#FILES:${PN}-lg642-wifi = " \
#        lib/firmware/fw_bcm43342_ag.bin \
#        lib/firmware/fw_bcm43342_ag_apsta.bin \
#        lib/firmware/fw_bcm43342_ag_p2p.bin \
#        lib/firmware/nvram_bcm43342.txt \
#"
