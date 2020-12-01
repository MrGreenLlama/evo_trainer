#!/bin/bash -e

### Get sources and bin-packages for evocortex ROS nodes

source /opt/ros/melodic/setup.bash

su - ${FIRST_USER_NAME} <<EOF
source /opt/ros/melodic/setup.bash
mkdir -p ~/evo_catkin_ws/src
cd ~/evo_catkin_ws/src
git clone https://github.com/evocortex/evo_rd_platform.git evo_rd_platform
EOF

cd /home/${FIRST_USER_NAME}/evo_catkin_ws/src/evo_rd_platform
dpkg --unpack \
	"bin/libevo-mbed-tools-dev_1.0.1-1~raspbian~buster_armhf.deb" \
	"bin/libevo-mbed-tools_1.0.1-1~raspbian~buster_armhf.deb"
apt-get --fix-broken install

su - ${FIRST_USER_NAME} <<EOF
source /opt/ros/melodic/setup.bash
cd ~/evo_catkin_ws/src/evo_rd_platform
wstool update
EOF
