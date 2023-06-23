FROM alpine:3.18

MAINTAINER Magomedcoder <info@magomedcoder.ru>

# Установка пакетов
RUN set -ex \
    && apk update \
    && apk add --no-cache php82 php82-ctype php82-curl php82-dom php82-exif php82-fileinfo php82-fpm php82-gd  \
    php82-iconv php82-intl php82-mbstring php82-mysqli php82-opcache php82-openssl php82-pecl-imagick php82-pecl-redis  \
    php82-phar php82-session php82-simplexml php82-soap php82-xml php82-xmlreader php82-zip php82-zlib php82-pdo php82-xmlwriter  \
    php82-tokenizer php82-pdo_mysql php82-pdo_sqlite nginx supervisor curl tzdata htop mysql-client dcron

# Установка composer
RUN wget -nv -O /usr/local/bin/composer https://github.com/composer/composer/releases/download/2.5.8/composer.phar \
    && chmod u+x /usr/local/bin/composer

# Настройка nginx,php, fpm-pool, supervisord
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fpm-pool.conf /etc/php8/php-fpm.d/www.conf
COPY config/php.ini /etc/php8/conf.d/custom.ini
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Копирование проекта в контейнер
WORKDIR /var/www/project
COPY project/ /var/www/project/

EXPOSE 8080

# Разрешить супервизору запускать nginx и php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Проверка работоспособности
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping