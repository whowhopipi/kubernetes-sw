FROM golang:1.14.1
  
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/lib/go-1.14/bin:$PATH
RUN echo "deb http://172.16.131.1/uos_sw fou/sp1 main contrib non-free" > /etc/apt/sources.list
RUN apt-get update\
        && apt-get install -y rsync jq apt-utils file patch unzip build-essential git iproute2 protobuf-compiler protobuf-c-compiler \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export ETCD_VERSION=3.3.15-0

COPY etcd /usr/local/bin













