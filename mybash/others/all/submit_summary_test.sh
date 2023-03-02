#! /usr/bin/env bash

DB_CONFIG_PATH="/opt/cpc_clk_summary/conf/db_credentials_dev.yml"

dt=$1
hdfs dfs -text /user/ppp/cpc_clk_summary/daily_summaries_hsq/rpp-se-hsq_clk_summary_${dt}.json/* | python submit_summary.py "${DB_CONFIG_PATH}"
