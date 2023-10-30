#!/bin/bash
set -xe
plugins=( ExtraTools CustomOptOut GroupPermissions InvalidateReports AdminNotification UserConsole QueuedTracking TrackerDomain GoogleAnalyticsImporter BotTracker EnvironmentVariables )
for i in "${plugins[@]}"
do
  curl -f -sS https://plugins.matomo.org/api/2.0/plugins/$i/download/latest > /tmp/plugins/$i.zip
  unzip /tmp/plugins/$i.zip -q -d /var/www/html/plugins -o
  echo adding $i
done

# clean up
rm -rf /tmp/plugins/*