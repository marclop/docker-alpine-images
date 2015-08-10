FROM alpine:3.2

MAINTAINER Marc Lopez <marc5.12@outlook.com>

ENV BIN consul
ENV CONSUL_VERSION 0.5.2
ENV GOMAXPROCS 2
ENV UI_URL http://dl.bintray.com/mitchellh/${BIN}/${CONSUL_VERSION}_web_ui.zip

## Instal go and configure it because Alpine linux doesn't contain libc
RUN apk add --update \
  make bash go git gcc musl-dev openssl-dev \
  && export GOPATH=/go \
  && go get -u -v github.com/hashicorp/$BIN \
  && cd /go/src/github.com/hashicorp/$BIN \
  && git checkout -q v$CONSUL_VERSION \
  && make \
  && mv bin/$BIN /bin/ \
  && cd /tmp \
  && wget -O ui.zip $UI_URL \
  && unzip ui.zip \
  && mv dist /ui \
  && apk del bash make go git gcc musl-dev openssl-dev \
  && rm -rf /var/cache/apk/* $GOPATH ui.zip \
  && mkdir -p /config/consul.d \
  && ln -s /config/consul.d /etc/consul.d

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

VOLUME [ "/data", "/config" ]

ENTRYPOINT [ "/bin/consul" ]
