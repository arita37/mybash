function setup_hdp_envs {
    export KRB5_CONFIG=/opt/hdp/krb5.conf
    export HADOOP_HOME=/opt/hdp/hadoop
    export JAVA_HOME=/opt/hdp/jdk
    export SPARK_SUBMIT_OPTS=-Djava.security.krb5.conf=/opt/hdp/krb5.conf
    export SPARK_HOME=/opt/hdp/spark2
    export HIVE_HOME=/opt/hdp/hive
    export TEZ_HOME=/opt/hdp/tez
    export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export PATH=$TEZ_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$JAVA_HOME/bin:$HADOOP_HOME/bin:$PATH
}

KEYTAB=/opt/hdp_c6000/keytabs/ppp.p6000jp.keytab
USER=ppp@JP.HADOOP.zzz.COM

setup_hdp_envs && \
kinit -kt $KEYTAB $USER
