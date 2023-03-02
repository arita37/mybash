33333333	#!/bin/bash

LINE_SEP="##############################################################################"
LINE_SEP2="######################################################"
LINE_SEP3="###########################"

LINE_END="\n\n\n#######################################################################"


function copy_no_overwrite() {
   #### copy folder1 into folder2 WITHOUT overwriting files.

   rsync 

}


function node_info() {

   ### OS Version
   lsb_release -d

   ### CPU 
   grep "model name" /proc/cpuinfo |uniq |awk -F ':' '{print $NF}'
   
   ### RAM available
   
   free -m
   
   ### Disk size

    df -h

}




function echo2 () {   
  if [[  $2 == ''  ]]; then
    echo -e $1  2>&1 | tee -a "${LOGFILE}"

  else :  ### Not append
    echo -e $1  2>&1 | tee   "${LOGFILE}"
  fi;

}


function echo3 () {   
  echo -e  $LINE_END  2>&1 | tee -a "${LOGFILE}"
  if [[  $2 == ''  ]]; then
    echo -e $1  2>&1 | tee -a "${LOGFILE}"

  else :  ### Not append
    echo -e $1  2>&1 | tee   "${LOGFILE}"
  fi;

}



function list_error() {
   ### Find Error msg in log file
   ## list_error ztmp/log//_log1.py    
   echo -e  "\n\n$LINE_END"  
   echo -e  "###### List of err-ors: ############" 
   echo -e  $1
   grep -Ehnr "error|Error" "$1"  | grep -ve "from_error"
   #grep -Ehnr "error|Error" "$1"  
   
   if [[  $2 == "raise_error" ]]; then
      exit 64
   fi

}


function path_abs() {
  # $1 : relative filename
  if [ -d "$(dirname "$1")" ]; then
    echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
  fi
}


function git_push_bot() {
    git config user.name github-actions[bot]
    git config user.email 41898282+github-actions[bot]@users.noreply.github.com
    git add --all &&  git commit -m "${1}"  
    git pull --all     
    git push --all -f  
}



function timeout2() {
    # First argument: PID
    # Second argument: Timeout
    # Get process start time (Field 22) to check for PID recycling
    start_time="$(cut -d ' ' -f 22 /proc/$1/stat)"

    sleep "$2"

    # Make sure that the PID was not reused by another process
    # that started at a later time
    if [ "$(cut -d ' ' -f 22 /proc/$1/stat)" = "$start_time" ]; then
        # Kill process with SIGTERM
        kill -9 "$1"
    fi
}


function kill_sub_process() {
    local pid="$1"
    local and_self="${2:-false}"
    if children="$(pgrep -P "$pid")"; then
        for child in $children; do
            kill_sub_process "$child" true
        done
    fi
    if [[ "$and_self" == true ]]; then
        kill -9 "$pid"
    fi
}



function print_envars(){ 
  python -c "import os, pprint; pprint.pprint(dict(os.environ))"  
}

function sum_numbers() {
  local result=0
  for num in $@; do
    result=$((result + num))
  done
  echo $result
}

function convert_to_mb() {
  local size_kb=$1
  local size_mb=$(echo "scale=2; $size_kb / 1024" | bc)
  echo "$size_kb KB is equivalent to $size_mb MB."
}

function count_files() {
  local file_count=$(ls -1 $1 | wc -l)
  echo "There are $file_count files in the directory $1."
}

function reverse_string() {
  local original_string=$1
  local reversed_string=""
  local string_length=${#original_string}
  for ((i=$string_length-1; i >= 0; i--)); do
    reversed_string="$reversed_string${original_string:$i:1}"
  done
  echo $reversed_string
}

function extract_files() {
  # $1 : archive file
  # $2 : destination folder
  local file="$1"
  local dest="$2"
  
  if [ ! -f "$file" ]; then
    echo "Error: $file not found"
    return 1
  fi

  if [ ! -d "$dest" ]; then
    echo "Error: $dest not found"
    return 1
  fi

  case "$file" in
    *.tar.bz2)  tar xjf "$file" -C "$dest";;
    *.tar.gz)   tar xzf "$file" -C "$dest";;
    *.bz2)      bunzip2 "$file" -C "$dest";;
    *.rar)      unrar x "$file" "$dest";;
    *.gz)       gunzip "$file";;
    *.tar)      tar xf "$file" -C "$dest";;
    *.tbz2)     tar xjf "$file" -C "$dest";;
    *.tgz)      tar xzf "$file" -C "$dest";;
    *.zip)      unzip "$fi no le" -d "$dest";;
    *.Z)        uncompress "$file";;
    *.7z)       7z x "$file" -o"$dest";;
    *)          echo "Error: $file is not a supported archive format";;
  esac
}

function check_command() {
  # First argument: Command to run
  # Second argument: Error message
  if ! "$1"; then
    echo "$2" >&2
    exit 1
  fi
}

function get_input() {
  # First argument: Message to display to the user
  # Second argument: Variable name to store the user input
  read -rp "$1" "$2"
}

function check_file() {
  # First argument: Filename
  # Second argument: Error message
  if [ ! -f "$1" ]; then
    echo "$2" >&2
    exit 1
  fi
}

function find_largest_files() {
  # Find the largest files in a directory
  # Usage: find_largest_files <directory>
  du -a "$1" | sort -n -r | head -n 10
}

function encrypt_file() {
  # Encrypt a file using gpg
  # Usage: encrypt_file <file> <recipient>
  gpg --encrypt --recipient "$2" "$1"
}

function monitor_process() {
  # Monitor the memory and CPU usage of a process
  # Usage: monitor_process <pid>
  while true; do
    ps -p "$1" -o %mem,%cpu
    sleep 1
  done
}

function calculate_checksum() {
  # Calculate the checksum of a file
  # Usage: calculate_checksum <file>
  sha256sum "$1"
}

function backup_file() {
  # Backup a file by copying it to a backup directory
  # Usage: backup_file <file> <backup_dir>
  cp "$1" "$2/$(date +%Y-%m-%d_%H-%M-%S)_$(basename "$1")"
}

function check_file_exists() {
    if [ -f "$1" ]; then
        return 0
    else
        return 1
    fi
}

function backup_file() {
    cp "$1" "${1}.bak"
}

function count_lines() {
    wc -l "$1" | awk '{print $1}'
}

function count_lines() {
    wc -l "$1" | awk '{print $1}'
}

function join_strings() {
    IFS=$'\n'
    echo "${*}"
}

function download_file() {
    curl -o "$1" "$2"
}

function get_file_extension() {
    echo "${1##*.}"
}

function replace_text() {
    sed -i "s/$2/$3/g" "$1"
}

echo "bin/utils.sh loaded"



