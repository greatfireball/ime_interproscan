FROM ubuntu:xenial

RUN apt update && apt install --yes \
        wget \
        python \
        openjdk-8-jre-headless

WORKDIR /opt
RUN     wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz && \
        wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz.md5 && \
        md5sum -c interproscan-5.27-66.0-64-bit.tar.gz.md5 && \
        tar xzf interproscan-5.27-66.0-64-bit.tar.gz && \
        rm interproscan-5.27-66.0-64-bit.tar.gz.md5 interproscan-5.27-66.0-64-bit.tar.gz && \
        ln -s interproscan-5.27-66.0 interproscan

#WORKDIR /opt/interproscan/data
#RUN     wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-12.0.tar.gz && \
#        wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-12.0.tar.gz.md5 && \
#        md5sum -c panther-data-12.0.tar.gz.md5 && \
#        tar xzf panther-data-12.0.tar.gz && \
#        rm panther-data-12.0.tar.gz.md5 panther-data-12.0.tar.gz

VOLUME  /data
WORKDIR /data
