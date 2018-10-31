FROM php:7.1-fpm
# Install modules
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo_mysql
ADD php.ini /usr/local/etc/php/php.ini
CMD ["php-fpm"]