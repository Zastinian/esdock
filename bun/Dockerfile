FROM --platform=$TARGETOS/$TARGETARCH oven/bun:slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get -o Acquire::Retries=5 -o Acquire::http::Timeout=30 update; \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        python3 \
        ca-certificates \
        build-essential \
        libvips; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
