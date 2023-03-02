#!/bin/bash

LOCAL_HOME=$(dirname $0)
source $LOCAL_HOME/lib/common_header.sh $LOCAL_HOME/tmp
PYTHON_SCRIPT=$LOCAL_HOME/score_calculator.py

read _end_day _end_hour <<< $( [[ $# -ge 2 ]] && echo $1 $2 || date -u '+%Y-%m-%d %H' )

AGG_RAWLOG="$WORK_HDFS_HOME/agg_rawlog${ENV_LABEL}"
DEMAND_LOG="/user/rdnuser/rssp_log${ENV_LABEL}/dataset=demand_log"
SUCCESS_FILE="$DEMAND_LOG/dt=$_end_day/hour=$_end_hour/_SUCCESS"
OUTPUT_DIR="$WORK_HDFS_HOME/bidding${ENV_LABEL}"

LOG_FILE=$LOCAL_HOME/log/runa_batches.${_end_day}.log
PYSPARK_LOG_FILE=$LOCAL_HOME/log/score_calculator.pyspark.${_end_day}.${_end_hour}.log

error_message="[HDFS] Demand_log data is not ready yet:\n\t $SUCCESS_FILE not found"
$HDFS dfs -test -e $SUCCESS_FILE 2> /dev/null || { error "$error_message"; }

start_date=$( date -d"$_end_day 4 weeks ago" '+%Y-%m-%d' )
# "--deploy-mode client" to get the stdout in the local server
$SPARK_SUBMIT --master yarn   \
              --deploy-mode client  \
              --queue common2   \
              --name "[TDA] Score calculator" \
              --num-executors 8   \
              --executor-cores 4  \
              --executor-memory 2g  \
              --conf spark.driver.memory=512m \
              --conf spark.hadoop.yarn.timeline-service.enabled=false \
              --conf spark.serializer=org.apache.spark.serializer.KryoSerializer  \
              $PYTHON_SCRIPT -r_log $AGG_RAWLOG   \
                             -d_log $DEMAND_LOG   \
                             -sdate $start_date   \
                             -shour "00"    \
                             -edate $_end_day   \
                             -ehour $_end_hour    \
                             -label "${ENV_LABEL}"  \
                             -out_p $OUTPUT_DIR   \
                             |& tee -a $PYSPARK_LOG_FILE | grep '\[CUSTOM\]' >> $LOG_FILE

[ ${PIPESTATUS[0]} -ne 0 ] && error "[PySpark] At Score calculator"
report "[PySpark] Scores ready: C4000:$OUTPUT_DIR"
