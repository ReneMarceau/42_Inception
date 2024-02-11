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
    wp core download --allow-root --path='/var/www/html'

    sed -i "s/database_name_here/$SQL_DATABASE/g" /var/www/html/wp-config-sample.php
    sed -i "s/username_here/$SQL_USER/g" /var/www/html/wp-config-sample.php
    sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/html/wp-config-sample.php
    sed -i "s/localhost/mariadb:3306/g" /var/www/html/wp-config-sample.php
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

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

    echo "Wordpress has been setup successfully. Starting PHP-FPM..."


fi

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F
