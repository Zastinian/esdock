FROM debian:buster-slim

LABEL author="Zastinian" maintainer="contact@mresmile.com"

RUN apt update && apt install -y wget gnupg2 lsb-release
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

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