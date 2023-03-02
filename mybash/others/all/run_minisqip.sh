#! /usr/bin/env bash

. www1_c6000_pro && kinit.sh

export PYSPARK_PYTHON="./CONDA_ENV/py37/bin/python"
export PYSPARK_DRIVER_PYTHON=$PYSPARK_PYTHON

spark-submit --master yarn \
            --name '[kkkma] minisqip' \
            --deploy-mode cluster \
            --num-executors 100 \
            --executor-cores 5 \
            --executor-memory 8g \
            --queue common2 \
            --conf spark.executor.memoryOverhead=4g \
            --conf spark.sql.shuffle.partitions=2000 \
            --conf spark.driver.memory=8g \
            --conf spark.yarn.maxAppAttempts=1 \
            --conf spark.yarn.keytab="$KEYTAB_FILE" \
            --conf spark.yarn.principal="$PRINCIPAL" \
            --conf spark.yarn.dist.archives=$ZIP_CONDA_PATH#CONDA_ENV,/opt/app/minisqip/conf/app.yml \
            --py-files /opt/app/minisqip/utils.py \
            /opt/app/minisqip/minisqip.py --conf app.yml