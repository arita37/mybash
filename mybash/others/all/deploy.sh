#! /usr/bin/env bash

tag="v11.6.0"
HTTP_PROXY=http://dev-proxy.db.zzz.co.jp:9501
HTTPS_PROXY=http://dev-proxy.db.zzz.co.jp:9501
NO_PROXY=localhost,127.0.0.1

docker build -t docker-regi.intra.zzz-it.com/ppp/cpc_clk_summary:${tag} \
             --build-arg http_proxy=${HTTP_PROXY} \
             --build-arg https_proxy=${HTTPS_PROXY} \
             --build-arg no_proxy=${NO_PROXY} \
             . && \
docker push docker-regi.intra.zzz-it.com/ppp/cpc_clk_summary:${tag}
