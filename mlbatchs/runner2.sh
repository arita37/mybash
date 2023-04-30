#!/bin/bash
info=" Generic Batch launcher

################ TODO

2) Parse the task with those folders patterns

   latest/
        YMD-HM_task01/run.sh  :  Only starts > YMD_HM date (in Japan time)
        YMD_task01/run.sh  :     Only starts > YMD_0000 date (at midnight YMD, in Japan time)

        HM_task01/run.sh  :      Only starts >  H hour M minutes on today's  date ( in Japan time)

       
        task01/run.sh  :              Starts at any time.

        task01_nodelete/run.sh  :     Starts at any time.


####################################################################################################




#### Usage
     ###### Run all scripts in test/  in debug modee,  1 hour maxttime,  below CPU 20% usage,  below 50% ram usage
     ./runner.sh debug  test/  3600   20   50

     ### run 1st script and stop directly 
     ./runner.sh debug2  test/  3600   20   50




     ###### Run all scripts in latest/  in prod mode,  4h hour maxttime,  below CPU 20% usage,  below 50% ram usage
     ./runner.sh prod  latest/  120   20   50

     ./runner.sh prod  latest/  14600   20   50


     ###### Full Prod + Instance stop
     ./runner.sh prodstop  latest/  14600   20   50  ### will stop the instance


     ###### Task folder structure
     latest/
          YYYYMMDD_myjob1/run01.sh  run02.sh     : task will launch after YYYYMMDD date

          myjob2/run01.sh  run02.sh             : task will launch anytime.

          myjob3_nodelete/run01.sh  run02.sh    : task will launch anytime and will not be deleted (ie every time it will be launched).


    cd batch/mlbatchs/


"
shopt -s expand_aliases


########## Default value ##############################################
mmode="$1"         && [ -z $1 ] &&  mmode="debug"     ### Prod mean github repo is updated at each time
dirin="$2"         && [ -z $2 ] &&  dirin="latest"
maxtime=$3         && [ -z $3 ] &&  maxtime=60
mincpu=$4          && [ -z $4 ] &&  mincpu=15 
minram=$5          && [ -z $5 ] &&  minram=100

echo $mmode
if  [[  "$mmode" == *"debug"* ]]; then
   mincpu=60
   minram=100
   maxtime=30
fi

instance_mode="$mmode"


########## Dates ######################################################
ymd=$(TZ='Asia/Tokyo' date +'%Y%m%d')
ymdhs=$(TZ='Asia/Tokyo' date +'%Y%m%d_%H%M%S')
t0_unix=$(date +%s)


########## LOGS ######################################################
export LOGDIR="zlog/$ymd/"
mkdir -p "$LOGDIR"
export LOGFILE7="${LOGDIR}/log_${ymdhs}.py"
echo  -e "###Start ${ymdhs} \n" 2>&1 | tee  "${LOGFILE7}"



########## Source ####################################################
source ../bins/utils.sh
nowjp || exit 1
echo "RAM usage $(ram_get_usage)"
  

function elog() {
    echo -e "$1" 2>&1 | tee -a "${LOGFILE7}"
}


######################################################################
####### Run Script in each sub-folder. ###############################
subfolders=$(find "$dirin" -maxdepth 1 -mindepth 1 -type d | sort)
for dirk0 in $subfolders; do
   dirk=${dirk0%*/}      # remove the trailing "/"  
   dirk="${dirk##*/}"    # print everything after the final "
   echo2 "## $dirk"

   if [[ -f "$dirk" ]]; then continue; fi  ### if not a directory

   dirnew="done/$ymd/$dirk/"               ### If target dir exist prevent 2nd runs for _nodelete
   if [ -d "$dirnew" ]; then  continue; fi  

   #### Check if script date is below than today's date
   dtscript=$(date_extract_to_unix $script)
   dtnow_unix=$(date +d)
   echo2 "job date: $dtscript"
   if (( $(echo "$dtscript > $dtnow_unix" | bc -l) )); then  echo "$dirk  skipped"; continue;  fi  


   echo2  "### $dirk  start: $(nowjp)"    
   subfolders2=$(find "$dirin/$dirk" -name "*.sh" -maxdepth 1 -mindepth 1 -type f | sort)
   for script in $subfolders2; do 

      if [[ $script == *"*"* ]]; then continue; fi    

      ### Run the task   ################################################# 
      echo2  "\n###### $script: start"  
      /bin/bash "$script" &   
      # exit 
      sleep 3


      ### Move Script   #################################################
      dirnew="done/$ymd/$dirk/" 
      task_movefolder $mmode  $script  $dirnew 
      if [[  $mmode   == *"debug2"* ]]; then exit;  fi   ### Exit early if debug



      ### Update Remote repo   ########################################
      if [[  "$mmode" == *"prod"* ]]; then
          echo2  "update repo"
          gitpushforce  "from batch: $(nowjp)"
      fi

   done

   rm_empty_folder "$dirin/$dirk/"


  ### Check if the CPU usage is low. #################################
  while true; do
    if [[ time_diff_is_greater_than $t0_unix $maxtime ]]; then
       echo2 "#### Max Time Limit: $maxtime, Stop Instance in 300s "  
       gitpushforce  "from batch: $(nowjp) - stop instance"
       sleep 300 #### Safety              
       mlinstance_stop   2>&1 | tee -a "${LOGFILE7}"

       exit 1
    fi

    #### Exit if not more python process running ##################### 
    cmd_list="$(get_current_shell_pid_all)"
    if [[  "$cmd_list" != *"python"* &&  "$cmd_list" != *"latest"*  ]]; then
       echo2 "No more python, latest/run.sh process running"
       break
    fi
    sleep 20


    elog $(cpu_get_avg_usage)   
    elog $(ram_get_usage)         
    #### Exit the waiting loop if CPU_usage < minCPU AND RAM_usage < minRAM 
    # if (( $(echo "$cpu_total_usage < $mincpu" | bc -l) )); then
    #     if (( $(echo "$ram_total_usage < $minram" | bc -l) )); then
    #        break
    #     fi   
    # fi

  done
  

done


#######################################################################
echo2 "\n#### ALL Tasks done"
ls -l "done/$ymd/"  2>&1 | tee -a "${LOGFILE7}"

if [[ "$mmode" == *"stop"*  ]]; then
    elog "Instance Stopped in 300sec"
    gitpushforce  "batch_runner: $(nowjp) - stop instance"       

    sleep 300  ### Safety , dont lower this level
    mlinstance_stop    

else 
    gitpushforce  "batch_runner: $(nowjp) "       


fi







