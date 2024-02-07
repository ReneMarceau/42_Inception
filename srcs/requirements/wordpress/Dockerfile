FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y wget \
    && apt-get install -y php7.3 \
    && apt-get install -y php-fpm \
    && apt-get install -y php-mysql \
    && apt-get install -y mariadb-client \
    && apt-get install -y netcat-traditional

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT [ "sh", "/tmp/auto_config.sh" ]
