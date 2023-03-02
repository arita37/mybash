#!/bin/bash
date="20170608"
input_file="data/rat/ebates_listwise_through_${date}.json.gz"
output_file="data/rat/ebates_listwise_through_${date}.with-products.json.gz"
database="data/catalog/us_ebates_storage-listing-${date}.sql3"
nohup_out="nohup.merge-catalog.${date}.out"

echo "*** input file:  ${input_file} ***"
echo "*** output file: ${outpu_file} ***"
echo "*** db file:     ${database} ***"
echo "*** log file:    ${nohup_out} ***"

nohup python src/data/merge_catalog_to_rat_listwise.py \
	-i ${input_file}\
	-d ${database} \
	-o ${output_file} > ${nohup_out}
 
