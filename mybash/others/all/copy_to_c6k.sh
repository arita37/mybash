# #! /usr/bin/env bash

. hdfs_all && kinit.sh
hadoop distcp \
    -Dmapred.job.queue.name=common \
    -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1,www1ns1 \
    -skipcrccheck \
    "hdfs://nameservice1:8020/user/ppp/kkkma/rat" \
    "hdfs://www1ns1:8020/user/ppp/kkkma/rat"



dt=`date '+%Y-%m-%d'`
hadoop distcp \
    -Dmapred.job.queue.name=common \
    -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1,www1ns1 \
    -skipcrccheck \
    "hdfs://nameservice1:8020/user/ppp/kkkma/minisqip/filtered_genre_stats.parquet/dt=$dt" \
    "hdfs://www1ns1:8020/user/ppp/kkkma/minisqip/filtered_genre_stats.parquet/dt=$dt"

hadoop distcp \
    -Dmapred.job.queue.name=common \
    -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1,www1ns1 \
    -skipcrccheck \
    "hdfs://nameservice1:8020/user/ppp/kkkma/minisqip/genre_stats.parquet/dt=$dt" \
    "hdfs://www1ns1:8020/user/ppp/kkkma/minisqip/genre_stats.parquet/dt=$dt"

hadoop distcp \
    -Dmapred.job.queue.name=common \
    -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1,www1ns1 \
    -skipcrccheck \
    "hdfs://nameservice1:8020/user/ppp/kkkma/minisqip/hsq_stats.parquet/dt=$dt" \
    "hdfs://www1ns1:8020/user/ppp/kkkma/minisqip/hsq_stats.parquet/dt=$dt"
