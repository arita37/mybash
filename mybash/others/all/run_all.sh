#! /usr/bin/env bash

set -ex

. jp_c6000_pro && kinit.sh
./run_rat_dump.sh
./run_minisqip.sh