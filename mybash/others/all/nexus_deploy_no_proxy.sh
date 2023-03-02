#!/bin/bash

function nexus_deploy_no_proxy() {
  if [ $# -eq 5 ]; then
    ARTIFACT_NAME=$1
    PACKAGING=$2
    VERSION=$3
    GROUP=$4
    URL=$5
  else
    echo "Incorrect number of arguments specified"
    exit 1
  fi

  FILE_NAME=${ARTIFACT_NAME}.${PACKAGING}

  wget -nv -O ${FILE_NAME} ${URL}
  mvn deploy:deploy-file \
    -Dmaven.wagon.http.ssl.insecure=true \
    -Dmaven.wagon.http.ssl.allowall=true \
    -Durl=https://rwasp-nexus.nnn.jp.local/repository/raw/ \
    -DrepositoryId=nexus-snapshots \
    -DgroupId=${GROUP} \
    -DartifactId=${ARTIFACT_NAME} \
    -Dversion=${VERSION} \
    -Dpackaging=${PACKAGING} \
    -Dfile=${FILE_NAME}

  rm ${FILE_NAME}
}
