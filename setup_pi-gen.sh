#!/bin/bash

TEXT_NORMAL="\033[0m"
TEXT_RED="\033[31m"
TEXT_GRN="\033[32m"
TEXT_YEL="\033[33m"

INSTALL_DIR="$(dirname "${BASH_SOURCE[0]}")"

echo -e "${TEXT_YEL}cloning pi-gen from github${TEXT_NORMAL}"
{
   git clone https://github.com/RPi-Distro/pi-gen.git "${INSTALL_DIR}/pi-gen/"
} || {
   if [ -d "${INSTALL_DIR}/pi-gen/" ]; then
      echo -e "${TEXT_RED}ERROR: pi-gen has already been downloaded, remove and reinstall? Y/n${TEXT_NORMAL}"
      read -r YN
      if ! [ "$YN" = "y" ] || [ "$YN" = "Y" ] || [ "$YN" = "\n" ]; then
         rm -rf "${INSTALL_DIR}/pi-gen/"
         /bin/bash "${BASH_SOURCE[0]}" # just execute itself again
         exit 0
      fi
      exit 1
   else
      echo -e "${TEXT_RED}ERROR: git clone failed ${TEXT_NORMAL}"
      exit 1
   fi
}

echo -e "${TEXT_YEL}setting up pi-gen for evo_trainer${TEXT_NORMAL}"
touch "${INSTALL_DIR}/pi-gen/stage2/SKIP_IMAGES"
cp "${INSTALL_DIR}/pi-gen-files/config" "${INSTALL_DIR}/pi-gen/"
cp -r "${INSTALL_DIR}/pi-gen-files/trainer_base" "${INSTALL_DIR}/pi-gen/"
cp -r "${INSTALL_DIR}/pi-gen-files/evocortex_ros" "${INSTALL_DIR}/pi-gen/"

echo -e "${TEXT_GRN}done!${TEXT_NORMAL}"
