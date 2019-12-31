FROM centos:7

ADD . /build-perl/
#ADD patches /build-perl/patches
#COPY entrypoint.sh /entrypoint.sh

WORKDIR /build-perl

#RUN yum install -y git
RUN yum install -y \
	expat \
	expat-devel \
	gcc \
	git \
	less \
	libidn \
	libidn-devel \
	make \
	openssl \
	openssl-devel \
	patch \
	which

VOLUME [ "/build-perl" ]

RUN /build-perl/build-perl.sh
#CMD ["/build-perl/build-perl.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/build-perl/entrypoint.sh"]
