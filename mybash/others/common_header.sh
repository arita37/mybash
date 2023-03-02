# CONSTANTS
# =========
HADOOP_INST=/home/zzzzz/work/ttrrrc01/hdp26_c4000
source $HADOOP_INST/.bashrc.Spark2.3
export HDFS=$HADOOP_INST/hadoop/bin/hdfs
export HIVE=$HADOOP_INST/hive/bin/hive
export SPARK_SUBMIT=$HADOOP_INST/spark2.3/bin/spark-submit

# HDFS related
kinit -kt $HOME/keytabs/$USER.nnn.keytab $USER
export WORK_HDFS_HOME=/user/zzzzz/runa
export ENV_LABEL="" # Empty for PROduction

export mail_recipients="zzztt.ttrrr@zywar.com"
if [ $# -ge 1 -a -d "$1" ]
then
    export _JAVA_OPTIONS=-Djava.io.tmpdir=$1
else
    export _JAVA_OPTIONS=-Djava.io.tmpdir=/tmp
fi

_log_location="Log file: `hostname -f`:$LOG_FILE"

terminate() {
  exit 10
}

abort() {
  kill -s USR1 $$
  exit 10
}

trap "terminate" USR1

error() {
    _message=$1
    _service=$( echo $0 | awk -F'/' '{print $(NF-1), $NF}' )
    if [ "$LOG_FILE" == "_NO_LOG_" ]; then
      _log_location=""
    else
      _log_location="Log file: `hostname -f`:$LOG_FILE"
      echo "[`date`] ERROR: $_message" >> $LOG_FILE
    fi
    echo -e "$_message\n\n$_log_location" | mail -s "[TDA$ENV_LABEL] ERROR $_service" "$mail_recipients"
    abort
}

inform() {
    _level=$1
    _message=$2
    _service=$( echo $0 | awk -F'/' '{print $(NF-1), $NF}' )
    _log_location="Log file: `hostname -f`:$LOG_FILE"
    echo "[`date`] $_level: $_message" >> $LOG_FILE
    echo -e "$_message\n\n$_log_location" | mail -s "[TDA$ENV_LABEL] $_level $_service" "$mail_recipients"
}

warning() {
    echo "[`date`] WARNING: $1" >> $LOG_FILE
}

report() {
    echo "[`date`] INFO: $1" >> $LOG_FILE
}
