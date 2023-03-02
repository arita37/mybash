#!/bin/bash
CUR_PATH=$(dirname "$0")
. $CUR_PATH/set_env_docker.sh
ds=`date  +%Y%m%d-%H:%M:%S`
cd /opt/app

# bin/start_generic_method.sh -c config/config_v16.properties -m rpp.rpp_index.RPPIndex.run_vran_index_producer -s rkm${ds} -q True
# bin/start_generic_method.sh -c config/config_v16.properties -m vran_index.vran_index.kkkmaIndex.run_vran_index_producer -s rkm${ds} -q True
pipenv run ./bin/start_generic_method.sh -c vran_index/conf/config_v16.properties -m vran_index.vran_index.VRANIndex.run_vran_index_producer -s vranidx${ds} -q False  # no monitor
