#!/bin/bash
# vim: et sw=4 ts=4:

# examples for silent installation
<< COMMENTOUT
export HADOOP_INSTALL_CLIENT_OS_ID="centos7"
export HADOOP_INSTALL_REGION="ecdc"
export HADOOP_INSTALL_CLUSTER="c6000"
export HADOOP_INSTALL_ENVIRONMENT="pro"
export HADOOP_INSTALL_DIRECTORY="/home/hiranotomomi01/hdp314_us_c6000_pro"
export HADOOP_INSTALL_JAVA_HOME="/usr/lib/jvm/jre"
export HADOOP_INSTALL_KRB5="yes"
export HADOOP_INSTALL_QUEUE="common-adhoc"
export HADOOP_INSTALL_HIVE="yes"
export HADOOP_INSTALL_SPARK="yes"
export HADOOP_INSTALL_HBASE="yes"
export HADOOP_INSTALL_SQOOP="yes"
export HADOOP_INSTALL_PIG="yes"
export HADOOP_INSTALL_BASHRC="yes"
COMMENTOUT

# Need to update set_prop() and set_download_server() for each.
set_prop(){
    # version information
    export CLIENT_VER="hdp314"
    export HDP_VER="3.1.4.0-315"
    export HDP_VER_SHORT="hdp3.1.4"
    export PKG_VER="3.1.4"

    # variables for environment
    os_list=("centos7" "ubuntu16" "ubuntu18")
    region_list=("jpe2" "wcdc" "ecdc" "euc1" "www1" "jpc1" "jpe1")
    cluster_list=("c4000" "c5000" "c6000")
    env_list=("pro" "stg" "dev" "lab")
}

set_download_server(){
    # repositry server
    if [ "$REGION" == "wcdc" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "pro" ];then
        DOWNLOAD_SERVERNAME="hdp-prod6000-conf.vip.las1..local"
        ZK1="hdp-jz6001.nnn.las1..local"
        ZK2="hdp-jz6002.nnn.las1..local"
        ZK3="hdp-jz6003.nnn.las1..local"
        HM1="hdp-hive6001.nnn.las1..local"
        HM2="hdp-hive6002.nnn.las1..local"
        REALM='US.HADOOP.zzz.COM'
    elif [ "$REGION" == "ecdc" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "pro" ];then
        DOWNLOAD_SERVERNAME="hdp-p6000ecdc-conf.vip.iad1..local"
        ZK1="hdp-jz6001.nnn.iad1..local"
        ZK2="hdp-jz6002.nnn.iad1..local"
        ZK3="hdp-jz6003.nnn.iad1..local"
        HM1="hdp-hive6001.nnn.iad1..local"
        HM2="hdp-hive6002.nnn.iad1..local"
        REALM='US.HADOOP.zzz.COM'
    elif [ "$REGION" == "ecdc" -a "$CLUSTER" == "c5000" -a "$ENVIRONMENT" == "pro" ];then
        DOWNLOAD_SERVERNAME="hdp-adm5001.nnn.iad1..local"
    elif [ "$REGION" == "euc1" -a "$CLUSTER" == "c6000" ];then
        DOWNLOAD_SERVERNAME="lb-100-97-126-217.lbaas.euc1a.dcnw.zzz"
        ZK1="hdp-jz6001.haas.euc1a.dcnw.zzz"
        ZK2="hdp-jz6002.haas.euc1a.dcnw.zzz"
        ZK3="hdp-jz6003.haas.euc1a.dcnw.zzz"
        HM1="hdp-hive6001.haas.euc1a.dcnw.zzz"
        HM2="hdp-hive6002.haas.euc1a.dcnw.zzz"
        REALM='EU.HADOOP.zzz.COM'
    elif [ "$REGION" == "jpe2" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "pro" ];then
        DOWNLOAD_SERVERNAME="lb-100-99-126-80.lbaas.jpe2b.dcnw.zzz"
        ZK1="hdp-jz6001.haas.jpe2b.dcnw.zzz"
        ZK2="hdp-jz6002.haas.jpe2b.dcnw.zzz"
        ZK3="hdp-jz6003.haas.jpe2b.dcnw.zzz"
        HM1="hdp-hive6001.haas.jpe2b.dcnw.zzz"
        HM2="hdp-hive6001.haas.jpe2b.dcnw.zzz"
        REALM='JP.HADOOP.zzz.COM'
    elif [ "$REGION" == "www1" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "pro" ];then
        DOWNLOAD_SERVERNAME="lb-100-96-127-92.lbaas.www1a.dcnw.zzz"
        ZK1="hdp-jz6001.haas.www1a.dcnw.zzz"
        ZK2="hdp-jz6002.haas.www1a.dcnw.zzz"
        ZK3="hdp-jz6003.haas.www1a.dcnw.zzz"
        HM1="hdp-hive6001.haas.www1a.dcnw.zzz"
        HM2="hdp-hive6002.haas.www1a.dcnw.zzz"
        REALM='JP.HADOOP.zzz.COM'
    elif [ "$REGION" == "www1" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "stg" ];then
        DOWNLOAD_SERVERNAME="lb-100-96-127-68.lbaas.www1a.dcnw.zzz"
        ZK1="stg-jz6001.haas.www1a.dcnw.zzz"
        ZK2="stg-jz6002.haas.www1a.dcnw.zzz"
        ZK3="stg-jz6003.haas.www1a.dcnw.zzz"
        HM1="stg-hive6001.haas.www1a.dcnw.zzz"
        HM2="stg-hive6002.haas.www1a.dcnw.zzz"
        REALM='JP_STG.HADOOP.zzz.COM'
    elif [ "$REGION" == "jpc1" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "pro" ];then
        DOWNLOAD_SERVERNAME="lb-100-111-126-109.lbaas.jpc1a.dcnw.zzz"
        ZK1="hdp-jz6001.haas.jpc1a.dcnw.zzz"
        ZK2="hdp-jz6002.haas.jpc1a.dcnw.zzz"
        ZK3="hdp-jz6003.haas.jpc1a.dcnw.zzz"
        HM1="hdp-hive6001.haas.jpc1a.dcnw.zzz"
        HM2="hdp-hive6002.haas.jpc1a.dcnw.zzz"
        REALM='JP.HADOOP.zzz.COM'
    elif [ "$REGION" == "jpe1" -a "$CLUSTER" == "c6000" -a "$ENVIRONMENT" == "lab" ];then
        DOWNLOAD_SERVERNAME="lab-hdp-node506.dev.hnd1..local"
        ZK1="lab-hdp-node501.dev.hnd1..local"
        ZK2="lab-hdp-node502.dev.hnd1..local"
        ZK3="lab-hdp-node503.dev.hnd1..local"
        HM1="lab-hdp-node502.dev.hnd1..local"
        HM2="lab-hdp-node503.dev.hnd1..local"
        REALM='LAB.HADOOP.zzz.COM'        
    else
        echo "Sorry, can't find the repository server. Please review Region: [${REGION}] and Cluster ID: [${CLUSTER}] and [${ENVIRONMENT}] and try again!"
        exit
    fi
    CONF_DIR="hadoop-conf-${ENVIRONMENT}-${HDP_VER_SHORT}"
    PKG_DIR="hadoop-pkg${PKG_VER}-${CLIENT_OS_ID}"

    DOWNLOAD_URL_PKG="http://${DOWNLOAD_SERVERNAME}/${PKG_DIR}"
    DOWNLOAD_URL_CONF="http://${DOWNLOAD_SERVERNAME}/${CONF_DIR}"
}

# some functions for choices for installation.
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

print_options() {
    local default=$1
    local cnt=0
    shift;
    for elem in $*; do
        ((cnt++))
        if [ "$elem" == "lab" -o "$elem" == "6000" ]; then
            continue
        fi
        if [ $elem == $default ]; then
            printf "[%s]" $default
        else
            printf $elem
        fi

        if [ $cnt !=  $# ]; then
            printf "/"
        fi
    done
}

# os_list needs to be set in set_prop().
set_client_os_id() {
    local not_correct=1
    while [ $not_correct == 1 ]; do
        if [[ -n "$HADOOP_INSTALL_CLIENT_OS_ID" ]];then
            CLIENT_OS_ID=${HADOOP_INSTALL_CLIENT_OS_ID}
            echo "Using ${CLIENT_OS_ID} as CLIENT_OS_ID"
        elif [ ${#os_list[@]} == 1 ]; then
            CLIENT_OS_ID=${os_list[0]}
            echo "Using ${CLIENT_OS_ID} as CLIENT_OS_ID"
        else
            printf "Please choose OS type ("; print_options "centos7" "${os_list[@]}"; printf "):"
            read CLIENT_OS_ID
            CLIENT_OS_ID=${CLIENT_OS_ID:-centos7}
        fi
        not_correct=0

        containsElement $CLIENT_OS_ID "${os_list[@]}"
        if [ $? != 0 ]; then
            echo "Invalid OS type!"
            unset CLIENT_OS_ID
            not_correct=1
        fi
    done
}

# region_list needs to be set in set_prop().
set_region() {
    local not_correct=1
    while [ $not_correct == 1 ]; do
        if [[ -n "$HADOOP_INSTALL_REGION" ]];then
            REGION=${HADOOP_INSTALL_REGION}
            echo "Using ${REGION} as REGION"
        elif [ ${#region_list[@]} == 1 ]; then
            REGION=${region_list[0]}
            echo "Using ${REGION} as REGION"
        else
            printf "Please choose the region ("; print_options "ecdc" "${region_list[@]}"; printf "):"
            read REGION
            REGION=${REGION:-ecdc}
        fi
        not_correct=0

        containsElement $REGION "${region_list[@]}"
        if [ $? != 0 ]; then
            echo "Invalid region!"
            unset HADOOP_INSTALL_REGION
            not_correct=1
        fi
    done
}

# cluster_list needs to be set in set_prop().
set_cluster() {
    local not_correct=1
    while [ $not_correct == 1 ]; do
        if [[ -n "$HADOOP_INSTALL_CLUSTER" ]];then
            CLUSTER=${HADOOP_INSTALL_CLUSTER}
            echo "Using ${CLUSTER} as CLUSTER"
        elif [ ${#cluster_list[@]} == 1 ]; then
            CLUSTER=${cluster_list[0]}
            echo "Using ${CLUSTER} as CLUSTER"
        elif [[ -n "$HADOOP_INSTALL_CLUSTER" ]];then
            CLUSTER=${HADOOP_INSTALL_CLUSTER}
            echo "Using ${CLUSTER} as CLUSTER"
        else
            printf "Please choose the cluster ("; print_options "c6000" "${cluster_list[@]}"; printf "):"
            read CLUSTER
            CLUSTER=${CLUSTER:-c6000}
        fi
        not_correct=0

        containsElement $CLUSTER "${cluster_list[@]}"
        if [ $? != 0 ]; then
            echo "Invalid cluster!"
            unset HADOOP_INSTALL_CLUSTER
            not_correct=1
        fi
    done
}

# env_list needs to be set in set_prop().
set_env() {
    local not_correct=1
    while [ $not_correct == 1 ]; do
        if [[ -n "$HADOOP_INSTALL_ENVIRONMENT" ]]; then
            ENVIRONMENT=${HADOOP_INSTALL_ENVIRONMENT}
            echo "Using ${ENVIRONMENT} as ENVIRONMENT"
        elif [ ${#env_list[@]} == 1 ]; then
            ENVIRONMENT=${env_list[0]}
            echo "Using ${ENVIRONMENT} as ENVIRONMENT"
        else
            printf "Please choose the environment ("; print_options "pro" "${env_list[@]}"; printf "):"
            read ENVIRONMENT
            ENVIRONMENT=${ENVIRONMENT:-pro}
        fi
        not_correct=0

        containsElement $ENVIRONMENT "${env_list[@]}"
        if [ $? != 0 ]; then
            echo "Invalid environment!"
            unset HADOOP_INSTALL_ENV
            not_correct=1
        fi
    done
}

set_dir() {
    if [[ -n "$HADOOP_INSTALL_DIRECTORY" ]];then
        DIRECTORY="${HADOOP_INSTALL_DIRECTORY}"
        echo "Using ${DIRECTORY} as DIRECTORY"
    else
        read -p "Please input installation directory (default: [${HOME}/${CLIENT_VER}_${REGION}_${CLUSTER}_${ENVIRONMENT}]): " DIRECTORY
    fi
    DIRECTORY=${DIRECTORY:-${HOME}/${CLIENT_VER}_${REGION}_${CLUSTER}_${ENVIRONMENT}}
    if [ ! -d "$DIRECTORY" ];then
        mkdir -p $DIRECTORY
    fi

    if [ "${DIRECTORY: -1}" == "/" ];then
        DIRECTORY=${DIRECTORY::-1}
    fi
}

set_java_home() {
    if [[ -n "${HADOOP_INSTALL_JAVA_HOME}" ]];then
        JAVA_HOME=${HADOOP_INSTALL_JAVA_HOME}
        echo "Using ${HADOOP_INSTALL_JAVA_HOME} as JAVA_HOME"
    else
        read -p "Please set Java home(default: [/usr/lib/jvm/jre]): " JAVA_HOME
        JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/jre}
    fi

    if [ ! -d "${JAVA_HOME}" ];then
        echo "Invalid JAVA_HOME path!"
        unset JAVA_HOME
        set_java_home
    fi

    if [ "${JAVA_HOME: -1}" == "/" ];then
        JAVA_HOME=${JAVA_HOME::-1}
    fi
}

set_krb5() {
    if [[ -n "$HADOOP_INSTALL_KRB5" ]];then
        KRB5=${HADOOP_INSTALL_KRB5}
        echo "Using ${KRB5} as KRB5"
    else
        read -p "Install krb5.conf([yes]/no): " KRB5
        KRB5=${KRB5:-yes}
    fi

    if [ "$KRB5" != "yes" -a "$KRB5" != "no" ];then
        echo "Invalid decision!"
        unset HADOOP_INSTALL_KRB5
        set_krb5
    fi
}

set_queue() {
    if [[ -n "$HADOOP_INSTALL_QUEUE" ]];then
        QUEUE=${HADOOP_INSTALL_QUEUE}
        echo "Using ${QUEUE} as QUEUE"
    else
        read -p "Please input your YARN default queue (default: [common-adhoc]): " QUEUE
        QUEUE=${QUEUE:-common-adhoc}
        if [[ -z "$QUEUE" ]];then
            echo "queue name cannot be empty!"
            unset HADOOP_INSTALL_QUEUE
            set_queue
        fi
    fi
}

set_hive() {
    if [[ -n "$HADOOP_INSTALL_HIVE" ]];then
        HIVE=${HADOOP_INSTALL_HIVE}
        echo "Using ${HIVE} as HIVE"
    else
        read -p "Install Hive([yes]/no): " HIVE
        HIVE=${HIVE:-yes}
    fi

    if [ "$HIVE" != "yes" -a "$HIVE" != "no" ];then
        echo "Please input yes or no!"
        unset HADOOP_INSTALL_HIVE
        set_hive
    fi
}

set_spark() {
    if [[ -n "$HADOOP_INSTALL_SPARK" ]];then
        SPARK=${HADOOP_INSTALL_SPARK}
        echo "Using ${SPARK} as SPARK"
    else
        read -p "Install Spark([yes]/no): " SPARK
        SPARK=${SPARK:-yes}
    fi

    if [ "$SPARK" != "yes" -a "$SPARK" != "no" ];then
        echo "Please input yes or no!"
        unset HADOOP_INSTALL_SPARK
        set_spark
    fi
}

set_hbase() {
    if [[ -n "$HADOOP_INSTALL_HBASE" ]];then
        HBASE=${HADOOP_INSTALL_HBASE}
        echo "Using ${HBASE} as HBASE"
    else
        read -p "Install Hbase([yes]/no): " HBASE
        HBASE=${HBASE:-yes}
    fi

    if [ "$HBASE" != "yes" -a "$HBASE" != "no" ];then
        echo "Please input yes or no!"
        unset HADOOP_INSTALL_HBASE
        set_hbase
    fi
}

set_sqoop() {
    if [[ -n "${HADOOP_INSTALL_SQOOP}" ]];then
        SQOOP="${HADOOP_INSTALL_SQOOP}"
        echo "Using ${SQOOP} as SQOOP"
    else
        read -p "Install Sqoop([yes]/no): " SQOOP
        SQOOP=${SQOOP:-yes}
    fi
    if [ "$SQOOP" != "yes" -a "$SQOOP" != "no" ];then
        echo "Please input yes or no!"
        unset HADOOP_INSTALL_SQOOP
        set_sqoop
    fi
}

#set_pig() {
#    if [[ -n "$HADOOP_INSTALL_PIG" ]];then
#        PIG=${HADOOP_INSTALL_PIG}
#        echo "Using ${PIG} as PIG"
#    else
#        read -p "Install Pig([yes]/no): " PIG
#        PIG=${PIG:-yes}
#    fi
#
#    if [ "$PIG" != "yes" -a "$PIG" != "no" ];then
#        echo "Please input yes or no!"
#        unset HADOOP_INSTALL_PIG
#        set_pig
#    fi
#}

set_bashrc() {
    if [[ -n "${HADOOP_INSTALL_BASHRC}" ]]; then
        BASHRC="${HADOOP_INSTALL_BASHRC}"
        echo "Using ${HADOOP_INSTALL_BASHRC} as BASHRC modification"
    else
        read -p $'\e[31mDo you want the script to Modify ~/.bashrc?([yes]/no)\e[0m: ' BASHRC
    fi
    BASHRC=${BASHRC:-yes}
    if [ "$BASHRC" != "yes" -a "$BASHRC" != "no" ];then
        echo "Please input yes or no!"
        unset HADOOP_INSTALL_BASHRC
        set_bashrc
    fi
}

download_pkg() {
    PKG_TMP="/tmp/hadoop_pkgs_${USER}"
    mkdir ${PKG_TMP}
    mkdir "${PKG_TMP}/hadoop/"

    wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/hadoop/" "$DOWNLOAD_URL_PKG/hadoop/"
    mkdir "${PKG_TMP}/hadooplzo/"
    wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/hadooplzo/" "$DOWNLOAD_URL_PKG/hadooplzo/"

    if [ "$HIVE" == "yes" ];then
        mkdir "${PKG_TMP}/hive/"
        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/hive/" "$DOWNLOAD_URL_PKG/hive/"
        mkdir "${PKG_TMP}/tez/"
        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/tez/" "$DOWNLOAD_URL_PKG/tez/"
    fi
    if [ "$SPARK" == "yes" ];then
        mkdir "${PKG_TMP}/spark2/"
        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/spark2/" "$DOWNLOAD_URL_PKG/spark2/"
        mkdir "${PKG_TMP}/hive_warehouse_connector/"
        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/hive_warehouse_connector/" "$DOWNLOAD_URL_PKG/hive_warehouse_connector/"
    fi
    if [ "$HBASE" == "yes" ];then
        mkdir "${PKG_TMP}/hbase/"
        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/hbase/" "$DOWNLOAD_URL_PKG/hbase/"
    fi
#    if [ "$PIG" == "yes" ];then
#        mkdir "${PKG_TMP}/pig/"
#        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/pig/" "$DOWNLOAD_URL_PKG/pig/"
#    fi
    if [ "$SQOOP" == "yes" ];then
        mkdir "${PKG_TMP}/sqoop/"
        wget -r -np -nd -nc -R "index.html*" -P "${PKG_TMP}/sqoop/" "$DOWNLOAD_URL_PKG/sqoop/"
    fi
}

install_hadoop_client() {
    tar -xzf ${PKG_TMP}/hadoop/hadoop-*.tar.gz -C $DIRECTORY
    ln -s `ls $DIRECTORY | grep "hadoop-"` $DIRECTORY/hadoop

    # change path to make it same as server side's.
    tar -xzf ${PKG_TMP}/hadooplzo/hadooplzo-*.tar.gz -C $DIRECTORY/hadoop/lib/
    mv $DIRECTORY/hadoop/lib/native/Linux-amd64-64/lib/* $DIRECTORY/hadoop/lib/native/Linux-amd64-64/
    rmdir $DIRECTORY/hadoop/lib/native/Linux-amd64-64/lib/

    # may need to do.
    # cp $DIRECTORY/hadoop/share/hadoop/common/lib/* $DIRECTORY/hadoop/lib

    rm -rf $DIRECTORY/hadoop/etc/hadoop/*
    wget -r -np -nd -nc -R "index.html*" -P "$DIRECTORY/hadoop/etc/hadoop/" "$DOWNLOAD_URL_CONF/hadoop/"

    if [ "$KRB5" == "yes" ];then
        wget -r -np -nd -nc -R "index.html*" -P "$DIRECTORY" "$DOWNLOAD_URL_CONF/krb5.conf"
        echo "export KRB5_CONFIG=$DIRECTORY/krb5.conf" >> $DIRECTORY/.bashrc
    fi

    echo "export HADOOP_HOME=${DIRECTORY}/hadoop" >> $DIRECTORY/.bashrc
    echo "export JAVA_HOME=${JAVA_HOME}" >> $DIRECTORY/.bashrc
    export PATH=${JAVA_HOME}/bin:${DIRECTORY}/hadoop/bin:$PATH

    echo "Hadoop core packages are installed!"
    sleep 1
}


install_hive_client() {
    tar -xzf ${PKG_TMP}/hive/apache-hive-*.tar.gz -C $DIRECTORY
    ln -s `ls $DIRECTORY | grep "apache"` $DIRECTORY/hive
    cp ${PKG_TMP}/hive/mysql-connector-java.jar $DIRECTORY/hive/lib/

    rm -rf $DIRECTORY/hive/conf/*
    wget -r -np -nd -nc -R "index.html*" -P "$DIRECTORY/hive/conf/" "$DOWNLOAD_URL_CONF/hive/"    

    echo "export HIVE_HOME=${DIRECTORY}/hive" >> $DIRECTORY/.bashrc
    export PATH=${DIRECTORY}/hive/bin:$PATH

    echo "Hive client packages are installed!"
    sleep 1
}

install_spark2_client() {
    tar -xzf ${PKG_TMP}/spark2/spark-*.tgz -C $DIRECTORY
    ln -s `ls $DIRECTORY | grep "spark"` $DIRECTORY/spark2
    cp ${PKG_TMP}/hive/mysql-connector-java.jar $DIRECTORY/spark2/jars/
    cp -r ${PKG_TMP}/hive_warehouse_connector $DIRECTORY/

    rm -rf $DIRECTORY/spark2/conf/*
    wget -r -np -nd -nc -R "index.html*" -P "$DIRECTORY/spark2/conf/" "$DOWNLOAD_URL_CONF/spark2/"

    if [ "$KRB5" == "yes" ];then
        echo "export SPARK_SUBMIT_OPTS=-Djava.security.krb5.conf=$DIRECTORY/krb5.conf" >> $DIRECTORY/.bashrc
    else
        echo "export SPARK_SUBMIT_OPTS=-Djava.security.krb5.conf=/etc/krb5.conf" >> $DIRECTORY/.bashrc
    fi

    echo "export SPARK_HOME=${DIRECTORY}/spark2" >> $DIRECTORY/.bashrc
    export PATH=${DIRECTORY}/spark2/bin:$PATH

    echo "# To access Hive" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.hadoop.hive.llap.daemon.service.hosts @llap0" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.sql.hive.hiveserver2.jdbc.url jdbc:hive2://${ZK1}:2181,${ZK2}:2181,${ZK3}:2181/hive_testdb;serviceDiscoveryMode=zooKeeperHA;zooKeeperNamespace=hs2ActivePassiveHA" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.datasource.hive.warehouse.load.staging.dir /tmp" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.datasource.hive.warehouse.metastoreUri thrift://${HM1}:9083,thrift://${HM2}:9083" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.security.credentials.hiveserver2.enabled false" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.sql.hive.hiveserver2.jdbc.url.principal hive/_HOST@${REALM}" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    echo "spark.hadoop.hive.zookeeper.quorum ${ZK1}:2181,${ZK2}:2181,${ZK3}:2181" >> $DIRECTORY/spark2/conf/spark-defaults.conf

    echo "Spark2 client packages are installed!"
    sleep 1
}

install_hbase_client() {
    tar -xzf ${PKG_TMP}/hbase/hbase-*.tar.gz -C $DIRECTORY
    ln -s `ls $DIRECTORY | grep "hbase-"` $DIRECTORY/hbase

    rm -rf $DIRECTORY/hbase/conf/*
    wget -r -np -nd -nc -R "index.html*" -P "$DIRECTORY/hbase/conf/" "$DOWNLOAD_URL_CONF/hbase/"

    # for setting env.
    echo "export HBASE_HOME=${DIRECTORY}/hbase" >> $DIRECTORY/.bashrc
    export PATH=${DIRECTORY}/hbase/bin:$PATH

    echo "Hbase client packages are installed!"
    sleep 1
}

#install_pig_client() {
#    tar -xzf ${PKG_TMP}/pig/pig-*.tar.gz -C $DIRECTORY
#    ln -s `ls $DIRECTORY | grep "pig-"` $DIRECTORY/pig
#
#    cp $CONF_PATH/pig_conf/* $DIRECTORY/pig/conf
#    sed -i 's:${HOME}/jdk:'"$JAVA_HOME"':g' $DIRECTORY/pig/conf/pig-env.sh
#    sed -i 's:${HOME}:'"$DIRECTORY"':g' $DIRECTORY/pig/conf/pig-env.sh
#    echo "export PIG_HOME=${DIRECTORY}/pig" >> $DIRECTORY/.bashrc
#    export PATH=${DIRECTORY}/pig/bin:$PATH
#
#    sed -i 's:/usr/hdp/current/pig-client/lib/piggybank.jar:'"$DIRECTORY"'/pig/lib/piggybank.jar:g' $DIRECTORY/pig/test/e2e/pig/conf/tez_rpm.conf
#    sed -i 's:/usr/hdp/current/pig-client/lib/piggybank.jar:'"$DIRECTORY"'/pig/lib/piggybank.jar:g' $DIRECTORY/pig/test/e2e/pig/conf/rpm.conf
#    echo "Pig client in $DIRECTORY is installed"
#}

install_sqoop_client() {
    tar -xzf ${PKG_TMP}/sqoop/sqoop-*.tar.gz -C $DIRECTORY
    ln -s `ls $DIRECTORY | grep "sqoop-"` $DIRECTORY/sqoop
    cp ${PKG_TMP}/hive/mysql-connector-java.jar $DIRECTORY/sqoop/lib

    rm -rf $DIRECTORY/sqoop/conf/*
    wget -r -np -nd -nc -R "index.html*" -P "$DIRECTORY/sqoop/conf/" "$DOWNLOAD_URL_CONF/sqoop/"

    echo "export SQOOP_HOME=${DIRECTORY}/sqoop" >> $DIRECTORY/.bashrc
    export PATH=${DIRECTORY}/sqoop/bin:$PATH

    echo "Sqoop client packages are installed!"
    sleep 1
}

update_hadoop_conf() {
    echo "Updating configuration files for hadoop client..."

    # edit hadoop-env.sh
    echo "" >> $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    sed -i "s;export JAVA_HOME=.*$;export JAVA_HOME="$JAVA_HOME";g" $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    sed -i "s;export HADOOP_HOME=.*$;export HADOOP_HOME="$DIRECTORY/hadoop";g" $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    sed -i "s;export HADOOP_LIBEXEC_DIR=.*$;export HADOOP_LIBEXEC_DIR="$DIRECTORY/hadoop/libexec";g" $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    sed -i "s;export JAVA_LIBRARY_PATH=.*$;export JAVA_LIBRARY_PATH=\${JAVA_LIBRARY_PATH}:"$DIRECTORY/hadoop/lib/native/Linux-amd64-64";g" $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh

    # add to hadoo-env.sh (HADOOP_CLASSPATH is require for LZO. Tomo is not sure we need hive and spark libs here...)
    #echo "export HADOOP_CLASSPATH=\$HADOOP_CLASSPATH:$DIRECTORY/hadoop/lib/*:$DIRECTORY/hive/lib/*:$DIRECTORY/spark2/jars/*" >> $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    echo "export HADOOP_CLASSPATH=\$HADOOP_CLASSPATH:$DIRECTORY/hadoop/lib/*" >> $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    sed -i "1s;^.*$;export HDP_VERSION=${HDP_VER};g" $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh

    if [ "$KRB5" == "yes" ];then
        sed -i 's;$HADOOP_OPTS\"$;$HADOOP_OPTS -Djava.security.krb5.conf='"$DIRECTORY"'/krb5.conf\";g' $DIRECTORY/hadoop/etc/hadoop/hadoop-env.sh
    fi

    # edit yarn-env.sh
    sed -i "s;export JAVA_HOME=.*$;export JAVA_HOME="$JAVA_HOME";g" $DIRECTORY/hadoop/etc/hadoop/yarn-env.sh
    sed -i "s;export HADOOP_YARN_HOME=.*$;export HADOOP_YARN_HOME="$DIRECTORY/hadoop";g" $DIRECTORY/hadoop/etc/hadoop/yarn-env.sh
    sed -i "s;export HADOOP_LIBEXEC_DIR=.*$;export HADOOP_LIBEXEC_DIR="$DIRECTORY/hadoop/libexec";g" $DIRECTORY/hadoop/etc/hadoop/yarn-env.sh

    # edit mapred-env.sh
    echo "" >> $DIRECTORY/hadoop/etc/hadoop/mapred-env.sh
    sed -i "1s;^.*$;export HDP_VERSION=${HDP_VER};g" $DIRECTORY/hadoop/etc/hadoop/mapred-env.sh

    for TARGET_FILE in core-site.xml hadoop-policy.xml hdfs-site.xml kms-acls.xml kms-site.xml resource-types.xml ssl-client.xml ssl-server.xml yarn-site.xml
    do
cat <<EOF > $DIRECTORY/hadoop/etc/hadoop/${TARGET_FILE}
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
        <xi:include href="$DOWNLOAD_URL_CONF/hadoop/${TARGET_FILE}" />

</configuration>
EOF
    done

    # need to set queue for mapred-site.xml
cat <<EOF > $DIRECTORY/hadoop/etc/hadoop/mapred-site.xml
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
    <xi:include href="$DOWNLOAD_URL_CONF/hadoop/mapred-site.xml" />

    <property>
        <name>mapreduce.job.queuename</name>
        <value>${QUEUE}</value>
    </property>

</configuration>
EOF

    # delete unnecessary file.
    rm $DIRECTORY/hadoop/etc/hadoop/capacity-scheduler.xml

    for TARGET_FILE in hadoop-env.sh yarn-env.sh mapred-env.sh core-site.xml hadoop-policy.xml hdfs-site.xml kms-acls.xml kms-site.xml resource-types.xml ssl-client.xml ssl-server.xml yarn-site.xml mapred-site.xml
    do
        if [ -f "$DIRECTORY/hadoop/etc/hadoop/${TARGET_FILE}" ]; then
            echo "$DIRECTORY/hadoop/etc/hadoop/${TARGET_FILE} is updated."
        else
            echo "ERROR: There is problem with $DIRECTORY/hadoop/etc/hadoop/${TARGET_FILE} ..."
            exit 1
        fi
    done

    echo "Configuration files for hadoop client are updated!"
}

update_hive_conf() {
    echo "Updating configuration files for hive..."

    #sed -i 's:${HOME}/jdk:'"$JAVA_HOME"':g' $DIRECTORY/hive/conf/hive-env.sh
    #sed -i 's:${HOME}:'"$DIRECTORY"':g' $DIRECTORY/hive/conf/hive-env.sh
    sed -i "s;HADOOP_HOME=.*$;export HADOOP_HOME="$DIRECTORY/hadoop";g" $DIRECTORY/hive/conf/hive-env.sh
    sed -i "s;export HIVE_HOME=.*$;export HIVE_HOME="$DIRECTORY/hive";g" $DIRECTORY/hive/conf/hive-env.sh
    sed -i "s;export HIVE_CONF_DIR=.*$;export HIVE_CONF_DIR="$DIRECTORY/hive/conf";g" $DIRECTORY/hive/conf/hive-env.sh

    # edit site.xml files
    for XML_FILE in beeline-site.xml hive-site.xml ivysettings.xml mapred-site.xml
    do
cat <<EOF > $DIRECTORY/hive/conf/${XML_FILE}
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
        <xi:include href="$DOWNLOAD_URL_CONF/hive/${XML_FILE}" />

</configuration>
EOF
    done

    for TARGET_FILE in hive-env.sh beeline-site.xml hive-site.xml ivysettings.xml mapred-site.xml
    do
        if [ -f "$DIRECTORY/hive/conf/${TARGET_FILE}" ]; then
            echo "$DIRECTORY/hive/conf/${TARGET_FILE} is updated."
        else
            echo "ERROR: There is problem with $DIRECTORY/hive/conf/${TARGET_FILE} ..."
            exit 1
        fi
    done

    echo "Configuration files for Hive client are updated!"
}

update_spark2_conf() {
    echo "Updating configuration files for Spark client..."

    # edit spark-default.conf
    echo "" >> $DIRECTORY/spark2/conf/spark-defaults.conf
    sed -i "s;spark.driver.extraLibraryPath.*$;spark.driver.extraLibraryPath $DIRECTORY/hadoop/lib/native:$DIRECTORY/hadoop/lib/native/Linux-amd64-64;g" $DIRECTORY/spark2/conf/spark-defaults.conf
    sed -i "s;spark.sql.hive.metastore.jars.*$;spark.sql.hive.metastore.jars $DIRECTORY/spark2/standalone-metastore/*;g" $DIRECTORY/spark2/conf/spark-defaults.conf
    sed -i "s;spark.yarn.queue.*$;spark.yarn.queue ${QUEUE};g" $DIRECTORY/spark2/conf/spark-defaults.conf

    # edit spark-env.sh
    sed -i "s;export SPARK_CONF_DIR=.*$;export SPARK_CONF_DIR=$DIRECTORY/spark2/conf;g" $DIRECTORY/spark2/conf/spark-env.sh
    sed -i "s;export HADOOP_HOME=.*$;export HADOOP_HOME=$DIRECTORY/hadoop;g" $DIRECTORY/spark2/conf/spark-env.sh
    sed -i "s;export HADOOP_CONF_DIR=.*$;export HADOOP_CONF_DIR=$DIRECTORY/hadoop/etc/hadoop;g" $DIRECTORY/spark2/conf/spark-env.sh
    sed -i "s;export JAVA_HOME=.*$;export JAVA_HOME=$JAVA_HOME\n;g" $DIRECTORY/spark2/conf/spark-env.sh

    # add new to spark-env.sh
    echo "export SPARK_HOME=$DIRECTORY/spark2" >> $DIRECTORY/spark2/conf/spark-env.sh
    echo "export HADOOP_LZO_DIR=$DIRECTORY/hadoop/lib" >> $DIRECTORY/spark2/conf/spark-env.sh
    echo "export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$DIRECTORY/spark2/*:$DIRECTORY/spark2/jars/*:$DIRECTORY/hadoop/lib/*:$DIRECTORY/hadoop/lib/native/*:$DIRECTORY/hadoop/lib/native/Linux-amd64-64/*" >> $DIRECTORY/spark2/conf/spark-env.sh
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIRECTORY/hadoop/lib/native:$DIRECTORY/hadoop/lib/native/Linux-amd64-64" >> $DIRECTORY/spark2/conf/spark-env.sh
    echo "export SPARK_CLASSPATH=$SPARK_CLASSPATH:$DIRECTORY/hadoop/lib/native/*:$DIRECTORY/hadoop/lib/native/Linux-amd64-64/*:$DIRECTORY/spark2/jars/*:$CLASSPATH" >> $DIRECTORY/spark2/conf/spark-env.sh
    echo "export HDP_VERSION=${HDP_VER}" >> $DIRECTORY/spark2/conf/spark-env.sh

    # edit spark2/bin/spark-class
    sed -i "s;HADOOP_LZO_DIR=.*$;HADOOP_LZO_DIR=$DIRECTORY/hadoop/lib;g" $DIRECTORY/spark2/bin/spark-class
 
    # add to spark-env.sh for hbase client.
    if [ "$HBASE" == "yes" ];then
      echo "export SPARK_CLASSPATH=\$SPARK_CLASSPATH:${DIRECTORY}/hbase/lib/*" >> $DIRECTORY/spark2/conf/spark-env.sh
    fi

    # edit site.xml files
    for XML_FILE in hive-site.xml
    do
cat <<EOF > $DIRECTORY/spark2/conf/${XML_FILE}
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
        <xi:include href="$DOWNLOAD_URL_CONF/spark2/${XML_FILE}" />

</configuration>
EOF
    done

    for TARGET_FILE in spark-defaults.conf spark-env.sh hive-site.xml
    do
        if [ -f "$DIRECTORY/spark2/conf/${TARGET_FILE}" ]; then
            echo "$DIRECTORY/spark2/conf/${TARGET_FILE} is updated."
        else
            echo "ERROR: There is problem with $DIRECTORY/spark2/conf/${TARGET_FILE} ..."
            exit 1
        fi
    done

    for TARGET_FILE in spark-class
    do
        if [ -f "$DIRECTORY/spark2/bin/${TARGET_FILE}" ]; then
            echo "$DIRECTORY/spark2/bin/${TARGET_FILE} is updated."
        else
            echo "ERROR: There is problem with $DIRECTORY/spark2/bin/${TARGET_FILE} ..."
            exit 1
        fi
    done

    echo "Configuration files for Spark client are updated!"
}

update_hbase_conf() {
    echo "Updating configuration files for HBase client..."

    # edit hbase-env.sh
    sed -i "s;export JAVA_HOME=.*$;export JAVA_HOME="$JAVA_HOME";g" $DIRECTORY/hbase/conf/hbase-env.sh
    sed -i "s;export HBASE_CONF_DIR=.*$;export HBASE_CONF_DIR="$DIRECTORY/hbase/conf";g" $DIRECTORY/hbase/conf/hbase-env.sh
    sed -i "s;export HBASE_CLASSPATH=.*$;export HBASE_CLASSPATH=\${HBASE_CLASSPATH}:"$DIRECTORY/hadoop/etc/hadoop";g" $DIRECTORY/hbase/conf/hbase-env.sh
    sed -i "s;/usr/hdp/current/hbase-client/conf/hbase_client_jaas.conf;"$DIRECTORY"/hbase/conf/hbase_client_jaas.conf;g" $DIRECTORY/hbase/conf/hbase-env.sh

    # add to hbase-env.sh
    echo "" >> $DIRECTORY/hbase/conf/hbase-env.sh
    echo "export HADOOP_CONF_DIR=$DIRECTORY/hadoop/etc/hadoop" >> $DIRECTORY/hbase/conf/hbase-env.sh
    if [ "$KRB5" == "yes" ];then
        echo 'export HBASE_OPTS="$HBASE_OPTS -Djava.security.krb5.conf='"$DIRECTORY"'/krb5.conf"' >> $DIRECTORY/hbase/conf/hbase-env.sh
    fi

    # edit site.xml files
    for XML_FILE in hbase-policy.xml hbase-site.xml
    do
cat <<EOF > $DIRECTORY/hbase/conf/${XML_FILE}
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
        <xi:include href="$DOWNLOAD_URL_CONF/hbase/${XML_FILE}" />

</configuration>
EOF
    done

    # delete unnecessary file.
    rm $DIRECTORY/hbase/conf/regionservers

    for TARGET_FILE in hbase-env.sh hbase-policy.xml hbase-site.xml
    do
        if [ -f "$DIRECTORY/hbase/conf/${TARGET_FILE}" ]; then
            echo "$DIRECTORY/hbase/conf/${TARGET_FILE} is updated."
        else
            echo "ERROR: There is problem with $DIRECTORY/hbase/conf/${TARGET_FILE} ..."
            exit 1
        fi
    done

    echo "Configuration files for HBase client are updated!"
}

update_sqoop_conf() {
    echo "Updating configuration files for Sqoop client..."

    # edit sqoop-env.sh
    echo "" >> $DIRECTORY/sqoop/conf/sqoop-env.sh
    sed -i "s;export HADOOP_HOME=.*$;export HADOOP_HOME="$DIRECTORY/hadoop";g" $DIRECTORY/sqoop/conf/sqoop-env.sh
    sed -i "s;export HBASE_HOME=.*$;export HBASE_HOME="$DIRECTORY/hbase";g" $DIRECTORY/sqoop/conf/sqoop-env.sh
    sed -i "s;export HIVE_HOME=.*$;export HIVE_HOME="$DIRECTORY/hive";g" $DIRECTORY/sqoop/conf/sqoop-env.sh

    # edit site.xml files
    for XML_FILE in sqoop-site.xml
    do
cat <<EOF > $DIRECTORY/sqoop/conf/${XML_FILE}
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
        <xi:include href="$DOWNLOAD_URL_CONF/sqoop/${XML_FILE}" />

</configuration>
EOF
    done

    for TARGET_FILE in sqoop-env.sh sqoop-site.xml
    do
        if [ -f "$DIRECTORY/sqoop/conf/${TARGET_FILE}" ]; then
            echo "$DIRECTORY/sqoop/conf/${TARGET_FILE} is updated."
        else
            echo "ERROR: There is problem with $DIRECTORY/sqoop/conf/${TARGET_FILE} ..."
            exit 1
        fi
    done

    echo "Configuration files for Sqoop client are updated!"
}

create_bashrc() {
    echo "export PATH=$PATH" >> $DIRECTORY/.bashrc
    echo "$DIRECTORY/.bashrc is created successfully."

    if [ "$BASHRC" == "yes" ];then
        isAlias=`cat ~/.bashrc | grep "${CLIENT_VER}_${REGION}_${CLUSTER}_${ENVIRONMENT}"`
        if [ -z "$isAlias" ];then
            echo "alias ${CLIENT_VER}_${REGION}_${CLUSTER}_${ENVIRONMENT}='. $DIRECTORY/.bashrc'" >> ~/.bashrc
            echo -e "\e[31malias \"${CLIENT_VER}_${REGION}_${CLUSTER}_${ENVIRONMENT}\" was added to your ~/.bashrc\e[m"  
        fi
        echo -e "\e[31mPlease execute \"${CLIENT_VER}_${REGION}_${CLUSTER}_${ENVIRONMENT}\" to set environment for hadoop client for each login.\e[m"
    fi
}

main() {
  set_prop
  echo "Default option is marked with []"
  cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null
  set_client_os_id
  set_region
  set_cluster
  set_env
  set_dir
  set_java_home
  set_krb5
  set_queue
  set_hive
  set_spark
  set_hbase
#  set_pig
  set_sqoop
  set_bashrc

  set_download_server
  download_pkg

  install_hadoop_client

  # install_spark2_client needs to be before hive for PATH setting (beeline issue).
  if [ "$SPARK" == "yes" ];then
    install_spark2_client
  fi

  if [ "$HIVE" == "yes" ];then
    install_hive_client
  fi

  if [ "$HBASE" == "yes" ];then
    install_hbase_client
  fi

  if [ "$SQOOP" == "yes" ];then
    install_sqoop_client
  fi

  update_hadoop_conf

  if [ "$SPARK" == "yes" ];then
    update_spark2_conf
  fi

  if [ "$HIVE" == "yes" ];then
    update_hive_conf
  fi

  if [ "$HBASE" == "yes" ];then
    update_hbase_conf
  fi

  if [ "$SQOOP" == "yes" ];then
    update_sqoop_conf
  fi

  create_bashrc

  rm -rf ${PKG_TMP}
  echo "All Hadoop clients installation is completed."
}

main
