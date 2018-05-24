FROM alpine:edge AS dl

ARG DL_URL=https://storage.googleapis.com/kubernetes-release/release/v1.9.6/bin/linux/amd64/{kubeadm,kubelet,kubectl}

RUN apk add --update wget
WORKDIR /opt/dl
RUN wget ${DL_URL}

FROM scratch

COPY --from=dl /opt/dl/ /data/bin/
COPY etc/ /data/etc/
COPY opt/ /data/opt/
