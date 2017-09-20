FROM alpine:latest

RUN apk --no-cache add \
        php7 \
        php7-curl \
        php7-intl \
        php7-json \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-xml \
        apache2 \
        php7-apache2 && \
    rm /var/www/localhost/htdocs/*

RUN mkdir /run/apache2
COPY httpd-foreground /usr/local/bin/

EXPOSE 80

CMD ["httpd-foreground"]
