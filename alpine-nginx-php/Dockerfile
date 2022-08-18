FROM alpine:3.16

MAINTAINER Magomedcoder <info@magomedcoder.ru>

# Установка пакетов
RUN apk --no-cache add php8="8.0.22-r0" php8-ctype php8-curl php8-dom php8-exif php8-fileinfo php8-fpm php8-gd php8-iconv php8-intl php8-mbstring php8-mysqli php8-opcache php8-openssl php8-pecl-imagick php8-pecl-redis php8-phar php8-session php8-simplexml php8-soap php8-xml php8-xmlreader php8-zip php8-zlib php8-pdo php8-xmlwriter php8-tokenizer php8-pdo_mysql php8-pdo_sqlite nginx supervisor curl tzdata htop mysql-client dcron

# Установка composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Настройка nginx,php, fpm-pool, supervisord
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fpm-pool.conf /etc/php8/php-fpm.d/www.conf
COPY config/php.ini /etc/php8/conf.d/custom.ini
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Настройка пользователя и переключение на него
RUN mkdir -p /var/www/project
RUN chown -R nobody.nobody /var/www/project && chown -R nobody.nobody /run && chown -R nobody.nobody /var/lib/nginx && chown -R nobody.nobody /var/log/nginx
USER nobody

# Копирование проекта в контейнер
WORKDIR /var/www/project
COPY --chown=nobody project/ /var/www/project/

EXPOSE 8080

# Разрешить супервизору запускать nginx и php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Проверка работоспособности
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping