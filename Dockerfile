FROM php:7.4-cli

RUN apt-get update; \
    apt-get install -y --fix-missing \
        apt-utils \
        gnupg \
        unzip \
        git \
        curl \
        openssl \
        wget \
    ;

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list; \
    echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list; \
    curl -sS --insecure https://www.dotdeb.org/dotdeb.gpg | apt-key add -;

RUN apt-get update; \
    apt-get install -y \
        zlib1g-dev \
        libzip-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libjpeg-dev \
        libxml2-dev \
        libsodium-dev \
        libxslt-dev \
        libonig-dev \
    ;

RUN docker-php-ext-install \
        zip \
        pdo_mysql \
        gd \
        exif \
        intl \
        bcmath \
        json \
        mbstring \
        dom \
        xml \
        sodium \
        xsl \
    ;

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

ARG SYMFONY_CLI_VERSION=4.21.3
RUN wget https://get.symfony.com/cli/installer -O - | bash;

RUN mv ${HOME}/.symfony/bin/symfony /usr/local/bin/symfony;

WORKDIR /usr/src/myapp

CMD [ "php" ]
