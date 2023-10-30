FROM matomo:4.15.1-fpm-alpine

RUN apk --update add rsync supervisor bash
RUN apk add --no-cache autoconf freetype-dev icu-dev libjpeg-turbo-dev libpng-dev libzip-dev openldap-dev pcre-dev patch;
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd ldap mysqli opcache pdo_mysql zip

RUN mkdir -p /etc/supervisor.d /tmp/matomo
COPY config.ini.php /usr/src/matomo/config/config.ini.php

COPY plugins_v2.sh /tmp/plugins.sh
RUN mkdir -p /tmp/plugins
RUN chmod ugo+x /tmp/plugins.sh && \
    /bin/bash -c '/tmp/plugins.sh'

RUN chown www-data:www-data /etc/supervisord.conf \
    && touch /var/log/supervisord.log \
    && chown www-data:www-data /var/log/supervisord.log 

RUN chown www-data:www-data -R /var/www/html
RUN rsync -crlOt --no-owner --no-group --no-perms /var/www/html/ /usr/src/matomo/ \
    && chown www-data:www-data -R /usr/src/matomo/

WORKDIR /var/www/html