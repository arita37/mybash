#!/bin/sh

set -e
# broker|coordinator|historical|middleManager|overlord
SERVICE="$1"

echo "$(date -Is) startup service ${SERVICE}"

CONF_DIR="${DRUID_CONF_DIR:=conf/druid}"
LOG_DIR="${DRUID_LOG_DIR:=log}"

cd /opt/druid

mkdir -p var/tmp var/druid/segments var/druid/indexing-logs var/druid/task var/druid/hadoop-tmp var/druid/segment-cache
mkdir -p log

# common
cp -p conf/${DRUID_VERSION}/_common/common.runtime.properties    ${CONF_DIR}/_common/
cp -p conf/${DRUID_VERSION}/_common/jets3t.properties            ${CONF_DIR}/_common/

# service
cp -p conf/${DRUID_VERSION}/${SERVICE}/runtime.properties        ${CONF_DIR}/${SERVICE}/

# start service
exec java ${JAVA_OPTS} -cp ${CONF_DIR}/_common:${CONF_DIR}/${SERVICE}:lib/*: io.druid.cli.Main server $@ >> ${LOG_DIR}/${SERVICE}.log 2>&1
