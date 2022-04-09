FROM alpine:3.15

MAINTAINER Magomedcoder <info@magomedcoder.ru>

RUN set -ex \
    && apk update \
    # Установка пакетов
    && apk add --no-cache ca-certificates curl wget tar xz libressl tzdata pcre php8 php8-bcmath php8-curl php8-ctype php8-dom php8-gd php8-iconv php8-mbstring php8-mysqlnd php8-openssl php8-pdo php8-pdo_mysql php8-pdo_sqlite php8-phar php8-posix php8-redis php8-sockets php8-sodium php8-sysvshm php8-sysvmsg php8-sysvsem php8-zip php8-zlib php8-xml php8-xmlreader php8-pcntl php8-opcache \
    && ln -sf /usr/bin/php8 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php8 \
    && apk update \
    # Расширение swoole libaio linux-заголовки
    && apk add --no-cache libstdc++ openssl git bash \
    && apk add --no-cache --virtual .build-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make php8-dev php8-pear pkgconf re2c pcre-dev pcre2-dev zlib-dev libtool automake libaio-dev openssl-dev curl-dev \
    # Скачать swoole
    && cd /tmp && curl -SL "https://github.com/swoole/swoole-src/archive/v4.8.8.tar.gz" -o swoole.tar.gz \
    && ls -alh \
    # php extension:swoole
    && cd /tmp && mkdir -p swoole \
    && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
    && ln -s /usr/bin/phpize8 /usr/local/bin/phpize \
    && ln -s /usr/bin/php-config8 /usr/local/bin/php-config \
    && ( \
        cd swoole && phpize && ./configure --enable-openssl --enable-http2 --enable-swoole-curl --enable-swoole-json && make -s -j$(nproc) && make install \
    ) \
    && echo "memory_limit=1G" > /etc/php8/conf.d/00_default.ini \
    && echo "opcache.enable_cli = 'On'" >> /etc/php8/conf.d/00_opcache.ini \
    && echo "extension=swoole.so" > /etc/php8/conf.d/50_swoole.ini \
    && echo "swoole.use_shortname = 'Off'" >> /etc/php8/conf.d/50_swoole.ini \
    # Устанавливать composer
    && wget -nv -O /usr/local/bin/composer https://github.com/composer/composer/releases/download/2.3.4/composer.phar \
    && chmod u+x /usr/local/bin/composer \
    # Информация о php
    && php -v \
    && php -m \
    && php --ri swoole \
    && composer \
    # Очистка мусора
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/bin/php* \
    && echo -e "\033[42;37m Завершена \033[0m\n"