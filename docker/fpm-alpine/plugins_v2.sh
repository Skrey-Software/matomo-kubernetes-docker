#!/bin/bash
set -xe
plugins=( 'ExtraTools:4.1.0-beta5' 'CustomOptOut:2.0.5' 'GroupPermissions:4.0.5' 'InvalidateReports:4.1.1' 'AdminNotification:4.0.0' 'UserConsole:4.0.2' 'QueuedTracking:4.0.7' 'TrackerDomain:0.3.3' 'GoogleAnalyticsImporter:4.6.11' 'BotTracker:2.08' 'EnvironmentVariables:4.0.1' 'CustomVariables:4.1.3' 'TrackingCodeCustomizer:4.0.0' 'ProtectTrackID:2.8.0' )
for i in "${plugins[@]}"
do

  if [[ $i == *":"* ]]
  then
    pluginArray=(${i//:/ })
    pluginName=${pluginArray[0]}
    pluginVersion=${pluginArray[1]}
  else
    pluginName=$i
    pluginVersion='latest'
  fi

  curl -f -sS https://plugins.matomo.org/api/2.0/plugins/$pluginName/download/$pluginVersion > /tmp/plugins/$pluginName.zip
  unzip /tmp/plugins/$pluginName.zip -q -d /var/www/html/plugins -o
  echo adding $pluginName $pluginVersion
done