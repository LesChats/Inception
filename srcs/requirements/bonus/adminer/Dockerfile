FROM	alpine:3.14

RUN		apk upgrade && apk add --no-cache -q -u curl php7 \
		php7-session php7-fpm php7-mysqli

COPY		./tools/entrypoint.sh /tmp/entrypoint.sh
RUN		chmod +x /tmp/entrypoint.sh

WORKDIR		/var/www/wordpress
ENTRYPOINT	[ "sh", "/tmp/entrypoint.sh" ]
