#!/bin/bash -e

### Build evocortex ROS nodes

su - ${FIRST_USER_NAME} <<EOF
source /opt/ros/melodic/setup.bash
cd ~/evo_catkin_ws/
catkin_make
EOF
