# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaudot <abaudot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/22 18:11:29 by abaudot           #+#    #+#              #
#    Updated: 2022/04/26 20:57:12 by abaudot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# last version is 3.15
FROM alpine:3.14

# ---------- APK ADD ----------------
RUN	apk update && apk upgrade && apk add --no-cache -q -u \
	nginx openssl

# ------------ OPENSSL -------------
# certificat/key creation
RUN	mkdir -p /etc/nginx/ssl \
	&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/abaudot.42.fr.crt\
        -keyout /etc/nginx/ssl/abaudot.42.fr.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=abaudot.42.fr/UID=abaudot"

# ----------- NGINX -----------------
RUN		mkdir -p /var/run/nginx
COPY		conf/nginx.conf /etc/nginx/http.d/default.conf

# symbolic link (redirection)
RUN		ln -sf /dev/stdout /var/log/nginx/access.log \
		&& ln -sf /dev/stderr /var/log/nginx/error.log

# tier network: port: 443
EXPOSE 443

# lauch nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
