#!/bin/bash

su - ${FIRST_USER_NAME} <<EOF
rosdep update
EOF

