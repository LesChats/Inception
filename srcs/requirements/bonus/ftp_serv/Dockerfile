FROM alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache -q -u vsftpd

COPY	conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN	chmod +x /etc/vsftpd/vsftpd.conf
COPY	./tools/entrypoint.sh /tmp/
# EXPOSE
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
