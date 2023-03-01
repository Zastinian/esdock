FROM debian:buster-slim

LABEL author="Zastinian" maintainer="contact@mresmile.com"

RUN apt update \ 
            && apt -y install curl ca-certificates \
            && apt -y install php8.2 php8.2-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]