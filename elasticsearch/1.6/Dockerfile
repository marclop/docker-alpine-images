FROM jolokia/alpine-jre-8

MAINTAINER Marc Lopez <marc5.12@outlook.com>

# Set environment variables
ENV PKG_NAME elasticsearch
ENV ELASTICSEARCH_VERSION 1.6.0
ENV ELASTICSEARCH_PKG $PKG_NAME-$ELASTICSEARCH_VERSION
ENV ELASTICSEARCH_URL https://download.elastic.co/$PKG_NAME/$PKG_NAME/$ELASTICSEARCH_PKG.tar.gz

# Download Elasticsearch
RUN apk update \
    && apk add ca-certificates curl \
    && mkdir -p /opt \
    && curl -o /tmp/$ELASTICSEARCH_PKG.tar.gz $ELASTICSEARCH_URL \
    && tar -xvzf /tmp/$ELASTICSEARCH_PKG.tar.gz -C /opt/ \
    && ln -s /opt/$ELASTICSEARCH_PKG /opt/$PKG_NAME \
    && rm -rf /tmp/*.tar.gz /var/cache/apk/*

# Add files
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY run.sh /run.sh

# Specify Volume
VOLUME ["/var/lib/elasticsearch"]

# Exposes
EXPOSE 9200
EXPOSE 9300

# CMD
ENTRYPOINT ["/run.sh"]
