#!/bin/bash -vx

. /usr/local/proad/hdp26_jp_c4000_pro/.bashrc
kinit -kt /usr/local/proad/hdp26_jp_c4000_pro/aduser.nnn.keytab aduser
local_path=/a/ngate301/datafeed/1_prod/gaps
hdfs_path=hdfs:///user/aduser/rpp_budget_allocation/gaps
hadoop_path=/usr/local/proad/hdp26_jp_c4000_pro/hadoop/bin

#Copy Kakau file
$hadoop_path/hadoop fs -copyFromLocal -f  $local_path/kakaku/kakaku.properties  $hdfs_path

#Copy Criteo file
$hadoop_path/hadoop fs -copyFromLocal -f  $local_path/criteo/criteo.properties $hdfs_path

#Copy Smartnews file
$hadoop_path/hadoop fs -copyFromLocal -f  $local_path/smartnews/smartnews.properties $hdfs_path