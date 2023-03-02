#!/bin/bash

read _data_day _data_hour <<< $( date -u '+%Y-%m-%d %H' )
LOCAL_HOME=$( dirname $0 )
$LOCAL_HOME/daily_hourly_aggregator.sh $_data_day $_data_hour
$LOCAL_HOME/recent_demand_log.sh       $_data_day
