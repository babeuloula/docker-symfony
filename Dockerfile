FROM php:8.1-cli-bookworm

RUN \
    echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list; \
    apt update; \
    apt install -y \
        zlib1g-dev \
        libzip-dev \
        libmcrypt-dev \
        libxml2-dev \
        libsodium-dev \
        libxslt-dev \
        libonig-dev \
        symfony-cli \
    ; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    truncate -s 0 /var/log/*log;


RUN docker-php-ext-install \
        zip \
        pdo_mysql \
        intl \
        bcmath \
        mbstring \
        dom \
        xml \
        sodium \
        xsl \
    ;

RUN \
    mkdir -p /.symfony5; \
    chmod 777 -R /.symfony5;

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /usr/src/myapp

CMD [ "php" ]
