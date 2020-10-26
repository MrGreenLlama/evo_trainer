#!/bin/bash

su - ${FIRST_USER_NAME} <<EOF
rosdep upadate
EOF

