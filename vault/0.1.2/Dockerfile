FROM alpine:3.2

MAINTAINER Marc Lopez <marc5.12@outlook.com>

ENV BIN vault
ENV REPO https://github.com/hashicorp/$BIN
ENV VAULT_VERSION 0.1.2
ENV GOMAXPROCS 2

RUN  apk add --update \
  make bash go git gcc musl-dev openssl-dev \
  && export GOPATH=/go \
  && export PATH=$PATH:$GOPATH/bin \
  && git clone $REPO /go/src/github.com/hashicorp/$BIN \
  && cd /go/src/github.com/hashicorp/$BIN \
  && git checkout -q v$VAULT_VERSION \
  && go get github.com/tools/godep \
  && go get github.com/mitchellh/gox \
  && go get golang.org/x/tools/cmd/cover \
  && go get golang.org/x/tools/cmd/vet \
  && make \
  && make dev \
  && mv $GOPATH/bin/$BIN /bin/ \
  && apk del bash make go git gcc musl-dev openssl-dev \
  && rm -rf /var/cache/apk/* $GOPATH

ENTRYPOINT ["/bin/vault"]
