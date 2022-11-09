FROM k8s.gcr.io/debian-base-sw64:v1.0.0
COPY swkylinos.repo /etc/yum.repos.d/swkylinos.repo 
RUN yum update -y && yum install -y  conntrack ebtables ipset iptables kmod iperf3



















