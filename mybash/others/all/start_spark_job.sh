#!/usr/bin/env bash

export PYSPARK_PYTHON="./CONDA_ENV/bin/python"
export PYSPARK_DRIVER_PYTHON=$PYSPARK_PYTHON
KEYTAB=$DIRECTORY/ppp.nnn.keytab
ZIP_CONDA_PATH=$HOME/.envs/base_env.zip

spark-submit --master yarn \
             --deploy-mode cluster \
             --num-executors 100 \
             --executor-cores 5 \
             --executor-memory 8g \
             --queue common2 \
             --files hive-site.xml \
             --conf spark.executor.memoryOverhead=8g \
             --conf spark.sql.shuffle.partitions=2000 \
             --conf spark.driver.memory=8g \
             --conf spark.yarn.maxAppAttempts=1 \
             --conf spark.yarn.keytab="$KEYTAB" \
             --conf spark.yarn.principal="ppp@C2000.HADOOP.zzz.COM" \
             --conf spark.yarn.dist.archives=$ZIP_CONDA_PATH#CONDA_ENV,/opt/cpc_clk_summary/resources/iplresources.tar.gz#IPLRESOURCES \
             compute_summary.py --look_back 30
