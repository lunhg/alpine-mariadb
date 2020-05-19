FROM alpine:3.11

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils
RUN addgroup mysql mysql && \
	rm -rf /var/cache/apk/*

COPY ./usr/local/bin /usr/local/bin

RUN chmod -R +x /usr/local/bin

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT /usr/local/bin/setup_mysql \
    -r $MYSQL_ROOT_PWD \
    -u $MYSQL_USER \
    -p $MYSQL_USER_PWD \
    -d $MYSQL_USER_DB \
    -c $MYSQL_CHARSET \
    -C $MYSQL_COLLATE \
    -m $MYSQL_MAX_ALLOWED_PACKET