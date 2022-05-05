# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaudot <abaudot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/22 19:51:03 by abaudot           #+#    #+#              #
#    Updated: 2022/04/25 17:22:37 by abaudot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.14

# ----- ADD
RUN	apk update && apk upgrade && apk add --no-cache -q -u bash curl less \
	mariadb-client redis \
	php7 php7-fpm php7-phar php7-mysqli php7-curl php7-json php7-iconv \
	&& mkdir -p /var/www/wordpress /usr/local/bin/wp

# php config
#RUN	adduser -S nginx && addgroup -S nginx
#COPY	conf/php-fpm.conf /etc/php7/php-fmp.conf
#COPY	conf/www.conf	/etc/php7/php-fpm.d/www.conf

# ------------- WP-CLI ----------

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	--output /usr/bin/wp --silent \
	&& chmod +x ./usr/bin/wp

# ---------- WORDPRESS ---------

# ---- Download wordpress 5.9.3 via wp cli
RUN		wp core download --version=5.9.3 --path=/var/www/wordpress
WORKDIR		/var/www/wordpress

# ----- config cpy: could use wp config create instead
COPY		conf/wp-config /config/wp-config
# ----- script cpy
COPY		./tools/entrypoint.sh /tmp/entrypoint.sh

RUN		chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
