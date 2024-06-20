FROM --platform=$TARGETOS/$TARGETARCH node:18-bullseye-slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install wget gnupg2 ca-certificates apt-utils

RUN apt-get update \
    && apt-get install -y wget gnupg --no-install-recommends \
    && wget -q -O /usr/share/keyrings/google-chrome.gpg https://dl.google.com/linux/linux_signing_key.pub \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
    dnsutils \
    build-essential \
    net-tools \
    xvfb \
    pulseaudio \
    apt-transport-https \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]