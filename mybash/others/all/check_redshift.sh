#!/usr/bin/env bash

: '
    Simple unit test to ensure localstack redshift is up and running
'

USER_NAME="Brian Kernighan"
PASSWORD="password"
AWS_TOOL="awslocal"
NODE_TYPE="ds2.xlarge"
CLUSTER_NAME="test-cluster"

awsInvoke() {
    aws "$@"
}

redshiftCreateCluster() {
    awsInvoke redshift create-cluster \
        --cluster-identifier "${CLUSTER_NAME}" \
        --node-type "${NODE_TYPE}" \
        --master-username "${USER_NAME}" \
        --master-user-password "${PASSWORD}" \
        --endpoint-url=http://localhost:4566
}

redshiftClusterList() {
    awsInvoke redshift describe-clusters \
        --endpoint-url=http://localhost:4566
}

redshiftDeleteUser() {
    awsInvoke redshift delete-cluster \
        --cluster-identifier "${CLUSTER_NAME}" \
        --endpoint-url=http://localhost:4566
}

main() {
    redshiftCreateCluster
    redshiftClusterList
    redshiftDeleteUser
    redshiftClusterList
}

main
