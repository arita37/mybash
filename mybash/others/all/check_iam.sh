#!/usr/bin/env bash
##### Check IAM

AWS_TOOL="awslocal"

awsInvoke() {
    awslocal "$@"
}

iamCreateUser() {
    local name="${1}"
    awsInvoke iam create-user --user-name "${name}" --endpoint-url=http://localhost:4566
}

iamUserList() {
    awsInvoke iam list-users --endpoint-url=http://localhost:4566
}

iamDeleteUser() {
    local name="${1}"
    awsInvoke iam delete-user --user-name "${name}" --endpoint-url=http://localhost:4566
}

main() {
    iamCreateUser "${USER_NAME}"
    iamUserList
    iamDeleteUser "${USER_NAME}"
    iamUserList
}

main
