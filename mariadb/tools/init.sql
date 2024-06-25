CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpress_user'@'%' IDENTIFIED BY 'wordpress_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%' IDENTIFIED BY 'wordpress_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'my-secret-pw';
--SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');