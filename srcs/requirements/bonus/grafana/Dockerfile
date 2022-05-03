FROM	alpine:3.14

RUN		apk update && apk add --no-cache -q -u curl libc6-compat \
		&& mkdir -p /monitor/grafana \
		&& curl -L https://dl.grafana.com/enterprise/release/grafana-enterprise-8.5.1.linux-amd64.tar.gz \
			-o /tmp/grafana-enterprise-8.5.1.linux-amd64.tar.gz \
		&& tar -zxvf /tmp/grafana-enterprise-8.5.1.linux-amd64.tar.gz -C /monitor/grafana \
		&& rm /tmp/grafana-enterprise-8.5.1.linux-amd64.tar.gz

WORKDIR 	/monitor/grafana
RUN		mv grafana-8.5.1/* . && rm -rf grafana-8.5.1/

COPY		./conf/provisioning/ /monitor/grafana/conf/provisioning/
COPY		./conf/dashboards/ /monitor/grafana/dashboards/
COPY		./conf/config.ini /monitor/grafana/conf/custom.ini

COPY		./tools/entrypoint.sh /tmp/entrypoint.sh
RUN		chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
