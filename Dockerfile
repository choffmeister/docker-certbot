FROM alpine:3.4
MAINTAINER Christian Hoffmeister <mail@choffmeister.de>

RUN apk add --no-cache --update wget bash certbot ca-certificates

WORKDIR /opt/certbot
COPY run.sh ./run.sh
ENTRYPOINT ["./run.sh"]

ENV INITIAL_DELAY 300
VOLUME /etc/letsencrypt
EXPOSE 80
