#/bin/bash -e

install -Dm 644 "./files/ros.list" "${ROOTFS_DIR}/etc/apt/sources.list.d/ros-latest.list"

on-chroot apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
on-chroot <<EOF
apt-get update
apt-get upgrade -y
EOF

