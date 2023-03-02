#!/usr/bin/env bash
spark-submit \
    --conf spark.app.name="[TEST] Compute RPP+SE Search Daily Summary" \
    --conf spark.master=yarn \
    --conf spark.submit.deployMode=cluster \
    --conf spark.executor.instances=2 \
    --conf spark.executor.cores=5 \
    --conf spark.executor.memory=8g \
    --conf spark.yarn.queue=common2 \
    --conf spark.executor.memoryOverhead=8g \
    --conf spark.sql.shuffle.partitions=2000 \
    --conf spark.driver.memory=8g \
    --conf spark.yarn.maxAppAttempts=1 \
    --conf spark.yarn.keytab="/usr/local/hdp26/keytabs/ppp.nnn.keytab" \
    --conf spark.yarn.principal="ppp@C2000.HADOOP.zzz.COM" \
    --conf spark.yarn.dist.archives=hdfs:///user/ppp/cpc_clk_summary_test/resources/dev/base_env.zip#CONDA_ENV,hdfs:///user/ppp/cpc_clk_summary_test/resources/dev/iplresources.tar.gz#IPLRESOURCES \
    --conf spark.yarn.appMasterEnv.PYSPARK_PYTHON="./CONDA_ENV/bin/python" \
    --conf spark.yarn.appMasterEnv.PYSPARK_DRIVER_PYTHON="./CONDA_ENV/bin/python" \
    --conf spark.driver.extraJavaOptions=-Djava.library.path=/usr/hdp/current/hadoop-client/lib/native:/usr/hdp/current/hadoop-client/lib/native/Linux-amd64-64 \
    compute_summary.py --look_back 3 --hdfs_root=cpc_clk_summary_test


