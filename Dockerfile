#
FROM php:8.0-apache

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN mkdir /app

RUN chown -R www-data /app

WORKDIR /app

ENV DOCUMENT_ROOT /app

RUN sed -ri -e 's!/var/www/html!${DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update

RUN apt-get install wget -y

RUN wget -O composer-setup.php https://getcomposer.org/installer

RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN apt-get install zip unzip -y



