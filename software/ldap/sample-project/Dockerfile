FROM php:8.1-apache

RUN apt-get update && apt-get install -y --no-install-recommends libldap2-dev ldap-utils \
 && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu && docker-php-ext-install ldap

RUN a2enmod rewrite

COPY src /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
