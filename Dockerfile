FROM debian:bullseye

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

RUN mkdir /home/ardour/
RUN cd /home/ardour/
WORKDIR /home/ardour/

ENV XARCH=x86_64
ENV SRCDIR=/home/ardour/tmp/winsrc
ENV TMPDIR=/home/ardour/tmp
ENV ROOT=/home/ardour
ENV ENABLE_OPT="ON"

RUN echo $XARCH
RUN echo "-----"

RUN apt-get -y -qq update && apt-get -y \
 			--no-install-recommends install \
			gcc-mingw-w64-x86-64-posix

# RUN bash /home/ardour/scripts/x-win/compile.sh
