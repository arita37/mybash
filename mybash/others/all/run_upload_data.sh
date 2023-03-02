#!/bin/bash

# create a sqlite product catalog from the JSON dump and upload
# both historical and current product entries

#data_dir='data/db/dump_20161201'
#db_file='product_info_full_dump_20161201.sl3'

#data_dir='data/db/dump_20161208'
#db_file='product_info_full_dump_20161208.sl3'

data_dir='data/db/dump_20170109'
db_file='product_info_full_dump_20170109.sl3'

mkdir -p $data_dir

function upload_historical_data() {
	hist_data_file='us_mall_storage-all_items.gz'

	./src/data/upload_data.py \
			--input_file ${data_dir}/${hist_data_file} \
			--data_base ${data_dir}/${db_file} \
			--zap
	echo "Created and updated database ${data_dir}/${db_file} "
}


function upload_currrent_data() {
	#current_data_file='us_mall_storage-item.gz'
	#current_data_file='us_mall_storage-item-20161208.gz'
        current_data_file='us_mall_storage-item-20170109.gz'


	./src/data/upload_data.py \
			--input_file ${data_dir}/${current_data_file} \
			--data_base ${data_dir}/${db_file}
	echo "Updated database ${data_dir}/${db_file} "
}

# main

#upload_historical_data
upload_currrent_data
