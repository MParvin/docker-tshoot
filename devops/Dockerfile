FROM alpine:latest

RUN apk add --update \
        bash \
        python3 \
        vim \
        redis \
        curl wget openssl \
        busybox-extras  \
        bind-tools  \
        tcpdump net-tools iperf iproute2 iputils \
        nmap nmap-scripts \
        mlocate \
        htop \
	tcpdump \
        && rm -rf /var/cache/apk/*

ENV ETCD_VER=v3.5.10

ENV GOOGLE_URL=https://storage.googleapis.com/etcd
ENV GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
ENV DOWNLOAD_URL=${GOOGLE_URL}

RUN rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
RUN rm -rf /tmp/etcd-download-files && mkdir -p /tmp/etcd-download-files

RUN curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
RUN tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-files --strip-components=1
RUN rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

RUN mv /tmp/etcd-download-files/etcdctl /usr/local/bin/etcdctl
RUN chmod +x /usr/local/bin/etcdctl

WORKDIR /tshoot

ENTRYPOINT [ "/bin/bash" ]