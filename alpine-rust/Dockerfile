FROM alpine:3.22 AS builder

RUN apk add --no-cache \
    rust \
    cargo \
    musl-dev \
    gcc \
    pkgconfig \
    openssl-dev \
    libc-dev \
    make \
    cmake

WORKDIR /example-project

COPY Cargo.toml Cargo.lock ./
COPY src ./src

RUN cargo build --release

FROM alpine:3.22

RUN apk add --no-cache libgcc ca-certificates

RUN addgroup -S app && adduser -S app -G app

WORKDIR /example-project

COPY --from=builder /example-project/target/release/example-project /example-project/

USER app

CMD ["./example-project"]