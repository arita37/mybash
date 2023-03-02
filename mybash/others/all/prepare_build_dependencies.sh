#!/bin/bash

source ../scripts/nexus_deploy.sh

CURRENT_DIR=$(pwd)
TEMP_DIR=${CURRENT_DIR}/temp_dir
mkdir ${TEMP_DIR}
cd ${TEMP_DIR}

FLINK_VERSION=1.10.1
SCALA_VARIANT=scala_2.12
HADOOP_VERSION=2.6.5-8.0

FLINK_GROUP_ID=org.apache.flink

FLINK_URL_FILE_PATH=flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-${SCALA_VARIANT}.tgz
FLINK_TGZ_URL=https://www.apache.org/dyn/closer.cgi?action=download\&filename=${FLINK_URL_FILE_PATH}

FLINK_HADOOP_FILE_ARTIFACT=flink-shaded-hadoop-2-uber
FLINK_HADOOP_FILE_NAME=${FLINK_HADOOP_FILE_ARTIFACT}-${HADOOP_VERSION}.jar
FLINK_HADOOP_JAR_URL=https://repo.maven.apache.org/maven2/org/apache/flink/${FLINK_HADOOP_FILE_ARTIFACT}/${HADOOP_VERSION}/${FLINK_HADOOP_FILE_NAME}

nexus_deploy flink-bin tgz ${FLINK_VERSION}-${SCALA_VARIANT} ${FLINK_GROUP_ID} ${FLINK_TGZ_URL}
nexus_deploy flink-shaded-hadoop-2-uber jar ${HADOOP_VERSION} ${FLINK_GROUP_ID} ${FLINK_HADOOP_JAR_URL}

cd ${CURRENT_DIR}
rm -rf ${TEMP_DIR}
