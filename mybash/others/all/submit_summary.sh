#! /usr/bin/env bash

# date=$1
# hdfs dfs -text cpc_clk_summary/daily_summaries/cpc_clk_summary_${date}.json/* | gzip > clk_summary_${date}.json.gz
# # curl --netrc-file .netrc -F "file=@clk_summary_${date}.json.gz" "bpiop215.nnn.hnd1..local:8080/cpc/submit/clk_summary/v9"
# # curl --netrc-file .netrc -F "file=@clk_summary_${date}.json.gz" "mesos101.nnn.hnd2..local:10015/cpc/submit/clk_summary/v9"
#
# # v11 !!
# curl --netrc-file .netrc -F "file=@clk_summary_${date}.json.gz" "mesos101.nnn.hnd2..local:10014/cpc/submit/clk_summary/v11"

dt=$1
export PATH=/opt/conda/bin:$PATH
hdfs dfs -text /user/ppp/cpc_clk_summary/daily_summaries_hsq/rpp-se-hsq_clk_summary_${dt}.json/* | python submit_summary.py
