FROM --platform=$TARGETOS/$TARGETARCH node:16-bullseye-slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -f install \
    && apt-get install -y \
        wget \
        apt-utils \
        apt-transport-https \
        ca-certificates \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' \
        >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable \
        --no-install-recommends \
        --allow-downgrades \
        fonts-ipafont-gothic \
        fonts-wqy-zenhei \
        fonts-thai-tlwg \
        fonts-kacst \
        fonts-freefont-ttf \
        ffmpeg \
        python3 \
        build-essential \
        libvips \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
