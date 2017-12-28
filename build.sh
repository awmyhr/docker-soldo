#!/usr/bin/bash
#===============================================================================
# Project:   docker-soldo
# Author:    Myhr, Andy
# Revised:   2017-12-27
# Created:   2017-12-27
# Copyright: 2017, awmyhr
# License:   Apache-2.0
#===============================================================================
PROJECT='docker-soldo'
USER='awmyhr'

BUILD_NAME="${USER}/${PROJECT}:build"
FINAL_NAME="${USER}/${PROJECT}:latest"

#-------------------------------------------------------------------------------
#-- Build Container
#-------------------------------------------------------------------------------
printf 'Building %s...\n' "${BUILD_NAME}"

docker build -t "${BUILD_NAME}" . -f Dockerfile.build

docker create --name extract "${BUILD_NAME}"
docker cp extract:/root/sld/build/release/src/sldd .
docker cp extract:/root/sld/build/release/src/sldm .
docker cp extract:/root/sld/build/release/src/sldp .
docker cp extract:/root/sld/build/release/src/sldw .

#-------------------------------------------------------------------------------
#-- Final Container
#-------------------------------------------------------------------------------
printf 'Building %s...\n' "${FINAL_NAME}"

docker build --no-cache -t "${FINAL_NAME}" .

#-------------------------------------------------------------------------------
#-- Clean up
#-------------------------------------------------------------------------------
docker rm -f extract
docker rmi "${BUILD_NAME}"
rm ./sld[dmpw]
