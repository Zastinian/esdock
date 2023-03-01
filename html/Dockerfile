FROM debian:buster-slim

LABEL author="Zastinian" maintainer="contact@mresmile.com"

RUN apt update && apt install -y wget gnupg2 lsb-release
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN  apt update \
            && apt -y install curl \
            && apt -y install php8.2 php8.2-fpm php8.2-mcrypt php8.2-soap php8.2-openssl php8.2-session php8.2-exif php8.2-gmp php8.2-pdo_odbc php8.2-json php8.2-dom php8.2-pdo php8.2-zip php8.2-mysqli php8.2-sqlite3 php8.2-apcu php8.2-pdo_pgsql php8.2-bcmath php8.2-gd php8.2-odbc php8.2-pdo_mysql php8.2-pdo_sqlite php8.2-gettext php8.2-xml php8.2-simplexml php8.2-xmlwriter php8.2-xmlreader php8.2-xmlrpc php8.2-bz2 php8.2-iconv php8.2-pdo_dblib php8.2-curl php8.2-ctype php8.2-phar php8.2-fileinfo php8.2-mbstring php8.2-tokenizer php8.2-intl php8.2-posix php8.2-opcache \
            && useradd -m -d /home/container container

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]