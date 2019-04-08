#!/bin/bash -e

IMAGE="xeon-ubuntu1604-ffmpeg-dldt-gst-dev"
DIR=$(dirname $(readlink -f "$0"))

. "${DIR}/../../../script/shell.sh"
