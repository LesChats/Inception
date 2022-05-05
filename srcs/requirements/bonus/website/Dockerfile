
FROM alpine:3.14

RUN apk update && apk add --update --no-cache -q nodejs npm

ADD ./tools/index.html .
ADD ./tools/site.js .
CMD node site.js
