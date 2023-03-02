#!/usr/bin/env bash

set -ex

# hadoop
export CLASSPATH=`$HADOOP_HOME/bin/hdfs classpath --glob`
. www1_c6000_pro
kinit.sh

pipenv run jupyter lab \
    --ip=0.0.0.0 \
    --port=443 \
    --notebook-dir='/home/nbuser/notebooks' \
    --certfile=/home/nbuser/.secrets/dask-k8s.pem \
    --keyfile=/home/nbuser/.secrets/dask-k8s.key \
    --no-browser