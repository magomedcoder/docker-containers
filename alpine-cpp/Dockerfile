FROM alpine:3.22

RUN apk update  \
    && apk upgrade \
    && apk --update add gcc g++ build-base cmake bash libstdc++ cppcheck py-pip  \
    && pip install conan  \
    && rm -rf /var/cache/apk/*

WORKDIR /example-project

VOLUME example-project

ENTRYPOINT [ "bash", "-c" ]