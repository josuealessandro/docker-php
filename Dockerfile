#
FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install software-properties-common vim -y
RUN add-apt-repository ppa:ondrej/php

RUN apt-get install apache2 php8.0 libapache2-mod-php8.0 composer -y

RUN mkdir /app

RUN chown -R www-data /app

WORKDIR /app

ENV DOCUMENT_ROOT /app

RUN apt-get install php-mysql php-pgsql composer -y

COPY entrypoint.sh /var/entrypoint.sh

RUN chmod 777 /var/entrypoint.sh

ENTRYPOINT /var/entrypoint.sh



