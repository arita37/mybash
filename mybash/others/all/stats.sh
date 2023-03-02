#!/bin/bash
input_file="data/rat/ebates_listwise_through_20170608.with-products.json.gz"

echo "**** complete listings with clicks ****"
zcat ${input_file} | grep '\"product_complete\": true' | grep -v '\"clicks\": \[\]'  | wc -l

echo "**** complete listings without clicks ****"
zcat ${input_file} | grep '\"product_complete\": true' | grep '\"clicks\": \[\]'  | wc -l

echo "**** incomplete listings with clicks ****"
zcat ${input_file} |	grep '\"product_complete\": false' | grep -v '\"clicks\": \[\]'  | wc -l

echo "**** incomplete listings without clicks ****"
zcat ${input_file} |	grep '\"product_complete\": false' | grep '\"clicks\": \[\]'  | wc -l

echo "**** Unique product with clicks and product categories ****"
zcat ${input_file} | jq .search_prod | grep "\": {" | sed -e "s/\"\: {//g" | sed -e "s/  \"//g" | sort -u > _search_prod_ids
zcat ${input_file} | jq .clicks[][1] | sed -e "s/\"//g" | cut -d '/' -f 2 | sort -u > _click_ids
sort _search_prod_ids _click_ids | uniq -d | wc -l
rm _search_prod_ids _click_ids

