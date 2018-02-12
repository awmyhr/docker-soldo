#!/bin/bash
#===============================================================================
# Project:   docker-soldo
# Author:    Myhr, Andy
# Revised:   2018-02-12
# Created:   2018-02-06
# Copyright: 2017, awmyhr
# License:   Apache-2.0
#===============================================================================
#-- If we have source, clean and update it, else pull it.
if [ -d source ]; then
    cd source || exit 1
    make clean
    git pull
else
    git clone https://github.com/monselice/sld.git source
    cd source || exit 1
fi

mkdir -p build /build/bin
cd build || exit 1
#-- Passing '-DSTATIC=ON' successfully static linked the Boost libs, but not
#   glibc. It looks like CMAKE_EXE_LINKER_FLAGS is not getting set as it should.
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/build \
      -DARCH=default \
      -DCMAKE_C_FLAGS="-mtune=generic" \
      -DCMAKE_CXX_FLAGS="-mtune=generic" \
      ..
make
#-- 'Release' is still leaving debug info in the binaries.
cp src/sld[dmpw] /build/bin
strip -s /build/bin/*
cp --parents $(ldd /build/bin/* \
            | tr -s ' ' \
            | cut -d' ' -f3 \
            | sort -u \
            | grep lib) /build/
cd /build || exit 1
tar -cf /source/build.tar ./*
