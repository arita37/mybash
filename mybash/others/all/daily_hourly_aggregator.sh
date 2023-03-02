#!/bin/bash

LOCAL_HOME=$( dirname $0 )
source $LOCAL_HOME/lib/common_header.sh $LOCAL_HOME/tmp

check_n_process() {
    _day=$1
    RAW_LOG="/user/rdnuser/rssp_log${ENV_LABEL}/dataset=raw_log/dt=$_day"
    AGG_RAWLOG="/user/ppp/runa/agg_rawlog${ENV_LABEL}/dataset=ad_spots/dt=$_day"

    comm -23 <( $HDFS dfs -ls    $RAW_LOG/hour=??/_SUCCESS 2> /dev/null | grep -o "hour=[0-9]\{2\}" ) \
             <( $HDFS dfs -ls $AGG_RAWLOG/hour=??/_SUCCESS 2> /dev/null | grep -o "hour=[0-9]\{2\}" ) \
    | cut -d'=' -f2 | while read HH
    do
        $LOCAL_HOME/hourly_aggregator.sh $_day $HH
    done
}

read _day _hour <<< $( [[ $# -ge 2 ]] && echo $1 $2 || date -u '+%Y-%m-%d %H' )
previous=$( date '+%Y-%m-%d' -d"$_day $_hour 1 hour ago" )
today=$_day
if [ $previous != $today ]
then
    check_n_process $previous
fi
check_n_process $today
