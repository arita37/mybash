#!/bin/bash

# Start the kinit refresh daemon process
/kinit-daemon.sh &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start kinit-c2000: $status"
  exit $status
fi

# Start logstash process
/start-logstash.sh &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start logstash: $status"
  exit $status
fi

while sleep 60; do
  ps aux | grep org.logstash.Logstash | grep -q -v grep
  LOGSTASH_STATUS=$?

  if [ $LOGSTASH_STATUS -ne 0 ]; then
    echo "Logstash has already exited."
    echo $LOGSTASH_STATUS
    exit 1
  fi
done