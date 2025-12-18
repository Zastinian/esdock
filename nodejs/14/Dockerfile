FROM --platform=$TARGETOS/$TARGETARCH node:14-bullseye-slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt -y install ffmpeg python3 ca-certificates build-essential libvips \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
