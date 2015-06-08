FROM phusion/baseimage:0.9.16
MAINTAINER MATSUI Shinsuke <poppen.jp@gmail.com>

RUN apt-get update && \
    apt-get install -y \
        software-properties-common
RUN add-apt-repository ppa:mc3man/trusty-media && \
    apt-get update && \
    apt-get install -y \
        ffmpeg \
        swftools \
        python-pip \
        build-essential \
        gcc \
        make \
        git \
        libssl-dev \
        unzip

RUN mkdir /tmp/work

WORKDIR /tmp/work
RUN git clone git://git.ffmpeg.org/rtmpdump
RUN curl -L https://github.com/K-S-V/Scripts/releases/download/v2.4/rtmpdump-2.4.zip > /tmp/work/rtmpdump-2.4.zip && \
    unzip -x rtmpdump-2.4.zip

WORKDIR /tmp/work/rtmpdump
RUN patch -p0 < ../Patch.diff && \
    make SYS=posix && \
    make install
RUN ldconfig

WORKDIR /

RUN pip install radikorec
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tmp/work

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
