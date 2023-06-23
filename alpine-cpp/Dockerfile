FROM alpine:3.18

MAINTAINER Magomedcoder <info@magomedcoder.ru>

RUN apk update  \
    && apk upgrade \
    && apk --update add gcc g++ build-base cmake bash libstdc++ cppcheck py-pip  \
    && pip install conan  \
    && rm -rf /var/cache/apk/*

WORKDIR /project

VOLUME project

ENTRYPOINT [ "bash", "-c" ]