FROM alpine:3.2

MAINTAINER Marc Lopez <marc5.12@outlook.com>

ENV BIN vault
ENV REPO https://github.com/hashicorp/$BIN
ENV VAULT_VERSION 0.2.0
ENV URL http://dl.bintray.com/mitchellh/$BIN/vault_${VAULT_VERSION}_linux_amd64.zip
ENV GOMAXPROCS 2

## 2.0 Compilation broken
#RUN  apk add --update \
#  make bash go git gcc musl-dev openssl-dev \
#  && export GOPATH=/go \
#  && git clone $REPO /go/src/github.com/hashicorp/$BIN \
#  && cd /go/src/github.com/hashicorp/$BIN \
#  && git checkout -q v$VAULT_VERSION \
#  && make bootstrap \
#  && make \
#  && make dev \
#  && mv $GOPATH/bin/$BIN /bin/ \
#  && apk del bash make go git gcc musl-dev openssl-dev \
#  && rm -rf /var/cache/apk/* $GOPATH

## Download Instead
RUN wget -O vault.zip $URL \
  && unzip vault.zip \
  && chmod +x vault \
  && mv vault /bin/ \
  && rm -f *.zip

ENTRYPOINT ["/bin/vault"]
