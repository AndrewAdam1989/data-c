FROM alpine:3.7

ENV CONFIG_JSON=none CERT_PEM=none KEY_PEM=none VER=3.9

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /bin \ 
 && cd /bin \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && mv /bin/v2ray-v$VER-linux-64/v2ray /bin/ \
 && mv /bin/v2ray-v$VER-linux-64/v2ctl /bin/ \
 && mv /bin/v2ray-v$VER-linux-64/geoip.dat /bin/ \
 && mv /bin/v2ray-v$VER-linux-64/geosite.dat /bin/ \
 && chmod +x /bin/v2ray \
 && rm -rf v2ray.zip \
 && rm -rf v2ray-v$VER-linux-64 \
 && chgrp -R 0 /bin \
 && chmod -R g+rwX /bin 
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT  /entrypoint.sh 

EXPOSE 38087
