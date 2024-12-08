FROM --platform=$TARGETOS/$TARGETARCH node:14-alpine

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN apk update && apk add --no-cache \
    wget gnupg ca-certificates \
    chromium \
    ttf-freefont font-noto-cjk font-noto font-noto-emoji \
    ffmpeg iproute2 git sqlite sqlite-dev python3 tzdata \
    build-base \
    bind-tools \
    pulseaudio xvfb

RUN adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/ash", "/entrypoint.sh" ]