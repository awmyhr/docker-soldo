#!/usr/bin/bash
#===============================================================================
# Project:   docker-soldo
# Author:    Myhr, Andy
# Revised:   2017-12-29
# Created:   2017-12-27
# Copyright: 2017, awmyhr
# License:   Apache-2.0
#===============================================================================
PROJECT='awmyhr/soldo-miner'

BUILD_NAME="${PROJECT}:build"
FINAL_NAME="${PROJECT}:latest"

#-------------------------------------------------------------------------------
#-- Build Container
#-------------------------------------------------------------------------------
printf 'Building %s...\n' "${BUILD_NAME}"

docker build -t "${BUILD_NAME}" . -f Dockerfile.build

docker create --name extract "${BUILD_NAME}"
docker cp extract:/build.tar .

#-------------------------------------------------------------------------------
#-- Final Container
#-------------------------------------------------------------------------------
printf 'Building %s...\n' "${FINAL_NAME}"

docker build --no-cache=true -t "${FINAL_NAME}" .

#-------------------------------------------------------------------------------
#-- Clean up
#-------------------------------------------------------------------------------
docker rm -f extract
docker rmi "${BUILD_NAME}"
rm build.tar
