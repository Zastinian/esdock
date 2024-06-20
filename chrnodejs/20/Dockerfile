FROM --platform=$TARGETOS/$TARGETARCH node:20-bullseye-slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install wget gnupg2 apt-utils \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    google-chrome-stable \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-kacst \
    fonts-freefont-ttf \
    ffmpeg \
    iproute2 \
    git \
    sqlite3 \
    python3 \
    tzdata \
    ca-certificates \
    dnsutils \
    build-essential

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    net-tools \
    xvfb \
    pulseaudio \
    apt-transport-https

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]