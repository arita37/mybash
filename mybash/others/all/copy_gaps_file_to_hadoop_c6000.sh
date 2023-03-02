#!/bin/bash -vx

source /usr/local/proad/hdp314_www1_c6000_pro/.bashrc
kinit -kt /usr/local/proad/hdp314_www1_c6000_pro/adopuser.p6000jp.keytab adopuser
local_path=/a/ngate301/datafeed/1_prod/gaps
hdfs_path=hdfs:///user/adopuser/rpp_budget_allocation/gaps

#Copy Kakau file
hadoop fs -put -f $local_path/kakaku/kakaku.properties  $hdfs_path

#Copy Criteo file
hadoop fs -put -f  $local_path/criteo/criteo.properties $hdfs_path

#Copy Smartnews file
hadoop fs -put -f  $local_path/smartnews/smartnews.properties $hdfs_path