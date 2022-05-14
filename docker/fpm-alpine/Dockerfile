FROM matomo:4.9.1-fpm-alpine
RUN apk --update add rsync supervisor
RUN mkdir -p /etc/supervisor.d /tmp/matomo
COPY ${PWD}/config.ini.php /usr/src/matomo/config/config.ini.php
COPY ${PWD}/Plugins/ExtraTools/ /usr/src/matomo/plugins/ExtraTools/
COPY ${PWD}/Plugins/QueuedTracking-4.0.2/ /usr/src/matomo/plugins/QueuedTracking/
COPY ${PWD}/Plugins/CustomVariables-4.0.1/ /usr/src/matomo/plugins/CustomVariables/
COPY ${PWD}/Plugins/UserConsole-4.0.0/ /usr/src/matomo/plugins/UserConsole/
COPY ${PWD}/Plugins/CustomAlerts-4.0.4/ /usr/src/matomo/plugins/CustomAlerts/
COPY ${PWD}/Plugins/CustomOptOut-2.0.1/ /usr/src/matomo/plugins/CustomOptOut/
COPY ${PWD}/Plugins/MarketingCampaignsReporting-4.1.1/ /usr/src/matomo/plugins/MarketingCampaignsReporting/
COPY ${PWD}/GeoIP2/GeoLite2-City.mmdb /usr/src/matomo/misc/DBIP-City.mmdb
