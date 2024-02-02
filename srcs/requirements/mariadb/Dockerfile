FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server \
    && apt-get clean

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/init_db.sh /tmp/init_db.sh
RUN chmod +x /tmp/init_db.sh

CMD ["sh", "/tmp/init_db.sh"]