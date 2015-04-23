FROM ubuntu:latest
MAINTAINER = G. ESNAUD <gesnaud@avencall.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y autoconf 
RUN apt-get install -y python-argparse
RUN apt-get install -y python-jinja2
RUN apt-get install -y git 
RUN apt-get install -y pkg-config


#Dl, Install & Compil SIPP
#First SIPp building's dependencies
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpcap-dev
RUN apt-get install -y libsctp-dev
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y libgsl0-dev 
RUN git clone https://github.com/SIPp/sipp.git

WORKDIR /sipp
RUN ./build.sh --with-pcap --with-sctp --with-openssl --with-rtpstream --with-gsl
WORKDIR /
RUN rm -rf sipp


#Dl, Install xivo-load-tester 

RUN git clone git://git.xivo.fr/official/xivo-load-tester.git

CMD ["/bin/bash", "-l"]
