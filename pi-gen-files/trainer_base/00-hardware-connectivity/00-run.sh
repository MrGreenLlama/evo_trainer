#!/bin/bash -e

# enable usb-network module
echo -n " modules-load=dwc2,g_ether" >>"${ROOTFS_DIR}/boot/cmdline.txt"

# configure services
install -Dm 644 "./files/01-update-ssid.conf" \
	"${ROOTFS_DIR}/etc/systemd/system/hostapd.service.d/01-update-ssid.conf"
install -Dm 644 "./files/alive-pin.service" \
	"${ROOTFS_DIR}/etc/systemd/system/alive-pin.service"
install -Dm 644 "./files/hostapd.conf" "${ROOTFS_DIR}/etc/hostapd/hostapd.conf"
install -Dm 644 "./files/dnsmasq.conf" "${ROOTFS_DIR}/etc/dnsmasq.conf"
cat "./files/interfaces" >>"${ROOTFS_DIR}/etc/network/interfaces"

# enable services
ln -sf "/etc/systemd/system/alive-pin.service" \
	"${ROOTFS_DIR}/etc/systemd/system/multi-user.target.wants/alive-pin.service"
ln -sf "/usr/lib/systemd/system/hostapd.service" \
	"${ROOTFS_DIR}/etc/systemd/system/multi-user.target.wants/hostapd.service"
ln -sf "/usr/lib/systemd/system/dnsmasq.service" \
	"${ROOTFS_DIR}/etc/systemd/system/multi-user.target.wants/dnsmasq.service"
