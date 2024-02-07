FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server \
    && apt-get clean

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld


COPY tools/init_db.sh /tmp/init_db.sh
RUN chmod +x /tmp/init_db.sh


ENTRYPOINT ["sh", "/tmp/init_db.sh"]
