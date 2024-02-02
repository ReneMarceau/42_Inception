#!/bin/bash

sleep 10

wp core download --allow-root --path='/var/www/wordpress'

wp config create --allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --allow-root \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_USER \
    --admin_password=$WP_PASSWORD \
    --admin_email=$WP_EMAIL \
    --path='/var/www/wordpress'

wp user create $WP_USER $WP_USER_EMAIL \
    --user_pass=$WP_USER_PASSWORD \
    --role=$WP_USER_ROLE \
    --porcelain \
    --allow-root 

mkdir /run/php

/usr/sbin/php-fpm7.3 -F

