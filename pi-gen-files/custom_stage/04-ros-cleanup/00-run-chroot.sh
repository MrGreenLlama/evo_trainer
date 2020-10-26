#!/bin/bash

rosdep fix-permissions

su - ${FIRST_USER_NAME} <<EOF
rosdep upadate
EOF

