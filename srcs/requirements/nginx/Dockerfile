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

FROM alpine:3.14

# ---------- APK AD ----------------
RUN	apk update
RUN	apk add --no-cache -q -u nginx
RUN	apk add --no-cache -q -u openssl
#RUN	apk add --no-cache -q -u wget

# ------------ OPENSSL -------------
#ARG	ssl_dir="/etc/nginx/ssl"
RUN	mkdir -p /etc/nginx/ssl

#man x509 --- SSL CERTIF

#RUN	openssl req -x509 -nodes \
#	-out /etc/nginx/ssl/abaudot.42.fr.crt \
#	-keyout /etc/nginx/ssl/abaudot.42.fr.key \
#	-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=abaudot.42.fr/UID=abaudot"

RUN		openssl dhparam 2048 -out /etc/nginx/certs/dhparam.pem
#RUN		wget -O /etc/nginx/certs/lets-encrypt-x3-cross-signed.pem \
#		"https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem"

#RUN	cat /etc/nginx/ssl/abaudot.42.fr.key
#RUN	echo "-------------------------"
#RUN	cat /etc/nginx/ssl/abaudot.42.fr.crt
# ----------- NGINX -----------------
RUN		mkdir -p /var/run/nginx
COPY		conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN		cat /etc/nginx/conf.d/default.conf

# symbolic link (redirection)
RUN		ln -sf /dev/stdout /var/log/nginx/access.log \
		&& ln -sf /dev/stderr /var/log/nginx/error.log

# tier network: port: 443
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
