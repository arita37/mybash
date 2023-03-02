#!/bin/bash
CUR_PATH="$( cd "$(dirname "$0")/.." ; pwd -P )"
export HDF5_USE_FILE_LOCKING=FALSE
export PATH="$CUR_PATH/bin:$PATH"
export PYTHONPATH="$CUR_PATH"

