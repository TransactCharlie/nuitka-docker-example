FROM ubuntu
MAINTAINER Charlie Gildawie <charlie@skyscanner.net>

# System Files
RUN apt-get update
RUN apt-get install -y python python3-dev python3-pip build-essential
RUN pip3 install nuitka

COPY build_scripts /build_scripts
