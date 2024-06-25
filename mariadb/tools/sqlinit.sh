if mysql -u ${MYSQL_ROOT_USER} -e "SHOW DATABASES LIKE 'wordpress'" | grep -q "wordpress"; then
    echo "Database 'wordpress' already exists, skipping creation."
else
    mysql -u ${MYSQL_ROOT_USER} < /mariadb/init.sql
fi

echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

# Create new user and grant privileges only if the user does not exist
if mysql -u ${MYSQL_ROOT_USER} -e "SELECT 1 FROM mysql.user WHERE User = '${MYSQL_USER}' AND Host = 'localhost'" | grep -q "1"; then
    echo "User '${MYSQL_USER}'@'localhost' already exists, skipping creation."
else
    echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
    echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
fi

if mysql -u ${MYSQL_ROOT_USER} -e "SELECT 1 FROM mysql.user WHERE User = '${MYSQL_USER}' AND Host = '%'" | grep -q "1"; then
    echo "User '${DB_USER}'@'%' already exists, skipping creation."
else
    echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u ${MYSQL_ROOT_USER}
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u ${MYSQL_ROOT_USER}
fi

echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

# Change Password For root user only if the password is different
if [ "${MYSQL_ROOT_PASS}" != "$(mysql -u ${MYSQL_ROOT_USER} -e "SELECT authentication_string FROM mysql.user WHERE User = '${MYSQL_ROOT_USER}' AND Host = 'localhost'" -s -N)"]; then
    mysql -u ${MYSQL_ROOT_USER} -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
fi
