FROM k8s.gcr.io/debian-base-sw64:v1.0.0
RUN ln -s /hyperkube /apiserver \
 && ln -s /hyperkube /cloud-controller-manager \
 && ln -s /hyperkube /controller-manager \
 && ln -s /hyperkube /kubectl \
 && ln -s /hyperkube /kubelet \
 && ln -s /hyperkube /proxy \
 && ln -s /hyperkube /scheduler \
 && ln -s /hyperkube /usr/local/bin/cloud-controller-manager \
 && ln -s /hyperkube /usr/local/bin/kube-apiserver \
 && ln -s /hyperkube /usr/local/bin/kube-controller-manager \
 && ln -s /hyperkube /usr/local/bin/kube-proxy \
 && ln -s /hyperkube /usr/local/bin/kube-scheduler \
 && ln -s /hyperkube /usr/local/bin/kubectl \
 && ln -s /hyperkube /usr/local/bin/kubelet
RUN echo "http://172.16.131.1/kylin_server_v10" > /etc/yum.repos.d/swkylinos.repo 
RUN yum install -y expat.sw_64 expat-devel.sw_64
RUN echo CACHEBUST>/dev/null && yum install -y\
    bash
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
RUN echo CACHEBUST>/dev/null && yum update && yum install  -y \
    ca-certificates \
    ceph-common \
    cifs-utils \
    conntrack \
    e2fsprogs \
    xfsprogs \
    ebtables \
    ethtool \
    git \
    glusterfs-client \
    iptables \
    ipset \
    jq \
    kmod \
    openssh-client \
    netbase \
    nfs-common \
    socat \
    udev \
    util-linux
COPY cni-bin/bin /opt/cni/bin


