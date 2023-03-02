#!/bin/bash
# [CUSTOM] Param1, Param2: YYYY-MM-DD and HH in the path of <raw_log> data, for recovery work

LOCAL_HOME=$(dirname $0)
source $LOCAL_HOME/lib/common_header.sh $LOCAL_HOME/tmp
PYTHON_SCRIPT=$LOCAL_HOME/hourly_aggregator.py

# Period to run: HH:43~HH:59
read _data_day _data_hour <<< $( [[ $# -ge 2 ]] && echo $1 $2 || date -u '+%Y-%m-%d %H' )

RAW_LOG_DIR="/user/rdnuser/rssp_log${ENV_LABEL}/dataset=raw_log"
SUCCESS_FILE="$RAW_LOG_DIR/dt=$_data_day/hour=$_data_hour/_SUCCESS"
OUTPUT_DIR="$WORK_HDFS_HOME/agg_rawlog${ENV_LABEL}"

LOG_FILE=$LOCAL_HOME/log/runa_batches.$_data_day.log
PYSPARK_LOG_FILE=$LOCAL_HOME/log/hourly_aggregator.pyspark.$_data_day.log

error_message="[HDFS] Raw_log data is not ready yet:\n\t $SUCCESS_FILE not found"
$HDFS dfs -test -e $SUCCESS_FILE 2> /dev/null || error "$error_message"

# "--deploy-mode client" to get the stdout in the local server
$SPARK_SUBMIT --master yarn     \
              --deploy-mode client  \
              --queue common3       \
              --name "[TDA] Hourly data aggregator" \
              --num-executors 8     \
              --executor-cores 4    \
              --executor-memory 2g  \
              --conf spark.hadoop.yarn.timeline-service.enabled=false \
              --conf spark.serializer=org.apache.spark.serializer.KryoSerializer    \
              $PYTHON_SCRIPT -inp "$RAW_LOG_DIR"    \
                             -dt   $_data_day       \
                             -hh   $_data_hour      \
                             -lb  "${ENV_LABEL}"    \
                             -out  $OUTPUT_DIR      \
                             |& tee -a $PYSPARK_LOG_FILE | grep '\[CUSTOM\]' >> $LOG_FILE

[ ${PIPESTATUS[0]} -ne 0 ] && error "[PySpark] At hourly-aggregating raw_log data"
report "[PySpark] Hourly-aggregate dataset ready: C4000:$OUTPUT_DIR"
