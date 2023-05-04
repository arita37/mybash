


function cron_current_process() { 
   ### Dump the ps faux related to the cron process
   #ps faux | sed -n '/\/usr\/sbin\/cron/,$p'   
   ### BETWEEN   sbin/cron AND   usr/bin/db procsess
   ps faux | sed -n '/\/usr\/sbin\/cron/,/\/usr\/bin\/dbus/p'
}


function cron_current_process_logging() { 
   ### Dump PS FAUX on disk every 600sec
   local logfile2="$1"
   mkdir -p "$(dirname "$logfile2")"
   echo "start logging cron processes" >> "$logfile2" 
   while true; do 
       echo -e "\n\n"        >> "$logfile2"       
       ps faux | sed -n '/\/usr\/sbin\/cron/,/\/usr\/bin\/dbus/p'  >> "$logfile2"  
       sleep 600; 
   done 

}


####
### cron_current_process_logging "ztmp/log_psfaux.log"  produces infinite  some loop



