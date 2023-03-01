FROM debian:buster-slim

LABEL author="Zastinian" maintainer="contact@mresmile.com"

RUN add-apt-repository -y ppa:jason.grammenos.agility/php

RUN  apt update \
            && apt -y install curl \
            && apt -y install php8.2 php8.2-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip} \
            && useradd -m -d /home/container container

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]