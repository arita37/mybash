. www1_c6000_pro
export CLASSPATH="$(hdfs classpath --glob)"
export LD_LIBRARY_PATH="/usr/local/hdp/hadoop/lib/native:/usr/local/hdp/hadoop/lib/native/Linux-amd64-64"
export PYTHONPATH="/usr/local/hdp/spark2/python/lib/pyspark.zip:/usr/local/hdp/spark2/python/lib/py4j-0.10.9-src.zip"
export PYTHONPATH="/opt/rpp-budget/src:$PYTHONPATH"
export PATH="/opt/conda/bin:${PATH}"
export KEYTAB_FILE=/usr/local/hdp/keytabs/adopuser.p6000jp.keytab
export PRINCIPAL=adopuser@JP.HADOOP.zzz.COM
kinit.sh