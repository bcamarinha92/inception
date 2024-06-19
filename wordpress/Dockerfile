FROM alpine:3.19
RUN apk update && \
    apk add --no-cache  openrc \
    php php-fpm php-mysqli php-opcache php-gd php-mbstring \
    wget unzip && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /wordpress
    
RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
COPY ./tools/* /wordpress
COPY ./conf/* /wordpress
COPY ./conf/www.conf /etc/php82/php-fpm.d
RUN chmod +x /wordpress/*.sh

RUN openrc && touch /run/openrc/softlevel


#RUN chown -R www-data:www-data /var/html/www

ENTRYPOINT ["/bin/sh", "/wordpress/init.sh"]
