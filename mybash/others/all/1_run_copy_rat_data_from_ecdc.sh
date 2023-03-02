#!/usr/bin/env bash
# Copy data from ECDC to local folders

months="2017_09 2017_10 2017_11 2017_12"

data_src="node11:/home/linyiuchang01"
data_dest="data/rat"

for month in months;
    dir_dest="${data_dest}/ebates_rat_${month}/"
    dir_src="${data_src}/ebates_rat_${month}/*.json"
    mkdir -p ${dir_dest}
    echo  "${dir_src} -> ${dir_dest}"
    rsync -avz --progress $dir_src $dir_dest
    for f in ${dir_dest}/*.json; do
        echo "Compressing $f"
        gzip -f $f
    done
done