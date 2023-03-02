# Add when downgrading to CentOS7 Not sure why these two env variables are not necessary in CentOS 8
export CLASSPATH="$(hdfs classpath --glob)"
export LD_LIBRARY_PATH="/usr/local/hdp/hadoop/lib/native:/usr/local/hdp/hadoop/lib/native/Linux-amd64-64"
export PYTHONPATH="tttcb301/sssvols05/pppppp/CodeV16:${PYTHONPATH}"
export KRB5CCNAME="/tmp/krb_simple-dash"
nohup python index.py > /tmp/simple-dash.log &