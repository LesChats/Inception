FROM	alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache -q -u \
		prometheus
COPY	./conf/prometheus.yml /etc/prometheus/prometheus.yml
RUN	chmod +x	/etc/prometheus/prometheus.yml

COPY	./tools/entrypoint.sh /tmp/entrypoint.sh
RUN	chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
