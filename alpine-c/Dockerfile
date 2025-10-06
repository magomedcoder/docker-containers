FROM alpine:3.22

RUN apk add --no-cache \
    build-base \
    cmake \
    make \
    gcc \
    git \
    bash \
    file \
    pkgconfig \
    autoconf \
    automake \
    libtool

RUN apk add --no-cache \
    valgrind \
    gdb \
    strace \
    ltrace \
    cppcheck

WORKDIR /example-project

SHELL ["/bin/bash", "-c"]

CMD ["bash"]