FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y wget \
    && apt-get install -y php7.3 \
    && apt-get install -y php-fpm \
    && apt-get install -y php-mysql \
    && apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN tar -xvf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www \
    && rm /var/www/wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

ENTRYPOINT [ "sh", "/tmp/auto_config.sh" ]

# Ensuite pour éviter une erreur qui concerne le PHP, j’ai rajouté une condition qui crée le dossier  /run/php  s’il n’existe pas.