FROM --platform=$TARGETOS/$TARGETARCH node:20-bullseye-slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install wget gnupg2 ca-certificates apt-utils

RUN apt-get update && apt-get install -y -q --no-install-recommends \
    libgtk-3-dev \
    libx11-xcb1  \
    libnss3 \
    libxss1 \
    libasound2 \
    libu2f-udev \
    libvulkan1 \
    fonts-liberation \
    libappindicator3-1 \
    lsb-release \
    xdg-utils

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i ./google-chrome-stable_current_amd64.deb \
    && rm ./google-chrome-stable_current_amd64.deb

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
    && apt-get clean

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]