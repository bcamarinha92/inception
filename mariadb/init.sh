#!/bin/sh

if [ -f /mariadb.env ]; then
    export $(cat /mariadb.env | xargs)
fi

mysql_install_db;
service mysql start;
mysql -u mysql < /mariadb/init.sql
exec "$@"
