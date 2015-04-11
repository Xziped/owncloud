FROM php:5.6-apache
MAINTAINER xziped <xzip@mail.ownsync.at>

ENV WWW_ROOT /var/www/html
ENV OC_VERS owncloud-8.0.2
ENV BIN_ROOT /var/www/bin
ENV APACHE_BIN /usr/sbin/apache2
ENV PATH $PATH:$BIN_ROOT:/usr/sbin:/usr/bin:/sbin:/bin

COPY config/php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y \
	zlib1g-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
	libmysqlclient-dev \
	libmysqld-dev \
	exif \
	libexif-dev \
	libexif12 \
	libbz2-dev \
	libcurl4-gnutls-dev \
	libghc-utf8-string-dev \
	file \
	libldap2-dev \
	libldap-2.4-2 \
	wget \
	unzip \
	&& apt-get autoclean && apt-get clean \
	&& docker-php-ext-install iconv mcrypt exif zip mysql mysqli pdo pdo_mysql mbstring bcmath bz2 calendar ctype curl fileinfo hash \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
	&& docker-php-ext-install ldap \
	&& rm -rf /usr/src/php

WORKDIR $WWW_ROOT

COPY ./run $BIN_ROOT/run

EXPOSE 80 443

CMD ["start"]
ENTRYPOINT ["run"]
