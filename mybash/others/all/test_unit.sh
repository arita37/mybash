#!/usr/bin/env bash
dirn="$(dirname "$0")"
which_python="$(which python)"

#  find /full/path/to/dir -name "*c*" -type dir
#  python  batch/ztest/tasks/zztsk_fast/main.py
#  rm -rf ${dirn}/ztest/tasks/task_demo1

cd /home/ubuntu/aagit/aapackage/aapackage/


rm -rf `find  -type d -name "*task_demoxx1*"`
yes | cp -rf ${dirn}/ztest/tasks/task_ignore  batch/ztest/tasks/task_demoxx1


rm -rf `find  -type d -name "*task_demoxx2*"`
yes | cp -rf ${dirn}/ztest/tasks/task_ignore_pygmo  batch/ztest/tasks/task_demoxx2



###### Run Batch  ##################################################################################
batch_daemon_launch_cli.py  --task_folder batch/ztest/tasks/ &
sleep 3
batch_daemon_monitor_cli.py --monitor_log_folder batch/ztest/monitor_logs



# ${which_python} ${dirn}/../../batch_daemon_launch_cli.py  --task_folder ${dirn}/../../ztest/tasks/ &
# sleep 3
# ${which_python} ${dirn}/../../batch_daemon_monitor_cli.py --monitor_log_folder ${dirn}/../../ztest/monitor_logs


