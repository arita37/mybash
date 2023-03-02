#!/bin/bash

LINE_SEP="##############################################################################"
LINE_SEP2="######################################################"
LINE_SEP3="###########################"

LINE_END="\n\n\n#######################################################################"

function echo2() {
    if [ "$#" -lt 1 ]; then
        echo "Usage: echo2 MESSAGE [APPEND]"
        echo "  MESSAGE: The message to be echoed and written to a log file."
        echo "  APPEND: (optional) Specifies whether to append the message to the log file or overwrite it. If not specified, the default behavior is to append the message."
        return
    fi

    if [ "$#" -eq 1 ]; then
        echo "$1" | tee -a "${LOGFILE}"
    else
        echo "$1" | tee "${LOGFILE}"
    fi
}


function echo3() {
    if [ "$#" -lt 1 ]; then
        echo "Usage: echo3 MESSAGE [APPEND]"
        echo "  MESSAGE: The message to be echoes and written to a log file."
        echo "  APPEND: (optional) Specifies whether to append the message to the log file or overwrite it. If not specified, the default behavior is to append the message."
        return
    fi

    echo -e "${LINE_END}" | tee -a "${LOGFILE}"

    if [ "$#" -eq 1 ]; then
        echo "$1" | tee -a "${LOGFILE}"
    else
        echo "$1" | tee "${LOGFILE}"
    fi
}


function list_error() {
   ### Find Error msg in log file
   ## list_error ztmp/log//_log1.py    
   echo -e  "\n\n$LINE_END"  
   echo -e  "###### List of errors: ############" 
   echo -e  $1
   grep -Ehnr "error|Error" "$1"  | grep -ve "from_error"
   #grep -Ehnr "error|Error" "$1"  
   
   if [[  $2 == "raise_error" ]]; then
      exit 64
   fi

}


function path_abs() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: path_abs RELATIVE_FILE_PATH"
        echo "  RELATIVE_FILE_PATH: The relative file path for which to find the absolute path."
        return
    fi

    local file_path="$1"
    if [ -d "$(dirname "$file_path")" ]; then
        echo "$(cd "$(dirname "$file_path")" && pwd)/$(basename "$file_path")"
    fi
}



function timeout2() {
    if [ $# -lt 2 ]; then
        echo "Usage: timeout2 PID Timeout"
        echo "  PID: The process id to be monitored."
        echo "  Timeout: The number of seconds to wait before sending SIGTERM signal."
        return
    fi

    # First argument: PID
    # Second argument: Timeout
    # Get process start time (Field 22) to check for PID recycling
    start_time="$(ps -o lstart= -p $1 | awk '{print $1 " " $2}')"

    sleep "$2"

    # Make sure that the PID was not reused by another process
    # that started at a later time
    current_time="$(ps -o lstart= -p $1 | awk '{print $1 " " $2}')"
    if [ "$current_time" = "$start_time" ]; then
        # Kill process with SIGTERM
        kill -9 "$1"
    fi
}


function kill_sub_process() {
    if [ $# -lt 1 ]; then
        echo "Usage: kill_sub_process PID [and_self]"
        echo "  PID: The process id to be killed along with its sub-processes."
        echo "  and_self: (optional) Specifies whether to also kill the process with the specified PID. Default is false."
        return
    fi

    local pid="$1"
    local and_self="${2:-false}"
    children="$(pstree -p "$pid" | awk -F'[\(\)]' '{for (i=2; i<=NF; i+=2) print $i}')"
    for child in $children; do
        kill_sub_process "$child" true
    done
    if [[ "$and_self" == true ]]; then
        kill -9 "$pid"
    fi
}


echo "utils.sh loaded"
