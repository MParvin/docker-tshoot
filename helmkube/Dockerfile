FROM alpine:latest

ENV OS_ARCH="${TARGETARCH:-amd64}"

RUN apk add --update \
        bash \
        vim \
        curl wget openssl \
        busybox-extras \
        && rm -rf /var/cache/apk/*

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${OS_ARCH}/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod +x 700 get_helm.sh
RUN ./get_helm.sh

WORKDIR /deployments

ENTRYPOINT [ "/bin/bash" ]