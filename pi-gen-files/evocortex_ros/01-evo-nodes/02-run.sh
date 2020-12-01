#!/bin/bash -e

### Install platform specific launch file

EVO_CATKIN_WS=${ROOTFS}/home/${FIRST_USER_NAME}/evo_catkin_ws/
PLATFORM_EXAMPLES=${EVO_CATKIN_WS}/src/evo_rd_platform/evo_rd_platform_examples/

install -Dm 0644 $(stat --format "-u %u -g %g" ${PLATFORM_EXAMPLES}/launch) \
	-t ${PLATFORM_EXAMPLES}/launch/ \
	files/evo_evotrainer_base_driver.launch

