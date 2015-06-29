FROM alpine:3.2

MAINTAINER Marc Lopez <marc5.12@outlook.com>

## Install Python 2.7
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install --upgrade pip \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/* \
  && mkdir /app

WORKDIR /app
