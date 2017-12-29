# From template version: 1.0.0 (2017-03-03)
# Author:    awmyhr
# Created:   2017-12-27
# Project:   docker-soldo
# Copyright: 2017, awmyhr
# License:   Apache-2.0
FROM ubuntu:latest

ENV container=docker \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update -qy \
    && apt-get upgrade -qy

RUN apt-get install -qy \
        libboost-filesystem?.??.? \
        libboost-program-options?.??.? \
        libboost-system?.??.? \
    && apt-get clean

WORKDIR /root/

COPY build.tar /root/

RUN cd /root \
    && tar -xf /root/build.tar \
    && rm /root/build.tar

ENV THREADS 1
ENV ADDRESS ''

ENTRYPOINT /root/sldd --mining-threads $THREADS --start-mining $ADDRESS

LABEL org.label-schema.name="soldo-miner" \
      org.label-schema.vendor="awmyhr <awmyhr@gmail.com>" \
      org.label-schema.version="1.1.0-alpha" \
      org.label-schema.release="2017-12-28" \
      org.label-schema.url="TODO: CHANGEME" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="TODO: CHANGEME" \
      org.label-schema.summary="For running the Soldo commands." \
      org.label-schema.description="For running the Soldo commands." \
      org.label-schema.schema-version='1.0.0-rc.1'
