FROM debian:stretch

LABEL maintainer="Nadezhda Ryabtsova <nadezhdaryabtsova@gmail.com>"
LABEL description="Provides an image with Janus Gateway"

RUN apt-get update

RUN apt-get install -y \
	git \
	build-essential \
	autoconf \
	automake \
	autotools-dev \
	dh-make \
	debhelper \
	devscripts \
	fakeroot \
	xutils \
	lintian \
	pbuilder

RUN apt-get install -y \
	libmicrohttpd-dev \
	libjansson-dev \
	libnice-dev \
	libssl-dev \
	libsrtp2-dev \
	libsofia-sip-ua-dev \
	libglib2.0-dev \
	libopus-dev \
	libogg-dev \
	pkg-config \
	gengetopt \
	libtool \
	automake \
	cmake \
	libwebsockets-dev \
	libavutil-dev \
	libavcodec-dev \
	libavformat-dev \
	liblua5.3-dev

RUN echo deb http://deb.debian.org/debian testing main >> /etc/apt/sources.list && \
	apt-get update && \
	apt-cache policy libmicrohttpd-dev libnice-dev libssl-dev libopus-dev

RUN apt-get install -y \
	libmicrohttpd-dev=0.9.59-1 \
	libjansson-dev=2.11-1 \
	libcurl4-openssl-dev=7.61.0-1 \
	libglib2.0-dev=2.56.1-2 \
	libsrtp2-dev=2.2.0-1 \
	libssl-dev=1.1.0h-4 \
	libopus-dev=1.3~beta+20180518-1

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/janus /var/janus/janus/log /var/janus/janus/data && \
	cd /usr/src/janus && \
	wget -c https://github.com/meetecho/janus-gateway/archive/v0.4.3.tar.gz && \
	tar -xzf v0.4.3.tar.gz && \
	cd janus-gateway-0.4.3 && \
	sh autogen.sh && \
	./configure --prefix=/var/janus/janus --enable-post-processing --disable-rabbitmq --disable-data-channels && \
	make && make install && make configs && \
	rm -rf /usr/src/janus

EXPOSE 8088/tcp 8188/tcp
EXPOSE 8188/udp 20000-40000/udp

CMD /var/janus/janus/bin/janus --nat-1-1=${DOCKER_IP}
