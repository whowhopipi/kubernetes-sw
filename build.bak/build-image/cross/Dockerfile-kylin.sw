FROM golang:1.14.1
  
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/lib/go-sw64-1.14.1/bin:$PATH
COPY swkylinos.repo /etc/yum.repos.d/swkylinos.repo
RUN yum update -y\
        && yum install -y gcc rsync jq yum file patch unzip make git iproute protobuf protobuf-compiler \
        && yum clean all && rm -rf /var/lib/apt/lists/*

RUN export ETCD_VERSION=3.3.15-0

COPY etcd /usr/local/bin













