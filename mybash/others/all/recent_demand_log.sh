#!/bin/bash

LOCAL_HOME=$( dirname $0 )
source $LOCAL_HOME/lib/common_header.sh $LOCAL_HOME/tmp

check_n_process() {
    _day=$1
    DEMAND_LOG="/user/rdnuser/rssp_log${ENV_LABEL}/dataset=demand_log/dt=$_day"
    BIDDING="/user/ppp/runa/bidding${ENV_LABEL}/dataset=ad_spots/dt=$_day"

    _empty_today="True"
    recent_hour=$( $HDFS dfs -ls $DEMAND_LOG/hour=??/_SUCCESS 2> /dev/null | grep -o "hour=[0-9]\{2\}" | tail -1 )
    if [ "$recent_hour" != "" ]
    then
        _empty_today="False"
        $HDFS dfs -test -e $BIDDING/$recent_hour/_SUCCESS 2> /dev/null
        if [ $? -ne 0 ]
        then
            HH=$( echo $recent_hour | cut -d"=" -f2 )
            $LOCAL_HOME/score_calculator.sh $_day $HH
        fi
    fi
    echo $_empty_today
}

today=${1:-$( date -u '+%Y-%m-%d' )}
empty_today=$( check_n_process $today )
if [ "$empty_today" == "True" ]
then
    yesterday=$( date '+%Y-%m-%d' -d"$today 1 day ago" )
    __=$( check_n_process $yesterday )
fi
