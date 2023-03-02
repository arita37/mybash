#!/usr/bin/env bash
if [ ! -d "$HOME/.aws" ]; then
    mkdir -p $HOME/.aws
fi
fname="$HOME/.aws/spotprice_list.txt"
region='us-west-2'
echo "Fetching spot prices for regions and instance type in $fname"
echo "Price,Instance,Region" > $fname
curl -s 'http://spot-price.s3.amazonaws.com/spot.js' | sed 's/callback(//g;s/)\;//g' | jq -r '[.config.regions[] | {region:.region, size:(.instanceTypes[].sizes[])}] | map("\(.size.valueColumns[0].prices.USD),\(.size.size),\(.region)")|.[]' | grep -v 'N/A*' | sort -nrk2  >> $fname 2>&1
if [ -z "$fname" ]; then
   echo "Unable to fetch spot prices"
   exit 1
fi
if [ "$#" -gt 0 ] ; then
   types=`echo $@ | sed -e 's/ /|/g'`
   echo "Fecthing prices($region) for: $types"
   cmd="cat $fname | grep $region | egrep '$types'"
else
   echo "Fecthing prices for: $region"
   cmd="cat $fname | grep $region"
fi
# echo $cmd
bash -c "${cmd}"

