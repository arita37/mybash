#!/bin/bash
CUR_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $CUR_PATH/set_env_docker.sh
salt=default
dnm=False
while getopts ":c:m:s:q:" opt; do
  case $opt in
    c) conf="$OPTARG"
    ;;
    s) salt="$OPTARG"
    ;;
    m) meth="$OPTARG"
    ;;
    q) dnm="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

printf "conf is            %s\n" "$conf"
printf "method is          %s\n" "$meth"
printf "salt is            %s\n" "$salt"
printf "monitor is  %s\n" "$dnm"
cd "$CUR_PATH"
python simplek8s/run_local_method.py $conf $meth $salt $dnm 
