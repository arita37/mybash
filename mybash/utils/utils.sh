#!/bin/bash

LINE_SEP="##############################################################################"
LINE_SEP2="######################################################"
LINE_SEP3="###########################"

LINE_END="\n\n\n#######################################################################"


function exists_in_list() {
    # https://www.baeldung.com/linux/check-variable-exists-in-list
    # list1="banana pear apple strawberry lime"
    # if exists_in_list "pear"   "$list1" ","; then
    #     echo "pear is in the list"
    # else
    #     echo "pear is not in the list"
    # fi    

    VALUE=$1
    LIST=$2
    DELIMITER=$3  &&  [ -z $3 ] &&    DELIMITER=","

    echo $LIST | tr "$DELIMITER" '\n' | grep -F -q -x "$VALUE"
}

alias exists=exists_in_list



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
   echo -e  $LINE_END  
   echo -e  "\n\n###### List of errors: ############" 
   grep -Ehnr "error|Error" "$1"  

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


alias env_show=print_envars



alias bashs="source ~/.zshrc"



echo "utils.sh loaded"























