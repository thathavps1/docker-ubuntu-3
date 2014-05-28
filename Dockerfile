FROM ubuntu:14.04
MAINTAINER Frank Macreery <frank@macreery.com>

RUN apt-get update

# Install Git
RUN apt-get install -y git

# Install latest security updates
RUN grep security /etc/apt/sources.list > /tmp/security.sources.list && \
    apt-get -y -o Dir::Etc::SourceList=/tmp/security.sources.list upgrade

# Install Bats
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test
