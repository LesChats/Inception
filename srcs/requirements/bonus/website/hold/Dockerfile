from alpine:3.14


RUN	apk update && apk add --no-cache -q -u \
	nginx openssl \
	&& mkdir -p /var/www/html \
	&& mkdir -p /var/run/nginx

COPY	./build/ /var/www/html
COPY	conf/nginx.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
