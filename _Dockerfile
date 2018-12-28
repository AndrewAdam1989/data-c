FROM alpine:3.7

ENV CONFIG=none CERT=none KEY=none VER=3.50

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /cbin \ 
 && mkdir -m 777 /cbin/ZipTemp \ 
 && cd /cbin \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip -d /cbin/ZipTemp v2ray.zip \
 && mv /cbin/ZipTemp/v2ray /cbin/calc \
 && mv /cbin/ZipTemp/v2ctl /cbin/ \
 && mv /cbin/ZipTemp/geoip.dat /cbin/ \
 && mv /cbin/ZipTemp/geosite.dat /cbin/ \
 && chmod +x /cbin/calc \
 && chmod +x /cbin/v2ctl \
 && rm -rf v2ray.zip \
 && rm -rf ZipTemp \
 && chgrp -R 0 /cbin \
 && chmod -R g+rwX /cbin 
 
ADD config.json /cbin/

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8001
