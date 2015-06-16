FROM alpine:3.2

MAINTAINER Marc Lopez <marc5.12@outlook.com>

# Set environment variables
ENV KIBANA_VERSION 4.0.3
ENV PKG_NAME kibana
ENV PKG_PLATFORM linux-x64
ENV KIBANA_PKG $PKG_NAME-$KIBANA_VERSION-$PKG_PLATFORM
ENV KIBANA_CONFIG /opt/$PKG_NAME-$KIBANA_VERSION-$PKG_PLATFORM/config/kibana.yml
ENV KIBANA_URL https://download.elastic.co/$PKG_NAME/$PKG_NAME/$KIBANA_PKG.tar.gz
ENV ELASTICSEARCH_HOST elasticsearch

# Download Kibana
RUN apk update \
    && apk add ca-certificates curl nodejs \
    && mkdir -p /opt \
    && curl -o /tmp/$KIBANA_PKG.tar.gz $KIBANA_URL \
    && tar -xvzf /tmp/$KIBANA_PKG.tar.gz -C /opt/ \
    && ln -s /opt/$KIBANA_PKG /opt/$PKG_NAME \
    && sed -i "s/localhost/$ELASTICSEARCH_HOST/" $KIBANA_CONFIG \
    && rm -rf /tmp/*.tar.gz /var/cache/apk/* /opt/$KIBANA_PKG/node/ \
    && mkdir -p /opt/$KIBANA_PKG/node/bin/ \
    && ln -s $(which node) /opt/$PKG_NAME/node/bin/node

# Expose
EXPOSE 5601

# Working directory
WORKDIR ["/opt/$KIBANA_PKG"]
CMD ["/opt/kibana/bin/kibana"]
