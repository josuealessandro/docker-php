#
FROM php:8.0-apache

RUN mkdir /app

RUN chown -R www-data /app

WORKDIR /app

ENV DOCUMENT_ROOT /app

RUN sed -ri -e 's!/var/www/html!${DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

