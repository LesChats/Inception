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

# ------ ADD -----
RUN		apk update && apk upgrade && apk add --no-cache -q -u \
		mariadb \
		mariadb-client

# ---- daemon directory ----
RUN		mkdir -p /var/lib/mysqld /run/mysqld

# ---- cpopy data base script
COPY		./conf/create_db.sql /tmp/create_db.sql
# ---- copy endpoint script
COPY		./tools/entrypoint.sh ./

# install mariadb and configuration
RUN		mariadb-install-db --datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal\
		&& chown -R mysql:mysql /var/lib/mysql /run/mysqld

ENTRYPOINT ["sh", "entrypoint.sh"]
