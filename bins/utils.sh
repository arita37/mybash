#!/bin/bash

LINE_SEP="##############################################################################"
LINE_SEP2="######################################################"
LINE_SEP3="###########################"

LINE_END="\n\n\n#######################################################################"

function echo2() {
  if [[ $2 == '' ]]; then
    echo -e $1 2>&1 | tee -a "${LOGFILE7}"

  else
    : ### Not append
    echo -e $1 2>&1 | tee "${LOGFILE7}"
  fi

}

function echo3() {
  echo -e $LINE_END 2>&1 | tee -a "${LOGFILE7}"
  if [[ $2 == '' ]]; then
    echo -e $1 2>&1 | tee -a "${LOGFILE7}"

  else
    : ### Not append
    echo -e $1 2>&1 | tee "${LOGFILE7}"
  fi

}

function echo4() {
  if [[ $2 == '' ]]; then
    echo -e "$(nowjp): $1" 2>&1 | tee -a "${LOGFILE7}"

  else
    : ### Not append
    echo -e "$(nowjp): $1" 2>&1 | tee -a "${LOGFILE7}"
  fi

}

function list_error() {
  ### Find Error msg in log file
  ## list_error ztmp/log//_log1.py
  echo -e "\n\n$LINE_END"
  echo -e "###### List of err-ors: ############"
  echo -e $1
  grep -Ehnr "error|Error" "$1" | grep -ve "from_error"
  #grep -Ehnr "error|Error" "$1"

}

function list_warning() {
  ### Find Error msg in log file
  ## list_error ztmp/log//_log1.py
  echo -e "\n\n$LINE_END"
  echo -e "###### List of warni-nings: ############"
  echo -e $1
  grep -Ehnr "warning|Warning" "$1" | grep -ve "from_error"
  #grep -Ehnr "error|Error" "$1"

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
  git add --all && git commit -m "${1}"
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

eexport() {
  ### Export variable to disk for later reload
  # my_var="Hello, World!"
  # export_var my_var  file.sh
  # source file.sh
  eval "echo export $1=$2 " >$3
  #source $2
}

export_allenv() {
  # Export all environment variables to a file in a format that can be sourced
  # export_allenv "env2.txt"
  while IFS='=' read -r name value; do

    if [[ $string1 == *"image_tag"* ]]; then
      printf 'export %s="%q"\n' "$name" "${value}"
    else
      echo ""
    fi

    printf 'export %s="%q"\n' "$name" "${value}"
  done < <(printenv) >$1
}

function print_envars() {
  python -c "import os, pprint; pprint.pprint(dict(os.environ))"
}

####################################################################################
function cpu_get_num_cores() {
  # Check if the system is macOS or Linux
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: Use the sysctl command to get the number of CPU cores
    num_cores=$(sysctl -n hw.ncpu)
  else
    # Linux: Use the nproc command to get the number of CPU cores
    num_cores=$(nproc)
  fi

  # Return the result
  echo "$num_cores"
}

function cpu_get_avg_usage() {
  # Get the total CPU usage from the ps command
  cpu_total_usage=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
  num_cores=$(cpu_get_num_cores)
  cpu_total_usage=$(echo "scale=4; $cpu_total_usage / $num_cores" | bc -l)

  echo "Total CPU usage per core: $cpu_total_usage%"
}
# cpu_get_avg_usage

function cpu_get_avg_usage2() {
  period=$1 && [ -z $1 ] && period=600 ###  print folder size
  local avg_cpu_usage=$(sar -u 1 $period | grep "Average" | awk '{print 100-$8}')
  echo "Average CPU usage over $period : $avg_cpu_usage%"
}

function ram_get_usage() {

  if [[ "$OSTYPE" == "darwin"* ]]; then
    pages_free=$(vm_stat | grep 'Pages free:' | awk '{print $3}' | tr -d '.')
    pages_active=$(vm_stat | grep 'Pages active:' | awk '{print $3}' | tr -d '.')
    pages_inactive=$(vm_stat | grep 'Pages inactive:' | awk '{print $3}' | tr -d '.')
    pages_speculative=$(vm_stat | grep 'Pages speculative:' | awk '{print $3}' | tr -d '.')
    pages_wired_down=$(vm_stat | grep 'Pages wired down:' | awk '{print $4}' | tr -d '.')
    pages_purgeable=$(vm_stat | grep 'Pages purgeable:' | awk '{print $3}' | tr -d '.')

    # total_used=$((pages_active + pages_inactive + pages_speculative + pages_wired_down))
    total_used=$((pages_active))
    total_free=$((pages_free + pages_purgeable))
    total_memory=$((total_used + total_free))

    ram_total_usage=$(echo "scale=2; $total_used / $total_memory * 100" | bc)

  else

    ram_total_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

  fi

  echo "Ram usage: $ram_total_usage"

}

####################################################################################
function date_extract() {
  #  date_extract "20230401-34563435"
  input_string="$1"
  date_regex='[0-9]{4}[0-9]{2}[0-9]{2}'

  if [[ $input_string =~ $date_regex ]]; then
    extracted_date=$(grep -oE "$date_regex" <<<"$input_string" | head -n 1)
    echo $extracted_date
  else
    echo "-1"
  fi

}

function is_smaller_float {
  if (($(echo "$1 <= $2" | bc -l))); then
    echo "$1 is less than or equal to $2"
  else
    echo "$1 is greater than $2"
  fi
}

# bash script to extract %Y%m%d date from string

function mlinstance_stop() {
  echo "stop instance"

  if [[ $instance_mode == *"stop"* ]]; then
    sleep 300 ### safety

    sudo shutdown -h now

  fi

}

function rm_empty_folder() {
  # Set the path to the folder to be checked
  local folder_path="$1"

  # Check if the folder is empty
  if [ "$(ls -A "$folder_path")" ]; then
    echo "folder is not empty"
  else
    echo "$folder_path is empty: deleting"
    # Delete the folder
    rmdir "$folder_path"
  fi
}

function date_tounix() {
  date_string=$1        ###  "20220101_1200"
  timezone="Asia/Tokyo" ###  2
  #format="%Y%m%d_%H%M"

  timestamp=$(TZ=≈"$timezone" date -d "${date_string}" +"%s")
  echo "${timestamp}"

}

function nowjp() {
  echo $(TZ='Asia/Tokyo' date +'%Y%m%d_%H%M%S')
}

function gitpushforce() {
  git add --all
  git commit -m "$1"
  git push -f --all

}

function get_current_shell_pid() {
  echo $$
}

function get_subprocess() {
  # curr_pid="$(get_current_shell_pid)"
  # get_subprocess $curr_pid
  # local pid="$1"   && [ -z $1 ] &&  local_pid="$(get_current_shell_pid)"
  # echo "current_shell_pid: $local_pid"
  local pid="$1"
  local result=""
  for spid in $(pgrep -P "$pid"); do
    # local cmd=$(ps -p "$spid" -o comm=)   ## short cmd
    local cmd=$(ps -p "$spid" -o args=) ### long cmd
    result+="$spid: $cmd;"
    result+=$(get_subprocess "$spid")
  done
  echo "$result"
}

function get_current_shell_pid_all() {
  ### All PID and cmd on this current shell
  local curr_pid="$(get_current_shell_pid)"
  get_subprocess $curr_pid >"./ztmp.txt"
  local cmd_list=$(cat "./ztmp.txt")
  echo $cmd_list

}

function log_report_push() {

  dirlog_report="$HOME/D/gitdev/log_report/"
  echo "push $dirlog_report"

  local CURRENT_DIR=$(pwd)
  cd $dirlog_report

  gitignore
  git pull --all
  git add --all
  git commit -m "update"
  gitpushsecure

  cd "$CURRENT_DIR"
}

function mkdir2() {
  local dirfile="$1"
  if [[ -d "$dirfile" ]]; then
    mkdir -p "$dirfile"

  elif [[ -f "$dirfile" ]]; then
    local parentdir="$(dirname "$dirfile")"
    mkdir -p "$parentdir"
  fi
}

function get_subfolder_list() {

  #myfolder="/path/to/folder"
  local myfolder="$1"
  subfolders=$(find "$myfolder" -maxdepth 1 -mindepth 1 -type d | sort)
  echo $subfolders
  #for folder in $subfolders; do
  #   echo "$folder"
  #done
}

function get_file_list() {

  #subfolders2=$(find "$dirin/$dirk" -name "*.sh" -maxdepth 1 -mindepth 1 -type f | sort)
  subfiles=$(find "$1" -maxdepth 1 -mindepth 1 -type f | sort)
  echo $subfiles
  #for file in $subfiles; do
  #      echo "$file"
  #done

}

echo "bin/utils.sh loaded"
