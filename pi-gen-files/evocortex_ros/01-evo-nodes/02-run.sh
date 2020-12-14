#!/bin/bash -e

### Install platform specific launch file

EVO_CATKIN_WS=${ROOTFS_DIR}/home/${FIRST_USER_NAME}/evo_catkin_ws
PLATFORM_EXAMPLE=${EVO_CATKIN_WS}/src/evo_rd_platform/evo_rd_platform_example

install -Dm 0644 $(stat --format "-o %u -g %g" "${PLATFORM_EXAMPLE}/launch") \
	"files/evo_evotrainer_base_driver.launch" \
	"${PLATFORM_EXAMPLE}/launch/evo_evotrainer_base_driver.launch"

