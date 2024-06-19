#nginx -g "daemon off;"
cd /wordpress
wget https://pt.wordpress.org/latest-pt_PT.zip
unzip -o latest-pt_PT.zip -d /var/html/www/
cd /var/html/www/wordpress/
chown -R www-data:www-data /var/html/www
cp /wordpress/wp-config.php ./wp-config.php
php-fpm82 -FR
