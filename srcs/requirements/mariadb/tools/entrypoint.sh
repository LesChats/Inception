#!/usr/bin/env sh

######################################################################
# @author      : abaudot (aimebaudot@gmail.com)
# @file        : entrypoint
# @created     : vendredi avril 22, 2022 19:41:23 CEST
#
# @description : 
######################################################################

cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	# Apply config
	sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0\nport=3306|g" /etc/my.cnf.d/mariadb-server.cnf

	# --- waing for data base to be reachable
	if ! mysqladmin --wait=30 ping; then
		printf "Unable to reach mariadb\n"
		exit 1
	fi

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	pkill mariadb
	touch .setup
fi
# secur lauch of mysql server
usr/bin/mysqld_safe --datadir=/var/lib/mysql
