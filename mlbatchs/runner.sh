#!/bin/bash
info=" Generic Batch launcher

     ## Example
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

ymd=$(TZ='Asia/Tokyo' date +'%Y%m%d')
ymdhs=$(TZ='Asia/Tokyo' date +'%Y%m%d_%H%M%S')

########## Varname ####################################################
mmode="$1"         && [ -z $1 ] &&  mmode="debug"     ### Prod mean github repo is updated at each time
dirin="$2"         && [ -z $2 ] &&  dirin="latest"
maxtime=$3         && [ -z $3 ] &&  maxtime=60
mincpu=$4          && [ -z $4 ] &&  mincpu=15 
minram=$5          && [ -z $5 ] &&  minram=100

maxtime=36000

if  [[  "$mmode" == *"debug"* ]]; then
   mincpu=60
   minram=100
   maxtime=30
fi
instance_mode="$mmode"



########## LOGS ######################################################
export LOGDIR="zlog/$ymd/"
mkdir -p "$LOGDIR"
export LOGFILE7="${LOGDIR}/log_${ymdhs}.py"
echo  -e "###Start ${ymdhs} \n" 2>&1 | tee  "${LOGFILE7}"




########## Source ####################################################
source ../bins/utils.sh
nowjp || exit 1

echo "RAM usage $(ram_get_usage)"



###########Check Parms ###############################################
echo2   "mode: $mmode"            
echo2   "Task folder: $dirin"     
echo2   "MaxTime:     $maxtime"   
echo2  "\n#########Batch Loop #######################\n"


######################################################################
echo2  "\n#########Run batch loop ####################################\n"

mkdir -p "ztmp/" &&  echo "" > "ztmp/ztmp_pid.txt"    
t0_unix=$(date +%s)
subfolders=$(find "$dirin" -maxdepth 1 -mindepth 1 -type d | sort)
for dirk0 in $subfolders; do

   dirk=${dirk0%*/}      # remove the trailing "/"  
   dirk="${dirk##*/}"    # print everything after the final "
   echo2 "## $dirk"

   if [[ $dirk == *"readme"* ]]; then continue; fi  

   dirnew="done/$ymd/$dirk/"    #### If dir exist prevent 2nd runs for _nodelete
   if [ -d "$dirnew" ]; then  
      echo "task already done, skipping" ; continue; 
   fi  

   #### Check if script date is below than today's date
   dtscript=$(date_extract "$dirk")
   ymd1=$(TZ='Asia/Tokyo' date +'%Y%m%d')
   echo2 "job date: $dtscript"
   if (( $(echo "$dtscript > $ymd1" | bc -l) )); then  echo "$dirk  skipped"; continue;  fi  


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
      # echo $dirnew

      mkdir -p $dirnew
      if [[  $mmode   == *"debug"* || $script == *"nodelete"*  ]]; then
          cp "$script" "$dirnew" ;    echo2  "COPY $script TO $dirnew"  

      else
          mv $script $dirnew ;        echo2  "MOVE $script TO $dirnew"            
      fi  

      if [[  $mmode   == *"debug2"* ]]; then exit;  fi 


      ### Update Remote repo   ########################################
      if [[  "$mmode" == *"prod"* ]]; then
        echo2  "update repo"
        gitpushforce  "from batch: $(nowjp)"
      fi;

   done

   rm_empty_folder "$dirin/$dirk/"


  ### Max Run time limit #################################
  while true; do
    tnow=$(date +%s)
    time_diff=$((tnow - t0_unix))
    echo $time_diff
    if [[ $time_diff -gt $maxtime ]]; then
          echo2 "#### Max Time Limit, Stop Instance "  
          gitpushforce  "from batch: $(nowjp) - stop instance"
          sleep 300 #### Safety              
          instance_stop   2>&1 | tee -a "${LOGFILE7}"

       exit 1
    fi

    #### Exit if not more python process running :  ##################### 
    curr_pid="$(get_current_shell_pid)"
    get_subprocess "$curr_pid" > "ztmp/ztmp_pid.txt"  ### BE Careful this is a recursive call, cannot embed in other function
    cmd_list=$(cat  "ztmp/ztmp_pid.txt" )
    echo "##cmd: $cmd_list"

    if [[  "$cmd_list" != *"python"* &&  "$cmd_list" != *"latest"*  ]]; then
         echo2 "No more python, latest/run.sh process running"
         break
    fi
    sleep 20



    cpu_get_avg_usage   2>&1 | tee -a "${LOGFILE7}"
    ram_get_usage       2>&1 | tee -a "${LOGFILE7}"  
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
    echo "Instance Stopped in 300sec" 2>&1 | tee -a "${LOGFILE7}"
    gitpushforce  "batch_runner: $(nowjp) - stop instance"       

    sleep 400  ### Safety , dont lower this level
    instance_stop    

else 
    gitpushforce  "batch_runner: $(nowjp) "       


fi







