FROM	alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache -q -u \
		libc6-compat grafana \
	&& mkdir -p /monitor/grafana


COPY	./conf/provisioning/ /monitor/grafana/conf/provisioning/
COPY	./conf/dashboards/ /monitor/grafana/dashboards/
COPY	./conf/config.ini /monitor/grafana/conf/custom.ini
COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

# SUPERVISOR
#COPY ./supervisord.conf /etc/
#RUN mkdir -p /var/log/supervisor/

RUN	chmod +x tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
