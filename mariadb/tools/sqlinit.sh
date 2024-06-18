mysql -u ${MYSQL_ROOT_USER} < /mariadb/init.sql

echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}
# Create new user and Make The user GRANT ALL PRIVILEGES to all databases in loaclhosts
echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

# Create new user and Make The user GRANT ALL PRIVILEGES on Wordpress database
echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}
# Change Password For root user
mysql -u ${MYSQL_ROOT_USER} -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
