ARG osversion=xenial
FROM ubuntu:${osversion}

ARG VERSION=master
ARG VCS_REF
ARG BUILD_DATE

RUN echo "VCS_REF: "${VCS_REF}", BUILD_DATE: "${BUILD_DATE}", VERSION: "${VERSION}

LABEL maintainer="frank.foerster@ime.fraunhofer.de" \
      description="Dockerfile providing the interproscan pipeline" \
      version=${VERSION} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/greatfireball/ime_interproscan.git"

RUN apt update && apt install --yes \
        wget \
        python \
        openjdk-8-jre-headless

WORKDIR /opt
ENV     INTERPROSCAN_VERSION=5.32-71.0
RUN     wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${INTERPROSCAN_VERSION}/interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz && \
        wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${INTERPROSCAN_VERSION}/interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz.md5 && \
        md5sum -c interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz.md5 && \
        tar xzf interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz && \
        rm interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz.md5 interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz && \
        ln -s interproscan-${INTERPROSCAN_VERSION} interproscan

WORKDIR /opt/interproscan/data
RUN     wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-12.0.tar.gz && \
        wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-12.0.tar.gz.md5 && \
        md5sum -c panther-data-12.0.tar.gz.md5 && \
        tar xzf panther-data-12.0.tar.gz && \
        rm panther-data-12.0.tar.gz.md5 panther-data-12.0.tar.gz

VOLUME  /data
WORKDIR /data
