WP_USER_PASSWORD=$(cat "$WP_USER_PASSWORD_FILE") 
WP_ADMIN_PASSWORD=$(cat "$WP_ADMIN_PASSWORD_FILE")
echo $WP_ADMIN_PASSWORD

cd /var/html/www/wordpress/
if [ ! -f ./wp-config.php ]; then
    cd /wordpress
    wget https://pt.wordpress.org/latest-pt_PT.zip
    unzip -n latest-pt_PT.zip -d /var/html/www/
    rm latest-pt_PT.zip
    cd /var/html/www/wordpress/
    cp /wordpress/wp-config.php ./wp-config.php
    sleep 5
    php /usr/local/bin/wp/wp-cli.phar core install --path=$WP_HOME --url=$WP_SITEURL --title="BinhasOnte" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    php /usr/local/bin/wp/wp-cli.phar user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWORD

fi
php-fpm82 -FR