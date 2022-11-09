
FROM minibase:1.0

ENV DEBIAN_FRONTEND=noninteractive

COPY excludes /etc/dpkg/dpkg.cfg.d/excludes

RUN apt-get update \
    && apt-get dist-upgrade -y
RUN apt-mark hold apt gnupg adduser passwd libsemanage1 libcap2

WORKDIR /usr/local/bin
RUN touch noop && \
    chmod 555 noop && \
    ln -s noop runlevel && \
    ln -s noop invoke-rc.d && \
    ln -s noop update-rc.d
WORKDIR /

RUN apt-get autoremove -y && \
    apt-get clean -y && \
    tar -czf /usr/share/copyrights.tar.gz /usr/share/common-licenses /usr/share/doc/*/copyright && \
    mkdir -p /usr/share/man/man1 /usr/share/man/man2 \
        /usr/share/man/man3 /usr/share/man/man4 \
        /usr/share/man/man5 /usr/share/man/man6 \
        /usr/share/man/man7 /usr/share/man/man8












