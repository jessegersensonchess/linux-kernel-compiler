FROM ubuntu:22.04 as builder

ENV DEBIAN_FRONTEND=noninteractive \
    TZ='Europe/Berlin'

RUN set -e \
  && apt-get update \
  && apt-get install --no-install-recommends -y \
  bc \
	bison \
	btrfs-progs \
  flex \
	gcc \
  libbison-dev  \
  libelf-dev \
  libssl-dev \
  locales \
	make \
  tar \
	wget \
	xz-utils 

RUN apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* 2>/dev/null

#### todo: could script this idea
# wget -q --no-check-certificate $(wget -q --no-check-certificate -O - https://www.kernel.org/ | grep tar.x | head -1 | cut -f2 -d '"');
# FILE=$(ls -f linux-*);
# FILE_WITHOUT_EXT=$(ls -f linux-* | sed 's/.tar.xz//g')
# tar xf "$FILE";
# cd "$FILE_WITHOUT_EXT"
# make defconfig;
# make -j5
