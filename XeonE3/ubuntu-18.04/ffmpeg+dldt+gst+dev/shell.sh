#!/bin/bash -e

IMAGE="xeone3-ubuntu1804-ffmpeg-dldt-gst-dev"
DIR=$(dirname $(readlink -f "$0"))

. "${DIR}/../../../script/shell.sh"
