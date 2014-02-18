FROM ubuntu:12.10
MAINTAINER Frank Macreery <frank@macreery.com>

RUN apt-get update

# Install Bats
RUN apt-get install -y git
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats
RUN cd /tmp/bats && ./install.sh /usr/local

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test

CMD ["/bin/bash"]
