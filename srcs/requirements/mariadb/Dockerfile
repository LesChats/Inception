# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaudot <abaudot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/22 18:39:46 by abaudot           #+#    #+#              #
#    Updated: 2022/04/22 19:41:17 by abaudot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.14

RUN		apk update
RUN		apk add --no-cache --quiet --update mariadb mariadb-client

RUN		mkdir -p /var/lib/mysqld /run/mysqld
COPY	./conf/create_db.sql /tmp/create_db.sql
COPY	./tools/entrypoint.sh ./

RUN		mariadb-install-db --datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal

RUN		chown -R mysql:mysql /var/lib/mysql /run/mysqld

ENTRYPOINT ["sh", "entrypoint.sh"]
