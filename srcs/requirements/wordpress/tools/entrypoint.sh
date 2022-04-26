#!/usr/bin/env sh

######################################################################
# @author      : abaudot (aimebaudot@gmail.com)
# @file        : entrypoint
# @created     : lundi avril 25, 2022 17:23:04 CEST
#
# @description : 
######################################################################

conf_file="/etc/php7/php-fmp.d/www.conf"

grep -E "listen = 127.0.0.1" $conf_file > /dev/null 2>&1
if [ $? -eq 0 ]; then
	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $conf_file
	echo "env[MARIADB_HOST] \$MARIADB_HOST" >> $conf_file
	echo "env[MARIADB_USER] = \$MARIADB_USER" >> $conf_file
	echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> $conf_file
	echo "env[MARIADB_DB] = \$MARIADB_DB" >> $conf_file
fi

if [ ! -f "wp-config.php" ]; then
	cp /config/wp-config ./wp-config.php
	sleep 1;
	if ! mysqladmin -h $MARIADB_HOST -u $MARIADB_USER \
		--password=$MARIADB_PWD --wait=60 ping > /dev/null; then
	printf "MySQL is not available.\n"
	exit 1
	fi

	wp core install --url-"$WP_URL" --title="WP_TITLE" \
	--admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PWD" \
	--admin_email="$WP_ADMIN_EMAIL" --skip-email

	wp plugin install redis-cache --activate
	wp plugin upadte --all

	wp user create $WP_USER $WP_USER_EMAIL --role=author \
	--user_pass=$WP_USER_PWD

	wp redis enable
fi

php-fpm7 --nadaemonize
