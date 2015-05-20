FROM phusion/baseimage:0.9.16
MAINTAINER MATSUI Shinsuke <poppen.jp@gmail.com>

RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        python-pip \
        rtmpdump \
        swftools
RUN add-apt-repository ppa:mc3man/trusty-media && \
    apt-get update && \
    apt-get install -y \
        ffmpeg
RUN pip install radikorec
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
