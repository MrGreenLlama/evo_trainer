#!/bin/bash -e

# Easy run script to start robot control
install -Dm 0755 $(stat --format "-u $u -g %g" ${ROOTFS}/home/${FIRST_USER_NAME}) \
	-t ${ROOTFS}/home/${FIRST_USER_NAME}/ \
	files/run-evotrainer-controller.sh

