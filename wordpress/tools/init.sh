cd /var/html/www/wordpress/
if [ ! -f ./wp-config.php ]; then
    cd /wordpress
    wget https://pt.wordpress.org/latest-pt_PT.zip
    unzip -n latest-pt_PT.zip -d /var/html/www/
    rm latest-pt_PT.zip
    cd /var/html/www/wordpress/
    cp /wordpress/wp-config.php ./wp-config.php
    php /usr/local/bin/wp/wp-cli.phar core install --path=/var/html/www/wordpress --url=https://bde-sous.42.fr --title="BinhasOnte" --admin_user=wordpress_user --admin_password=wordpress_password --admin_email=bde-sous@student.42porto.com
fi
php-fpm82 -FR