FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:8-jdk-jammy

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN apt update \
        && apt install -y curl lsof ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 zip unzip \
        && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]