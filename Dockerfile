FROM mediawiki:1.43
RUN apt-get update && apt-get install -y --no-install-recommends libmemcached-dev zlib1g-dev wget git \
  && pecl install memcached \
  && docker-php-ext-enable memcached \
  && rm -rf /var/lib/apt/lists/*
RUN pecl install redis && docker-php-ext-enable redis
RUN mkdir /jobrunner && cd /jobrunner && git clone https://github.com/wikimedia/mediawiki-services-jobrunner.git \
  && cd mediawiki-services-jobrunner \
  && composer install --no-dev
