
# BSD 3-Clause License
#
# Copyright (c) 2021, Intel Corporation
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the name of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This file is automatically generated from .m4 template.
# To update, modify the template and regenerate.
FROM ubuntu:20.04 AS build


RUN mkdir -p /opt/build && mkdir -p /opt/dist

ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget make autoconf automake g++ && \
  rm -rf /var/lib/apt/lists/*

# build libogg
ARG OGG_VER=1.3.5
ARG LIBOGG_REPO=https://github.com/xiph/ogg/releases/download/v${OGG_VER}/libogg-1.3.5.tar.gz

RUN cd /opt/build && \
    wget -O - ${LIBOGG_REPO} | tar xz && \
    cd libogg-1.3.5 && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib --enable-shared && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget make autoconf automake && \
  rm -rf /var/lib/apt/lists/*

# build libvorbis
ARG VORBIS_VER=1.3.7
ARG LIBVORBIS_REPO=https://github.com/xiph/vorbis/releases/download/v${VORBIS_VER}/libvorbis-1.3.7.tar.gz
RUN cd /opt/build && \
    wget -O - ${LIBVORBIS_REPO} | tar xz && \
    cd libvorbis-1.3.7 && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib --enable-shared && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget g++ autoconf libtool autotools-dev automake make && \
  rm -rf /var/lib/apt/lists/*

# build libfdkaac
ARG LIBFDKAAC_REPO=https://github.com/mstorsjo/fdk-aac/archive/v2.0.2.tar.gz
RUN cd /opt/build && \
    wget -O - ${LIBFDKAAC_REPO} | tar xz && \
    cd fdk-aac-2.0.2 && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib --enable-shared && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget autoconf libtool make && \
  rm -rf /var/lib/apt/lists/*

# build libopus
ARG LIBOPUS_REPO=https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
RUN cd /opt/build && \
    wget -O - ${LIBOPUS_REPO} | tar xz && \
    cd opus-1.3.1 && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib --enable-shared && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget tar g++ make bzip2 && \
  rm -rf /var/lib/apt/lists/*

# build nasm
ARG NASM_REPO=https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.bz2
RUN cd /opt/build && \
    wget -O - ${NASM_REPO} | tar xj && \
    cd nasm-2.15.05 && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib && \
     make -j$(nproc) && \
     make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git cmake make autoconf && \
  rm -rf /var/lib/apt/lists/*

# build libvpx
ARG LIBVPX_REPO=https://chromium.googlesource.com/webm/libvpx.git
RUN cd /opt/build && \
    git clone ${LIBVPX_REPO} -b v1.10.0 --depth 1 && \
    cd libvpx && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib --enable-shared --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=nasm && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git cmake make autoconf && \
  rm -rf /var/lib/apt/lists/*

# build libx264
ARG LIBX264_REPO=https://github.com/mirror/x264
RUN cd /opt/build && \
    git clone ${LIBX264_REPO} -b stable --depth 1 && \
    cd x264 && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib \
        --enable-shared && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget tar g++ make && \
  rm -rf /var/lib/apt/lists/*

# build yasm
ARG YASM_REPO=https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
RUN cd /opt/build && \
    wget -O - ${YASM_REPO} | tar xz
RUN cd /opt/build/yasm-1.3.0 && \
    # TODO remove the line below whether no other component inside this project requires it.
    # `sed -i "s/) ytasm.*/)/" Makefile.in' && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib && \
    make -j $(nproc) && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libnuma-dev cmake make && \
  rm -rf /var/lib/apt/lists/*

# build libx265
ARG LIBX265_REPO=https://github.com/videolan/x265/archive/3.4.tar.gz
RUN cd /opt/build && \
    wget -O - ${LIBX265_REPO} | tar xz && \
    cd x265-3.4/build/linux && \
    cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr/local -DLIB_INSTALL_DIR=/usr/local/lib ../../source && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates meson tar g++ wget pkg-config && \
  rm -rf /var/lib/apt/lists/*

# build dav1d
ARG DAV1D_REPO=https://code.videolan.org/videolan/dav1d/-/archive/0.9.0/dav1d-0.9.0.tar.gz
RUN cd /opt/build && \
  wget -O - ${DAV1D_REPO} | tar xz
RUN cd /opt/build/dav1d-0.9.0 && \
  meson build --prefix=/usr/local --libdir /usr/local/lib --buildtype=plain && \
  cd build && \
  ninja install && \
  DESTDIR=/opt/dist ninja install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates cmake g++ make wget && \
  rm -rf /var/lib/apt/lists/*

# build gmmlib
ARG GMMLIB_REPO=https://github.com/intel/gmmlib/archive/intel-gmmlib-21.1.3.tar.gz
RUN cd /opt/build && \
  wget -O - ${GMMLIB_REPO} | tar xz
RUN cd /opt/build/gmmlib-intel-gmmlib-21.1.3 && mkdir build && cd build && \
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=/usr/local/lib .. && \
  make -j$(nproc) && \
  make install DESTDIR=/opt/dist && \
  make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    automake ca-certificates gcc libdrm-dev libtool make pkg-config wget libx11-dev libxext-dev libxfixes-dev libwayland-dev && \
  rm -rf /var/lib/apt/lists/*

# build libva2
ARG LIBVA2_REPO=https://github.com/intel/libva/archive/2.11.0.tar.gz
RUN cd /opt/build && \
  wget -O - ${LIBVA2_REPO} | tar xz
RUN cd /opt/build/libva-2.11.0 && \
  ./autogen.sh --prefix=/usr/local --libdir=/usr/local/lib && \
  make -j$(nproc) && \
  make install DESTDIR=/opt/dist && \
  make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates wget && \
  rm -rf /var/lib/apt/lists/*

# build opencl
ARG OPENCL_GMMLIB_REPO=https://github.com/intel/compute-runtime/releases/download/21.23.20043/intel-gmmlib_21.1.3_amd64.deb
ARG OPENCL_IGC_CORE_REPO=https://github.com/intel/intel-graphics-compiler/releases/download/igc-1.0.7423/intel-igc-core_1.0.7423_amd64.deb
ARG OPENCL_IGC_OCL_REPO=https://github.com/intel/intel-graphics-compiler/releases/download/igc-1.0.7423/intel-igc-opencl_1.0.7423_amd64.deb
ARG OPENCL_INTEL_OCL_REPO=https://github.com/intel/compute-runtime/releases/download/21.23.20043/intel-opencl_21.23.20043_amd64.deb

RUN mkdir -p /opt/build/opencl && \
    cd /opt/build/opencl && \
    wget ${OPENCL_GMMLIB_REPO} ${OPENCL_IGC_CORE_REPO} ${OPENCL_IGC_OCL_REPO} ${OPENCL_INTEL_OCL_REPO} && \
    dpkg -i ./*.deb && \
    for x in *.deb; do dpkg-deb -x $x /opt/dist/usr/local; done

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates cmake g++ libpciaccess-dev make pkg-config wget && \
  rm -rf /var/lib/apt/lists/*

# build media driver
ARG MEDIA_DRIVER_REPO=https://github.com/intel/media-driver/archive/intel-media-21.1.3.tar.gz
RUN cd /opt/build && \
  wget -O - ${MEDIA_DRIVER_REPO} | tar xz
RUN cd /opt/build/media-driver-intel-media-21.1.3 && mkdir build && cd build && \
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=/usr/local/lib -DENABLE_PRODUCTION_KMD=OFF .. && \
  make -j$(nproc) && \
  make install DESTDIR=/opt/dist && \
  make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates gcc g++ make cmake pkg-config wget && \
  rm -rf /var/lib/apt/lists/*

# build media sdk
ARG MSDK_REPO=https://github.com/Intel-Media-SDK/MediaSDK/archive/intel-mediasdk-21.1.3.tar.gz
RUN cd /opt/build && \
    wget -O - ${MSDK_REPO} | tar xz
RUN cd /opt/build/MediaSDK-intel-mediasdk-21.1.3 && \
    mkdir -p build && cd build && \
    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DCMAKE_INSTALL_LIBDIR=/usr/local/lib \
    -DBUILD_SAMPLES=no \
    -DBUILD_TUTORIALS=OFF \
    .. && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    cpio libjson-c-dev && \
  rm -rf /var/lib/apt/lists/*

# Install OpenVINO - Closed source dldt
ARG OPENVINO_REPO=http://registrationcenter-download.intel.com/akdlm/irc_nas/17662/l_openvino_toolkit_p_2021.3.394.tgz

#Download and unpack OpenVino
RUN mkdir /opt/build/openvino
RUN wget ${OPENVINO_REPO} -P /opt/build/openvino
RUN if [ -f /opt/build/openvino/l_openvino_toolkit_p_2021.3.394.tgz ]; \
    then tar xzvf /opt/build/openvino/l_openvino_toolkit_p_2021.3.394.tgz -C /opt/build/openvino && rm /opt/build/openvino/l_openvino_toolkit_p_2021.3.394.tgz; \
    else echo "Please prepare the OpenVino installation bundle"; \
fi

# Create a silent configuration file for install
RUN echo "ACCEPT_EULA=accept" > /opt/build/openvino/silent.cfg                        && \
    echo "CONTINUE_WITH_OPTIONAL_ERROR=yes" >> /opt/build/openvino/silent.cfg         && \
    echo "PSET_INSTALL_DIR=/opt/intel" >> /opt/build/openvino/silent.cfg              && \
    echo "CONTINUE_WITH_INSTALLDIR_OVERWRITE=yes" >> /opt/build/openvino/silent.cfg   && \
    echo "COMPONENTS=DEFAULTS" >> /opt/build/openvino/silent.cfg                      && \
    echo "COMPONENTS=ALL" >> /opt/build/openvino/silent.cfg                           && \
    echo "PSET_MODE=install" >> /opt/build/openvino/silent.cfg                        && \
    echo "INTEL_SW_IMPROVEMENT_PROGRAM_CONSENT=no" >> /opt/build/openvino/silent.cfg  && \
    echo "SIGNING_ENABLED=no" >> /opt/build/openvino/silent.cfg

#Install OpenVino
RUN /opt/build/openvino/l_openvino_toolkit_p_2021.3.394/install.sh --ignore-signature --cli-mode -s /opt/build/openvino/silent.cfg && rm -rf /opt/build/openvino

#Create symlink to assure compatibility with components
RUN cd /opt/intel/      &&\
    ln -s openvino_2021 openvino

ARG OPENVINO_IE_DIR=/opt/intel/openvino/deployment_tools/inference_engine

ENV IE_PLUGINS_PATH=${OPENVINO_IE_DIR}/lib/intel64
ENV HDDL_INSTALL_DIR=${OPENVINO_IE_DIR}/external/hddl
ENV InferenceEngine_DIR=${OPENVINO_IE_DIR}/share
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/openvino/deployment_tools/ngraph/lib:/opt/intel/opencl:$HDDL_INSTALL_DIR/lib:${OPENVINO_IE_DIR}/external/gna/lib:${OPENVINO_IE_DIR}/external/mkltiny_lnx/lib:${OPENVINO_IE_DIR}/external/omp/lib:${OPENVINO_IE_DIR}/external/tbb/lib:/opt/intel/openvino/openvx/lib:$IE_PLUGINS_PATH

#Remove components of OpenVino that are not needed
ARG CV_BASE_DIR=/opt/intel/openvino
RUN rm -rf ${CV_BASE_DIR}/uninstall* && \
    rm -rf ${CV_BASE_DIR}/python && \
    rm -rf ${CV_BASE_DIR}/documentation && \
    rm -rf ${CV_BASE_DIR}/install_dependiencies && \
    rm -rf ${CV_BASE_DIR}/openvino_toolkit_uninstaller && \
    rm -rf ${CV_BASE_DIR}/deployment_tools/demo && \
    rm -rf ${CV_BASE_DIR}/deployment_tools/intel_models && \
    rm -rf ${CV_BASE_DIR}/deployment_tools/model_optimizer && \
    rm -rf ${CV_BASE_DIR}/deployment_tools/tools && \
    rm -rf ${CV_BASE_DIR}/deployment_tools/inference_engine/samples && \
    rm -rf ${CV_BASE_DIR}/openvx/samples && \
    rm -rf ${CV_BASE_DIR}/opencv/samples

#Copy over directories to run image
RUN mkdir -p /opt/dist/opt/intel && \
    cp -rH /opt/intel/openvino /opt/dist/opt/intel/



ARG LIBJSONC_REPO=https://github.com/json-c/json-c/archive/json-c-0.15-20200726.tar.gz
RUN cd /opt/build && \
    wget -O - ${LIBJSONC_REPO} | tar xz && \
    cd json-c-json-c-0.15-20200726 && mkdir build && cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=/usr/local/lib .. && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install



ARG KAFKA_VER=1.7.0
ARG LIBRDKAFKA_REPO=https://github.com/edenhill/librdkafka/archive/v${KAFKA_VER}.tar.gz
RUN cd /opt/build && \
    wget -O - ${LIBRDKAFKA_REPO} | tar xz && \
    cd librdkafka-1.7.0 && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib && \
    make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates cmake gcc g++ make wget python3-numpy ccache libeigen3-dev && \
  rm -rf /var/lib/apt/lists/*

# build opencv
ARG OPENCV_REPO=https://github.com/opencv/opencv/archive/4.5.2.tar.gz
RUN cd /opt/build && \
  wget -O - ${OPENCV_REPO} | tar xz
# TODO: file a bug against opencv since they do not accept full libdir
RUN cd /opt/build/opencv-4.5.2 && mkdir build && cd build && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    .. && \
  make -j $(nproc) && \
  make install DESTDIR=/opt/dist && \
  make install

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential ca-certificates wget patch libv4l-dev libass-dev  && \
  rm -rf /var/lib/apt/lists/*

# build ffmpeg
ARG FFMPEG_REPO=https://github.com/FFmpeg/FFmpeg/archive/n4.4.tar.gz
RUN cd /opt/build && \
    wget -O - ${FFMPEG_REPO} | tar xz

#ifdef(`BUILD_SVT_VP9',`FFMPEG_PATCH_SVT_VP9(BUILD_HOME/FFmpeg-FFMPEG_VER)')dnl
#ifdef(`BUILD_DLDT',`FFMPEG_PATCH_ANALYTICS(BUILD_HOME/FFmpeg-FFMPEG_VER)')dnl
#ifdef(`BUILD_OPENVINO',`FFMPEG_PATCH_ANALYTICS(BUILD_HOME/FFmpeg-FFMPEG_VER)')dnl
ARG FFMPEG_PATCH_VAAPI_REPO=https://github.com/OpenVisualCloud/Dockerfiles-Resources/raw/master/ffmpeg-patch-0041-lavc-vaapi_encode_h265-fix-max_transform_hierarchy_d.tar.gz
RUN cd /opt/build && \
    wget -O - ${FFMPEG_PATCH_VAAPI_REPO} | tar xz && \
    cd /opt/build/FFmpeg-n4.4 && \
    patch -p1 < ../0041-lavc-vaapi_encode_h265-fix-max_transform_hierarchy_d.patch || true


ARG FFMPEG_1TN_PATCH_REPO=https://raw.githubusercontent.com/OpenVisualCloud/Dockerfiles-Resources/master/n4.4-enhance_1tn_performance.patch
RUN cd /opt/build/FFmpeg-n4.4 && \
    wget -O - ${FFMPEG_1TN_PATCH_REPO} | patch -p1;

RUN cd /opt/build/FFmpeg-n4.4 && \
    ./configure --prefix=/usr/local --libdir=/usr/local/lib --enable-shared --disable-static --disable-doc --disable-htmlpages \
    --disable-manpages --disable-podpages --disable-txtpages \
    --extra-cflags=-w         --enable-libass     --enable-libfreetype     --disable-xlib --disable-sdl2         --enable-libmfx     --enable-vaapi     --enable-libv4l2 --enable-indev=v4l2     -rpath=/usr/local/ssl/lib     --enable-libfdk-aac     --enable-libopus     --enable-libvpx     --enable-libvorbis     --enable-gpl --enable-libx264     --enable-gpl --enable-libx265                     --enable-libdav1d     && make -j$(nproc) && \
    make install DESTDIR=/opt/dist && \
    make install

RUN cd /opt/build/opencv-4.5.2/build && \
  rm -rf ./* && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    .. && \
  cd modules/videoio && \
  make -j $(nproc) && \
  cp -f ../../lib/libopencv_videoio.so.4.5.2 /opt/dist/usr/local/lib

# cleanup
RUN rm -rf /opt/dist/usr/local/include && \
    rm -rf /opt/dist/usr/local/lib/pkgconfig && \
    find /opt/dist -name "*.a" -exec rm -f {} \; || echo ""
RUN rm -rf /opt/dist/usr/local/share/doc /opt/dist/usr/local/share/gtk-doc
RUN rm -rf /opt/dist/usr/local/share/man

FROM ubuntu:20.04
LABEL Description="This is the base image for FFMPEG ubuntu 20.04"
LABEL Vendor="Intel Corporation"
WORKDIR /home

# Install
RUN apt-get update && apt-get upgrade -y systemd
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libnuma1 libdrm2 libx11-6 libxext6 libxfixes3 libwayland-client0 libpciaccess0 libusb-1.0-0-dev libboost-filesystem1.71.0 libboost-system1.71.0 libboost-program-options1.71.0 libjson-c4 libxcb-shape0 libxcb-xfixes0 libv4l-0 libass9  && \
  rm -rf /var/lib/apt/lists/*

COPY --from=build /opt/dist /
RUN echo "/usr/local/lib" >> /etc/ld.so.conf.d/all-libs.conf && ldconfig

ENV LIBVA_DRIVERS_PATH=/usr/local/lib/dri
ENV LIBVA_DRIVER_NAME=iHD
ENV DISPLAY=:0.0

ARG OPENVINO_IE_DIR=/opt/intel/openvino/deployment_tools/inference_engine
ENV IE_PLUGINS_PATH=${OPENVINO_IE_DIR}/lib/intel64
ENV HDDL_INSTALL_DIR=${OPENVINO_IE_DIR}/external/hddl
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/openvino/deployment_tools/ngraph/lib:/opt/intel/opencl:$HDDL_INSTALL_DIR/lib:/opt/intel/openvino/deployment_tools/inference_engine/external/gna/lib:/opt/intel/openvino/deployment_tools/inference_engine/external/mkltiny_lnx/lib:/opt/intel/openvino/deployment_tools/inference_engine/external/omp/lib:/opt/intel/openvino/deployment_tools/inference_engine/external/tbb/lib:/opt/intel/openvino/openvx/lib:/usr/local/lib:$IE_PLUGINS_PATH

