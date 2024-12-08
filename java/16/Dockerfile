FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:16-jdk-alpine AS amd64-image
FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:16-jdk-focal AS arm64-image

FROM --platform=$TARGETOS/$TARGETARCH \
    ${TARGETARCH:+${TARGETARCH}-}image

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN if [ "$TARGETARCH" = "amd64" ]; then \
    apk update && apk add --no-cache \
    curl lsof ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 freetype zip unzip && \
    adduser -D -h /home/container container; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
    apt update \
    && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool ash \
    && useradd -m -d /home/container container; \
    fi

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/ash", "/entrypoint.sh" ]