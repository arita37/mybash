#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
source "${script_dir}/nexus_deploy_no_proxy.sh"
source /etc/profile.d/proxy.sh

function nexus_deploy() {
  zzz_proxy
  nexus_deploy_no_proxy "${@:1}"
}
