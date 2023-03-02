#!/bin/bash

LOCAL_HOME=$(dirname $0)
source $LOCAL_HOME/lib/common_header.sh $LOCAL_HOME/tmp

day=$( [[ $# -ge 1 ]] && echo $1 || date -u '+%Y-%m-%d' )
$HDFS dfs -ls /user/rdnuser/rssp_log${ENV_LABEL}/dataset=raw_log/dt=$day		2> /dev/null
$HDFS dfs -ls /user/ppp/runa/agg_rawlog${ENV_LABEL}/dataset=ad_spots/dt=$day	2> /dev/null
$HDFS dfs -ls /user/rdnuser/rssp_log${ENV_LABEL}/dataset=demand_log/dt=$day		2> /dev/null
$HDFS dfs -ls /user/ppp/runa/bidding${ENV_LABEL}/dataset=line_items/dt=$day		2> /dev/null
