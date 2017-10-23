FROM alpine:latest

RUN apk --no-cache add \
      wget \
      curl \
      git \
      php7 \
      php7-curl \
      php7-intl \
      php7-json \
      php7-mbstring \
      php7-openssl \
      php7-pdo_mysql \
      php7-pdo_pgsql \
      php7-pdo_sqlite \
      php7-phar \
      php7-xml \
      php7-zlib \
      apache2 \
      php7-apache2 && \
    rm /var/www/localhost/htdocs/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN mkdir /run/apache2 && ln -s /dev/stdout /var/log/apache2/access.log && ln -s /dev/stderr /var/log/apache2/error.log 
COPY httpd-foreground /usr/local/bin/

EXPOSE 80

CMD ["httpd-foreground"]
