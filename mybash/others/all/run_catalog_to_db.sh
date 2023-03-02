#!/bin/bash
date="20170608"
nohup python ./src/data/catalog_to_db.py \
	--input_file data/catalog/us_ebates_storage-listing-${date}.gz \
	--table_name PRODUCT \
	--database data/catalog/us_ebates_storage-listing-${date}.sql3 > nohup_catalog_to_db.out &

