ARG osversion=bionic
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
        python3 \
	perl \
	gcc \
	libidn11 \
        openjdk-8-jre-headless

ADD	check_md5sum_in_pipe.pl /tmp/check_md5sum_in_pipe.pl
RUN     chmod +x /tmp/check_md5sum_in_pipe.pl

WORKDIR /opt
ENV     INTERPROSCAN_VERSION=5.36-75.0
RUN	wget -q --show-progress ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${INTERPROSCAN_VERSION}/interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz.md5 && \
	wget -q --show-progress -O - ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${INTERPROSCAN_VERSION}/interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz | \
	/tmp/check_md5sum_in_pipe.pl interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz.md5 | \
        tar xzf - && \
        rm interproscan-${INTERPROSCAN_VERSION}-64-bit.tar.gz.md5 && \
        ln -s interproscan-${INTERPROSCAN_VERSION} interproscan

WORKDIR /opt/interproscan/data
ENV     PANTHER_VERSION=14.1
RUN     wget -q --show-progress ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHER_VERSION}.tar.gz.md5 && \
	wget -q --show-progress -O - ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHER_VERSION}.tar.gz | \
	/tmp/check_md5sum_in_pipe.pl panther-data-${PANTHER_VERSION}.tar.gz.md5 | \
	tar xzf - && \
	rm panther-data-${PANTHER_VERSION}.tar.gz.md5

VOLUME  /data
WORKDIR /data
