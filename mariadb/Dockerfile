FROM alpine:3.19
RUN apk update && \
    apk add --no-cache mariadb mariadb-server-utils && \
    rm -rf /var/cache/apk/* && \
    mkdir /mariadb

COPY ./init.sql /docker-entrypoint-initdb.d/
COPY ./init.sh /mariadb
COPY ./init.sql /mariadb
RUN chmod +x /mariadb/init.sh
# RUN mkdir -p /var/lib/mysql
# RUN chown -R mysql:mysql /var/lib/mysql
#RUN sh /mariadb/init.sh
#USER mysql
EXPOSE 3306

CMD ["/mariadb/init.sh"]

