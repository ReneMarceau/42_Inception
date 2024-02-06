# #!/bin/bash

# service mysql start


# sleep 10

# echo "Flushing Privileges"


# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# echo "Creating Database: ${SQL_DATABASE}"

# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# echo "Creating User: ${SQL_USER}"

# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# echo "Granting Privileges to User: ${SQL_USER}"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# echo "Changing Root Password"

# mysql -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown

# exec mysqld_safe

#!/bin/bash
if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; then
    echo "Database '$SQL_DATABASE' already exists. Skipping setup."
else
	service mysql start
	sleep 10
	echo "Setting database..."
	echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
	echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' ;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql
	echo "Fuck that"
	mysql < db1.sql
	echo "Fuck this"
	sleep 5
	echo "Bullshit A"
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
	echo "Bullshit B"
fi
mysqld_safe