FROM debian:buster

RUN	apt-get update
RUN	apt-get -y upgrade
RUN	apt-get -y install curl

RUN	curl -L https://github.com/google/cadvisor/releases/download/v0.39.3/cadvisor \
	-o /usr/bin/cadvisor --silent \
	&& chmod +x /usr/bin/cadvisor
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
