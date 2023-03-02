#!/bin/bash
date="20170608"
input_file="data/rat/ebates_raw_rat_through_${date}.tsv.gz"
output_file="data/rat/ebates_listwise_through_${date}.json.gz"
nohup_out="nohup_rat_to_listwise.${date}.out"

echo "*** input file:  ${input_file} ***"
echo "*** output file: ${output_file} ***"
echo "*** log file:    ${nohup_out} ***"

nohup python src/data/ebates_rat_to_listwise_data.py \
        -i ${input_file} \
        -o ${output_file} > ${nohup_out}
 
