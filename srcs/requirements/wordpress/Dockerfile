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

RUN	apk update
RUN	apk add --no-cache --quiet --update bash curl less
RUN	apk add --no-cache --quiet --update mariadb-client redis
RUN	apk add --no-cache --quiet --upadte php7 php7-fpm php7-phar php7-mysqli \
						php7-curl php7-json php7-iconv

RUN	mkdir -p /var/www/wordpress /usr/local/bin/wp

# ------------- WP-CLI ----------

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			--output /usr/bin/wp --silent
RUN	chmod u+x ./usr/bin/wp

# ---------- WORDPRESS ---------

RUN		wp core download --version=5.9.3
WORKDIR	/var/www/wordpress

COPY	conf/wp-config /conf/wp-config
COPY	./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN		chmod u+x /usr/local/bin/entrypoint/.sh

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
