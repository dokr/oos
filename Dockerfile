FROM alpine:edge AS dl

ARG DL_URL=https://storage.googleapis.com/kubernetes-release/release/v1.9.6/bin/linux/amd64/{kubeadm,kubelet,kubectl}

RUN apk add --update wget
WORKDIR /opt/dl
RUN wget ${DL_URL}

FROM scratch

ARG APP=kubebins
ARG VERSION=1.9.6
ARG DIR=/dl/

LABEL APP=${APP}
LABEL VERSION=${VERSION}
LABEL DIR=${DIR}

COPY --from=dl /opt/dl/ ${DIR}
