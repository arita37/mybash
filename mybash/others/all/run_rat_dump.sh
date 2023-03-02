#! /usr/bin/env bash

. www1_c6000_pro && kinit.sh

export PYSPARK_PYTHON="./CONDA_ENV/py37/bin/python"
export PYSPARK_DRIVER_PYTHON=$PYSPARK_PYTHON

spark-submit --master yarn \
            --name '[kkkma] minisqip - rat_dump' \
            --deploy-mode cluster \
            --num-executors 100 \
            --executor-cores 5 \
            --executor-memory 1g \
            --queue common2 \
            --conf spark.executor.memoryOverhead=1g \
            --conf spark.sql.shuffle.partitions=2000 \
            --conf spark.local.dir=/tmp \
            --conf spark.driver.memory=1g \
            --conf spark.yarn.maxAppAttempts=1 \
            --conf spark.yarn.keytab="$KEYTAB_FILE" \
            --conf spark.yarn.principal="$PRINCIPAL" \
            --conf spark.yarn.dist.archives=$ZIP_CONDA_PATH#CONDA_ENV,/opt/includes/iplresources.tar.gz#IPLRESOURCES,/opt/app/minisqip/conf/app.yml \
            --conf spark.yarn.appMasterEnv.IPLRESOURCES_BUILD=$IPLRESOURCES_BUILD \
            --py-files /opt/app/minisqip/utils.py \
            /opt/app/minisqip/preprocess_rat.py --conf app.yml "$@"