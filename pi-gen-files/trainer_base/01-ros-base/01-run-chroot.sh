#!/bin/bash -e

rosdep init
rosdep --as-root pip:false update 

su - ${FIRST_USER_NAME} <<EOF
mkdir -p ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator ros_comm \
	--rosdistro melodic \
	--deps \
	--wet-only \
	--tar \
	> melodic-ros_comm-wet.rosinstall
wstool init src melodic-ros_comm-wet.rosinstall
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

su - ${FIRST_USER_NAME} <<EOF
rosdep update
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
EOF
