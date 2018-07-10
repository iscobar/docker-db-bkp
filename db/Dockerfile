FROM alpine:3.7

RUN apk add --no-cache postgresql-client zip

RUN mkdir -p /backups/db/dumps

ADD . /backups/db

WORKDIR /backups/db

VOLUME /backups/db/dumps

