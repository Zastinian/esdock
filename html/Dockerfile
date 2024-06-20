FROM --platform=$TARGETOS/$TARGETARCH alpine:latest

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN apk add --update --no-cache ca-certificates tzdata \
                                                    && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/ash", "/entrypoint.sh" ]