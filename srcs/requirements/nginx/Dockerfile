FROM alpine:3.19


RUN apk update && \
apk add --no-cache nginx openssl openrc && \
rm -rf /var/cache/apk/* && \
mkdir -p /nginx 
#&& mkdir -p /var/html/www

COPY ./tools/* /nginx 
COPY ./tools/index.html /var/html/www/
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN openrc && touch /run/openrc/softlevel && \
    mkdir -p /etc/nginx/ssl && chmod +x /nginx/*.sh && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=PT/ST=PORTO/L=PORTO/O=Dis/CN=bde-sous.42.fr"

EXPOSE 443

ENTRYPOINT ["/bin/sh", "/nginx/init.sh"]
