#!/bin/bash -vx

hdfs_path=
today_date=`(date -d 'now' +%Y-%m-%d)`

output_text=""



cv_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//cv/${today_date}
if [ $? -eq 0 ]
 then
	date=`hdfs dfs -ls -R ${cv_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
	time=`hdfs dfs -ls -R ${cv_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
	file_cnt_folder=`hadoop fs -ls ${cv_file} | wc -l`
	output_text="$output_text  table_path: ${cv_file} "
	output_text="$output_text \n end_time: ${date} ${time}"
	output_text="$output_text \n n_files: $file_cnt_folder "
fi

clk_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//clk/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${clk_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${clk_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${clk_file} | wc -l`
        output_text="$output_text \n table_path: ${clk_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi


imp_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//imp/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${imp_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${imp_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${imp_file} | wc -l`
        output_text="$output_text \n table_path: ${imp_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi

imp_lag_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//imp_lag_log/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${imp_lag_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${imp_lag_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${imp_lag_file} | wc -l`
        output_text="$output_text \n table_path: ${imp_lag_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi


clk_lag_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//clk_lag_log/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${clk_lag_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${clk_lag_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${clk_lag_file} | wc -l`
        output_text="$output_text \n table_path: ${clk_lag_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi


imp_cnt_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//imp_cnt_log/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${imp_cnt_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${imp_cnt_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${imp_cnt_file} | wc -l`
        output_text="$output_text \n table_path: ${imp_cnt_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi


clk_cnt_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//clk_cnt_log/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${clk_cnt_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${clk_cnt_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${clk_cnt_file} | wc -l`
        output_text="$output_text \n table_path: ${clk_cnt_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi

uv_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//user_agent/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${uv_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${uv_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${uv_file} | wc -l`
        output_text="$output_text \n table_path: ${uv_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi

gms_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//gms/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${gms_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${gms_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${gms_file} | wc -l`
        output_text="$output_text \n table_path: ${gms_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi


label_file=hdfs://user/ppp/rpp/fraud/data/dev/features_ip//label/${today_date}
if [ $? -eq 0 ]
 then
        date=`hdfs dfs -ls -R ${label_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f6`
        time=`hdfs dfs -ls -R ${label_file} |  sort -k6,7 | tail -1 | tr -s ' ' | cut -d' ' -f7`
        file_cnt_folder=`hadoop fs -ls ${label_file} | wc -l`
        output_text="$output_text \n table_path: ${label_file} "
        output_text="$output_text \n end_time: ${date} ${time}"
        output_text="$output_text \n n_files: $file_cnt_folder "
fi

