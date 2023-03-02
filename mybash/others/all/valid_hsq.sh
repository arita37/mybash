#!/usr/bin/env bash


set +ex

while read fname; do
    dt=$(echo $fname | awk -F '/' '{print $4}')
    echo $dt
    docker run --rm docker-regi.intra.zzz-it.com/ppp/rpp-kkkma:0.1.4rc-minisqip ./run_valid_hsq.sh --$dt
done < tmp.txt
