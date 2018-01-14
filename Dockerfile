FROM ubuntu:xenial

RUN apt update && apt install --yes \
        wget \
        python \
        openjdk-8-jre-headless

WORKDIR /opt/interproscan
RUN     wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz && \
        wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz.md5 && \
        md5sum -c interproscan-5.27-66.0-64-bit.tar.gz.md5
