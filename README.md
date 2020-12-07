# EvoTrainer

This repository contains the software for the Evocortex EvoTrainer educational
and training small robotics platform.

This software consists primarily of the customized Raspberry OS image.
The [pi-gen](https://github.com/RPi-Distro/pi-gen) configuration for this image
is located in the pi-gen-files directory.

## Usage of the Rasberry OS image

Official releases of the EvoTrainer Rasberry OS images are provided on the 
evocortex website (*link tbd*).
After download, these images can be flashed to any sufficiently large SD-card
following the standard SD-card image flashing procedures (e.g. using `dd` or
[Etcher](https://www.balena.io/etcher/) ).
Please note, since this is not an image provided by the Raspberry Pi organization,
the official Imager tool will not easyly work.

### Building the Image

Should you want to build the image for yourself instead of using the official 
release, you need a linux system with the reqired setup to use 
[pi-gen](https://github.com/RPi-Distro/pi-gen) (refere to its requirements for 
details).

After getting pi-gen,

	$ git clone https://github.com/RPi-Distro/pi-gen

you need need to apply the configuration from the `pi-gen-files` directory

	$ touch <pi-gen-dir>/stage2/SKIP_IMAGES
	$ cp -r <pi-gen-files-dir>/{config,trainer_base,evocortex_ros} <pi-gen-dir>/

Then simply run the pi-gen process (e.g. using the docker build)

	# cd <pi-gen-dir>
	# ./build-docker.sh -c config

The resulting image should end up in the `deploy` subdirectory.

