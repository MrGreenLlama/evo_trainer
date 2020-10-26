#!/bin/bash -e

rosdep init

su - ${FIRST_USER_NAME} <<EOF
rosdep update 
mkdir -p ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator ros_comm --rosdistro melodic --deps --wet-only --tar > melodic-ros_comm-wet.rosinstall
wstool init src melodic-ros_comm-wet.rosinstall
EOF

cd /home/${FIRST_USER_NAME}/ros_catkin_ws
rosdep --as-root pip:false install -y --from-paths src --ignore-src --rosdistro melodic -r --os=debian:buster
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j

echo "source /opt/ros/melodic/setup.bash" >> /home/${FIRST_USER_NAME}/.bashrc
