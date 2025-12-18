FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:17-jdk-jammy

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y \
        curl \
        ca-certificates \
        openssl \
        fontconfig \
        libfreetype6 \
        sqlite3 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
