#!/usr/bin/bash
#===============================================================================
# Project:   docker-soldo
# Author:    Myhr, Andy
# Revised:   2017-12-30
# Created:   2017-12-27
# Copyright: 2017, awmyhr
# License:   Apache-2.0
#===============================================================================
PROJECT='awmyhr/soldo-miner'

#-------------------------------------------------------------------------------
#-- Builder Container
#-------------------------------------------------------------------------------
if [ "${*#*--nobuilder}" != "${*}" ]; then
    printf 'Skipping builder.\n'
else
    BUILDER_NAME="${PROJECT}:build"
    printf 'Building %s...\n' "${BUILDER_NAME}"

    docker build -t "${BUILDER_NAME}" . -f Dockerfile.build

    docker create --name extract "${BUILDER_NAME}"
    docker cp extract:/build.tar .
    docker rm -f extract

    if [ "${*#*--nobcup}" != "${*}" ]; then
        printf 'Skipping builder cleanup.\n'
    else
        printf 'Doing builder cleanup.\n'
        docker rmi "${BUILDER_NAME}"
    fi
fi

#-------------------------------------------------------------------------------
#-- Runner Container
#-------------------------------------------------------------------------------
if [ "${*#*--norunner}" != "${*}" ]; then
    printf 'Skipping runner.\n'
else
    if [ -r build.tar ]; then
        RUNNER_NAME="${PROJECT}:latest"
        printf 'Building %s...\n' "${RUNNER_NAME}"

        docker build --no-cache=true -t "${RUNNER_NAME}" .
        if [ "${*#*--norcup}" != "${*}" ]; then
            printf 'Skipping runner cleanup.\n'
        else
            printf 'Doing runner cleanup.\n'
            rm build.tar
        fi
    else
        printf 'ERROR: build.tar not found. Run builder.\n'
    fi
fi
