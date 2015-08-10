FROM alpine:3.2

MAINTAINER Marc Lopez <marc5.12@outlook.com>

ENV BIN terraform
ENV REPO https://github.com/hashicorp/$BIN
ENV TERRAFORM_VERSION 0.6.2
ENV TERRAFORM_WORKING_COMMIT 1a44b427a7c7b07bc17640afd6197308e9b95ce5
ENV GOMAXPROCS 2

RUN  apk add --update \
  make bash mercurial go git gcc musl-dev openssl-dev \
  && export GOPATH=/go \
  && export PATH=$PATH:$GOPATH/bin \
  && git clone $REPO /go/src/github.com/hashicorp/$BIN \
  && cd /go/src/github.com/hashicorp/$BIN \
  && git checkout -q $TERRAFORM_WORKING_COMMIT \
  && make updatedeps \
  && make \
  && make dev \
  && mv $GOPATH/bin/$BIN /bin/ \
  && apk del bash mercurial make go git gcc musl-dev openssl-dev \
  && rm -rf /var/cache/apk/* $GOPATH

ENTRYPOINT ["/bin/terraform"]
