FROM alpine:3.18

MAINTAINER Magomedcoder <info@magomedcoder.ru>

ARG GOLANG_VERSION=1.20

RUN apk update \
    && apk add go gcc bash musl-dev openssl-dev ca-certificates \
    && update-ca-certificates \
    && wget https://dl.google.com/go/go$GOLANG_VERSION.src.tar.gz \
    && tar -C /usr/local -xzf go$GOLANG_VERSION.src.tar.gz \
    && cd /usr/local/go/src && ./make.bash \
    && ENV PATH=$PATH:/usr/local/go/bin \
    && rm go$GOLANG_VERSION.src.tar.gz \
    && apk del go \
    && go version
