#!/bin/bash -e

### Install ROS dependencies

# TODO: proper dependency resolution
# hardcoded depends:
#  geometry_msgs
#  nav_msgs
#  tf
su - ${FIRST_USER_NAME} <<EOF
source /opt/ros/melodic/setup.bash
cd ~/ros_catkin_ws/
rosinstall_generator \
	geometry_msgs \
	nav_msgs \
	tf \
	--rosdistro melodic \
	--deps \
	--wet-only \
	--tar \
	> evo-depends.rosinstall
wstool merge -t src evo-depends.rosinstall
wstool update -t src
EOF

cd /home/${FIRST_USER_NAME}/ros_catkin_ws
rosdep --as-root pip:false install -y \
	--from-paths src \
	--ignore-src \
	--rosdistro melodic \
	-r --os=debian:buster
./src/catkin/bin/catkin_make_isolated \
	-DCMAKE_C_FLAGS="-march=armv6 -mfpu=vfp -mfloat-abi=hard" \
	-DCMAKE_CXX_FLAGS="-march=armv6 -mfpu=vfp -mfloat-abi=hard" \
	-DCMAKE_BUILD_TYPE=Release \
	--install \
	--install-space /opt/ros/melodic \
	-j

