#!/usr/bin/env bash

function install_hdp_client() {
    export HADOOP_INSTALL_CLIENT_OS_ID=centos7  && \
    export HADOOP_INSTALL_REGION=${DC_REGION} && \
    export HADOOP_INSTALL_CLUSTER=c6000 && \
    export HADOOP_INSTALL_DIRECTORY=/opt/hdp_c6000 && \
    export HADOOP_INSTALL_ENV=pro && \
    export HADOOP_INSTALL_JAVA_HOME=/usr/lib/jvm/jre && \
    export HADOOP_INSTALL_KRB5=yes && \
    export HADOOP_INSTALL_QUEUE=common && \
    export HADOOP_INSTALL_HIVE=yes && \
    export HADOOP_INSTALL_SPARK=no && \
    export HADOOP_INSTALL_SQOOP=no && \
    export HADOOP_INSTALL_PIG=no && \
    export HADOOP_INSTALL_HBASE=yes && \
    export HADOOP_INSTALL_BASHRC=yes && \
    ./hadoop-client-c6000/install_client.sh
}

function patch_log4j() {
    # https://confluence.zzz-it.com/confluence/display/HADOOP/Log4j2+vulnerability+fix+-+user+guide+for+all+C6000+HDP3+hadoop-clients
    TARGET_DIR=$1
    for f in $TARGET_DIR/*log4j*.properties; do
        echo >> $f
        echo "# log2j vulnerability patch" >> $f
        echo "formatMsgNoLookups = true" >> $f
    done
}

function patch_log4j_part2() {
    # https://confluence.zzz-it.com/confluence/display/HADOOP/Log4j2+vulnerability+fix+-+user+guide+for+all+C6000+HDP3+existing+hadoop-clients
    cp /opt/hdp_c6000/jars/log4j-core-2.10.0.jar /opt/hdp_c6000/hive/lib/
    # confirmation
    # ls -lrt /opt/hdp_c6000/hive/lib/ | grep -i "log4j"
    # jar -tvf /opt/hdp_c6000/hive/lib/log4j-core-2.10.0.jar | grep -i "JNDi"
}

install_hdp_client && \
patch_log4j /opt/hdp/hive/conf && \
patch_log4j_part2
