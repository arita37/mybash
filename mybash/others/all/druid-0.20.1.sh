#!/bin/sh

set -e
# broker|coordinator|historical|middleManager|overlord|router
SERVICE="$1"

echo "$(date -Is) startup service ${SERVICE}"

getConfPath() {
  cluster_conf_base="$1"
  service="$2"
  case "$service" in
    _common) echo $cluster_conf_base/_common ;;
    historical) echo $cluster_conf_base/data/historical ;;
    middleManager) echo $cluster_conf_base/data/middleManager ;;
    coordinator | overlord) echo $cluster_conf_base/master/coordinator-overlord ;;
    broker) echo $cluster_conf_base/query/broker ;;
    router) echo $cluster_conf_base/query/router ;;
  esac
}
COMMON_CONF_DIR_SRC=$(getConfPath /opt/druid/conf/${DRUID_VERSION} _common)
COMMON_CONF_DIR_DST=$(getConfPath /opt/druid/conf/druid/cluster _common)
SERVICE_CONF_DIR_SRC=$(getConfPath /opt/druid/conf/${DRUID_VERSION} ${SERVICE})
SERVICE_CONF_DIR_DST=$(getConfPath /opt/druid/conf/druid/cluster ${SERVICE})
LOG_DIR="${DRUID_LOG_DIR:=log}"

cd /opt/druid

mkdir -p var/tmp var/druid/segments var/druid/indexing-logs var/druid/task var/druid/hadoop-tmp var/druid/segment-cache
mkdir -p log

# common
cp -p ${COMMON_CONF_DIR_SRC}/common.runtime.properties    ${COMMON_CONF_DIR_DST}
# Use the official aws-sdk instead of jets3t https://github.com/apache/druid/pull/5382 ,
# thus aws.region needs to be set explicitly (See jvm.config)
#cp -p ${COMMON_CONF_DIR_SRC}/jets3t.properties            ${COMMON_CONF_DIR_DST}

# service
cp -p ${SERVICE_CONF_DIR_SRC}/runtime.properties  ${SERVICE_CONF_DIR_DST}
cp -p ${SERVICE_CONF_DIR_SRC}/jvm.config          ${SERVICE_CONF_DIR_DST}
JAVA_OPTS="$JAVA_OPTS $(cat ${SERVICE_CONF_DIR_DST}/jvm.config | xargs)"

# start service
exec java ${JAVA_OPTS} -cp ${COMMON_CONF_DIR_DST}:${SERVICE_CONF_DIR_DST}:lib/*: org.apache.druid.cli.Main server $@ >> ${LOG_DIR}/${SERVICE}.log 2>&1
