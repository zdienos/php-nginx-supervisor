ARG PHP_VERSION=8.4
FROM php:${PHP_VERSION}-fpm-alpine

RUN apk upgrade --no-cache \
    && apk add --no-cache \
    nginx \
    supervisor \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    libxpm-dev \
    icu-dev \
    oniguruma-dev \
    libxml2-dev \
    $PHPIZE_DEPS \
    && docker-php-ext-configure gd \
       --with-freetype \
       --with-jpeg \
       --with-webp \
       --with-xpm \
    && docker-php-ext-install \
       pdo_mysql \
       zip \
       bcmath \
       gd \
       intl \
       pcntl \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del $PHPIZE_DEPS

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
