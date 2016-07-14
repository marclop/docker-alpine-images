FROM alpine:3.4

MAINTAINER Marc Lopez <marc5.12@outlook.com>

RUN apk -U --no-cache upgrade && \
    apk --update --no-cache add \
    bash \
    mariadb \
    mariadb-client \
    su-exec \
    tzdata \
    && mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD my.cnf /etc/mysql/my.cnf
VOLUME /var/lib/mysql

EXPOSE 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld"]
