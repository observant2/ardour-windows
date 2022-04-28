FROM debian:buster AS tools

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

RUN mkdir -p {tmp,src,tmp/winsrc}
RUN git clone --depth 1 --branch 6.9 https://github.com/Ardour/ardour.git ./src

COPY ./scripts ./scripts

RUN bash /home/ardour/scripts/ardour-build-tools/x-mingw.sh

#----------------------------

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

ENV SPRRRRT=1
RUN mkdir /home/ardour/
RUN cd /home/ardour/
WORKDIR /home/ardour/

COPY ./scripts ./scripts
COPY --from=tools /home/ardour/win-build-w64 /home/ardour/win-build-w64
COPY --from=tools /home/ardour/win-stack-w64 /home/ardour/win-stack-w64
COPY ./ardour/ /home/ardour/src/

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
