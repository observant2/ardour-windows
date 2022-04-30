FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y -qq update && apt-get -y \
 			--no-install-recommends install \
            apt-transport-https \
            curl \
            wget \
            sudo \
            git
RUN apt-get -y -qq update && apt-get -y \
 			--no-install-recommends install \
            ca-certificates \
            unzip \
            rsync \
            ed \
            yasm \
            cmake \
            nsis \
            subversion \
            ocaml-nox \
            gperf \
            meson \
            python \
            python3 \
            python3-pip \
            build-essential \
            ccache \
            autoconf \
            automake \
            libtool \
            pkg-config \
            gettext

RUN export XARCH=x86_64
RUN export SRCDIR=/home/ardour/tmp/winsrc
RUN export TMPDIR=/home/ardour/tmp
RUN export ROOT=/home/ardour

RUN apt-get -y -qq update && apt-get -y \
 			--no-install-recommends install \
			mingw-w64

RUN mkdir /home/ardour/
RUN cd /home/ardour/
WORKDIR /home/ardour/

RUN mkdir -p tmp src tmp/winsrc

# RUN bash /home/ardour/scripts/ardour-build-tools/x-mingw.sh
