FROM --platform=$TARGETOS/$TARGETARCH oven/bun:slim

LABEL author="Zastinian" maintainer="contact@hedystia.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        python3 \
        curl \
        xz-utils \
        bash \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    ARCH="$(uname -m)"; \
    if [ "$ARCH" = "x86_64" ]; then \
        curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
        | tar -xJ --strip-components=1 -C /usr/local/bin --wildcards '*/ffmpeg' '*/ffprobe'; \
    elif [ "$ARCH" = "aarch64" ]; then \
        curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-arm64-static.tar.xz \
        -o /usr/local/bin/ffmpeg; \
        chmod +x /usr/local/bin/ffmpeg; \
    else \
        echo "Arquitectura no soportada: $ARCH"; exit 1; \
    fi

RUN useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
