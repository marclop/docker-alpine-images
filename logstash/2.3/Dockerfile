FROM anapsix/alpine-java:8

MAINTAINER Miguel Angel Garcia <mgarcia.inf@gmail.com>

# Set environment variables
ENV PKG_NAME logstash
ENV LOGSTASH_VERSION 2.3.2
ENV LOGSTASH_PKG $PKG_NAME-$LOGSTASH_VERSION
ENV LOGSTASH_URL https://download.elastic.co/$PKG_NAME/$PKG_NAME/$LOGSTASH_PKG.tar.gz

# Download logstash
ADD $LOGSTASH_URL /tmp/$LOGSTASH_PKG.tar.gz

RUN apk update \
    && apk add bash ca-certificates curl \
    && mkdir -p /opt \
    && tar xzf /tmp/$LOGSTASH_PKG.tar.gz -C /opt/ \
    && ln -s /opt/$LOGSTASH_PKG /opt/$PKG_NAME \
    && rm -rf /tmp/*.tar.gz /var/cache/apk/* \
    && mkdir /etc/$PKG_NAME

# Expose Syslog TCP and UDP ports
EXPOSE 514 514/udp
WORKDIR /opt/$PKG_NAME

ENV LOGSTASH_CONFIG /etc/$PKG_NAME/logstash.conf
# Add logstas config file
ADD logstash.json $LOGSTASH_CONFIG

CMD /opt/$PKG_NAME/bin/logstash -f $LOGSTASH_CONFIG
