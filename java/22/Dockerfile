FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:22-jdk-alpine

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN apk update && apk add --no-cache \
    curl lsof ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 freetype zip unzip \
    && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/ash", "/entrypoint.sh" ]