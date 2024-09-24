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

COPY --from=mparvin/run4ever:latest /usr/local/bin/run4ever /usr/local/bin/run4ever

WORKDIR /scripts

# https://gist.github.com/MParvin/c421714662d06116e419999ed59fe9b1
ADD https://gist.github.com/MParvin/c421714662d06116e419999ed59fe9b1/raw/ea929cbbd26cc8c3be82d32ceb8cb89c2dc68063/check_logstash.sh check_logstash.sh
RUN chmod +x check_logstash.sh

ENTRYPOINT [ "/bin/bash" ]