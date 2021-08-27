FROM php:7.1-fpm
# Install modules
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo_mysql
RUN apt-get update -y && apt-get install -y sendmail libpng-dev
RUN apt-get update && \
apt-get install -y \
zlib1g-dev
RUN docker-php-ext-configure gd --with-webp-dir=/usr/include/webp --with-jpeg-dir=/usr/include --with-png-dir=/usr/include --with-freetype-dir=/usr/include/freetype2
RUN docker-php-ext-install gd
ADD php.ini /usr/local/etc/php/php.ini
CMD ["php-fpm"]
