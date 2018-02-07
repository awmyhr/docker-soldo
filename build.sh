#!/usr/bin/bash
#===============================================================================
# Project:   docker-soldo
# Author:    Myhr, Andy
# Revised:   2018-02-06
# Created:   2017-12-27
# Copyright: 2017, awmyhr
# License:   Apache-2.0
#===============================================================================
PROJECT='awmyhr/soldo-miner'

#-------------------------------------------------------------------------------
#-- Build binaries
#-------------------------------------------------------------------------------
if [ -r build.tar ]; then
    printf 'Using existing build.tar. Remove it first if you want to rebuild.\n'
else
    tempdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'tempdir')
    docker run --rm -it \
           -v "$(pwd):/source:Z" \
           -v "${tempdir}:/build:Z" \
           -u "$(id -ru):$(id -rg)" \
           awmyhr/builders:ubuntu ./build-binaries.sh
    rm -Rf "${tempdir}"
fi

#-------------------------------------------------------------------------------
#-- Build image
#-------------------------------------------------------------------------------
if [ -r build.tar ]; then
    IMAGE_NAME="${PROJECT}:latest"
    IMAGE="$(docker images -q ${IMAGE_NAME})"
    if [[ "${IMAGE}z" == z ]]; then
        printf 'Building %s...\n' "${IMAGE_NAME}"

        docker build --no-cache=true -t "${IMAGE_NAME}" .
    else
        printf '%s exists. Remove it first if you want to rebuild.\n' "${IMAGE_NAME}"
    fi
else
    printf 'ERROR: build.tar not found. Somthing Bad(TM) happened.\n'
fi
