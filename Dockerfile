FROM mediawiki:1.43
RUN pecl install redis && docker-php-ext-enable redis
