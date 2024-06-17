#!/bin/sh

if [ -f /mariadb.env ]; then
    export $(cat /mariadb.env | xargs)
fi


mkdir /var/run/mysqld/
mkdir /var/lib/mysql/ 
mkdir /var/log/mysql/
mkdir /run/mysqld/


#touch /run/mysqld/mysqld.sock
#touch /run/mysqld/mysqld.pid
#touch /var/run/mysqld/mysqld.pid

chmod 777 -R /var/log/mysql
chmod 777 -R /var/lib/mysql
chmod 777 -R /var/run/mysqld/
chmod 777 -R /run/mysqld/

chown -R mysql /var/lib/mysql
chgrp -R mysql /var/lib/mysql

chown -R mysql /run/mysqld/
chgrp -R mysql /run/mysqld/

sleep 2

#mysql_install_db
sleep 2
#rc-service mariadb start
sleep 2
# mariadb -u mysql < /mariadb/init.sql
rc-service mariadb stop

exec "$@"
