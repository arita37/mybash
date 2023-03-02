#!/bin/bash

if [ $# -eq 2 ]; then
    log_monitoring_path="$1"
    nfs_base_path="$2"
else
    echo "Incorrect number of arguments. Expected 2"
    exit 1
fi

hostname=`hostname`
date=`date -d "yesterday" +%Y-%m-%d`

function save_to_nfs {
  file_fullpath="$1"
  filename=`basename -- "$file_fullpath"`

  logname="${filename%.old}"
  logpath="${file_fullpath%"$filename"}"
  logpath=${logpath#"$log_monitoring_path"}

  nfs_dir_path="${nfs_base_path}${logpath}${date}"
  mkdir -p "$nfs_dir_path"

  nfs_file_path="${nfs_dir_path}/${hostname}-${logname}"
  mv "$file_fullpath" "$nfs_file_path"
}

function flush_logs {
  target_dir="$1"
  for filepath in "$target_dir"/*.old; do
  	[ -e "$filepath" ] || continue
    save_to_nfs "$filepath"
  done
}

function traverse {
  target_dir="$1"
  flush_logs "$target_dir"
  for sub_dir in "$target_dir"/*; do
    if [ -d "$sub_dir" ]; then
      flush_logs "$sub_dir"
      traverse "$sub_dir"
    fi
  done
}

traverse "$log_monitoring_path"