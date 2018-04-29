# From template version: 1.0.0 (2017-03-03)
# Author:    awmyhr
# Created:   2017-12-27
# Project:   docker-soldo
# Copyright: 2017, awmyhr
# License:   Apache-2.0
FROM debian:stretch-slim

ENV container=docker

ARG USER=nobody
ARG GROUP=nogroup

COPY build.tar /

RUN cd / \
    && tar --extract --skip-old-files -f build.tar \
    && rm /build.tar \
    && mkdir -p /data /wallet /nonexistent \
    && ln -s /data /.sld \
    && ln -s /data /nonexistent/.sld \
    && chown ${USER}:${GROUP} /data /wallet /nonexistent

USER ${USER}:${GROUP}

VOLUME ["/data", "/wallet"]

WORKDIR /data/

EXPOSE 33711
EXPOSE 33712

ENTRYPOINT ["/bin/sldd"]

CMD ["--help"]

LABEL org.label-schema.name="soldo-miner" \
      org.label-schema.vendor="awmyhr <awmyhr@gmail.com>" \
      org.label-schema.version="3.1.1" \
      org.label-schema.release="2018-02-15" \
      org.label-schema.url="https://hub.docker.com/r/awmyhr/soldo-miner" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/awmyhr/docker-soldo" \
      org.label-schema.summary="For running the Soldo commands." \
      org.label-schema.description="For running the Soldo commands." \
      org.label-schema.schema-version='1.0.0-rc.1'
