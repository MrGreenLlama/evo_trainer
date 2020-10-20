#!/bin/bash -e

echo -n "modules-load=dwc2,g_ether" >>"${ROOTFS_DIR}/boot/cmdline.txt"

install -Dm 644 "./files/01-update-ssid.conf" "${ROOTFS_DIR}/etc/systemd/system/hostapd.service.d/01-update-ssid.conf"
install -Dm 644 "./files/alive-pin.service" "${ROOTFS_DIR}/etc/systemd/system/alive-pin.service"
install -Dm 644 "./files/hostapd.conf" "${ROOTFS_DIR}/etc/hostapd/hostapd.conf"
install -Dm 644 "./files/dnsmasq.conf" "${ROOTFS_DIR}/etc/dnsmasq.conf"
cat "./files/interfaces" >>"${ROOTFS_DIR}/etc/network/interfaces"
