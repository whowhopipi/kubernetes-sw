
FROM golang:1.14.1

ENV DEBIAN_FRONTEND=noninteractive

COPY excludes /etc/dpkg/dpkg.cfg.d/excludes

RUN yum update -y \
    && yum upgrade -y
RUN yum install gnupg passwd libsemanage libcap

WORKDIR /usr/local/bin
RUN touch noop && \
    chmod 555 noop && \
    ln -s noop runlevel && \
    ln -s noop invoke-rc.d && \
    ln -s noop update-rc.d
WORKDIR /

RUN yum remove -y && \
    yum clean all -y && \
    mkdir -p /usr/share/man/man1 /usr/share/man/man2 \
        /usr/share/man/man3 /usr/share/man/man4 \
        /usr/share/man/man5 /usr/share/man/man6 \
        /usr/share/man/man7 /usr/share/man/man8












