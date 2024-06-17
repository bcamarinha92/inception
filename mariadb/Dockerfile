FROM alpine:3.19
RUN apk update && \
    apk add --no-cache mariadb mariadb-client openrc && \
    rm -rf /var/cache/apk/* && \
    mkdir /mariadb

COPY ./init.sh /mariadb
COPY ./init.sql /mariadb
COPY ./mariadb-server.cnf /etc/my.cnf.d/

RUN chmod +x /mariadb/init.sh
RUN /bin/sh /mariadb/init.sh
#RUN chown -R mysql:mysql /run/mysqld/
RUN mysql_install_db --user=mysql
USER mysql
EXPOSE 3306

#CMD ["/bin/sh", "/mariadb/init.sh"]
CMD [ "/bin/sh", "/usr/bin/mysqld" ]
