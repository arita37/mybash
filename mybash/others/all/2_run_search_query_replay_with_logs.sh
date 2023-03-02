#!/usr/bin/env bash

# re-play Ebates queries to capture SQIP and Solr signals
# to run this script, it is necessary to ssh tunnel to the  staging system
# For instance, when using the laptop, it is necessary to run this command:
# ssh -L 8888:us2p-gsp29i-gtw-001.nnn.iad1..local:9006 difabbriziog01@104.241.202.28
# see also: https://confluence.zzz-it.com/confluence/pages/viewpage.action?pageId=865076272
# Query example:
# http://localhost:8888/search/v2/us_ebates_search/listing.json?sid=test&authkey=test&query=&queryversion=2.6&offset=0&wt_pipeline=ebates-result-reorder-pipeline&qt_pipeline=ebates-query-pipeline&facetresponseformat=json&scoredebug=true&queryId=4c9ff3e2-6122-4f62-b3f5-030e2fb69946&querySubId=1&hits=20&postfilter=field:storeId%20values:123%20invert:true&postfilter=field:storeId%20values:15624,15192,4633%20invert:true&filter=imagePresent:true&filter=NOT%20brandNameEbates:%22South%20Shore%22&filter=NOT%20brandNameEbates:%22Baby%20K%27Tan%22&filter=NOT%20brandNameEbates:%22delonghi%22&filter=NOT%20brandNameEbates:%22braun%22&filter=NOT%20brandNameEbates:%22kenwood%22&filter=NOT%20brandNameEbates:%22schoenhut%22


export PYTHONIOENCODING=UTF-8


function replay_queries_with_products() {

	# Note: this will attach the query info before merging with the catalog
	# To merge with the catalog, it is necessary to run another script
	# Note: the latest search_query_rerun.py includes several additional signals
	# and the output files are identified by '.extended.' in the file name

	input_data_dir="data/rat/merged-with-logs"
	output_data_dir="data/processed"
	mkdir -p ${output_data_dir}

	for file in ${input_data_dir}/00*.json.gz; do
		echo "##############################################"
		echo "       Processing File: ${file}"
		echo "##############################################"

        output_file_name=$(basename $file)
		output_file_name="${output_data_dir}/${output_file_name%.json.gz}-with-signals.json.gz"
        python3 ./src/data/search_query_replay_with_logs.py -i ${file} -o ${output_file_name} --verbose -l  ${output_file_name}.log
	done
}

# ---- Main ----
replay_queries_with_products

