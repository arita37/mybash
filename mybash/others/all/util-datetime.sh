#!/usr/bin/env bash

# convert second to day hour minute second
# l_seconds in seconds
function second_to_dhms {
   l_seconds=${1:-86400}
   echo $((l_seconds/86400))" days "$(date -d "1970-01-01 + $l_seconds seconds" "+%H hours %M minutes %S seconds")
}

# get the total time based on two unixtimestamp in epoch
# l_start epoch unixtimestamp
# l_end epoch unixtimestamp 
function total_time {
  l_start=${1:-}
  l_end=${2:-}
  echo $((l_end - l_start))
}

# get the total time based on two unixtimestamp in epoch
# and convert time milliseconds
# l_start epoch unixtimestamp
# l_end epoch unixtimestamp 
function total_time_in_ms {
  l_start=${1:-}
  l_end=${2:-}
  l_t=`total_time $l_start $l_end`
  echo $((l_t * 1000))
}
