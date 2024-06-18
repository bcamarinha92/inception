FROM alpine:3.19
RUN apk update && \
    apk add --no-cache mariadb mariadb-client openrc && \
    rm -rf /var/cache/apk/* && \
    mkdir /mariadb

RUN openrc
RUN touch /run/openrc/softlevel

COPY ./tools/* /mariadb
#COPY ./init.sql /mariadb

RUN chmod +x /mariadb/*.sh

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/mariadb/init.sh"]
