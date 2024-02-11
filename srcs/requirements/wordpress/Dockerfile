FROM debian:buster

# RUN apt install unzip php curl wget redis php-redis php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y wget \
    && apt-get install -y php7.3 \
    && apt-get install -y php-fpm \
    && apt-get install -y php-mysql \
    && apt-get install -y mariadb-client \
    && apt-get install -y netcat-traditional

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && php wp-cli.phar --info \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

ENTRYPOINT [ "sh", "/tmp/auto_config.sh" ]
