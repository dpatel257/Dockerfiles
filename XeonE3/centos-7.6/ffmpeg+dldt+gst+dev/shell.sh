#!/bin/bash -e

IMAGE="xeone3-centos76-ffmpeg-dldt-gst-dev"
DIR=$(dirname $(readlink -f "$0"))

. "${DIR}/../../../script/shell.sh"
