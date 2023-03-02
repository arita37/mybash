#!/bin/bash

[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -E 0 -en "$0" "$0" "$@" ||

LASTRUN_FILE='/tmp/kinit-lastrun'
LASTRUN_THRESHOLD=60
KINIT_COMMAND='kinit -kt /krb5.keytab ppp@C2000.HADOOP.zzz.COM'

CURRENT_TIME=$(date +%s)
RUN_KINIT=1
if [ -f $LASTRUN_FILE ]; then
  # doing kinit
  LASTRUN=$(<$LASTRUN_FILE)
  ELAPSED=$(expr $CURRENT_TIME - $LASTRUN)
  if [ $ELAPSED -lt $LASTRUN_THRESHOLD ]; then
    RUN_KINIT=0
  fi
fi

if [ $RUN_KINIT -eq 1 ]; then
  echo "running kinit commmand"
  $KINIT_COMMAND && echo $CURRENT_TIME > $LASTRUN_FILE
fi
