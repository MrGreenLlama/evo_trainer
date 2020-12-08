#!/bin/bash -e

# Easy run script to start robot control
install -Dm 0755 $(stat --format "-u %u -g %g" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}") \
	"files/run-evotrainer-controller.sh" \
	"${ROOTFS_DIR}/home/${FIRST_USER_NAME}/run-evotrainer-controller.sh"

