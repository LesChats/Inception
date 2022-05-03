#FROM	alpine:3.14
#RUN	apk update && apk add --no-cache -q -u prometheus
#COPY	./config/prometheus.yml /etc/prometheus/prometheus.yml
#RUN	chmod +x /etc/prometheus/prometheus.yml
#COPY	./scripts/entrypoint.sh ./entrypoint.sh
#RUN 	chmod +x ./entrypoint.sh
#ENTRYPOINT [ "sh", "entrypoint.sh" ]
FROM	debian:buster
RUN		apt-get update && apt-get -y upgrade \
		&& apt-get -y install prometheus

COPY	./conf/prometheus.yml /etc/prometheus/prometheus.yml
RUN		chmod +x /etc/prometheus/prometheus.yml

COPY	./tools/entrypoint.sh ./entrypoint.sh
RUN 	chmod +x ./entrypoint.sh

ENTRYPOINT [ "sh", "entrypoint.sh" ]
