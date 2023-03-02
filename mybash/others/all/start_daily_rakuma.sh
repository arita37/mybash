#!/bin/bash
CUR_PATH=$(dirname "$0")
. $CUR_PATH/set_env_docker.sh
ds=`date  +%Y%m%d-%H:%M:%S`
cd /opt/app

# bin/start_generic_method.sh -c config/config_v16.properties -m rpp.rpp_index.RPPIndex.run_kkkma_index_producer -s rkm${ds} -q True
# bin/start_generic_method.sh -c config/config_v16.properties -m kkkma_index.kkkma_index.kkkmaIndex.run_kkkma_index_producer -s rkm${ds} -q True
pipenv run ./bin/start_generic_method.sh -c kkkma_index/conf/config_v16.properties -m kkkma_index.kkkma_index.kkkmaIndex.run_kkkma_index_producer -s rkm${ds} -q False  # no monitor
