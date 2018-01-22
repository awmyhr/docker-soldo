# From template version: 1.0.0 (2017-03-03)
# Author:    awmyhr
# Created:   2017-12-27
# Project:   docker-soldo
# Copyright: 2017, awmyhr
# License:   Apache-2.0
FROM debian:stretch-slim

ENV container=docker

COPY build.tar /

RUN cd / \
    && tar --extract --skip-old-files -f build.tar \
    && rm /build.tar

WORKDIR /root/

VOLUME ["/root/.sld", "/wallet"]

EXPOSE 33711
EXPOSE 33712

ENTRYPOINT ["/bin/sldd"]

CMD ["--help"]

LABEL org.label-schema.name="soldo-miner" \
      org.label-schema.vendor="awmyhr <awmyhr@gmail.com>" \
      org.label-schema.version="2.4.0" \
      org.label-schema.release="2018-01-21" \
      org.label-schema.url="https://hub.docker.com/r/awmyhr/soldo-miner" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/awmyhr/docker-soldo" \
      org.label-schema.summary="For running the Soldo commands." \
      org.label-schema.description="For running the Soldo commands." \
      org.label-schema.schema-version='1.0.0-rc.1'
