FROM anapsix/alpine-java:8

MAINTAINER Miguel Angel Garcia <mgarcia.inf@gmail.com>

# Set environment variables
ENV PKG_NAME elasticsearch
ENV KOPF_VERSION v2.1.1
ENV KOPF_BRANCH 2.0
ENV ELASTICSEARCH_VERSION 2.3.3
ENV ELASTICSEARCH_PKG $PKG_NAME-$ELASTICSEARCH_VERSION
ENV ELASTICSEARCH_URL https://download.elasticsearch.org/$PKG_NAME/release/org/$PKG_NAME/distribution/tar/$PKG_NAME/$ELASTICSEARCH_VERSION/$ELASTICSEARCH_PKG.tar.gz

# Download elasticsearch
ADD $ELASTICSEARCH_URL /tmp/$ELASTICSEARCH_PKG.tar.gz

COPY run.sh /run.sh

# Download Elasticsearch
RUN apk add --update bash sudo \
    && mkdir -p /opt \
    && tar -xvzf /tmp/$ELASTICSEARCH_PKG.tar.gz -C /opt/ \
    && ln -s /opt/$ELASTICSEARCH_PKG /opt/$PKG_NAME \
    && chmod +x /run.sh \
    && /opt/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/$KOPF_BRANCH/$KOPF_VERSION \
    && adduser -S -D -H elasticsearch \
    && mkdir -p /var/lib/elasticsearch \
    && chown -R elasticsearch:nogroup /var/lib/elasticsearch \
    && chown -R elasticsearch:nogroup /opt/elasticsearch \
    && chown -R elasticsearch:nogroup /opt/$ELASTICSEARCH_PKG \
    && chown -R elasticsearch:nogroup /var/lib/elasticsearch \
    && rm -rf /tmp/*.tar.gz /var/cache/apk/*

# Add files
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

# Specify Volume
VOLUME ["/var/lib/elasticsearch"]

# Exposes
EXPOSE 9200 9300

# CMD
ENTRYPOINT ["/run.sh"]
