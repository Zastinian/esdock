FROM --platform=$TARGETOS/$TARGETARCH alpine:latest

LABEL author="Zastinian" maintainer="contact@hedystia.com"

RUN apk add --update --no-cache ca-certificates tzdata \
                                                    && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD [ "/bin/ash", "/entrypoint.sh" ]