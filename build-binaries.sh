#!/bin/bash
#===============================================================================
# Project:   docker-soldo
# Author:    Myhr, Andy
# Revised:   2018-02-06
# Created:   2018-02-06
# Copyright: 2017, awmyhr
# License:   Apache-2.0
#===============================================================================

# check if directory exists, if it does
if [ -d source ]; then
    cd source
    make clean
    git pull
else
    git clone https://github.com/monselice/sld.git source
    cd source
fi

mkdir -p build /build/bin
cd build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/build \
      -DARCH=default \
      -DCMAKE_C_FLAGS="-mtune=generic" \
      -DCMAKE_CXX_FLAGS="-mtune=generic" ..
make
cp src/sld[dmpw] /build/bin
strip -s /build/bin/*
cp --parents $(ldd /build/bin/* \
            | tr -s ' ' \
            | cut -d' ' -f3 \
            | sort -u \
            | grep lib) /build/
cd /build
tar -cf /source/build.tar *
