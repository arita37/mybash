hadoop fs -mkdir -p /user/training/streaming
hadoop fs -conf config.xml -cp s3n://itversitydata/output /user/training/streaming/output