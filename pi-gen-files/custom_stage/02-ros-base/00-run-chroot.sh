#!/bin/bash -e

rosdep init

sudo -iu ${FIRST_USER_NAME} <<EOF
rosdep update
mkdir -p ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator ros_comm --rosdistro melodic --deps --wet-only --tar > melodic-ros_comm-wet.rosinstall
wstool init src melodic-ros_comm-wet.rosinstall
rosdep install -y --from-paths src --ignore-src --rosdistro melodic -r --os=debian:buster
EOF

cd ~${FIRST_USER_NAME}/ros_catkin_ws
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j

echo "source /opt/ros/melodic/setup.bash" >> ~${FIRST_USER_NAME}/.bashrc
