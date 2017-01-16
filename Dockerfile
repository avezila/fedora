FROM fedora

MAINTAINER pioh "thepioh@zoho.com"

RUN dnf install --setopt=tsflags=nodocs -y wget tar perl perl-core gcc \
 && dnf update --setopt=tsflags=nodocs -y \
 && dnf clean all

RUN cd ~ \
 && wget https://www.openssl.org/source/openssl-1.1.0c.tar.gz \
 && tar xf openssl-1.1.0c.tar.gz \
 && cd openssl* \
 && mkdir -p /opt \
 && ./config --prefix=/opt/openssl --openssldir=/usr/ssl \
 && make \
 && make install \
 && rm -rf /opt/openssl/share \
 && cp -r /opt/openssl/* /usr/ \
 && ldconfig \
 && openssl version \
 && cd ~ \
 && rm -rf openssl* /opt/openssl



CMD ["/bin/bash"]
