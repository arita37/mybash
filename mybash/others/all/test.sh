#!/usr/bin/env bash

export http_proxy=http://dev-proxy.db.zzz.co.jp:9501
export https_proxy=http://dev-proxy.db.zzz.co.jp:9501
sudo /usr/local/bin/mount_gluster.sh
. www1_c6000_pro && kinit.sh
tox