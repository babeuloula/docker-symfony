FROM php:8.1-cli

RUN \
    echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list; \
    apt update; \
    apt install -y symfony-cli;

RUN \
    mkdir -p /.symfony5; \
    chmod 777 -R /.symfony5;

WORKDIR /usr/src/myapp

CMD [ "php" ]
