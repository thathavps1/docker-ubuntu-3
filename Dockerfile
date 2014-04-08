FROM ubuntu:12.04
MAINTAINER Frank Macreery <frank@macreery.com>

RUN apt-get update

# Install Git
RUN apt-get install -y git

# Install Bats
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test
