FROM --platform=$TARGETOS/$TARGETARCH node:22-alpine

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN apk update && apk add --no-cache \
    ffmpeg iproute2 git sqlite sqlite-dev python3 python3-dev ca-certificates bind-tools tzdata zip tar curl build-base libtool \
    && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/sh", "/entrypoint.sh" ]