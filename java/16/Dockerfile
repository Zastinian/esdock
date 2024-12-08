ARG BASE_IMAGE=alpine

FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:16-jdk-${BASE_IMAGE}

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN if [ "$BASE_IMAGE" = "alpine" ]; then \
        apk update && apk add --no-cache \
        curl lsof ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 freetype zip unzip && \
        adduser -D -h /home/container container; \
    else \
        apt update && apt install -y \
        curl lsof ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 zip unzip && \
        useradd -m -d /home/container container; \
    fi

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/sh", "/entrypoint.sh" ]