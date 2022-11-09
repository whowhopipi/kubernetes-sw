FROM k8s.gcr.io/debian-base-sw64:v1.0.0

RUN echo "deb  http://172.16.131.1/uos_sw fou/sp1 main contrib non-free" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y  conntrack ebtables ipset iptables kmod netbase



















