##### batch
Generic job launcher

### How to use
```
     ######  Put bash scripts in sub-folders as follow
     latest/
          YYYYMMDD_myjob1/run01.sh  run02.sh    : task will launch after YYYYMMDD date

          myjob2/run01.sh  run02.sh             : task will launch anytime.

          myjob3_nodelete/run01.sh  run02.sh    : task will launch anytime and not be deleted (only launch once a day at max).


     ###### Run all scripts in latest/  in prod mode,  120sec max runtime
     ./runner.sh prod  latest/  120  



     ###### Run all scripts in test/  in debug modee,  1 hour maxttime,  below CPU 20% usage,  below 50% ram usage
     ./runner.sh debug  test/  3600   20   50

     ### run 1st script and stop directly 
     ./runner.sh debug2  test/  3600   20   50



     ###### Run all scripts in latest/  in prod mode,  4h hour maxttime
     ./runner.sh prod  latest/  14600  


     ###### Full Prod + Instance stop
     ./runner.sh prodstop  latest/  14600   20   50  ### will stop the instance




    cd batch/mlbatchs/

```
