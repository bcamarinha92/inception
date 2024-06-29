#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	chown -R mysql:mysql /var/lib/mysql/
	/etc/init.d/mariadb setup
	rc-service mariadb start
	/mariadb/sqlinit.sh

fi

sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop


/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
