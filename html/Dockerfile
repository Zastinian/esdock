FROM debian:buster-slim

LABEL author="Zastinian" maintainer="contact@mresmile.com"

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt update \ 
            && apt -y install curl ca-certificates \
            && apt -y install php8.2 php8.2-{fpm,mcrypt,soap,openssl,session,exif,gmp,pdo_odbc,json,dom,pdo,zip,mysqli,sqlite3,apcu,pdo_pgsql,bcmath,gd,odbc,pdo_mysql,pdo_sqlite,gettext,xml,simplexml,xmlwriter,xmlreader,xmlrpc,bz2,iconv,pdo_dblib,curl,ctype,phar,fileinfo,mbstring,tokenizer,intl,posix,opcache,pecl-imagick}

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]