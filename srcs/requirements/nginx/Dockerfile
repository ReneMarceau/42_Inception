FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y nginx \
    && apt install -y openssl \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=CA/ST=Quebec/L=Quebec City/O=42 Quebec/OU=Inception/CN=rmarceau.42.fr/UID=rmarceau"

RUN mkdir -p /var/run/nginx

COPY conf/default.conf /etc/nginx/conf.d/default.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]





