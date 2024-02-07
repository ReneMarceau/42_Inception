#!/bin/bash

while true; do
    if nc -z -w 2 mariadb 3306; then
        echo "MariaDB is up and running"
        sleep 1
        break
    else
        echo "Waiting for MariaDB to start..."
        sleep 5
    fi
done

if [ -f /var/www/html/wordpress/wp-config.php ]; then
    echo "wordpress already downloaded"
else
    wget http://wordpress.org/latest.tar.gz -P /var/www/html
    tar -xvf /var/www/html/latest.tar.gz -C /var/www/html
    rm -rf /var/www/html/latest.tar.gz
    chown -R root:root /var/www/html/wordpress

    wp core download --allow-root --path='/var/www/html'

    wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='/var/www/html'

    wp core install --allow-root \
        --url=$DOMAIN_NAME \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --path='/var/www/html'

    wp user create $WP_USER $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASSWORD \
        --role=$WP_USER_ROLE \
        --porcelain \
        --allow-root \
        --path='/var/www/html'

    echo "Wordpress setuped successfully. Starting PHP-FPM..."


fi

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F
