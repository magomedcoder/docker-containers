FROM alpine:3.18

MAINTAINER Magomedcoder <info@magomedcoder.ru>

RUN set -ex \
    && apk update \
    # Установка пакетов
    && apk add --no-cache ca-certificates curl wget tar xz libressl tzdata pcre php82 php82-bcmath php82-curl \
      php82-ctype php82-dom php82-gd php82-iconv php82-mbstring php82-pdo_pgsql php82-openssl php82-phar php82-redis \
      php82-posix php82-redis php82-sockets php82-sodium php82-sysvshm php82-sysvmsg php82-sysvsem \
      php82-zip php82-zlib php82-xml php82-xmlreader php82-pcntl php82-opcache php82-tokenizer \
    && ln -sf /usr/bin/php82 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php82 \
    && apk update \
    # Расширение swoole libaio linux-заголовки
    && apk add --no-cache libstdc++ openssl git bash \
    && apk add --no-cache --virtual .build-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make php82-dev php82-pear \
    pkgconf re2c pcre-dev pcre2-dev zlib-dev libtool automake libaio-dev openssl-dev curl-dev \
    # Скачать swoole
    && cd /tmp && curl -SL "https://github.com/swoole/swoole-src/archive/v5.0.3.tar.gz" -o swoole.tar.gz \
    && ls -alh \
    # php extension:swoole
    && cd /tmp && mkdir -p swoole \
    && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
    && ln -s /usr/bin/phpize82 /usr/local/bin/phpize \
    && ln -s /usr/bin/php-config82 /usr/local/bin/php-config \
    && ( \
        cd swoole \
            && phpize \
            && ./configure --enable-openssl --enable-http2 --enable-swoole-curl --enable-swoole-json  \
            && make -s -j$(nproc)  \
            && make install \
    ) \
    && echo "memory_limit=1G" > /etc/php82/conf.d/00_default.ini \
    && echo "opcache.enable_cli = 'On'" >> /etc/php82/conf.d/00_opcache.ini \
    && echo "extension=swoole.so" > /etc/php82/conf.d/50_swoole.ini \
    && echo "swoole.use_shortname = 'Off'" >> /etc/php82/conf.d/50_swoole.ini \
    && { \
        echo "upload_max_filesize=100M"; \
        echo "post_max_size=108M"; \
        echo "memory_limit=1024M"; \
        echo "date.timezone=Europe/Moscow"; \
    } | tee /etc/php82/conf.d/99-overrides.ini \
    && ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo "Europe/Moscow" > /etc/timezone \
    # Установка composer
    && wget -nv -O /usr/local/bin/composer https://github.com/composer/composer/releases/download/2.5.8/composer.phar \
    && chmod u+x /usr/local/bin/composer \
    # Информация о php
    && php -v \
    && php -m \
    && php --ri swoole \
    # Очистка мусора
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/bin/php* \
    && echo -e "\033[42;37m Завершена \033[0m\n"

WORKDIR /project

COPY /project /project

#RUN composer install

EXPOSE 9501

ENTRYPOINT ["php", "/project/swoole.php"]