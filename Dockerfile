# Docker environment for building and running xv6.
# Course context: Operating Systems 20594 — Maman 03.
# The amd64 platform is used for compatibility with xv6 and gcc-multilib.

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends --reinstall \
       ca-certificates \
       git \
       gcc-multilib \
       make \
       qemu-system \
    && git clone https://github.com/mit-pdos/xv6-public.git /xv6 \
    && chmod +x /xv6/*.pl \
    && apt-get purge -qq git \
    && apt-get autoremove --purge -qq \
    && apt-get clean -qq \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /usr/share/man/* /usr/share/doc/*

WORKDIR /xv6

CMD ["/bin/bash"]
