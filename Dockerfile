FROM golang:alpine
MAINTAINER Sylvain Laurent <s@6120.eu>

EXPOSE 8333 8334 18333 18334
WORKDIR /btcd

RUN mkdir -p /btcd /data && \
    apk --update add git && \
    go get github.com/btcsuite/btcd/... && \
    apk del git && \
    rm -rf /var/cache/apk/*

RUN echo -e "[Application Options]\ndatadir=/data" > /btcd/btcd.conf
COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
