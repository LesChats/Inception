# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaudot <abaudot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/22 18:11:29 by abaudot           #+#    #+#              #
#    Updated: 2022/04/22 18:38:12 by abaudot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN	apk update
RUN	apk add --no-cache --quiet --update nginx
RUN	apk add --no-cache --quiet --update openssl

# ------------ OPENSSL -------------
ARG	ssl_dir="/ect/nginx/ssl"
RUN	mkdir -p $ssl_dir

#man x509 --- SSL CERTIF
RUN	openssl req -x509 -nodes -out $ssl_dir/abaudot.42.fr.crt \
	-keyout $ssl_dir/abaudot.42.fr.key -subj \
	"/C=FR/ST=IDF/L=Paris/O=42/CN=abaudot.42.fr/UID=abaudot"

# ----------- NGINX -----------------
RUN		mkdir -p /var/run/nginx
COPY	config/nginx.conf /etc/nginx/conf.d/default.conf

# symbolic link (redirection)
RUN		ln -sf /dev/stdout /var/log/nginx/access.log \
		&& ln -sf /dev/stderr /var/log/nginx/error.log

# tier network: port: 443
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
