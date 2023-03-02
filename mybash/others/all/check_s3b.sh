#!/usr/bin/env bash

: '
    Simple unit test to ensure localstack is up and running
'

BUCKET_NAME="example-bucket"

s3CreateBucket() {
    local name="${1}"
    awslocal s3api create-bucket --bucket "${name}"    
}

s3BucketList() {
    awslocal s3 ls
}

s3DeleteBucket() {
    local name="${1}"
    awslocal s3api delete-bucket --bucket "${name}"
}

main() {
    s3CreateBucket "${BUCKET_NAME}"
    s3BucketList
    s3DeleteBucket "${BUCKET_NAME}"
    s3BucketList
}

main
