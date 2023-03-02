


### TODO 
  get infos on bidding systems  (RUNNA ):


  get infos on couchbase Fields from CA  -->  textFile :

  Print the big powertpoint from Search















https://git.zzz-it.com/projects//repos/dig-ips-chef-repo/browse/cookbooks/dig-ips-roles/recipes/secure-cassandra.rb#56,67-68,81,91-92,92-93,95,100,102

https://git.zzz-it.com/projects//repos/dig-ips-chef-repo/browse/cookbooks/aog-ssl/files/default/certs/nodes/cass101.analysis-shared.jpe2b.dcnw.zzz




https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/configuration/secureSSLCertWithCA.html



Step 5 – Copy SSL certificates from current Cassandra to new Cassandra
If you have SSL certificates in your Cassandra installation, copy them to the new Cassandra. To copy the SSL certificates, copy the following files to /home/ngsuser/usr/cassandra/cassandra-current.version/cassandra/conf/:

/home/ngsuser/usr/cassandra/cassandra-current.version/cassandra/conf/.truststore
/home/ngsuser/usr/cassandra/cassandra-current.version/cassandra/conf/.keystore
Step 6 – Update new Cassandra configuration files
Update your Cassandra configuration files with the relevant settings from your current Cassandra installation. The following files must be updated:

/home/ngsuser/usr/cassandra/cassandra-new.version/cassandra/conf/cassandra.yaml
/home/ngsuser/usr/cassandra/cassandra-new.version/cassandra/bin/cassandra.in.sh
/home/ngsuser/usr/cassandra/cassandra-new.version/cassandra/conf/cassandra.rackdc.properties
/home/ngsuser/usr/cassandra/cassandra-new.version/cassandra/conf/cassandra-topology.properties
/home/ngsuser/usr/cassandra/cassandra-new.version/cassandra/conf/cassandra-env.sh (This file only needs to be updated if you changed your JMX configuration from the current Cassandra installation)
You can do a diff on the files to see a complete list of the differences. The following are the values in each file that must be updated:

/home/ngsuser/usr/cassandra/cassandra-new.version/cassandra/conf/cassandra.yaml:



/etc/cassandra/conf/.truststore
/etc/cassandra/conf/.keystore





copy


ls  aothers/sodkomkhamda01/code

 cp -R  aothers/sodkomkhamda01/code     a/ggg101/sssvols07/ntmp/export/  &



ls  aothers/chenjiahong01



cp -R  aothers/chenjiahong01/projects    a/ggg101/sssvols07/ntmp/export/  &



cp -R  aothers/chenjiahong01/projects_ins-     a/ggg101/sssvols07/ntmp/export/  &


projects  projects_ins- 

cd a/ggg101/sssvols07/ntmp/export/ 


tar -zc -f  tmp.tar.gz --exclude='*.parquet'  tmp/*



find tmp/ -type f -size -1024k -print0 | tar -czf --null -T - -f  tmp.tar.gz  &






#####  TO DO :  #########################################################

Daily Batch on disk with
      rp cookie --> isbot    score .


Re-using IP address from Fraud  --->
    Dump on disk


No-GMS  one --->  


Rule based higher than frequency 
   --> Impression no click 





################################################################################
### C:\D\gitdev\fraud\___analysis\
  --->  Table on disk daily, or hourly,

  --->  IP Filterring 

  --->     

   








##############################################################################













#### Need to check   ######################################################

  1)  Is cassandra updated or not 
         check the number of keys 
         check cqlsh  part 


  2)  Upload full item master part 




#!/usr/bin/python

# run by crontab
# removes any files in /logs/ older than 10 days




dry= False 
//dd/101/sssvols07/ndata/cpa/hdfs/daily_user_hist/19141/pur_ran/user_pur_417_19141-437598-72084.parquet,




/a/nd





####################################################################################################
###### Fraud detection part ########################################################################
cd tttcb301/sssvols05/ppp/cprod/cass_aim






#####################################################################################################
#### feature/AD-1794-aim   #######################################################################
git clone https://git.zzz-it.com/scm//aog-adim-batches.git  prod2

    
git checkout  feature/AD-1794-aim         
    
    

    a/ggg101/sssvols07/fdata/daily
    
    
  
############################################################################
. www1_c6000_pro && sh /usr/local/hdp/bin/kinit.sh && sudo /usr/local/bin/mount_gluster.sh 



source tttcb301/sssvols05/ppp/test_code/cass_imaster/prod/scripts/set_envs.sh



export logfile="/dd/101/sssvols07/fdata/log/ztest_"

export cfg="config/prod.properties"


python siid_extract.py  hourly_get_hdfs_aimdelta_siid  --config $cfg --nfile 2  2>&1 | tee -a  "${logfile}_hourly_siid_build.py" 



def hourly_get_hdfs_aimdelta_siid(config:str=None, nfile:int= 10 , add_hours:int=-1 , npool:int=5):
    
    
    config=  "config/prod.properties"
    
    nfile = 10 
    
    
 config= "config/prod.properties"; nfile:int= 10; add_hours:int=-1; npool:int=5

#### pandas
pip install pandas==1.3.5   ### o bad lines

                

hdfs dfs -ls  hdfs://www1ns1/user/adimuser/warehouse/adimuser_ad_item/ad-item-master-delta/22/acc=1/aid=2/dt=2022-07-08/hh=16

    


    
############################################################################################################################
#### SIID updates  #########################################################################################################
config="config/stg.properties";  target='item';  mode='local'; filename="*";  keep=1


cd tttcb301/sssvols05/ppp/cprod/cass_aim
cd src

export VERBOSE=10
export logfile="/dd/101/sssvols07/fdata/daily/log/log"


python siid_extract.py  hourly_get_hdfs_aimdelta_siid  --config $cfg --nfile 2  2>&1 | tee -a  "${logfile}_hourly_siid_build.py" 




    
    
############################################################################################################################
#### Cass udpates   ########################################################################################################
config="config/stg.properties";  target='item';  mode='local'; filename="*";  keep=1


cd tttcb301/sssvols05/ppp/cprod/cass_aim
cd src

export VERBOSE=10
export logfile="/dd/101/sssvols07/fdata/daily/log/log"


python cass_update.py  run_insert  --config config/stg.properties  --nrows 100   2>&1 | tee -a  "${logfile}_cass_update.py" 


export cfg="config/stg.properties"


start Insert Loop
debug: (58253017, 2) 20220711
debug:            item_id  shop_id   bk
5118518   15347500   280652    0
5909184   10045500   298559    0
47286496  15573500   359323    0
25065490  10012500   235321    0
4023097   10002500   395694    0
...            ...      ...  ...
15148357  12215499   220942  499
54581011  10941499   284767  499
3381534   10230999   211165  499
5697043   33080499   237784  499
29707071  10045499   202179  499

[58253017 rows x 3 columns]
processing  0











#############################################
Old Chronos Batch

  "name": "cass_item_daily_dbass_full",
  "command": "sh mount_gluster.sh  && ls /a && mkdir -p /a/ndt101/vol/aog  && ls /a && mount -o 'nolock' -t nfs ndt401-v.nnn.jp.local:/aog /a/ndt101/vol/aog && ls /a/ndt101/vol/aog/itemMaster && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/batch_imaster/dbasscass_item_full.sh  ' ",


   #### Shop List is updated and require some changes
  "name": "cass_item_daily_dbass",
  "command": "sh mount_gluster.sh  && ls /a && mkdir -p /a/ndt101/vol/aog  && ls /a && mount -o 'nolock' -t nfs ndt401-v.nnn.jp.local:/aog /a/ndt101/vol/aog && ls /a/ndt101/vol/aog/itemMaster && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/batch_imaster/dbasscass_item.sh  ' ",


    
    {
  "name": "cass_item_daily",
  "command": "sh mount_gluster.sh  && ls /a && mkdir -p /a/ndt101/vol/aog  && ls /a && mount -o 'nolock' -t nfs ndt401-v.nnn.jp.local:/aog /a/ndt101/vol/aog && ls /a/ndt101/vol/aog/itemMaster && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/bin/cass_item.sh  ' ",



#### Kevin Algo:        
## Kafka Feed
  "name": "offca_5minsc6k",
  "command": "sh /usr/local/bin/mount_gluster.sh  && ls /a  &&  ls /dd/101/sssvols07/  && runuser -m root -c 'sh tttcb301/sssvols05/ppp/cprod/batch_ca/ww_5mins_c6k.sh '",
        
        
        
  "name": "offca_5mins",
  "command": "sh mount_gluster.sh && tttcb301/sssvols05/ppp/tbin/zmount/mount2.sh   &&  ls /a  && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/batch_ca/ww_5mins.sh '",

        
    
##### Daily CA Logic 
  "name": "offca_daily",
  "command": "sh mount_gluster.sh && tttcb301/sssvols05/ppp/tbin/zmount/mount2.sh   &&  ls /a  && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/bin/ww_daily.sh '",
  
    
  "name": "offca_daily_pm",
  "command": "sh mount_gluster.sh && tttcb301/sssvols05/ppp/tbin/zmount/mount2.sh   &&  ls /a  && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/bin/ww_daily_pm.sh '",



  "name": "offca_manual",
  "command": "sh mount_gluster.sh && tttcb301/sssvols05/ppp/tbin/zmount/mount2.sh   &&  ls /a  && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/bin/ww_manual.sh '",


    

        
#### New Chronos Batch
        
        




{
  "name": "offca_daily_pm",
  "command": "sh mount_gluster.sh && tttcb301/sssvols05/ppp/tbin/zmount/mount2.sh   &&  ls /a  && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/cprod/bin/ww_daily_pm.sh '",
  "shell": true,
  "executor": "",
  "executorFlags": "",
  "taskInfoData": "",
  "retries": 1,
  "owner": "",
  "ownerName": "",
  "description": "",
  "cpus": 4,
  "disk": 20024,
  "mem": 20000,
  "disabled": false,
  "softError": false,
  "dataProcessingJobType": false,
  "fetch": [
    {
      "uri": "file:///etc/ppp-docker.tar.gz",
      "executable": false,
      "cache": false,
      "extract": true
    }
  ],
  "uris": [],
  "environmentVariables": [
    {
      "name": "NAGIOS_CONTACT",
      "value": "something"
    }
  ],
  "arguments": [],
  "highPriority": false,
  "runAsUser": "root",
  "concurrent": false,
  "container": {
    "type": "DOCKER",
    "image": "docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2",
    "network": "HOST",
    "networkInfos": [],
    "volumes": [],
    "forcePullImage": false,
    "parameters": [
      {
        "key": "privileged",
        "value": "true"
      }
    ]
  },
  "constraints": [],
  "schedule": "R/2021-10-26T15:10:00.000+09:00/PT24H",
  "scheduleTimeZone": ""
}


























cd tttcb301/sssvols05/ppp/cprod/cass_aim




#### feature/AD-1794-aim
git clone https://git.zzz-it.com/scm//aog-adim-batches.git  prod2

    
git checkout  feature/AD-1794-aim         
    
    
    
    a/ggg101/sssvols07/fdata/daily
    
    
    
############################################################################
    

. www1_c6000_pro && sh /usr/local/hdp/bin/kinit.sh && sudo /usr/local/bin/mount_gluster.sh 



source tttcb301/sssvols05/ppp/test_code/cass_imaster/prod/scripts/set_envs.sh



export logfile="/dd/101/sssvols07/fdata/log/ztest_"

export cfg="config/prod.properties"


python siid_extract.py  hourly_get_hdfs_aimdelta_siid  --config $cfg --nfile 2  2>&1 | tee -a  "${logfile}_hourly_siid_build.py" 



def hourly_get_hdfs_aimdelta_siid(config:str=None, nfile:int= 10 , add_hours:int=-1 , npool:int=5):
    
    
    config=  "config/prod.properties"
    
    nfile = 10 
    
    
 config= "config/prod.properties"; nfile:int= 10; add_hours:int=-1; npool:int=5

#### pandas
pip install pandas==1.3.5   ### o bad lines

                

hdfs dfs -ls  hdfs://www1ns1/user/adimuser/warehouse/adimuser_ad_item/ad-item-master-delta/22/acc=1/aid=2/dt=2022-07-08/hh=16

    

    
    
############################################################################################################################
#### SIID updates  #########################################################################################################
config="config/stg.properties";  target='item';  mode='local'; filename="*";  keep=1


cd tttcb301/sssvols05/ppp/cprod/cass_aim
cd src

export VERBOSE=10
export logfile="/dd/101/sssvols07/fdata/daily/log/log"


python siid_extract.py  hourly_get_hdfs_aimdelta_siid  --config $cfg --nfile 2  2>&1 | tee -a  "${logfile}_hourly_siid_build.py" 



    
    
    
    
    


    
############################################################################################################################
#### Cass udpates   ########################################################################################################
config="config/stg.properties";  target='item';  mode='local'; filename="*";  keep=1


cd tttcb301/sssvols05/ppp/cprod/cass_aim
cd src

export VERBOSE=10
export logfile="/dd/101/sssvols07/fdata/daily/log/log"


python cass_update.py  run_insert  --config config/stg.properties  --nrows 100   2>&1 | tee -a  "${logfile}_cass_update.py" 





















export cfg="config/stg.properties"





















 . www1_c6000_pro && sh /usr/local/hdp/bin/kinit.sh && sudo /usr/local/bin/mount_gluster.sh 


from utilmy import pd_read_file

dirin = "/dd/101/sssvols07/fdata/output/merge_impratio-time_full_2022-07-14/pred/to_rpp/"

df = pd_read_file( dirin + "/ip_fraud_flag_model_2022-07-14.parquet")
df 

df.to_csv( dirin +"/ip_fraud_flag_model_2022-07-14.csv"    ,index=False)




dirout = "/dd/101/sssvols07/fdata/output/merge_impratio-time_full_2022-07-14/pred/to_rpp/"


##### Impression no-click   #################################
dirin = "/dd/101/sssvols07/fdata/input/features/ip_suspicious_imp_noclick_2022-07-14/"
df    = pd_read_file( dirin + "/ip_impression_noclick.parquet")
df 

df.to_csv( dirout +"/ip_impression_noclick.csv"    ,index=False)






######## HDFS Export ##########################################
export dirin=/dd/101/sssvols07/fdata/output/merge_impratio-time_full_2022-07-14/pred/to_rpp/csv/

export dirout=/user/ppp/rpp/fraud/data/export/prod/rpp_sgteam_ipfraudflag/pred/2022-07-14/


hdfs dfs  -copyFromLocal  $dirin/*   $dirout


hdfs dfs  -ls   $dirout



hdfs dfs  -rmr   $dirout/to_rpp



#### Copy to RPP
hdfs dfs -cp  /user/ppp/rpp/fraud/data/export/prod/rpp_sgteam_ipfraudflag/pred/2022-07-14  /user/rppuser/rpp/AogMLBlockingList/source/



hdfs dfs  -ls  /user/rppuser/rpp/AogMLBlockingList/source/2022-07-14









hdfs dfs  -ls   hdfs://www1ns1/user/adimuser/warehouse/adimuser_ad_item/ad-item-master-delta/acc=1/aid=2/dt=2022-07-15/hh=08/




hdfs://www1ns1/user/ppp/rpp/fraud/data/export/prod/rpp_sgteam_ipfraudflag/pred/2022-07-14/ip_fraud_flag_model_2022-07-14.parquet
-rw-------   3 ppp ppp      91032 2022-07-14 22:24 hdfs://www1ns1/user/ppp/rpp/fraud/data/export/prod/rpp_sgteam_ipfraudflag/pred/2022-07-14/ip_impression_noclick.parquet



hdfs 



fs -f $LOCAL_MOUNT_SRC_PATH/yourfilename.txt your_hdfs_file-path


ound 2 items
-rw-------   3 ppp ppp     644672 2022-07-14 22:23 hdfs://www1ns1/user/ppp/rpp/fraud/data/export/prod/rpp_sgteam_ipfraudflag/pred/2022-07-14/ip_fraud_flag_model_2022-07-14.parquet
-rw-------   3 ppp ppp      91032 2022-07-14 22:24 hdfs://www1ns1/user/ppp/rpp/fraud/data/export/prod/rpp_sgteam_ipfraudflag/pred/2022-07-14/ip_impression_noclick.parquet













    




docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7

export IMAGE_NAME='docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7base'



########  Details  ############################################################################
docker build   --file Dockerfile.star_root  -t ${IMAGE_NAME}  .  


docker push ${IMAGE_NAME} 






docker run  -d -it --name py3_6k02 --net=host -v /tmp:/tmp  -v /home:/home   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7base   bash 


docker exec -it  py3_6k02  /bin/bash 




docker commit -p  -m 'py_c6k'  bb3b2665e53c  docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7base2



bb3b2665e53c   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7base   "bash"                   2 minutes ago   Up 2 minutes                                                                                                py3_6k02







[martinezdavi01@omnia-crs-cassandra-www1a-stg-001 ~]$ 

cqlsh --debug --ssl --cqlshrc /home/martinezdavi01/.cassandra/cqlshrc -u dbaas_admin -p 8a88e3631bfdfa53f2399f52af7eaccb505d5184747756f6623a450f1452b24c omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz
Using CQL driver: <module 'cassandra' from '/usr/share/cassandra/lib/cassandra-driver-internal-only-3.11.0-bb96859b.zip/cassandra-driver-3.11.0-bb96859b/cassandra/__init__.py'>
Using connect timeout: 5 seconds
Using 'utf-8' encoding
Using ssl: True
Connected to aog-cassaas1 at omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz:9042.
[cqlsh 5.0.1 | Cassandra 3.11.12 | CQL spec 3.4.4 | Native protocol v4]
Use HELP for help.


[connection]
factory = cqlshlib.ssl.ssl_transport_factory

https://docs.datastax.com/en/security/6.0/security/Auth/secCqlshSsl.html


[ssl]
validate = false
version = TLSv1_2
certfile = /home/martinezdavi01/rootca.crt
userkey = /home/martinezdavi01/client_key.key
usercert = /home/martinezdavi01/client_cert.crt_signed


Generate a separate key and certificate for cqlsh, using the client.conf file you created in the previous step.
openssl req -newkey rsa:2048 \
-nodes \
-keyout client_key.key \
-out signing_request.csr \
-config client.conf


https://docs.datastax.com/en/security/6.0/security/Auth/secCqlshSsl.html



rootca - ca-cert

client cert - cassandra cert signed

client key - get the private key from the pem file


#### not forced authenitication.
9042

cqlsh --debug --ssl --cqlshrc "tttcb301/sssvols05/ppp/cprod/config/cass_config/cqlsh-cfg.ini"  -u dbaas_admin -p 8a88e3631bfdfa53f2399f52af7eaccb505d5184747756f6623a450f1452b24c omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz


[ppp@docker101 test_code]$
[ppp@docker101 test_code]$
[ppp@docker101 test_code]$ cqlsh --debug --ssl --cqlshrc "tttcb301/sssvols05/ppp/cprod/config/cass_config/cqlsh-cfg.ini"  -u dbaas_admin -p 8a88e3631bfdfa53f2399f52af7eaccb505d5184747756f6623a450f1452b24c omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz
Using CQL driver: <module 'dse' from 'tttcb301/sssvols05/ppp/cprod/batch_imaster/cqlsh_bin/bin/../zipfiles/dse-driver-internal-only-2.11.1.zip/dse-driver-2.11.1/dse/__init__.py'>
Using connect timeout: 5 seconds
Using 'utf-8' encoding
Using ssl: True
Using DSEPlainTextAuthProvider
Connected to aog-cassaas1 at omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz:9042.
[cqlsh 5.0.1 | Cassandra 3.11.12 | CQL spec 3.4.4 | Native protocol v4]
Use HELP for help.











#######
parquet to csv 




ssh docker101.analysis-shared.jpe2b.dcnw.zzz


#### HDP 6k
docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7


docker run --rm -d -it --name py3_6k01 --net=host -v /tmp:/tmp  -v /home:/home   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7   bash 


docker exec -it  py3_6k01  /bin/bash 

. www1_c6000_pro && sh /usr/local/hdp/bin/kinit.sh && sudo /usr/local/bin/mount_gluster.sh 






Create Docker system with root acccess 


################################################################################
##### Information New requirements:
   SKU 

       Specifications :  












########################################################################################################################
[11:32 AM] Serie, Benoit | Benoit | PAMD
Noel, Kevin | Kev | PAMD You can checkout


 https://onecloud.zzz-it.com/database/deployments dbaas-cassandra : aog-cassaas1.

  And One Cloud doc: https://onecloud.zzz-it.com/one-docs/docs/Database/DBaaS/dbaas-multidc-cassandra-create-and-destroy


omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz 


Nodes
FQDN  DC  Platform  Instance  Role
omnia-aog-cassaas1-001.dbaas.jpe2c.dcnw.zzz JPE2C bmaas c7.mem  cassandra-bm-seed-node-with-reaper
omnia-aog-cassaas1-002.dbaas.jpe2c.dcnw.zzz JPE2C bmaas c7.mem  cassandra-bm-seed-node
omnia-aog-cassaas1-003.dbaas.jpe2c.dcnw.zzz JPE2C bmaas c7.mem  cassandra-bm-non-seed-node
omnia-aog-cassaas1-004.dbaas.jpe2c.dcnw.zzz JPE2C bmaas c7.mem  cassandra-bm-non-seed-node
omnia-aog-cassaas1-005.dbaas.jpe2c.dcnw.zzz JPE2C bmaas c7.mem  cassandra-bm-non-seed-node



##### path
tttcb301/sssvols05/ppp/cprod/batch_imaster/cqlsh_bin/bin/cqlsh


export PATH="$PATH:tttcb301/sssvols05/ppp/cprod/batch_imaster/cqlsh_bin/bin/"



cqlsh --cqlshrc="tttcb301/sssvols05/ppp/cprod/config/cass_config/cqlsh-cfg.ini"



(base) [root@docker101 c6k]# cqlsh --cqlshrc="tttcb301/sssvols05/ppp/cprod/config/cass_config/cqlsh-cfg.ini"
Connection error: ('Unable to connect to any servers', {'100.117.94.9:9142': ConnectionRefusedError(111, "Tried connecting to [('100.117.94.9', 9142)]. Last error: Connection refused")})
(base) [root@docker101 c6k]#









// use the image to connect both C4000 and www1 C6000
docker run --net=host --rm -it  -d  --name hdfs1   docker-regi.intra.zzz-it.com/ppp/aog-user-behaviors:py36-www1-c6000-c4000-pro-1.0.0 bash
 
docker exec -it   hdfs1  /bin/bash 
/usr/local/hdp314/bin/kinit.sh




------------------------------------------------------- backup z data (purchase related) on C6000 -------------------------------------------------------
// kinit as zdatauser
$ kinit -kt /usr/local/hdp314/keytabs/zdatauser.C2000.keytab zdatauser@C2000.HADOOP.zzz.COM
// confirm z data on C4000 (no need to specify port 8020)
$ hdfs dfs -ls hdfs://nameservice1:8020/user/zdatauser/zdata.db/z/transaction/z_T_purchase_item/dt=2021-07-19
 


// copy z data to ppp C4000
$ hdfs dfs -mkdir hdfs://nameservice1:8020/user/ppp/external/zdata/z_t_purchase_item
$ hdfs dfs -cp hdfs://nameservice1:8020/user/zdatauser/zdata.db/z/transaction/z_T_purchase_item/dt=2021-07-19 hdfs://nameservice1:8020/user/ppp/external/zdata/z_t_purchase_item
 
// switch to ppp and execute the same distcp command => succeeded
/usr/local/hdp314/bin/kinit.sh

hadoop distcp -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1 \
              -skipcrccheck \
              hdfs://nameservice1:8020/user/ppp/external/zdata/z_t_purchase_item/dt=2021-07-19 \
              hdfs://www1ns1:8020/user/ppp/external/zdata/z_t_purchase_item
 

#### C4000 to C6000 Copy 
F1 , F0 Screen

hdfs dfs -ls  hdfs://nameservice1:8020/user/ppp/external/zdata/



hdfs dfs -ls   hdfs://www1ns1:8020/user/ppp/external/zdata/z_t_purchase_item




hadoop distcp -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1 \
              -skipcrccheck \
              hdfs://nameservice1/user/aduser/rpp_fraud/geo_location  \
              hdfs://www1ns1:8020/user/ppp/rpp/fraud/c4000/  



hadoop distcp -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1 \
              -skipcrccheck \
              hdfs://nameservice1/user/aduser/rpp_fraud/dashboard_feed  \
              hdfs://www1ns1:8020/user/ppp/rpp/fraud/c4000/fraud/    &  




hadoop distcp -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1 \
              -skipcrccheck \
              hdfs://nameservice1/user/aduser/rpp_fraud/features/2022-05-21  \
              hdfs://www1ns1:8020/user/ppp/rpp/fraud/c4000/fraud/features_dash/    &  



###  ppp nono
hadoop distcp -Dmapreduce.job.hdfs-servers.token-renewal.exclude=nameservice1 \
              -skipcrccheck \
              hdfs://nameservice1/user/ppp/nono/quantity_extract  \
              hdfs://www1ns1:8020/user/ppp/rpp/fraud/c4000/nono/    &


#### HIVE Databse 


hdfs://nameservice1/user/ppp/nono/quantity_extract



hdfs dfs -mkdir hdfs://www1ns1:8020/user/ppp/rpp/fraud/c4000/fraud/nono3.db/


hdfs dfs -mkdir hdfs://www1ns1:8020/user/ppp/rpp/fraud/c4000/fraud/nono/

















Ad Item Master



Glsuters i

hdfs dfs -copyToLocal   hdfs://www1ns1/user/adimuser/warehouse/adimuser_ad_item/ad-item-master-delta/acc=1/aid=2/dt=2022-05-19/hh=08



hdfs://www1ns1/user/adimuser/warehouse/adimuser_ad_item/



warehouse/adimuser_ad_item/ad-item-master-delta//acc=1/aid=2/
   --> 2098 " ""deleted_flg"": 1}"  " ""update_datetime"":1652914847433"                            "{""id"":""00000264046-00023186437-1"""                                                                                                                                                                                                                                                                                                                                             
2099    " ""deleted_flg"": 1}"  " ""update_datetime"":1652914847433"                            "{""id"":""298309-10179786"""       




hdfs dfs -copyToLocal   hdfs://www1ns1/user/adimuser/warehouse/adimuser_ad_item/ad-item-master-snapshot_latest_partition


/dd/101/sssvols07/fdata/hdfs/ 





20

Recently I had to migrate some images from Docker registry (docker.mycompany.com) to Artifactory (docker.artifactory.mycompany.com)

docker pull docker.mycompany.com/something/redis:4.0.10
docker tag docker.mycompany.com/something/redis:4.0.10    docker.artifactory.mycompany.com/something/redis:4.0.10
docker push docker.artifactory.mycompany.com/something/redis:4.0.10


docker tag    docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v06       docker-regi.intra.zzz-it.com/ppp/rpp-fraud:hdp6000-v01


docker  push  docker-regi.intra.zzz-it.com/ppp/rpp-fraud:hdp6000-v01













[9:05 AM] Komoda, Kazuhiro | Kazu | PAMD[Action Required] C6000 Migration for CA/RPP Flink HDFS data consumers
    




Hello ,  |  | PAMD, Chen, Kyle | Kyle | , Zhao, Meng | Meng | PAMD, Camps, James | James | , Sodkomkham, Danaipat | Jo | FID (Cc: General, Alhat, Aniket)
Thank you for your patience, CA Flink and RPP Flink have finally started to produce HDFS data to both C4000 and C6000.


  
(CA Flink, from 2022-01-26) https://jira.zzz-it.com/jira/browse/AD-1348
  
(RPP Flink, from 2022-04-12) https://jira.zzz-it.com/jira/browse/AD-1560


Actions


  
Kindly let me know if End of Apr 2022 is a realistic deadline for your migration or suggest alternative plan.
  
Would you mind trying to migrate your batches, etc. to read from C6000?

For those of you who read data under below directories in C4000,


  
(CA Flink) hdfs://nameservice1/user/ppp/sc_stream/prod/
  
(RPP Flink) hdfs://nameservice1/user/ppp/cpcreborn/prod/RPPOutputToHadoop/

Path in C6000 instead (and let me know if you find any issues)


  
(CA Flink) hdfs://www1ns1/user/ppp/ca/stream/prod/
  
(RPP Flink) hdfs://www1ns1/user/ppp/rpp/stream/prod/



Details

Please find the target HDFS paths here https://confluence.zzz-it.com/confluence/pages/viewpage.action?pageId=2962405431
The page shows from which timestamp (hour) you can expect C6000 data to be available.










(base) [root@docker101 c6k]# mkdir zlog
(base) [root@docker101 c6k]#   python    data_pipe_line/get_test.py --config config/prod_local.yaml    >> zlog/zlog_HourlyIpRpExporter.py 2>&1   &
[1] 12224
(base) [root@docker101 c6k]# hdfs dfs -ls   hdfs:///user/ppp/
Found 29 items
drwx------   - ppp ppp          0 2022-04-14 00:05 hdfs:///user/ppp/.Trash
drwxr-----   - ppp ppp          0 2021-07-21 08:19 hdfs:///user/ppp/.hiveJars
drwx------   - ppp ppp          0 2022-03-09 07:21 hdfs:///user/ppp/.skein
drwx------   - ppp ppp          0 2022-04-14 03:14 hdfs:///user/ppp/.sparkStaging
drwx------   - ppp ppp          0 2022-04-13 18:24 hdfs:///user/ppp/.staging
drwx------   - ppp ppp          0 2022-02-16 01:58 hdfs:///user/ppp/Sarah
drwx------   - ppp ppp          0 2022-01-27 12:10 hdfs:///user/ppp/aog-user-behaviors
drwx------   - ppp ppp          0 2022-03-25 07:40 hdfs:///user/ppp/bta
drwx------   - ppp ppp          0 2022-01-21 04:47 hdfs:///user/ppp/ca
drwx------   - ppp ppp          0 2022-04-05 16:23 hdfs:///user/ppp/ww_targeting
drwx------   - ppp ppp          0 2022-03-29 08:59 hdfs:///user/ppp/zzztt
drwxr-----   - ppp ppp          0 2021-10-12 05:29 hdfs:///user/ppp/cma
drwx------   - ppp ppp          0 2022-01-21 06:14 hdfs:///user/ppp/common
drwx------   - ppp ppp          0 2021-07-27 08:13 hdfs:///user/ppp/cpcreborn
drwx------   - ppp ppp          0 2021-08-30 14:11 hdfs:///user/ppp/dist-ml-example
drwx------   - ppp ppp          0 2021-07-21 02:46 hdfs:///user/ppp/external
drwx------   - ppp ppp          0 2021-10-06 02:17 hdfs:///user/ppp/flink
drwx------   - ppp ppp          0 2022-04-12 04:49 hdfs:///user/ppp/flink-mesos
drwx------   - ppp ppp          0 2022-01-13 15:55 hdfs:///user/ppp/meng
drwx------   - ppp ppp          0 2022-01-27 01:18 hdfs:///user/ppp/kkkma
drwx------   - ppp ppp          0 2021-11-11 05:46 hdfs:///user/ppp/rmpse
drwx------   - ppp ppp          0 2022-04-08 01:18 hdfs:///user/ppp/rpp
drwx------   - ppp ppp          0 2022-01-10 08:47 hdfs:///user/ppp/runa
drwx------   - ppp ppp          0 2021-07-12 03:04 hdfs:///user/ppp/sc_stream
drwx------   - ppp ppp          0 2021-07-20 04:13 hdfs:///user/ppp/ppp_test
drwx------   - ppp ppp          0 2022-04-14 02:45 hdfs:///user/ppp/tmp
drwx------   - ppp ppp          0 2021-07-20 13:46 hdfs:///user/ppp/vran
drwx------   - ppp ppp          0 2022-02-01 13:47 hdfs:///user/ppp/warehouse
drwx------   - ppp ppp          0 2021-10-12 08:12 hdfs:///user/ppp/work
[1]+  Exit 1                  python data_pipe_line/get_test.py --config config/prod_local.yaml >> zlog/zlog_HourlyIpRpExporter.py 2>&1
(base) [root@docker101 c6k]# hdfs dfs -ls   hdfs:///user/ppp/fraud
ls: hdfs:///user/ppp/fraud: No such file or directory
(base) [root@docker101 c6k]# hdfs dfs -ls   hdfs:///user/ppp/rpp/fraud
(base) [root@docker101 c6k]# hdfs dfs -ls   hdfs:///user/ppp/warehouse
Found 5 items
drwx------   - ppp ppp          0 2021-11-15 05:15 hdfs:///user/ppp/warehouse/ppp_ca_db
drwx------   - ppp ppp          0 2022-02-01 11:44 hdfs:///user/ppp/warehouse/ppp_db
drwx------   - ppp ppp          0 2021-10-29 06:05 hdfs:///user/ppp/warehouse/ppp_se_db
drwx------   - ppp ppp          0 2021-09-30 09:54 hdfs:///user/ppp/warehouse/ppp_test
drwx------   - ppp ppp          0 2022-02-01 13:47 hdfs:///user/ppp/warehouse/ppp_tmp_db
(base) [root@docker101 c6k]# hdfs dfs -ls   hdfs:///user/ppp/warehouse/ppp_db
Found 4 items
drwx------   - ppp ppp          0 2022-04-13 18:30 hdfs:///user/ppp/warehouse/ppp_db/z_t_purchase_item
drwxr-----   - ppp ppp          0 2022-04-13 18:30 hdfs:///user/ppp/warehouse/ppp_db/z_t_purchase_item_cancel
drwxr-----   - ppp ppp          0 2022-04-13 18:30 hdfs:///user/ppp/warehouse/ppp_db/z_t_purchase_order
drwxr-----   - ppp ppp          0 2022-04-13 18:30 hdfs:///user/ppp/warehouse/ppp_db/z_t_purchase_order_cancel
(base) [root@docker101 c6k]# hdfs dfs -ls   hdfs:///user/ppp/warehouse





2>&1 | tee -a zlog_runbatch.txt  




### new docker hosting
ssh docker101.analysis-shared.jpe2b.dcnw.zzz




cat  /var/log/cassandra/system.log 



cp -r ./SourceFolder ./DestFolder



Spark show print 

#####

Kid to manage 


Wife
over hours and business trip and doing Business Trip 

Need to manage the kid morning/evening : Extra Cost.

2 hours  Morning :
  2 days home helpful.


#####
 Offline project for backend Ui :
    prepare the docker for the backend : Up and Running 


 Meeting discussion on Fraud Bot dump and
    follow on this to fix some issues.

    Singapore Follow up


 Fix pipeline batches for Rec CA.






du -h your_directory




#### folder sizer biggest size 
find /sys/fs/cgroup/ -printf '%s %p\n'|sort -nr|head -20


find /data/workspaces/ -printf '%s %p\n'|sort -nr|head -50  > bigfile2.txt

du -h 


####



#### In sublime
ssh -m hmac-sha2-512 popo01@loginjpe1101z.nnn.jp.local



#################################################################
Backend Monitoring :

    Debug the UI data.
    Debug the models.
 
    Monitor the 




 ###### Use SSH Login 
#!/bin/sh
# {Your short account}@stg-loginXXX
  
SERVERS=(
stg-amoraerumallredis101z.stg.jp.local
stg-amoraerumallredis102z.stg.jp.local
stg-bmoraerumall101z.stg.jp.local
stg-bmoraerumall102z.stg.jp.local
stg-wmoraerumalladmin101z.stg.jp.local
stg-wmoraerumalladmin102z.stg.jp.local
stg-wmoraerumallapi101z.stg.jp.local
stg-wmoraerumallapi102z.stg.jp.local
stg-wmoraerumallimage101z.stg.jp.local
stg-wmoraerumallimage102z.stg.jp.local
stg-wmoraerumallportal101z.stg.jp.local
stg-wmoraerumallportal102z.stg.jp.local
)
 
for server in ${SERVERS[@]}; do
    ssh $server "ssh-keygen"
    scp ~/.ssh/id_rsa.pub $server:~/id_rsa.pub.`hostname`
    ssh $server "cat id_rsa.pub.`hostname` >> ~/.ssh/authorized_keys"
    ssh $server "chmod 600 ~/.ssh/authorized_keys"
done


Generate a pair of authentication keys for aztop301z.nnn.jp.local without password:


$ ssh-keygen -t rsa
# This create .ssh folder in /home/user01/.ssh


Create .ssh folder in other servers (aztop3[01-35]z) and add aztop301z public key to other servers .ssh/authorized_keys:

ssh nguyenphuong01@aztop302z.nnn.jp.local mkdir -p .ssh

cat .ssh/id_rsa.pub | ssh nguyenphuong01@aztop302z.nnn.jp.local 'cat >> .ssh/authorized_keys'



SSH to other servers without password:

[nguyenphuong01@aztop301z ~]$ ssh aztop302z.nnn.jp.local
Last login: Wed May 23 11:43:48 2018 from 100.74.27.108








vim  /var/lib/glusterd/a-gfs101-ipsvols07.log





wc -l <filename>




yes | cp -rf xxx yyy



##### Renew of the certificates
mkdir -p /var/lib/glusterd/

cp  tttcb301/sssvols05/ppp/tbin/zmount/glusterd/secure-access /var/lib/glusterd/secure-access

cp -R  tttcb301/sssvols05/ppp/tbin/zmount/ssl  /etc/


ls -l tttcb301/sssvols05/ppp/tbin/zmount/ssl

mv /etc/ssl /etc/ssl_old

#### New Certificates
cp -R  tttcb301/sssvols05/ppp/tbin/zmount/ssl  /etc/

ls -l  /var/lib/glusterd/

mv  /var/lib/glusterd/secure-access /var/lib/glusterd/secure-access_old




mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.aog.jpe2b.dcnw.zzz:gfs103.aog.jpe2b.dcnw.zzz gfs101.aog.jpe2b.dcnw.zzz:/sssvols07 /dd/101/sssvols07


sudo su root

sudo umount   /dd/101/sssvols07                                                                                                                                                               



rm -rf  /dd/101/sssvols07   



#### Check 

ls -l  /var/lib/glusterd/  #### secure-access


ls /dd/101/sssvols07   

mkdir -p  /dd/101/sssvols07   

mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.aog.jpe2b.dcnw.zzz:gfs103.aog.jpe2b.dcnw.zzz gfs101.aog.jpe2b.dcnw.zzz:/sssvols07 /dd/101/sssvols07






[2022-04-22 06:52:16.265006] E [mount.c:475:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (Operation not permitted)
[2022-04-22 06:52:16.265036] E [MSGID: 101019] [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]
[2022-04-22 12:24:39.617409] E [mount.c:475:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (Operation not permitted)
[2022-04-22 12:24:39.617435] E [MSGID: 101019] [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]
~
~
~


crw-rw-rw- 1 root root 10, 229 Apr 22 12:24 /dev/fuse



[root@1fc70fd4f695 ztmp]# ls -l /dev/fuse
crw-rw-rw- 1 root root 10, 229 Apr 15 02:47 /dev/fuse







ls /var/lib/glusterd/secure-access 



/var/log/glusterfs:
a-cb201-ipsvols03.log  a-cb301-ipsvols05.log  a-gfs101-ipsvolh01.log  a-gfs201-ipsvols02.log  a-gfs101-ipsvols07.log

vim /var/log/glusterfs/a-gfs101-ipsvols07.log



Glusterfs mount failed: Initialization of volume 'fuse' failed, review your volfile again
[root@testdb1  ~]# vi /etc/fstab

storage1:/dbasharedvol /mnt/dbasharedvol glusterfs defaults,_netdev 0 0

[root@testdb1 ~]# mount -a
Mount failed. Please check the log file for more details.

[root@testdb1 ~]# tail -100 /var/log/glusterfs/mnt-dbasharedvol.log
[2017-03-17 14:58:34.225615] I [glusterfsd.c:1910:main] 0-/usr/sbin/glusterfs: Started running /usr/sbin/glusterfs version 3.4.1 (/usr/sbin/glusterfs --volfile-id=/dbasharedvol --volfile-server=storage1 /mnt/dbasharedvol)
[2017-03-17 14:58:34.225874] E [mount.c:267:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (No such file or directory)
[2017-03-17 14:58:34.225888] E [xlator.c:390:xlator_init] 0-fuse: Initialization of volume 'fuse' failed, review your volfile again
[2017-03-17 14:58:59.468108] I [glusterfsd.c:1910:main] 0-/usr/sbin/glusterfs: Started running /usr/sbin/glusterfs version 3.4.1 (/usr/sbin/glusterfs --volfile-id=/dbasharedvol --volfile-server=storage1 /mnt/dbasharedvol)
[2017-03-17 14:58:59.468362] E [mount.c:267:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (No such file or directory)
[2017-03-17 14:58:59.468376] E [xlator.c:390:xlator_init] 0-fuse: Initialization of volume 'fuse' failed, review your volfile again
[2017-03-17 15:00:25.063138] I [glusterfsd.c:1910:main] 0-/usr/sbin/glusterfs: Started running /usr/sbin/glusterfs version 3.4.1 (/usr/sbin/glusterfs --volfile-id=/dbasharedvol --volfile-server=storage1 /mnt/dbasharedvol)
[2017-03-17 15:00:25.063375] E [mount.c:267:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (No such file or directory)
[2017-03-17 15:00:25.063390] E [xlator.c:390:xlator_init] 0-fuse: Initialization of volume 'fuse' failed, review your volfile again

Solution:
 mknod -m 666 /dev/fuse c 10 229
 mount -a 



mknod /dev/fuse c 10 229 



 [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]
[2022-04-22 05:28:03.722849] E [mount.c:475:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (No such file or directory)
[2022-04-22 05:28:03.722884] E [MSGID: 101019] [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]
[2022-04-22 06:18:58.630101] E [mount.c:475:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (No such file or directory)
[2022-04-22 06:18:58.630129] E [MSGID: 101019] [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]
[2022-04-22 06:49:50.604077] E [mount.c:475:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (Is a directory)
[2022-04-22 06:49:50.604107] E [MSGID: 101019] [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]
[2022-04-22 06:52:16.265006] E [mount.c:475:gf_fuse_mount] 0-glusterfs-fuse: cannot open /dev/fuse (Operation not permitted)
[2022-04-22 06:52:16.265036] E [MSGID: 101019] [xlator.c:623:xlator_init] 0-fuse: Initialization of volume failed. review your volfile again. [{name=fuse}]




##### Need to Install fuse
(base) [root@docker101 work_dir]#
(base) [root@docker101 work_dir]# which fuse
/usr/bin/which: no fuse in (/opt/anaconda3/bin:/opt/anaconda3/condabin:/usr/local/hdp314/hbase/bin:/usr/local/hdp314/hive/bin:/usr/local/hdp314/spark2/bin:/usr/local/hdp314/jre/bin:/usr/local/hdp314/hadoop/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin:/bin:/usr/sbin:/usr/bin)
(base) [root@docker101 work_dir]# yum install fuse-utils
^CCentOS-8 - AppStream                                             [            ===                                             ] ---  B/s |   0  B     --:-- ETCentOS-8 - AppStream                                                                                                            0.0  B/s |   0  B     00:24
Error: Failed to download metadata for repo 'AppStream': Librepo was interrupted by a signal
(base) [root@docker101 work_dir]#




echo $https_proxy


#### CentOS
export https_proxy="http://pkg.proxy.nnn.jp.local:10080"
export http_proxy="http://pkg.proxy.nnn.jp.local:10080"


cd /etc/yum.repos.d/ \
&& sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
&& sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* \
&& yum -y install --nogpgcheck --enablerepo=PowerTools  \



 yum -y install --nogpgcheck --enablerepo=PowerTools  fuse fuse-libs


yum -y install gluster glusterfs-fuse

 yumdownloader 



f
Total download size: 206 k
Installed size: 515 k
Downloading Packages:
(1/3): fuse-common-3.2.1-12.el8.x86_64.rpm                                                                                       74 kB/s |  21 kB     00:00
(2/3): fuse-libs-2.9.7-12.el8.x86_64.rpm                                                                                        327 kB/s | 102 kB     00:00
(3/3): fuse-2.9.7-12.el8.x86_64.rpm                                                                                             107 kB/s |  82 kB     00:00
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                           266 kB/s | 206 kB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                        1/1
  Installing       : fuse-common-3.2.1-12.el8.x86_64                                                                                                        1/3
  Installing       : fuse-2.9.7-12.el8.x86_64                                                                                                               2/3
  Installing       : fuse-libs-2.9.7-12.el8.x86_64                                                                                                          3/3
  Running scriptlet: fuse-libs-2.9.7-12.el8.x86_64                                                                                                          3/3
  Verifying        : fuse-2.9.7-12.el8.x86_64                                                                                                               1/3
  Verifying        : fuse-common-3.2.1-12.el8.x86_64                                                                                                        2/3
  Verifying        : fuse-libs-2.9.7-12.el8.x86_64                                                                                                          3/3

Installed:
  fuse-2.9.7-12.el8.x86_64                         fuse-common-3.2.1-12.el8.x86_64                         fuse-libs-2.9.7-12.el8.x86_64




yum clean all && yum -y update && \
yum -y install bzip2 openssh-server wget fuse fuse-libs openib libibverbs nfs-utils librdmacm nfs-common userspace-rcu libibverbs attr psmisc && \
yum clean all
dockers
—
gluster/
Dockerfile

rpm -i /tmp/glusterfs-client-xlators-3.9.0-2.el7.x86_64.rpm && \
rpm -i /tmp/glusterfs-fuse-3.9.0-2.el7.x86_64.rpm && \
rpm -i /tmp/glusterfs-rdma-3.9.0-2.el7.x86_64.rpm && \






#!/bin/bash
########  Gluster mount ###########################################################################
#### Mount SSL Drive              #####################
mkdir -p /var/lib/glusterd/

cp  tttcb301/sssvols05/ppp/tbin/zmount/glusterd/secure-access /var/lib/glusterd/secure-access

cp -R  tttcb301/sssvols05/ppp/tbin/zmount/ssl  /etc/


# cp secure-access.sav /var/lib/glusterd/secure-access.sav


mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=acb402.analysis-shared.jpe2b.dcnw.zzz:acb403.analysis-shared.jpe2b.dcnw.zzz acb401.analysis-shared.jpe2b.dcnw.zzz:/sssvols06 /a/acb401/sssvols06
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.aog.jpe2b.dcnw.zzz:gfs103.aog.jpe2b.dcnw.zzz gfs101.aog.jpe2b.dcnw.zzz:/sssvols07 /dd/101/sssvols07

ls /dd/101/sssvols07


#### Logs
ls  /var/log/glusterfs/ 

### cp   /var/lib/glusterd/secure-access  tttcb301/sssvols05/ppp/tbin/zmount/glusterd/secure-access
### umount  /dd/101/sssvols07

#### Easy copy
chown -R ppp.ppp /dd/101/sssvols07/ndata



mkdir -p \
tttgfs101/sssvolh01 \
tttgfs104/sssvolh01 \
tttgfs201/sssvolh02 \
tttgfs204/sssvolh02 \
tttgfs201/sssvols02 \
tttgfs204/sssvols02 \
tttcb201/sssvolh03 \
tttcb204/sssvolh03 \
tttcb201/sssvols03 \
tttcb204/sssvols03 \
/a/ins-apiopds101/sssvols04 \
/a/ins-apiopds101/sssvolh04 \
/a/ins-apiopds104/sssvols04 \
/a/ins-apiopds104/sssvolh04 \
/a/ins-apiopds101/apiopdsgv01 \
tttcb301/sssvols05 \
/a/acb401/sssvols06 \
/dd/101/sssvols07

# Unsecured
mv /var/lib/glusterd/secure-access /var/lib/glusterd/secure-access.sav
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs101.nnn.hnd1..local:/sssvolh01 tttgfs101/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs104.nnn.hnd1..local:/sssvolh01 tttgfs104/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvolh02 tttgfs201/sssvolh02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs204.nnn.hnd1..local:/sssvolh02 tttgfs204/sssvolh02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvols02 tttgfs201/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs204.nnn.hnd1..local:/sssvols02 tttgfs204/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvolh03 tttcb201/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvolh03 tttcb204/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvols03 tttcb204/sssvols03
mount -t glusterfs -o log-level=WARNING ins-apiopds104.nnn.jp.local:/apiopdsgv01 /a/ins-apiopds101/apiopdsgv01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds101.nnn.hnd1..local:/sssvols04 /a/ins-apiopds101/sssvols04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds101.nnn.hnd1..local:/sssvolh04 /a/ins-apiopds101/sssvolh04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds104.nnn.hnd1..local:/sssvols04 /a/ins-apiopds104/sssvols04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds104.nnn.hnd1..local:/sssvolh04 /a/ins-apiopds104/sssvolh04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05

# Secured
mv /var/lib/glusterd/secure-access.sav /var/lib/glusterd/secure-access
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=acb402.analysis-shared.jpe2b.dcnw.zzz:acb403.analysis-shared.jpe2b.dcnw.zzz acb401.analysis-shared.jpe2b.dcnw.zzz:/sssvols06 /a/acb401/sssvols06
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.aog.jpe2b.dcnw.zzz:gfs103.aog.jpe2b.dcnw.zzz gfs101.aog.jpe2b.dcnw.zzz:/sssvols07 /dd/101/sssvols07



#### cp -R  /home/popo01/ssl  /etc/   copy the SSL into   /etc/ for secure mount


#### transpor end point issues :  secure-access.sav  and    umount tttcb201/sssvols03  and then mount it


####  umount  /a/ins-apiopds104/sssvols04 

## mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03


## umount tttcb201/sssvols03  && mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03  


## umount  tttcb204/sssvolh03  &&   mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvolh03 tttcb204/sssvolh03



## umount tttcb201/sssvolh03  &&  mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvolh03 tttcb201/sssvolh03  





###########  This one has Secure Mount certificates  + Root Acccess
docker_image=docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4
base_commands=sudo /usr/local/bin/mount_gluster.sh, sh /usr/local/hdp314/bin/kinit.sh

docker run --rm -d -it --name py3_c5bis --net=host -v /tmp:/tmp  -v /home:/home  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4   bash 

/usr/local/bin/mount_gluster.sh 


docker exec -it  py3_c5  /bin/bash 

docker exec -it  agitated_elion  /bin/bash 

docker exec -it  py3_c4  /bin/bash 



&& bash    

docker pull  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4   



#### Secure Acces
docker run --rm -d -it --name py3_c4 --net=host -v /data:/data -v /tmp:/tmp  -v /home:/home  -v /a:/a   -v /data_hdd:/data_hdd   -v /data:/data   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"      --privileged  $nname   bash    



############################################################################
#### Mount on Jupyter
docker exec -it  agitated_elion  /bin/bash 


#### Certificates to the dockers
cd  tttcb301/sssvols05/ppp/tbin/zmount


mkdir -p /var/lib/glusterd/
cp secure-access.sav  /var/lib/glusterd/
cp -R  ssl  /etc/

#### Ubuntu install Gluster client
apt-get install -y glusterfs-client

### Execute the mount
./mount_gluster.sh 





entrypoint.sh 

cp glusterfs /usr/sbin/


screen -ls




docker exec -it  py3_c4   /bin/bash 



Dashboard building for Fraud .


Continue Pipeline for Similarity improvement.
  Fixe 




#########  Copy certificates
###########  This one has Secure Mount certificates  + Root Acccess
docker run --rm -d -it --name py3_c5bis --net=host -v /tmp:/tmp  -v /home:/home  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4   bash 

docker exec -it  py3_c5bis   /bin/bash 


#### Mount Gluster
cd tttcb301/sssvols05/ppp/tbin/zmount
cp -R /etc/ssl/  .

cp -R  /home/popo01/ssl  /etc/


cp -R /usr/lib64/glusterfs  /home/popo01/zmount/


cp -R /var/lib/glusterd/  zmount/


cp /var/lib/glusterd/secure-access.sav  zmount/



##############################################################################
##############################################################################
glusterfs: error while loading shared libraries: libglusterfs.so.0: cannot open shared object file: No such file or directory


grep -rnw '/path/to/somewhere/' -e 'pattern'


grep -rnw '/.' -e 'libglusterfs'


cp -R /home/popo01/zmount/lib64  /usr/



#####  Install on Ubuntu
apt-get install openssh-server vim wget


wget https://download.gluster.org/pub/gluster/glusterfs/8/LATEST/Debian/stretch/pool/main/g/glusterfs/glusterfs-client_8.6-1_amd64.deb

mkdir -p   /home/popo01/ssl



#######################################################################################
##### Mount from Anaconda Centos ######################################################
ls /var/lib/glusterd/


##3 Copy certificates 
mkdir -p /var/lib/glusterd/

cp  /home/popo01/zmount/glusterd/secure-access /var/lib/glusterd/secure-access

cp -R  /home/popo01/zmount/ssl  /etc/









/home/popo01/zmount/mount_gluster.sh 
cp /var/lib/glusterd/secure-access.sav /home/popo01/



#####
mkdir -p /var/lib/glusterd/secure-access
cp /home/popo01/zmount/secure-access.sav  /var/lib/glusterd/secure-access

mv /var/lib/glusterd/secure-access.sav /var/lib/glusterd/secure-access



 0-glusterfs: could not load our cert at /etc/ssl/glusterfs.pem
[2021-08-27 17:41:44.137357] E [socket.c:246:ssl_dump_error_stack] 0-glusterfs:   error:02001002:system library:fopen:No such file or directory
[2021-08-27 17:41:44.137385] E [socket.c:246:ssl_dump_error_stack] 0-glusterfs:   error:20074002:BIO routines:FILE_CTRL:system lib

##################################################################################################################
##################################################################################################################









###################################################################
##### Details  ####################################################


15 characters

297840888220440000
-19512328278256
-20240911213310




per channel_id 
    in the ad logs

    ad_channel_id
      cpa, bta, cma,

    aid = 4,9  (RPP, BTA)



RASTA : channel ?
   aid = 
   itemid_aid   


 R2P2 :  logging per impression  widget_id.
    widget1  vs widget2   : CTR, CVR

 raw log





R2P2 competition : widget
Pitari display some parts











#### Test Setup
docker pull  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02  

docker run --net=host --privileged --rm -d -it --name 'off_stg'  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02    bash 

docker exec -it  off_stg  /bin/bash 


cd /opt/rrma &&  git clone https://git.zzz-it.com/scm/rrma/rrma-backend-api.git  rrma-feat && cd rrma-feat  && chmod -R 777 .  && scripts/script_feat.sh



### with logger
scripts/script_stg.sh


### without logger
scripts/script_feat.sh



#### Test on feature port
curl "http://docker101.analysis-shared.jpe2b.dcnw.zzz:9777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=3684023&start_date=1646006400000&end_date=1646352000000&cost=284.0&price=320&price_current=320"




#### Prod port
curl "http://docker101.analysis-shared.jpe2b.dcnw.zzz:6777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=3684023&start_date=1646006400000&end_date=1646352000000&cost=284.0&price=320&price_current=320"



######### Code Test inside Docker 
docker pull  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02  

docker run --net=host --privileged --rm -d -it --name 'off_stg'  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02    bash 

docker exec -it  off_stg  /bin/bash -c "cd /opt/rrma &&  git clone https://git.zzz-it.com/scm/rrma/rrma-backend-api.git  rrma-feat && cd rrma-feat  && chmod -R 777 .  && scripts/script_feat.sh"


#### Commit Background check

curl "http://docker101.analysis-shared.jpe2b.dcnw.zzz:9777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=3684023&start_date=1646006400000&end_date=1646352000000&cost=284.0&price=320&price_current=320"


#### Prod port
curl http://docker101.analysis-shared.jpe2b.dcnw.zzz:6777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=3684023&start_date=1646006400000&end_date=1646352000000&cost=284.0&price=320&price_current=320











### without logger
scripts/script_feat.sh



#### Test on feature port
curl "http://docker101.analysis-shared.jpe2b.dcnw.zzz:9777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=3684023&start_date=1646006400000&end_date=1646352000000&cost=284.0&price=320&price_current=320"




#### Prod port
curl http://docker101.analysis-shared.jpe2b.dcnw.zzz:6777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=3684023&start_date=1646006400000&end_date=1646352000000&cost=284.0&price=320&price_current=320






ssh docker101.analysis-shared.jpe2b.dcnw.zzz








    logger = Logger().logger
  File "/opt/rrma-backend-api/aarrma-feat/simul_api/utils.py", line 32, in logger
    os.makedirs(LOGDIR, exist_ok=True)
  File "/opt/anaconda3/lib/python3.8/os.py", line 223, in makedirs
    mkdir(name, mode)
PermissionError: [Errno 13] Permission denied: '/opt/zlog_stg/'










2>&1 | tee -a zlog_runbatch.txt  


exit 1


vi /usr/local/hdp26/hive/conf/hive-site.xml


cat /usr/local/hdp26/hive/conf/hive-site.xml



/data/workspaces/takos01/cpa/emb/z_order_20210901b_itemtagb2


# Confirm the job status
yarn application -status application_XXXXXXX_XXXXXXX
 


yarn application -kill  application_1638177492250_383236



Couchbase new  
acb200 / Scorpion.



yarn application -status  application_1631760652430_780626


#### Copy Data  #######################################

/user/ipluser/ipl_graph_clustering




pgrep -P $your_process1_pid


string='My long string'
if [[ $string == *"My long"* ]]; then
  echo "It's there!"
fi


echo "some data for the file" >> fileName



if [ condition ] || [ condition ]; then
    # code
elif [ condition ] && [ condition ]; then
    # code
fi



workdone=0
while : ; do
  ...
  if [ "$workdone" -ne 0 ]; then
      break
  fi
done


#!/bin/sh
value=`cat config.txt`
echo "$value"





##### Hive Changes:

/usr/local/hdp26/hive/



vim /usr/local/hdp26/hive/conf/hive-site.xml







https://pypi.org/project/brotlipy/
Broli : higher compression X4   (x3)


https://pypi.org/project/py-lz4framed/
Py-LZM : faster speed for decompression  1.8Gb  (vs 0.gb)





Also,
     can also dump for some  item sim. scores (browing based).
     





############## Next week
   Nodes.
   Project Life Cycle :
       Design document / Lead Approved. 




####### IPL:
  rancode2 : stopped by GSP.

  rancode1 : differences between fields.

  



top biggest folder 

  

391813 + 38092 = 429905

In Cass:  425142




###########################
Similarity Search Model for RPP 


Work on MONA Migration for RPP :  
 Start parallel testing.


          Is it ok to run a copy of brw_ran_hist_cass.py which feeds Cass ?
                (ie any potential side effect )




pip cache dir




lit('-'),



GZIP=-1 tar czf output.tar.gz /path/to/top_folder

tar -zc -f test_code.tar.gz --exclude='*.parquet'  tttcb301/sssvols05/ppp/test_code/*




#########
Tehnical ROI : 


##########################################
Tehnical Impressive :
   ip detection     :
   Dashboard faster :  





("{'rbt_d321171a3d8abe606b52c7c6605ff07f4a2b8fa': b'1', 'rbt_d3264d1f02f504a57fd998a47b5fc4c48a213eb':",)
"{'rbt_d3726e502d7906738669ff814861458f9e917a7': b'1', 'rbt_d3800c998fb4f4ec6e845696d35f37df54603bf':",)

"{'rbt_d6990c508e51c4cbd4b24333f6614a840fd7b6a': b'1', 'rbt_d6a5bf11601f9cbf67324fec115ffd2db64ff4e':",)

##### Useful packages :
pip install better_exceptions


python -m pip install pretty_errors  





Fraud Detection meeting with SGap team.   
  Work on a couple of fixes.


Work to do the presentation for conference feedback (join previous ), RecSsys.


Continue Similarity pipeline. 





##################################################
dir > a.txt 2>&1




TZ=America/New_York date




###############################################
##### GPU Servers   ###########################
ssh  100.89.8.84      g1   g2

32 Processors and 256 Gb

user/pass: popo01/popo01


docker login docker-regi.intra.zzz-it.com



#####################################################################
#### 4000 Docker  ###################################################
docker pull  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2    
&&  docker run --rm -d -it --name py3_c4 --net=host -v /tmp:/tmp  -v /home:/home   -v /data:/data   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/    --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2    bash    



docker commit   190c6089bdb3  py3_c4new




### docker images  | tac

docker run -it   -v /data:/data  py3_c4new  /bin/bash

docker run --rm -d -it --name py3_c4new2 --net=host -v /tmp:/tmp  -v /home:/home   -v /data:/data  -v /home/popo01/:/home/popo01/     -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   --privileged  py3_c4new2    bash    


#### Most recent
docker run --rm -d -it --name py3_c4new3 --net=host -v /tmp:/tmp  -v /home:/home   -v /data:/data  -v /home/popo01/:/home/popo01/     -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   --privileged  py3_c4new    bash    



### Linkage with Qdrant
docker run --rm -d -it --name py3_c4new3   --link drant01:drant01  -p 8080:80  -v /tmp:/tmp  -v /home:/home   -v /data:/data  -v /home/popo01/:/home/popo01/     -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   --privileged  py3_c4new3    bash    



###### MONA Prod Docker
docker commit -p  -m 'py_c4k'  347e014fe939 docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4_c4new2



#### 97ddfd817387
docker images  | tac
# docker tag gluster-hdp4000pro-anaconda3_fr_v01 docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv01:4.1.2


#### All in
docker push docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4_c4new2




########################################################################
#### Batch docker
docker pull docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2 && docker run --rm -d -it --name py3_batch --net=host -v /tmp:/tmp   -v /home/popo01/:/home/popo01/     -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   --privileged  docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2    bash    



docker commit -p  a2fce4d968f5       docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2b 


docker push  docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2b 




   docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2                     "bash"                   About an hour ago   Up About an hour                        py3_batch


docker exec -it  py3_batch  /bin/bash 











##### Mount disk
cd /home/popo01/zmount
./mount_gluster.sh 


ls /dd/101/sssvols07/ndata/cpa/hdfs/daily_usertopk



#### Copy backup diskcache
mkdir -p /sys/fs/cgroup/cpa/db

cp -R /dd/101/sssvols07/ndata/cpa/db/db/   /sys/fs/cgroup/cpa/

### Mlformed disk
rm -rf /sys/fs/cgroup/cpa/db/db_easyid_topgenre_brw




https://unix.stackexchange.com/questions/26364/how-can-i-create-a-tmpfs-as-a-regular-non-root-user


On RHEL4/RHEL5:

[me@home]$ mount | grep tmpfs
none on /dev/shm type tmpfs (rw)



##### 


        dirin   = "/sys/fs/cgroup/cpa/db"
        #dirout = "tttcb201/sssvolh03/ndata/cpa/db/db"
        dirout  = "/dd/101/sssvols07/ndata/cpa/db/db"


cd /home/popo01/test_code/recsys


docker ps


### exec:
docker exec -it  drant01   /bin/bash 



df = DataFrame({
    'a': np.random.choice(10, 5),
    'b': np.random.choice(10, 5),
    'c': np.random.choice(10, 5),
})

pure python
df[(df['a'] < df['b']) & (df['b'] < df['c'])]

query
df.query('(a<b) & (b<c)')



docker commit 0a56a222bda9   py3_c4new2


docker exec -it  py3_c4new3  /bin/bash 


docker exec -it  py3_c4new2  /bin/bash  


cd /home/popo01/test_code/recsys/



root     19975  0.0  0.0 113364 10456 ?        Sl   Jan25   5:21 /usr/bin/containerd-shim-runc-v2 -namespace moby -id 347e014fe9399ea7a977ee9239d9e0fd3f4f2d52a3e68973
root     20001  0.0  0.0  15260   296 pts/0    Ss+  Jan25   0:00  \_ bash
root     20069  0.0  0.0  15260  1236 pts/1    Ss+  Jan25   0:01  \_ /bin/bash
root     21440  0.0  0.0  15260  1176 pts/1    S    Jan25   1:30  |   \_ /bin/bash
root




docker stop py3_c4new2 


nname="docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4.1.2"
docker pull $nname
docker run --rm -d -it --name py3_c4 --net=host -v /data:/data -v /tmp:/tmp  -v /home:/home  -v /a:/a     -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"      --privileged  $nname   bash    


docker exec -it  py3_c5  /bin/bash 


docker  commmit






### Check HDFS
kdestroy 
kinit -kt  /usr/local/hdp26/keytabs/ppp.nnn.keytab ppp
klist
hadoop fs  -ls  /user/ppp/nono/quantity_extract

hive -e 'describe database nono2 ; '
which hadoop && which hive


docker exec -it  py3_c4  /bin/bash 



arr = np.array(some_sequence)
reversed_arr = arr[::-1]



https://docs.alluxio.io/os/user/stable/en/api/FS-API.html#java-client
#########################################################################


##### 6000 Docker
docker pull  docker-regi.intra.zzz-it.com/ppp/gluster-ds:py3-www1-c6000-pro-1.0.0  

docker run --rm  -it --name py3_c6 --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_workspaces:/data_workspaces  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-ds:py3-www1-c6000-pro-1.0.0    /bin/bash 

// source /usr/local/hdp314/.bashrc
$ /usr/local/hdp314/bin/init_hdp.sh
$ /usr/local/hdp314/bin/kinit.sh
// kinit confirmation

mkdir /data_workspaces/popo01/



#######################################################################
#### Login To Dokcer HUB  Registry ####################################
#### zzz Proxy
export http_proxy=http://pkg.proxy.nnn.jp.local:10080  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:10080 
export http_proxy=http://pkg.proxy.nnn.jp.local:9501  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:9501 



#### docker  https://hub.docker.com/_/registry?ref=login
docker login  -u artia37  
686d7cfc-b9b3-47af-ab3d-192ac35a1f8e

fell237.



docker pull gitpod/openvscode-server

docker run -it --init -p 3000:3000 -v "$(pwd):/home/workspace:cached"   gitpod/openvscode-server


#### entrypoint
ENTRYPOINT ["/bin/sh" "-c" "exec ${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server --host 0.0.0.0 --without-connection-token \"${@}\"" "--"]

An unexpected error occurred that requires a reload of this page.
The workbench failed to connect to the server (Error: WebSocket close with status code 1006)




#### docker iamgeb container id 
cat /proc/self/cgroup | head -1 | tr --delete ‘10:memory:/docker/’




### Docker with Gluster mount
# https://hub.docker.com/r/hussambutt8765/jupyterlab
### docker pull  hussambutt8765/jupyterlab  &&  docker run --rm -it --network host -v /home/popo01/:/notebooks  -v /data/:/notebooks/data  -v /home/:/notebooks/aothers   -v /a/:/notebooks/a   -v /data_workspaces/:/notebooks/share2         -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    -p 8888:8888    -e PASSWORD="elise237"    --privileged  hussambutt8765/jupyterlab 
docker pull  hussambutt8765/jupyterlab    && docker run  --name jup37 --rm -it --network host -v /home/popo01/:/notebooks  -v /data/:/notebooks/data  -v /home/:/notebooks/aothers      -v /data_workspaces/:/notebooks/share2         -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    -p 8888:8888    -e PASSWORD="elise237"    --privileged  --entrypoint /bin/bash   hussambutt8765/jupyterlab  


    docker run --rm -d -p 8888:8888 -v $(pwd):/notebooks -e PASSWORD="elsie237" hussambutt8765/jupyterlab

    ## To run vscode:   100.89.8.84:8443
    docker run --rm -d -p 8443:8443 -v $(pwd):/notebooks --entrypoint="vscode.sh" hussambutt8765/jupyterlab


docker pull  amalic/jupyterlab 
docker run --rm -it --network host    -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    -p 8888:8888 -v /home/popo01/:/notebooks   -v /a/:/notebooks/a   -v /data_workspaces/:/notebooks/share  -e PASSWORD="elise237"    --privileged  amalic/jupyterlab 


##### Jupyterlab:
docker-regi.intra.zzz-it.com/ppp/zamalic_jupyterlab:1.0
100.89.8.84:8888/lab




docker commit -p 56ef5f12e3d8   docker-regi.intra.zzz-it.com/ppp/mona:editor_huss_v01


docker push   docker-regi.intra.zzz-it.com/ppp/mona:editor_huss_v01


#### with Gluster built
docker commit -p  -m 'py_jup'  abff40d068ee  docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01
docker push  docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01


docker pull  docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01


docker run  --name jup37 -d --rm -it --network host -v /home/popo01/:/notebooks  -v /a/:/notebooks/a  -v /home/:/notebooks/aothers        -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    -p 8888:8888    -e PASSWORD="elise237"    --privileged  --entrypoint /bin/bash    docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01 


docker exec -it  jup37  /bin/bash 


entrypoint.sh  &




##########################################################################
#### Jupyter with Gluster mount  #########################################
screen g0
docker pull  hussambutt8765/jupyterlab    && docker run  --name jup37 --rm -it --network host -v /home/popo01/:/notebooks  -v /data/:/notebooks/data  -v /home/:/notebooks/aothers      -v /data_workspaces/:/notebooks/share2         -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    -p 8888:8888    -e PASSWORD="elise237"    --privileged  --entrypoint /bin/bash   hussambutt8765/jupyterlab  


#### Ubuntu install Gluster client
apt-get install -y glusterfs-client  zip unzip  git vim


cd /notebooks/zmount

#### Certificates to the dockers  (from docker root certificate)
### ## https://yallalabs.com/linux/how-to-mount-a-glusterfs-in-a-client-machine/
mkdir -p /var/lib/glusterd/
cp secure-access.sav  /var/lib/glusterd/
mv  /etc/ssl/certs  /etc/ssl/certs2
cp -R  ssl  /etc/

### Execute the mount
./mount_gluster.sh 

ls tttcb201/sssvols03

ln -s /a /notebooks/a2 

ls /var/log/


### Inside the docker Start Jupyterlab
chmod 777 /notebooks/
entrypoint.sh 


## for remount
docker exec -it  c65d8ee96828   /bin/bash     g3


-rwxrwxrwx.  1 20641 20641      660 Sep  2 01:37 README.txt
drwxrwxrwx.  2 20641 20641        6 May 26  2021 a
lrwxrwxrwx.  1 root  root         2 Aug 28 07:41 a2 -> /a
drwxrwxrwx. 17 root  root      4096 Nov  2 01:01 aothers
drwxrwxrwx.  3 20641 20641       32 May 25  2021 b
drwxrwxrwx.  7 root  root       102 Sep 17 18:05 data
drwxrwxrwx.  3 20641 20641       32 May 26  2021 data_local
-rwxrwxrwx.  1 11387  1002        0 Aug  7 04:57 folder_size.txt
drwxrwxrwx.  2 20641 20641        6 May 20  2021 share
drwxrwxrwx.  5 root  root        65 May 26  2021 share2
drwxrwxrwx.  3 20641 20641       47 May 26  2021 tbin
drwxrwxrwx. 14 20641 20641     4096 Nov  5 07:12 test_code
-rw-r--r--.  1 root  root  63300327 Nov 22 04:56 test_code.tar.gz
drwxr-xr-x.  3 root  root        90 Oct 18 02:27 zconda
drwxrwxrwx.  2 20641 20641        6 May 26  2021 zlog
drwxrwxrwx.  4 root  root       153 Nov  7 05:36 zmount



#################################################################################
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03

umount tttcb201/sssvols03
a2/cb201/sssvols03/ndata/cpa/log



docker_image=docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4
base_commands=sudo /usr/local/bin/mount_gluster.sh, sh /usr/local/hdp314/bin/kinit.sh



#### For HDFS FUSE
yum install hadoop-hdfs-fuse



wget https://downloads.alluxio.io/downloads/files/2.5.0-2/alluxio-2.5.0-2-bin.tar.gz

https://dzone.com/articles/turn-cloud-storage-or-hdfs-into-your-local-file-system



#### HDFS Mount
https://stackoverflow.com/questions/64392326/cant-rsync-to-hdfs-mount-mounted-hdfs

sudo apt remove 'golang-*'
cd ~
wget https://dl.google.com/go/go1.13.9.linux-amd64.tar.gz
tar xf go1.13.9.linux-amd64.tar.gz
sudo mv go /usr/local/go-1.13
export GOROOT=/usr/local/go-1.13
export PATH=$GOROOT/bin:$PATH
git clone --recurse-submodules -j8 https://github.com/microsoft/hdfs-mount.git
sudo mkdir -p $GOROOT/src/golang.org/x/
cd !$
sudo git clone https://github.com/golang/sys.git
cd ~/hdfs-mount/
make
sudo nano /etc/fuse.conf
# + --> uncomment settings in /etc/fuse.conf
sudo mkdir /hdfs_10G_fuse/
sudo chown danilo:danilo /hdfs_10G_fuse
sudo ./hdfs-mount 192.168.10.10:8020 /hdfs_10G_fuse/
(I did this after trying other approaches such as NFS Gateway native to HDP (mounting works, same issues as below + much slower), https://github.com/remis-thoughts/native-hdfs-fuse.git, https://github.com/alexsmith1612/hadoofus.git, etc. So hdfs-mount seemed to be the best option to me.)

On the HDFS I executed

hdfs dfs -chmod 755 /user/dir_1


https://github.com/EDS-APHP/py-hdfs-mount




sudo yum install hadoop-hdfs-fuse 
$ mkdir -p <mount_point>
$ hadoop-fuse-dfs dfs://<nameservice_id> <mount_point>



yum install fuse*






gsp dump of z data on hdfs

/user/ngsuser/gsp_data_dump/jp_mall_storage-item


​[2:36 PM] ,  |  | 
    df = pd.read_json('hdfs://nameservice1/user/ngsuser/gsp_data_dump/jp_mall_storage-item/2021-05-19-12.00.49/part-m-03576.gz',lines=True)


hdfs://nameservice1/user/ngsuser/gsp_data_dump/jp_mall_storage-item/2021-05-19-12.00.49/part-m-03576.gz




[2:35 PM] ,  |  | 
    Hi Kevin.   Jo sent a link to GSP data dump on hdfs.   This data is updated weekly   but maybe we can get them to update daily



gsp dump of z data on hdfs

/user/ngsuser/gsp_data_dump/jp_mall_storage-item


​[2:36 PM] ,  |  | 
    df = pd.read_json('hdfs://nameservice1/user/ngsuser/gsp_data_dump/jp_mall_storage-item/2021-05-19-12.00.49/part-m-03576.gz',lines=True)










#########################################################################
### z Data
   C6000, Select DB :  Only Differential data, no history
   



#### Docker for C6000 and C4000 from Kyel, Fast Version
screen -R m1
sudo su ppp
docker run --rm -it --name py3_c6 --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_workspaces:/data_workspaces  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.5                   

docker exec -it  py3_c6000  /bin/bash 


###############################################################
// use test image of gluster-ds to access www1

docker run --net=host --rm -it docker-regi.intra.zzz-it.com/ppp/gluster-ds:py3-www1-c6000-pro-1.0.0 bash

 
// source /usr/local/hdp314/.bashrc
$ /usr/local/hdp314/bin/init_hdp.sh
$ /usr/local/hdp314/bin/kinit.sh
// kinit confirmation

$ klist
Ticket cache: FILE:/tmp/krb5cc_20640
Default principal: ppp@JP.HADOOP.zzz.COM 
Valid starting       Expires              Service principal
04/21/2021 02:54:20  04/22/2021 02:54:20  krbtgt/JP.HADOOP.zzz.COM@JP.HADOOP.zzz.COM
    renew until 04/28/2021 02:54:20
 


import socket
ip = socket.gethostbyname(socket.gethostname())


import socket
print(socket.gethostname())



find . -printf %s %p\n|sort -nr|head 20


import multiprocessing
multiprocessing.cpu_count()



import time

time.time()


 check databases on c6000
 hive -e 'show databases;'


Were writing the files to below directory on c6000 www1.
 If you can tell me your accounts user name I can enable permissions with setfacl.



cp -R path_to_source path_to_destination/


cp -R  /opt/anaconda3/lib/python3.7/site-packages  mdkdir tttcb301/sssvols05/ppp/tbin/packages/37/


mdkdir tttcb301/sssvols05/ppp/tbin/packages




hdfs:////user/piop/gsp/prod/itemdata_delta 

hdfs:///user/piop/gsp/prod/itemdata_delta/dt=2021-05-12/hour=0/part-00000-7ecf763b-c8a1-47e7-b937-07ef47608c46.c000.snappy.parquet
-rw-------   3 piop piop    9949966 2021-05-12 00:25 hdfs:///user/piop/gsp/prod/itemdata_delta/dt=2021-05-12/hour=0/part-00000-87d165fa-1063-4257-b619-51b9fd640642.c000.snappy.parquet
-rw-------   3 piop piop   10657664 2021-05-12 00:23 hdfs:///user/piop/gsp/prod/itemdata_delta/dt=2021-05-12/hour=0/part-00000-883c92d7-a8ca-4da5-a4c3-931a2899c030.c000.snappy.parquet
-rw-------   3 piop piop    5264569 2021-05-12 00:45 hdfs:///user/piop/gsp/prod/itemdata_delta/dt=2021-05-12/hour=0/part-00000-8c842573-3c32-4b11-a84b-75d0f7f4f62a.c000.snappy.parquet


export http_proxy=http://pkg.proxy.nnn.jp.local:9501  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:9501






http://dev-proxy.db.zzz.co.jp:9501

#### zzz Proxy
export http_proxy=http://pkg.proxy.nnn.jp.local:10080  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:10080   && git config --global user.email "kevin.noel@zzz.com"  &&  git config --global user.name "Kevin Noel"  && git config --global credential.helper "cache --timeout=90600" 


list users
cassandra@cqlsh> list all of admin2
   ... ;

 role   | username | resource                 | permission
--------+----------+--------------------------+------------
 admin2 |   admin2 |        <keyspace z> |     SELECT
 admin2 |   admin2 |        <keyspace z> |     MODIFY
 admin2 |   admin2 |   <keyspace productblob> |     SELECT
 admin2 |   admin2 |   <keyspace productblob> |     MODIFY
 admin2 |   admin2 | <keyspace productmaster> |     SELECT
 admin2 |   admin2 | <keyspace productmaster> |     MODIFY
 admin2 |   admin2 |         <keyspace ztest> |     SELECT
 admin2 |   admin2 |         <keyspace ztest> |     MODIFY






############################################################
Same partition token   ( (par1, prr2), clust1, clust2, clust3)

4) Clustering Key
The purpose of the clustering key is to store row data in a sorted order. The sorting of data is based on columns,
 which are included in the clustering key. 
 This arrangement makes it efficient to retrieve data using the clustering key.


We can see all the three rows have the same partition token, 
hence Cassandra stores only one row for each partition key. 
All the data associated with that partition key is stored as columns in the datastore. The data that we have stored through three different insert statements have the same stuid value, i.e. 1, therefore, all the data is saved in that row as columns, i.e under one partition.

If you remember, we discussed before that the second component 
of a primary key is called the clustering key. 
The role of the clustering key is to group related items together. 
All the data that is inserted against same clustering key is grouped together.

In this case, all the columns, such as exam_name and marks, 
will be grouped by value in exam_date,
 i.e 2016-11-11 18:30:00+0000, by default in ascending order .

I hope these examples have helped you to clarify 
some of the concepts of data modeling in Cassandra. 






#####################################################################################
ssh j1m-workstation02c.mgt.hnd1..local

export HOME='/home/popo01'
export CHEF_SERVER='j1m-chef-c1-frontend01.mgt.hnd1..local/organizations/zzz_jp_ppp'
export CHEF_KEY='/home/popo01/.chef/chef.pem'
export CHEF_COOKBOOK_PATH='/home/popo01/dig-ips-chef-repo/cookbooks/'



############################################################################
#####  In Chef Server  #####################################################
screen -R b1
ssh j1m-workstation02c.mgt.hnd1..local
get_token_jpe1
cookwith update all
knife node list


cookwith switch roc_jpe2b_offline_ai
export CHEF_COOKBOOK_PATH='/home/popo01/dig-ips-chef-repo/cookbooks/'
git clone https://git.zzz-it.com/scm//dig-ips-chef-repo.git
git pull --all
knife cookbook upload dig-ips-roles


ls /home/popo01/dig-ips-chef-repo/cookbooks/
https://git.zzz-it.com/scm//dig-ips-chef-repo.git


###################################################################################
##### Execution of Chef part  directly on the targe server  #######################
## knife ssh name:cass201.offline-ai.jpe2b.dcnw.zzz  ' sudo -E chef-client -o recipe[dig-ips-roles::secure-cassandra]' 


umount /dev/nvme1n1p1   # Unmount data partition /data_nvme
 
# Remove fstab entry for data partition /data_hdd or /data_nvme
vi /etc/fstab
 
sudo su root
sudo -E chef-client -o recipe[dig-ips-roles::secure-cassandra]

#### Setup Cassandra


### Create Folder
https://confluence.zzz-it.com/confluence/pages/viewpage.action?pageId=2625944390


vim  /etc/cassandra/conf/cassandra.yaml

dynamic_snitch: false   
64 Tokens
offline_cass
key_cache_size_in_mb: 2000



### cassandra log
less /var/log/syslog


tail  /var/log/cassandra/cassandra.log


####################################################################  
/data2

nodetool status && nodetool drain &&  service cassandra stop   &&  service cassandra start && nodetool status


#### Check where it failed. 
cat /var/log/cassandra/system.log 




---
hadoop_profile: c4000
program_command: "python data_pipe_line/get_hourly_rp_and_ip.py --config config/prod.yaml  &> /usr/local/proad/logs/debug-$(date +'%Y-%m-%d-%H-%M-%S')-hourly_rp_and_ip.log"
branch_name: develop
project_name: fraud_detection
requirements_file: requirements_spark.txt
script_timeout: 92000
retry_count: 1
target_node: aadoptawx102z.nnn.jp.local




###################################################################3
sudo su root
 
yum localinstall https://artifactory.zzz-it.com/aog-generic-local/cassandra/cassandra-3.11.8-1.noarch.rpm
systemctl daemon-reload
 
cd /var/lib/cassandra/  &&  mkdir commitlog  data  hints  saved_caches  &&  chown -R cassandra:cassandra *
 
# Additional data drive
cd /data2 && mkdir commitlog  data  hints  saved_caches  && 
chown -R cassandra:cassandra *
chmod -R 777 .

pwd

chown -R cassandra:cassandra .

ls -l /var/lib/cassandra/ 




# Edit configuration
vi /etc/cassandra/conf/cassandra.yaml
 
systemctl start cassandra
systemctl status cassandra
 
# Check cluster status
nodetool status

100.99.213.2,100.99.213.3,100.99.213.4,100.99.213.5


screen -R cc1
100.99.213.2   cass201.offline-ai.jpe2b.dcnw.zzz

100.99.213.3  cass202.offline-ai.jpe2b.dcnw.zzz

100.99.213.4  cass203.offline-ai.jpe2b.dcnw.zzz

100.99.213.5  cass204.offline-ai.jpe2b.dcnw.zzz


ssh cass203.offline-ai.jpe2b.dcnw.zzz



#### SSH Part

vim ~/.cassandra/cqlshrc

[connection]
factory = cqlshlib.ssl.ssl_transport_factory
[ssl]
certfile = /etc/pki/tls/certs/ca.pem
validate = true



server_encryption_options:
    internode_encryption: all
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    #protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_W
    # require_client_auth: false
    # require_endpoint_verification: false


# enable or disable client/server encryption.
client_encryption_options:
    enabled: true
    # If enabled and optional is set to true encrypted and unencrypted connections are handled.
    optional: false
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    require_client_auth: false
    # Set trustore and truststore_password if require_client_auth is true
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    # protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WWITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA]





####### Cassnadra cb5  #######################################################################
server_encryption_options:
    internode_encryption: none
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    # protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA]
    # require_client_auth: false
    # require_endpoint_verification: false

# enable or disable client/server encryption.
client_encryption_options:
    enabled: false
    # If enabled and optional is set to true encrypted and unencrypted connections are handled.
    optional: true
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # require_client_auth: false
    # Set trustore and truststore_password if require_client_auth is true
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    # protocol: TLS
    # algorithm: SunX509
    # store_type: JKS








python type 


ssh    cass101.analysis-shared.jpe2b.dcnw.zzz 




#################
cqlsh  cass202.offline-ai.jpe2b.dcnw.zzz  9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra


cqlsh  cass201.offline-ai.jpe2b.dcnw.zzz --ssl 9142  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra


cqlsh  cass204.offline-ai.jpe2b.dcnw.zzz  9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2    -p pcovid19fwz9


cqlsh  cass203.offline-ai.jpe2b.dcnw.zzz --ssl 9142  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.

cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2  -p  pcovid19fwz9



cqlsh  cass102.analysis-shared.jpe2b.dcnw.zzz  --ssl 9142  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.



cqlsh  cass102.analysis-shared.jpe2b.dcnw.zzz  9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.



cqlsh  100.99.158.19   --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.





nodetool status && nodetool drain &&  service cassandra stop   &&  service cassandra start && nodetool status


service cassandra start && sleep 10 &&  cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra  -p  cassandra237.






cd /var/lib/cassandra/  && rm -rf * &&   mkdir commitlog  data  hints  saved_caches  &&  chown -R cassandra:cassandra *  && chmod -R 777 .

 
cd /data2 &&   rm -rf * && mkdir commitlog  data  hints  saved_caches  &&  chown -R cassandra:cassandra *  &&  chmod -R 777 .




#### Node Exporter
sudo su root 

sudo useradd --no-create-home --shell /bin/false node_exporter

curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.1.0/node_exporter-1.1.0.linux-amd64.tar.gz


tar xvf node_exporter-1.1.0.linux-amd64.tar.gz

cp node_exporter-1.1.0.linux-amd64/node_exporter /usr/local/bin


chown node_exporter:node_exporter /usr/local/bin/node_exporter


vim /etc/systemd/system/node_exporter.service


[Unit]
Description=Node Exporter
After=network.target
 
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
 
[Install]
WantedBy=multi-user.target



sudo systemctl daemon-reload && sudo systemctl start node_exporter   &&  systemctl status node_exporter

sudo systemctl enable node_exporter





curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.1.0/node_exporter-1.1.0.linux-amd64.tar.gz &&  tar xvf node_exporter-1.1.0.linux-amd64.tar.gz


systemctl stop node_exporter  &&  cp node_exporter-1.1.0.linux-amd64/node_exporter /usr/local/bin &&  systemctl start node_exporter 










[Yesterday 10:18 PM] Elfenbein, Sarah | Sarah | 
    ttrrr, zzztt | zzztt | , Chen, Kyle | Kyle | , Alhat, Aniket
CC: Cho, Shiten | Shiten | 

I am having trouble running the query for BTA KPI reporting on C6000, and was wondering if any of you might have advice.

This is the tail of the log file:

21/12/15 05:20:07 [main-SendThread(hdp-jz6003.haas.www1a.dcnw.zzz:2181)]: INFO zookeeper.ClientCnxn: Opening socket connection to server hdp-jz6003.haas.www1a.dcnw.zzz/100.96.108.15:2181. Will not attempt to authenticate using SASL (unknown error)
21/12/15 05:20:07 [main-SendThread(hdp-jz6003.haas.www1a.dcnw.zzz:2181)]: INFO zookeeper.ClientCnxn: Socket connection established, initiating session, client: /100.89.9.233:57842, server: hdp-jz6003.haas.www1a.dcnw.zzz/100.96.108.15:2181
21/12/15 05:20:07 [main-SendThread(hdp-jz6003.haas.www1a.dcnw.zzz:2181)]: INFO zookeeper.ClientCnxn: Session establishment complete on server hdp-jz6003.haas.www1a.dcnw.zzz/100.96.108.15:2181, sessionid = 0x37bb2e8d1f2777d, negotiated timeout = 60000
21/12/15 05:20:07 [main-EventThread]: INFO state.ConnectionStateManager: State change: CONNECTED
21/12/15 05:20:07 [Curator-Framework-0]: INFO imps.CuratorFrameworkImpl: backgroundOperationsLoop exiting
21/12/15 05:20:07 [main]: INFO zookeeper.ZooKeeper: Session: 0x37bb2e8d1f2777d closed
21/12/15 05:20:07 [main-EventThread]: INFO zookeeper.ClientCnxn: EventThread shut down
21/12/15 05:20:07 [main]: ERROR jdbc.Utils: Unable to read HiveServer2 configs from ZooKeeper
Error: Could not open client transport for any of the Server URI's in ZooKeeper: Failed to open new session: java.lang.IllegalArgumentException: Cannot modify END_DATE at runtime. It is not in list of params that are allowed to be modified at runtime (state=08S01,code=0)
beeline> No current connection
 


These are the steps I took before running:
1. Set up a docker container using the following image: gluster-hdpstar-anaconda3:4.2.7
2. Run this command:

. www1_c6000_pro
kinit.sh

3. Run Hive and check the tables in ad_cpc. Update the following table names in the query:

ad_orochi.imp_log -> ad_cpc.imp_log_cleaned
dig_bta.bta_location_media -> ad_cpc.location_media
bta_location_media.location_id -> location_media.location_id
bta_location_media.network2 -> location_media.network


4. Put commands into a file (kpi_simple.sh) and run using nohup:

 #!/bin/bash

hive --hiveconf START_DATE="2021-12-07" \
     --hiveconf END_DATE="2021-12-14"   \
     --hiveconf OUTDIR="tttcb301/sssvols05/sarahTemp/bta_reports_for_cho/kpi.outputs/kpi_simple.2021.12.07-12.14.run1"  \
     -f kpi_simple.hql


I don't think it's a syntax error - I used the same file format when running on the old Hadoop. If any of you have suggestions, I would really appreciate to hear them. Thank you very much.


​[Yesterday 10:21 PM] Chen, Kyle | Kyle | 
    
change hiveconf to hivevar
​[Yesterday 10:42 PM] Elfenbein, Sarah | Sarah | 
    Thank you Chen, Kyle | Kyle | !!

After working through some other issues, I am getting this:

0: jdbc:hive2://hdp-jz6001.haas.www1a.dcnw.ra> 0: jdbc:hive2://hdp-jz6001.haas.www1a.dcnw.ra> 0: jdbc:hive2://hdp-jz6001.haas.www1a.dcnw.ra> 0: jdbc:hive2://       hdp-jz6001.haas.www1a.dcnw.ra> Error: Error while processing statement: Permission denied: user [ppp] does not have [TEMPUDFADMIN] privilege on [global]        (state=,code=1)
Closing: 0: jdbc:hive2://hdp-jz6001.haas.www1a.dcnw.zzz:2181,hdp-jz6002.haas.www1a.dcnw.zzz:2181,hdp-jz6003.haas.www1a.dcnw.zzz:2181/default;pass       word=ppp;principal=hive/_HOST@JP.HADOOP.zzz.COM;serviceDiscoveryMode=zooKeeper;user=ppp;zooKeeperNamespace=hiveserver2

Is there any reason why I can access Hive on the command line with ppp but am having issues here?
​[10:25 AM] Chen, Kyle | Kyle | 
    Hi Sarah,
Would you be able to provide the kpi_simple.hql for us to do trouble-shooting? It's bit difficult to guess the reason from the logs.

Hive on C6k is very different thing from that on C4k. On C6k, it's hive 3 (defaults to beeline), while it's hive-1 on C4k, further, they clearly separate the namespace of hivevar from hiveconf, which you just faced. besides these tool version differences, hadoop team added the ranger that enforces several rules when accessing DB/Table/UDF.
(1 liked)​[11:11 AM] Elfenbein, Sarah | Sarah | 
    Hi Kyle, 
Thank you for your message! This is the current version. The variables commented out in the top were used with the old Hadoop, but threw errors when I tried running it on C6000 in my container. 
The code is also located here: tttcb301/sssvols05/sarahTemp/bta_reports_for_cho/kpi_simple.hql
[kpi_simple.hql] (https://officezzz.sharepoint.com/sites/Team-DIGRPP/Shared Documents/General/kpi_simple.hql)​[11:14 AM] Chen, Kyle | Kyle | 
    Thanks for the file, I can check it later. when does this need to be solved?
​[11:17 AM] Elfenbein, Sarah | Sarah | 
    Thank you so much! Cho, Shiten | Shiten | , by when do you need to report the data?
<https://teams.microsoft.com/l/message/19:6a46e85268174d8ebfe7016c95025557@thread.skype/1639574310401?tenantId=53a8b0d9-d900-48cc-9d7e-5935dc8d5b17&amp;groupId=e3a8b117-6d6e-4c56-ba93-a367fd952139&amp;parentMessageId=1639574310401&amp;teamName=Team - AOG&amp;channelName=General&amp;createdTime=1639574310401>








################################################################################################3
cookwith switch zzz_jp__demo

guptaakul01@j1m-workstation02c .chef]$ env | grep chef
CHEF_SERVER=j1l-chef01.lab..jp.local/organizations/zzz_jp__infra_lab
CHEF_SERVER_DEFAULT=j1l-chef01.lab..jp.local/organizations/zzz_jp__infra_lab
OLDPWD=/home/guptaakul01/.chef/cookwith.d
PWD=/home/guptaakul01/.chef
CHEF_PEM=/home/guptaakul01/.chef/chef.pem
CHEF_COOKBOOK_PATH=~/infra-chef-repo/cookbooks
CHEF_COOKBOOK_PATH_DEFAULT=~/infra-chef-repo/cookbooks
CHEF_KEY=~/.chef/chef.pem
INDIVIDUAL_CHEF_COOKBOOK_PATH_DEFAULT=~/individual/infra-chef-repo/cookbooks
CHEF_KEY_DEFAULT=~/.chef/chef.pem
API_PEM=/home/guptaakul01/.chef/api.pem


knife ssh name:cass10[1-6].nnn.hnd2..local 'zzz_proxy && sudo -E chef-client -o recipe[dig-ips-roles::secure-cassandra]'


knife ssh popo01:cass201.offline-ai.jpe2b.dcnw.zzz  'zzz_proxy && sudo -E chef-client -o recipe[dig-ips-roles::secure-cassandra]'


knife ssh popo01:cass201.offline-ai.jpe2b.dcnw.zzz  'zzz_proxy && sudo -E chef-client -o recipe[dig-ips-roles::secure-cassandra]'






[campsjames01@j1m-workstation02c ~]$ cookwith switch roc_jpe2b_offline_ai
knife chef_server_url is set to: jpe2b-chef1.mgt.jpe2b.dcnw.zzz/organizations/roc_jpe2b_offline_ai
knife client_key is set to:      ~/.chef/chef.pem
knife cookbook_path is set to:   ~/infra-chef-repo/cookbooks
All done!

[campsjames01@j1m-workstation02c ~]$ knife node list
cass201.offline-ai.jpe2b.dcnw.zzz
cass202.offline-ai.jpe2b.dcnw.zzz
cass203.offline-ai.jpe2b.dcnw.zzz
cass204.offline-ai.jpe2b.dcnw.zzz
pg101.offline-ai.jpe2b.dcnw.zzz
pg102.offline-ai.jpe2b.dcnw.zzz
pg103.offline-ai.jpe2b.dcnw.zzz
stg-pg101.offline-ai.jpe2b.dcnw.zzz


[guptaakul01@j1m-workstation02c ~]$ cookwith switch zzz_jp_ppp
knife chef_server_url is set to: j1m-chef-v.vip.hnd1..local/organizations/zzz_jp_ppp
knife client_key is set to:      ~/.chef/chef.pem
knife cookbook_path is set to:   ~/infra-chef-repo/cookbooks
All done!
[guptaakul01@j1m-workstation02c ~]$ knife node list | wc -l
120
[guptaakul01@j1m-workstation02c ~]$ cookwith switch roc_jpe2b_aog
knife chef_server_url is set to: jpe2b-chef1.mgt.jpe2b.dcnw.zzz/organizations/roc_jpe2b_aog
knife client_key is set to:      ~/.chef/chef.pem
knife cookbook_path is set to:   ~/infra-chef-repo/cookbooks
All done!
[guptaakul01@j1m-workstation02c ~]$ knife node list | wc -l



########################################################
########################################################
Margin Balance 
    Data Pipeline 
    Scheudule:


Prometheus
rate(node_network_receive_packets_total{device=~"eth0|eno3"}[1m])


node_filesystem_avail_bytes{device="/dev/nvme1n1p1"}



##### Issues :
    Unit Attached to japanese characters
    

#####################################################################################    
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHONPATH


spark_home = os.environ['SPARK_HOME']
sys.path.append( spark_home +"/python" )
sys.path.append( spark_home +"/python/lib" )
sys.path.append( spark_home +"/python/lib/py4j-0.10.4-src.zip" )




####################################################################################
On side note,
   had some chat with Vincent,, to setup 
   some DS meetup including Rec, Ipl, tram ....   (based on some your suggestion).
   He looks favorable, alhtough  people being busy, once a month should be enough.
     Will setup one confluence page with a list of topics, believe it can be existing tutorial from conference.

   GSP has one, but mostly focused on research paper+ image/search related.
  https://confluence.zzz-it.com/confluence/pages/viewpage.action?spaceKey=~simon.archambault&title=Machine+Learning+Journal+Club
    

ins-apiopds101.nnn.hnd1..local:/sssvolh04                                            2.7T  1.1T  1.5T  42% /a/ins-apiopds101/sssvolh04
ins-apiopds104.nnn.hnd1..local:/sssvols04                                            2.0T  716G  1.2T  38% /a/ins-apiopds104/sssvols04
ins-apiopds104.nnn.hnd1..local:/sssvolh04                                            2.7T  942G  1.7T  37% /a/ins-apiopds104/sssvolh04


snzip file.tar
hdfs dfs -put file.tar.sz /user/hduser/test/


#############################################################################
######### Dump on Disk  #####################################################



##### 
   C6000  Hadoop  

2fc48bb290e9        docker-regi.intra.zzz-it.com/ppp/gluster-ds:py3-www1-c6000-pro-1.0.0              
  "bash"                   12 days ago         Up 12 days                                                                                                                                   py3_c6000ok


###### MONA Prod Docker
docker commit -p  -m 'py_c6k'  2fc48bb290e9  docker-regi.intra.zzz-it.com/ppp/mona:py3-www1-c6000-pro-1.0.0


#### 97ddfd817387
docker images  | tac
# docker tag gluster-hdp4000pro-anaconda3_fr_v01 docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv01:4.1.2


docker push docker-regi.intra.zzz-it.com/ppp/mona:py3-www1-c6000-pro-1.0.0


#####
docker commit -p  -m 'py_c6k'  2fc48bb290e9  docker-regi.intra.zzz-it.com/ppp/mona:py3-www1-c6000-pro-1.0.0




docker commit -p  -m 'py_jup'  abff40d068ee  docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01
docker push  docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01






#########################################
#### Embedding for images :

/user/ppp/zexport/z/fashion_emb_500k/





### Dump for other images url
siid, image_url

















##### Spark Config in the servers 
a/cb301/sssvols05/ppp/tbin/spark/conf/spark-env.sh



docker build -t   filename .


docker history 


zzz_proxy  && wget https://github.com/prometheus/node_exporter/releases/download/v1.1.1/node_exporter-1.1.1.linux-amd64.tar.gz && tar xvfz node_exporter-1.1.1.linux-amd64.tar.gz
cd node_exporter-*.*-amd64
./node_exporter




After some tinkering I figured it out; posting here to close the topic and to help others.

All the scripts in the conf/ directory work in concert and there are a number of environment variables you need to redirect if you install in a non-standard place (i.e. a tarball installation).

For each node in our cluster, we're (now) using: 


(1) cassandra-env.sh 
(2) cassandra-rackdc.properties 
(3) cassandra.yaml 
(4) jvm.options

All the other configuration files are pointed back to the conf/ directory from the tarball using an environment variable.

(2) and (3) set the properties of the node, such as its name, turning on gossip, etc:

(1) and (4) are used by the cassandra bash script when it launches -- the script goes looking for additional configuration files. We've set it so that the cassandra.in.sh is found in the install area; but previously (1) and (4) were not being found, and these are required to activate JMX, port 7199, which nodetool uses to connect to the cluster.



Package installations /etc/cassandra/cassandra-env.sh
Tarball installations install_location /conf/cassandra-env.sh






[root@cass201 ~]# cat ~/.cassandra/cqlshrc
[connection]
factory = cqlshlib.ssl.ssl_transport_factory
[ssl]
certfile = /etc/pki/tls/certs/ca.pem
validate = true



############## Change 
service cassandra start

cat /var/log/cassandra/system.log 


#### Cassandra user permission

list all of admin2


 role   | username | resource                | permission
--------+----------+-------------------------+------------
 admin2 |   admin2 | <keyspace offline_prod> |     SELECT
 admin2 |   admin2 | <keyspace offline_prod> |     MODIFY



with open(filename) as f:
    mylist = f.read().splitlines()



open(x, 'a').close()


DROP USER admin2;



DROP USER cass_writer ;

CREATE USER IF NOT EXISTS cass_writer WITH PASSWORD 'covid927x' NOSUPERUSER;


 j1m-workstation02c.mgt.hnd1..local


100.99.158.16

--  Address        Load       Tokens       Owns (effective)  Host ID                               Rack
UN  100.99.158.18  583.53 GiB  256          77.2%             b0c2998d-62a3-4be6-b334-043090eb9c4f  rack1
UN  100.99.158.17  546.1 GiB  256          71.6%             6fa3fd27-4cf2-4517-9d8d-e0024ec8f791  rack1
UN  100.99.158.16  638.88 GiB  256          78.3%             6b06b1c9-af19-4e25-9efa-b490e4264c63  rack1
UN  100.99.158.13  532.46 GiB  256          72.9%             f459be92-39c9-44f2-afeb-71871e3310f1  rack1

cass104.nnn.hnd2..local   100.89.9.60  285.99 KiB  256          100.0%            72706516-a4c3-4651-b06d-e215b9975c66  rack1
cass105.nnn.hnd2..local   100.89.9.119  

cass105.nnn.hnd2..local   100.89.9.80 


nodetool status && nodetool drain &&  service cassandra stop   &&  service cassandra start && nodetool status


cqlsh   cass105.nnn.hnd2..local   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 
cqlsh   cass105.nnn.hnd2..local   9042 -e " consistency all; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


consistency all; ALTER USER admin WITH PASSWORD 'pcovid19fwz9';




cass101.nnn.hnd2..local 
cass102.nnn.hnd2..local 
cass103.nnn.hnd2..local 

cass104.nnn.hnd2..local 
cass105.nnn.hnd2..local 
cass106.nnn.hnd2..local 


##### Services  #############################################
sudo useradd -rs /bin/false node_exporter
Step 2: Create a node_exporter service file under systemd.
sudo vi /etc/systemd/system/node_exporter.service


pgrep node_exporter


########################fvim
UN  100.89.9.89    113.32 KiB  256          33.2%             a1416a99-4248-414a-bd16-2d5c2273fdb2  rack1
UN  100.89.10.104  70.08 KiB  256          34.5%             52d0beaa-bf53-4243-996d-fb4d02140168  rack1
UN  100.89.9.90    160.32 KiB  256          32.7%             51ba9ec1-e024-433e-a3ae-1f8f4c893717  rack1
UN  100.89.9.60    89.16 KiB  256          34.2%             587f9652-4c3b-4426-9153-a32909f4fc56  rack1
UN  100.89.9.212   75.16 KiB  256          31.2%             d0bd4e51-e4a6-40e6-9be5-97dff5c125f4  rack1
UN  100.89.9.119   177.34 KiB  256          34.2%             406a54c8-34fd-46fb-a687-2e4d3b3cd5ca  rack1


##### z Cluster
cb1   100.89.9.212      ssh cass101.nnn.hnd2..local 
cb2   100.89.10.104     ssh cass102.nnn.hnd2..local 
cb3   100.89.9.89       ssh cass103.nnn.hnd2..local 


####  Offline
cb4  100.89.9.60    ssh cass104.nnn.hnd2..local     587f9652-4c3b-4426-9153-a32909f4fc56
cb5  100.89.9.119   ssh cass105.nnn.hnd2..local     406a54c8-34fd-46fb-a687-2e4d3b3cd5ca 
cb6  100.89.9.90    ssh cass106.nnn.hnd2..local     51ba9ec1-e024-433e-a3ae-1f8f4c893717 


/var/log/cassandra/system.log 

nodetool status && nodetool drain &&  service cassandra stop   &&  service cassandra start && nodetool status
nodetool describecluster

describe productmaster
keystore: cassandra.keystore
truststore: cassandra.truststore


vim  /etc/cassandra/conf/cassandra.yaml


#### New nodes
mv /etc/cassandra/conf /etc/cassandra/conf2

mv /etc/cassandra/default.conf /etc/cassandra/conf




vim  /etc/cassandra/conf/cassandra.yaml 



:set paste





##########################################################################
### nodetool start  ######################################################
vim /etc/cassandra/default.conf/cassandra-env.sh

# add this if you're having trouble connecting:
# JVM_OPTS="$JVM_OPTS -Djava.rmi.server.hostname=<public name>"



# Read user-defined JVM options from jvm.options file
JVM_OPTS_FILE=$CASSANDRA_CONF/jvm.options
for opt in `grep "^-" $JVM_OPTS_FILE`
do
  JVM_OPTS="$JVM_OPTS $opt"
done


-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt6Zd4W4mdn4cUZ9D6HF2
rWV7hj5lMfWtp74CrPhAW5aGmB06ILrM9g+lhFG2uigNx2X53JaTRPh/dHzpJQuT
WKnbFXPtAlQYmw2FIPj8vdInMx2oOf1RKLQljGIGTLIwCUsnZGpmNvoUB48GxcAy
qJXm+3LphjadL5bsEZa7Lw+UpGH+SqRqw8kbXdxaLGnLg/reCmY+X0m6afc4wJhQ
Q9K/9jwM2HTtUkm3VXQJ/Ojqaau2cKha3OvIEcNRtRN9EwsZsSlggXgL5ERFCSNV
h2Zrp9VX255APAJ2sl6KTofa89m0rtkKfWwmqwKriR7Cdq65tS0+T4xB9mNUd4/g
HQIDAQAB
-----END PUBLIC KEY-----


Sum 1-Distance


######
knife ssh popo01:cass201.offline-ai.jpe2b.dcnw.zzz 'zzz_proxy && sudo -E chef-client -o recipe[dig-ips-roles::secure-cassandra]'

cass20[1-4].offline-ai.jpe2b.dcnw.zzz



######
 cqlsh   cass106.nnn.hnd2..local   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 


Cluster
100.89.9.89, 100.89.10.104, 100.89.9.212

cass101.nnn.hnd2..local , cass102.nnn.hnd2..local , cass103.nnn.hnd2..local 


Offline
 cass104.nnn.hnd2..local  cass105.nnn.hnd2..local    cass106.nnn.hnd2..local   


 cqlsh   cass106.nnn.hnd2..local   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 





consistency all;


CREATE USER IF NOT EXISTS guest WITH PASSWORD 'nocass3456' NOSUPERUSER;
GRANT SELECT ON KEYSPACE productmaster TO guest ;
GRANT SELECT ON KEYSPACE z TO guest ;
GRANT SELECT ON KEYSPACE ztest TO guest ;


CREATE USER IF NOT EXISTS cass_writer WITH PASSWORD 'covid927x' NOSUPERUSER;
GRANT MODIFY ON KEYSPACE productmaster TO cass_writer ;
GRANT MODIFY ON KEYSPACE z TO   cass_writer ;
GRANT MODIFY ON KEYSPACE ztest TO cass_writer ;


CREATE USER IF NOT EXISTS admin WITH PASSWORD 'pcovid19fwz9' NOSUPERUSER;
GRANT MODIFY ON KEYSPACE z TO admin;
GRANT MODIFY ON KEYSPACE productmaster TO admin ;
GRANT MODIFY ON KEYSPACE ztest TO admin ;



ALTER USER cassandra WITH PASSWORD 'cassandra237.';



100.99.158.13 
##############################################################################################
batch_size_warn_threshold_in_kb: 14000

# Fail any multiple-partition batch exceeding this value. 50kb (10x warn threshold) by default.
batch_size_fail_threshold_in_kb: 15000


 service cassandra start
nodetool removenode    587f9652-4c3b-4426-9153-a32909f4fc56
nodetool removenode  587f9652-4c3b-4426-9153-a32909f4fc56

nodetool removenode  28742c89-7bde-4e35-a655-4f09a9c53697 


https://stackoverflow.com/questions/38722917/cassandra-issue-with-blob-creation-for-large-file


DN  100.89.9.119   384.73 GiB  256          45.7%             28742c89-7bde-4e35-a655-4f09a9c53697  rack1



vim  /etc/cassandra/conf/cassandra.yaml 


nodetool status  && nodetool flush && nodetool drain   && service cassandra stop  && service cassandra start



Node setup
vim  /etc/cassandra/conf/cassandra.yaml 



 inspect.getfullargspec(a_method)
(['arg1', 'arg2'], None, None, None)


import 


>>> def foo(a, b, c=4, *arglist, **keywords): pass
>>> inspect.getfullargspec(foo)
(['a', 'b', 'c'], 'arglist', 'keywords', (4,))





def os_get_vars_dict(a_method):
    ll =  inspect.getfullargspec(a_method)
    vars = ll[0]
    vals = ll[-1]
    n = len(Vars)
    n1 = n-len(vals)
    for i, var in enumerate(vars):
       if i >= n1:
          dd[var] = vals[i-n1]
       else :
          dd[var] = None   
    return dd
    print(dd)















ALTER KEYSPACE "ndata" WITH REPLICATION =
  {'class': 'NetworkTopologyStrategy', 'datacenter1': '2'};




CREATE KEYSPACE ndata WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': '3'}  AND durable_writes = true;




######################################################################
##### New Cass Cluster Setup  #############################################
nodetool status 

nodetool removenode  09adf199-6d80-4e8c-923a-86f43bdfef5a




blockdev --getra /dev/nvme0n1p1    {device}
blockdev --setra 64 /dev/nvme0n1p1  


blockdev --getra  /dev/mapper/data     # 256
blockdev --setra 32 /dev/mapper/data


blockdev --getra  /dev/mapper/data2
blockdev --setra 32 /dev/mapper/data2



ls  /etc/cassandra/

mv  /etc/cassandra/conf     /etc/cassandra/conf2  && mv  /etc/cassandra/default.conf   /etc/cassandra/conf



mv  /etc/cassandra/conf2/.truststore  /etc/cassandra/conf/
mv  /etc/cassandra/conf2/.keystore  /etc/cassandra/conf/


time.time()-5*3600





rm  /etc/cassandra/conf/cassandra.yaml 
vim  /etc/cassandra/conf/cassandra.yaml 

:set paste
### token 256 --> 64


service cassandra start

service cassandra stop


### need permission
chown -R cassandra:cassandra /var/lib/cassandra/  
chown -R cassandra:cassandra /data2/



rm -rf /var/lib/cassandra/data/*  &&  rm -rf /data2/data/*
rm -rf /var/lib/cassandra/data/*  &&  rm -rf /data2/data/*


mkdir -p /var/lib/cassandra/data/   chown -R cassandra:cassandra /var/lib/cassandra/


chown -R cassandra:cassandra /data2/


cd /var/lib/cassandra/ && mkdir commitlog  data  hints  saved_caches && chown -R cassandra:cassandra *
cd /data2 && mkdir commitlog  data  hints  saved_caches && chown -R cassandra:cassandra *


service cassandra start  &&  nodetool status



jhfh kdkfj  kfjfjf

100.99.158.14  cass105.analysis-shared.jpe2b.dcnw.zzz  


100.99.158.19  cass106.analysis-shared.jpe2b.dcnw.zzz  


100.99.158.15  cass107.analysis-shared.jpe2b.dcnw.zzz  


100.99.158.21  :  cass108.analysis-shared.jpe2b.dcnw.zzz

100.99.158.23 :   cass109.analysis-shared.jpe2b.dcnw.zzz

100.99.158.25 :   cass110.analysis-shared.jpe2b.dcnw.zzz


100.99.158.24 :   cass111.analysis-shared.jpe2b.dcnw.zzz








import pandas as pd
import random

A = [ random.randint(0,100) for i in range(10) ]
B = [ random.randint(0,100) for i in range(10) ]

df = pd.DataFrame({ 'field_A': A, 'field_B': B })
df
#    field_A  field_B
# 0       90       72
# 1       63       84
# 2       11       74
# 3       61       66
# 4       78       80
# 5       67       75
# 6       89       47
# 7       12       22
# 8       43        5
# 9       30       64

df.field_A.mean()   # Same as df['field_A'].mean()
# 54.399999999999999

df.field_A.median() 
# 62.0

# You can call `quantile(i)` to get the i'th quantile,
# where `i` should be a fractional number.

df.field_A.quantile(0.1) # 10th percentile
# 11.9

df.field_A.quantile(0.5) # same as median
# 62.0

df.field_A.quantile(0.9) # 90th percentile
# 89.10000000000001





tail   /var/log/cassandra/system.log  -n 5

### Disk 
/dev/mapper/data   917G   78M  871G   1% /var/lib/cassandra
/dev/mapper/data2  591G   73M  561G   1% /data2



#### Need 

#### To attach new nodes

authenticator: PasswordAuthenticator

# Authorization backend, implementing IAuthorizer; used to limit access/provide permissions
# Out of the box, Cassandra provides org.apache.cassandra.auth.{AllowAllAuthorizer,
# CassandraAuthorizer}.
#
# - AllowAllAuthorizer allows any action to any user - set it to disable authorization.
# - CassandraAuthorizer stores permissions in system_auth.role_permissions table. Please
#   increase system_auth keyspace replication factor if you use this authorizer.
authorizer: CassandraAuthorizer

hdfs dfs -mkdir /user/ppp/nono/hive/ww_item_list/



#### Reclaim disk space
nodetool garbagecollect  productmaster productmaster 



ssh docker101.analysis-shared.jpe2b.dcnw.zzz




Password :
Top page ppp 

Ah ok, yea it happens to me sometimes too.

http://dig-mesos.vip.hnd2..local:10027/monitoring/active/top
Its different, username: ppp password: Phoenix85001




https://arita37.github.io/myutil/en/zdocs_y23487teg65f6/utilmy.sspark.src.html#module-utilmy.sspark.src.util_hadoop



#####
cqlsh cass103.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.



#### Change default password for Cassandra
cqlsh cass104.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra


cqlsh cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.


cqlsh cass101.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.


cqlsh cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2 -p pcovid19fwz9


ALTER USER  cassandra WITH PASSWORD 'cassandra237.'   ;

GRANT MODIFY ON KEYSPACE z TO admin2;
GRANT SELECT ON KEYSPACE z TO admin2;



### Need to create other users
cqlsh   cass111.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy z.user_history (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2 -p  pcovid19fwz9


cqlsh   cass108.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2 -p  pcovid19fwz9


cqlsh   cass107.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra  -p  cassandra237. 



cqlsh   cass111.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.




cqlsh   cass108.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY QUORUM ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra  -p  cassandra237. 




#####################
   Discussion with Komoda san, zzztt for Bot logging. 

   Ddiscussion with Jack 





cqlsh   cass107.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy ndata.item_model (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 






  100.99.158.14, 100.99.158.18, 100.99.158.17

  100.99.158.19,100.99.158.14,100.99.158.18,100.99.158.17 


  100.99.158.15,100.99.158.19,100.99.158.14,100.99.158.18


  100.99.158.15,100.99.158.19,100.99.158.14,100.99.158.13



  service cassandra stop && service cassandra start  



service cassandra start     

cqlsh cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra

cqlsh cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237.

ALTER USER  cassandra WITH PASSWORD 'cassandra237.'   ;

GRANT MODIFY ON KEYSPACE z TO admin2;
GRANT SELECT ON KEYSPACE z TO admin2;





UN  100.99.158.18  691.42 GiB  256          53.6%             b0c2998d-62a3-4be6-b334-043090eb9c4f  rack1
UN  100.99.158.17  651.52 GiB  256          51.9%             6fa3fd27-4cf2-4517-9d8d-e0024ec8f791  rack1
UN  100.89.9.90    420.33 GiB  200          43.6%             b5da017c-a6ea-44d2-82c1-854b52b8a44b  rack1
UN  100.99.158.16  678.08 GiB  256          50.3%             6b06b1c9-af19-4e25-9efa-b490e4264c63  rack1
UN  100.89.9.60    346.8 GiB  128          29.1%             82a351bf-8ff0-46ce-8c5a-7dfa61288f5b  rack1
UN  100.99.158.13  616.27 GiB  256          49.7%             f459be92-39c9-44f2-afeb-71871e3310f1  rack1
UN  100.89.9.119   237.99 GiB  100          21.6%             253338

ab-832b-40ce-98d1-c769f7d708e7  rack1


100.99.158.17  :     cass102.analysis-shared.jpe2b.dcnw.zzz

100.99.158.13  :     cass104.analysis-shared.jpe2b.dcnw.zzz   f459be92-39c9-44f2-afeb-71871e3310f1 

100.99.158.18  cass103.analysis-shared.jpe2b.dcnw.zzz
 




###################33
100.99.158.17  :     cass102.analysis-shared.jpe2b.dcnw.zzz

100.99.158.16  :     cass102.analysis-shared.jpe2b.dcnw.zzz

nodetool decommission  6fa3fd27-4cf2-4517-9d8d-e0024ec8f791



cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.






cass102.analysis-shared.jpe2b.dcnw.zzz,cass103.analysis-shared.jpe2b.dcnw.zzz,cass104.analysis-shared.jpe2b.dcnw.zzz,cass105.analysis-shared.jpe2b.dcnw.zzz 


cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


cqlsh   cass106.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


cqlsh   cass107.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.



cqlsh   cass107.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2 -p  pcovid19fwz9


cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy z.user_history (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2 -p  pcovid19fwz9


cqlsh   cass109.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy z.user_history (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra   -p  cassandra237.



 ssh    cass103.analysis-shared.jpe2b.dcnw.zzz  

 cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 

 cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 

 cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 




cqlsh   cass106.nnn.hnd2..local   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 

cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2  -p pcovid19fwz9

cqlsh   cass104.nnn.hnd2..local   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u admin2  -p pcovid19fwz9



SELECT * from z.user_history LIMIT 2;

SELECT * from  productmaster.productmaster LIMIT 2;


SELECT * from z.stats LIMIT 2;



#####
100.99.158.16    cass101.analysis-shared.jpe2b.dcnw.zzz

100.99.158.13    cass104.analysis-shared.jpe2b.dcnw.zzz

100.89.9.119  cass105.nnn.hnd2..local  
100.89.9.60   cass104.nnn.hnd2..local    ##Down


100.99.158.18    cass103.analysis-shared.jpe2b.dcnw.zzz
100.99.158.17    cass102.analysis-shared.jpe2b.dcnw.zzz




############ Server
100.89.9.90   cass106.nnn.hnd2..local    



First, double-check the replication strategy used on the system_auth keyspace. 
By default, it is set to {'class':'SimpleStrategy','replication_factor':'1'} which is not sufficient (IMO) for anything other than local development. I always recommend changing this to the NetworkTopologyStrategy, and then specify replication by data center.

CREATE KEYSPACE system_auth WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': '3'}  AND durable_writes = true;



nodetool repair system_auth -full
That should bring back your previous user.
Note: Instead of a full repair, you might be able to get away with querying each table in system_auth at consistency ALL (which forces a read repair):

use system_auth;
consistency ALL;
SELECT COUNT(*) FROM roles;
SELECT COUNT(*) FROM role_permissions;
SELECT COUNT(*) FROM role_members;
SELECT COUNT(*) FROM resource_role_permissons_index;




nodetool status && nodetool drain && service cassandra stop  && service cassandra start



######################################################################
##### New Cluster Setup  #############################################
org.apache.cassandra.exceptions.ConfigurationException: Saved cluster name Test Cluster != 
Cluster name is saved inside Cassandra DB !

###################### 
nodetool drain && service cassandra stop
nodetool status 
nodetool removenode  587f9652-4c3b-4426-9153-a32909f4fc56


#### From Scratch setup, remove the data folder
service cassandra stop

rm -rf /var/lib/cassandra/data/*
rm -rf /data2/data/*

cd /var/lib/cassandra/ && mkdir data 
cd /data2 && mkdir  data 

service cassandra start


cd /var/lib/cassandra/ && mkdir commitlog  data  hints  saved_caches && chown -R cassandra:cassandra *
 
# Additional data drive
cd /data2 && mkdir commitlog  data  hints  saved_caches && chown -R cassandra:cassandra *

ls /data2/data/
ls /var/lib/cassandra/data/


###### Params and new cluster name
vim  /etc/cassandra/conf/cassandra.yaml   , setup the proper parameters and Cluster name

service cassandra start
nodetool status


###########  Cluster name
 cqlsh   cass101.nnn.hnd2..local   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 

UPDATE system.local SET cluster_name = 'Test Cluster' where key='local';

###############################################################################
###############################################################################

#### If one seed node is down when adding new node
set JVM_OPTS="$JVM_OPTS -Dcassandra.consistent.rangemovement=false" in the cassandra-env.sh

### Once bootstrapping is complete, a repair will need to be run using the following command on the node.
nodetool repair --full


###  Get the required node back online (preferred option).
###  If the required node is unrecoverable,  file to perform inconsistent range movements when auto bootstrapping.
###  This is to ensure the data it streamed is consistent with the rest of the replicas.


cassandra-env.sh








############ Error
WARN  [main] 2021-03-23 01:03:28,220 StartupChecks.java:332 - Directory /var/lib/cassandra/data doesn exist
ERROR [main] 2021-03-23 01:03:28,220 CassandraDaemon.java:785 - Has no permission to create directory /var/lib/cassandra/data


ERROR [main] 2021-03-22 18:09:52,007 CassandraDaemon.java:785 - Exception encountered during startup: Encryption must be enabled in client_encryption_options for native_transport_port_ssl



https://stackoverflow.com/questions/22006887/cassandra-saved-cluster-name-test-cluster-configured-name
cat  /var/log/cassandra/system.log 



In the cassandra-rackdc.properties file, assign the datacenter and rack names 
you determined in the Prerequisites. For example:
# indicate the rack and dc for this node
dc=DC1
rack=RAC1


vim  /etc/cassandra/conf/cassandra-rackdc.properties 


The GossipingPropertyFileSnitch always loads
 cassandra-topology.properties when that file is present.
  Remove the file from each node on any new cluster or any cluster migrated from the PropertyFileSnitch.


vim  /etc/cassandra/conf/cassandra-topology.properties

 cassandra-topology.properties 
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Cassandra Node IP=Data Center:Rack
192.168.1.100=DC1:RAC1
192.168.2.200=DC2:RAC2

10.0.0.10=DC1:RAC1
10.0.0.11=DC1:RAC1
10.0.0.12=DC1:RAC2

10.20.114.10=DC2:RAC1
10.20.114.11=DC2:RAC1

10.21.119.13=DC3:RAC1
10.21.119.10=DC3:RAC1

10.0.0.13=DC1:RAC2
10.21.119.14=DC3:RAC2
10.20.114.15=DC2:RAC2

# default for unknown nodes
default=DC1:r1

# Native IPv6 is supported, however you must escape the colon in the IPv6 Address
# Also be sure to comment out JVM_OPTS="$JVM_OPTS -Djava.net.preferIPv4Stack=true"
# in cassandra-env.sh
fe80\:0\:0\:0\:202\:b3ff\:fe1e\:8329=DC1:RAC3



from random import randrange
print(randrange(10))

http://hue4001.vip.hnd2..local/beeswax/#query
I made your account on our Hue.
Username : popo01
Password : Jh9HZLH9bAxkYMk

 cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz   9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 



cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy z.user_history_test (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy z.user_history_test (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy z.user_history_test (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.



./cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy z.user_history_test (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


50k 


./cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy z.user_history_test (key) to 'tttcb301/sssvols05/ppp/test_code/ztmp/key_userhistory.csv'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


500 mio  ---> 50 000   10 000




#### encryption Cassandra
Need to re-start all nodes one by one.
After re-starts, it takes 5mins to connect 


https://thelastpickle.com/blog/2015/09/30/hardening-cassandra-step-by-step-part-1-server-to-server.html


vim  /etc/cassandra/conf/cassandra.yaml

nodetool drain &&  service cassandra stop  && service cassandra start





# The passwords used in these options must match the passwords used when generating
# the keystore and truststore.  For instructions on generating these files, see:
# http://download.oracle.com/javase/6/docs/technotes/guides/security/jsse/JSSERefGuide.html#CreateKeystore
#
server_encryption_options:
    internode_encryption: none
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    truststore:  /etc/cassandra/conf/.truststore
    truststore_password:  R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    # protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA]
    # require_client_auth: false
    # require_endpoint_verification: false

# enable or disable client/server encryption.
client_encryption_options:
    enabled: false
    # If enabled and optional is set to true encrypted and unencrypted connections are handled.
    optional: true
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    require_client_auth: false
    # Set trustore and truststore_password if require_client_auth is true
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    # protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA]

# internode_compression controls whether traffic between nodes is
# compressed.
# Can be:
#
# all
#   all traffic is compressed
#
# dc
#   traffic between different datacenters is compressed
#
# none
#   nothing is compressed.
internode_compression: dc



# Currently, only the following file types are supported for transparent data encryption, although
# more are coming in future cassandra releases: commitlog, hints
transparent_data_encryption_options:
    enabled: false
    chunk_length_kb: 64
    cipher: AES/CBC/PKCS5Padding
    key_alias: testing:1
    # CBC IV length for AES needs to be 16 bytes (which is also the default size)
    # iv_length: 16
    key_provider:
      - class_name: org.apache.cassandra.security.JKSKeyProvider
        parameters:
          - keystore: conf/.keystore
            keystore_password: cassandra
            store_type: JCEKS
            key_password: cassandra








import datetime as DT
import pytz
import calendar
naive_time3 = DT.datetime.strptime('2013/11/03', '%Y/%m/%d')
print repr(naive_time3)
#datetime.datetime(2013, 11, 3, 0, 0)
localized_time3 = mtl.localize(naive_time3)
print repr(localized_time3)
#datetime.datetime(2013, 11, 3, 0, 0, tzinfo=<DstTzInfo 'America/Montreal' EDT-1 day, 20:00:00 DST>)
print calendar.timegm(localized_time3.utctimetuple())
#1383451200.0

def add_day(x):
    d = x.date()+DT.timedelta(1)
    return mtl.localize(x.replace(year=d.year, month=d.month, day=d.day, tzinfo=None))
print repr(add_day(localized_time3))
#datetime.datetime(2013, 11, 4, 0, 0, tzinfo=<DstTzInfo 'America/Montreal' EST-1 day, 19:00:00 STD>)




def date_unix(add_days=0, hours=7, mins=17 ):
    from pytz import timezone as tzone
    import datetime, calendar

    # Current time 
    now = datetime.datetime.now(tzone('Asia/Tokyo'))
    now = now.replace(hour=hours, minute=mins, second=0)
    now = now + 
    return calendar.timegm(now.utctimetuple())




    return mtl.localize(x.replace(year=d.year, month=d.month, day=d.day, tzinfo=None))



    def date_now_jp(fmt="%Y%m%d", add_days=0, add_hours=0, timezone='Asia/Tokyo', mode='str'):
        # "%Y-%m-%d %H:%M:%S %Z%z"
        from pytz import timezone as tzone
        import datetime
        # Current time in UTC
        now_utc = datetime.datetime.now(tzone('UTC'))
        now_new = now_utc+ datetime.timedelta(days=add_days, hours=add_hours)

        if timezone == 'utc':
           return now_new.strftime(fmt)
        else :
           # Convert to US/Pacific time zone
           now_pacific = now_new.astimezone(tzone('Asia/Tokyo'))
           return now_pacific.strftime(fmt)





print repr(add_day(localized_time3))


keep.update(yoursequenceofvalues)





ssh docker101.analysis-shared.jpe2b.dcnw.zzz



####### Cassandra cb4

server_encryption_options:
    internode_encryption: none
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    # protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA]
    # require_client_auth: false
    # require_endpoint_verification: false

# enable or disable client/server encryption.
client_encryption_options:
    enabled: false
    # If enabled and optional is set to true encrypted and unencrypted connections are handled.
    optional: true
    keystore: /etc/cassandra/conf/.keystore
    keystore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # require_client_auth: false
    # Set trustore and truststore_password if require_client_auth is true
    truststore: /etc/cassandra/conf/.truststore
    truststore_password: R5btsfx3KKQVBE2bMKWTn3ktIgBl22
    # More advanced defaults below:
    protocol: TLS
    # algorithm: SunX509
    # store_type: JKS
    # cipher_suites: [TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA]

# internode_compression controls whether traffic between nodes is
# compressed.
# Can be:
#
# all
#   all traffic is compressed
#
# dc
#   traffic between different datacenters is compressed
#
# none
#   nothing is compressed.
internode_compression: dc



select A.date,A.id,max(c)
from
(
   select date,id,desc,count(desc) c
   from hive_tab 
   group by date,id,desc
) A
group by A.date,A.id;





E-tag promotion is more than 50%:


/bin/sh - c  "while true; do  tttcb301/sssvols05/ppp/tbin/tbin.sh; sleep 16000 ; do &"




/bin/sh - c  "while true; do  chown -R ppp.ppp tttcb301/sssvols05/ppp/tbin/tbin.sh; sleep 16000 ; do &"



#### show the system
/bin/sh - c  "while true; do  top -b -n 1 sleep 10 ; do &"


lscpu | head -n 10





while true; do  tttcb301/sssvols05/ppp/tbin/tbin.sh && sleep 21000 ; done &






sudo 


a2/cb301/sssvols05/ppp/codev15.tar.gz

ssh  ins-101.nnn.hnd2..local

a7 : Pyspark

pyspark  --conf spark.driver.memory=10g   --conf spark.executor.memory=5g



umount -l tttcb301/sssvols05


mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05



tar -pczf MyBackup.tar.gz --exclude "/home/user/public_html/tmp/" /home/user/public_html/


tar -pczf codev15b.tar.gz  --exclude "CodeV15/data/"    CodeV15




tar -pczf code2.tar.gz  --exclude "CodeV14/data/"    CodeV14

tar -pczf offline.tar.gz  --exclude "CodeV14/data/"    offline


pip insall pycallgraph2
'/home/ppp/.local/lib/python3.7/site-packages/pycallgraph2/__init__.py'>


Executable

python   /home/ppp/.local/bin/pycallgraph  


pycallgraph -v --stdlib --include "django.core.*" graphviz -- ./manage.py syncdb --noinput





########################################################################
#### Pyspark in ####################################################
sudo su ppp

source /home/ppp/work/ttrrrc01/hdp26_c4000/.bashrc.Spark2.3


export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;


source activate /home/ppp/work/ttrrrc01/anaconda2/

cd tttcb301/sssvols05/ppp/test_code/


pyspark  --conf spark.driver.memory=5g   --conf spark.executor.memory=15g  --conf spark.dynamicAllocation.enabled=true  --conf spark.dynamicAllocation.maxExecutors=60


pyspark  --conf spark.driver.memory=15g   --conf spark.executor.memory=5g  --conf spark.dynamicAllocation.enabled=true  --conf spark.dynamicAllocation.maxExecutors=60

       
 hadoop fs -mkdir -p /user/ppp/nono/quantity_extract


# Enable Arrow-based columnar data# Enable Arrow-based columnar data 
spark.conf.set("spark.sql.execution.arrow.pyspark.enabled", "true")

Firstly, we need to ensure that a compatible PyArrow and pandas versions are installed. 
These are 0.15.1 for the former and 0.24.2 for the latter.



sudo su ppp
source /home/ppp/work/ttrrrc01/hdp26_c4000/.bashrc.Spark2.3

export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;




#########################################################################
### HIVE HDFS 
sudo su ppp
kinit -kt ~/keytabs/ppp.nnn.keytab ppp@C2000.HADOOP.zzz.COM

klist


hdfs:///user/coconuts/profile/version=2.0.0/service=z/span=whole/key=member/type=all/year=2020/month=10/day=04



##########################################
### by zip3 
→ Cass transfer :

        Batch transfer your batch list :  15mins update,  → Leo (Kevin).

        Consume files.




>>>  sc.getConf().getAll()sc.getConf().getAll()
>>> 
[('spark.eventLog.enabled', 'true'), 
('spark.yarn.queue', 'common'), 
('spark.eventLog.dir', 'hdfs://nameservice1/ns1/spark2/history-server-logs'), 
('spark.driver.port', '45975'),
 ('spark.driver.extraClassPath', ':/usr/local/hdp26/hadoop/lib/native/*:/usr/local/hdp26/spark2/lib/*:'), 
 ('spark.sql.warehouse.dir', '/user/ppp/warehouse'), ('spark.executor.id', 'driver'), 
 ('spark.app.name', 'PySparkShell'), ('spark.app.id', 'local-1615451117547'), 
 ('spark.executor.extraClassPath', ':/usr/local/hdp26/hadoop/lib/native/*:/usr/local/hdp26/spark2/lib/*:'),
  ('spark.driver.extraJavaOptions', '-Djava.library.path=/usr/local/hdp26/hadoop/lib/native:/usr/local/hdp26/hadoop/lib/native/Linux-amd64-64/lib'), 
  ('spark.sql.catalogImplementation', 'hive'), ('spark.rdd.compress', 'True'), ('spark.serializer.objectStreamReset', '100'),
   ('spark.driver.host', '100.78.23.56'),
    ('spark.executor.extraJavaOptions', '-Djava.library.path=/usr/hdp/current/hadoop-client/lib/native:/usr/hdp/current/hadoop-client/lib/native/Linux-amd64-64'), 
    ('spark.master', 'local[*]'), ('spark.submit.deployMode', 'client'), 
    ('spark.yarn.am.extraJavaOptions', '-Dhdp.version=2.6.2.0-205')]




#### Carlso Specs

HADOOP_INST=/home/ppp/work/ttrrrc01/hdp26_c4000
export KRB5_CONFIG=$HADOOP_INST/krb5.conf
export HADOOP_HOME=$HADOOP_INST/hadoop
export JAVA_HOME=$HADOOP_INST/jdk
export SPARK_HOME=$HADOOP_INST/spark2.3
export SPARK_SUBMIT_OPTS=-Djava.security.krb5.conf=$HADOOP_INST/krb5.conf
export HIVE_HOME=$HADOOP_INST/hive
export HCAT_HOME=$HADOOP_INST/hive/hcatalog
export TEZ_HOME=$HADOOP_INST/tez
export PIG_HOME=$HADOOP_INST/pig
export HBASE_HOME=$HADOOP_INST/hbase
export PATH=$HBASE_HOME/bin:$PIG_HOME/bin:$TEZ_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$JAVA_HOME/bin:$HADOOP_HOME/bin:/data_hdd/ttrrrc01/work/notebooks:/usr/lib64/qt-3.3/bin:/usr/local/maven-3.3.9/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/lib/jvm/java/bin:/usr/hdp/current/hadoop/bin:/home/ppp/.local/bin:/home/ppp/bin
export PS1='\[\033[46;30m\][\t \u@\h \W]$\[\033[0m\] '
export KRB5CCNAME=/tmp/krb5cc_20640_2

# To allow Hive read tables with data on json format
EXTERNAL_LIB=/data_hdd/ttrrrc01/work/repositories/external-library
export HIVE_AUX_JARS_PATH=$EXTERNAL_LIB/json-serde-1.3.8-jar-with-dependencies.jar


### Web
export HTTP_PROXY=dev-proxy.db.zzz.co.jp:10080
export HTTPS_PROXY=dev-proxy.db.zzz.co.jp:10080



export http-proxy=dev-proxy.db.zzz.co.jp:9502
export https-proxy=dev-proxy.db.zzz.co.jp:9502




export TZ="Asia/Tokyo"
export HTTP_PROXY=dev-proxy.db.zzz.co.jp:9502
export HTTPS_PROXY=dev-proxy.db.zzz.co.jp:9502

swap_link() {
  local _file=$1
  local _link=$2
  rm $_link && mv $_file $_link && ln -s $_link $_file
}

alias c4000="rm $HADOOP_HOME/etc/hadoop/CLUSTER && ln -s $HADOOP_HOME/etc/hadoop/C4000 $HADOOP_HOME/etc/hadoop/CLUSTER && rm $HIVE_HOME/conf/hive-site.xml && ln -s $HIVE_HOME/conf/hive-site.xml.C4000 $HIVE_HOME/conf/hive-site.xml && export spark_queue=common2-adhoc"
#alias c5000="rm $HADOOP_HOME/etc/hadoop/CLUSTER && ln -s $HADOOP_HOME/etc/hadoop/C5000 $HADOOP_HOME/etc/hadoop/CLUSTER && rm $HIVE_HOME/conf/hive-site.xml && ln -s $HIVE_HOME/conf/hive-site.xml.C5000 $HIVE_HOME/conf/hive-site.xml && export spark_queue=common-spark"
alias ll='ls -l'

notebook() {
    if [ "$spark_queue" == "" ]
    then
        echo "\$spark_queue variable is empty"
        return 1
    fi

    if [ "$num_executors" == "" ]
    then
        num_executors=8
    fi

    if [ "$executor_memory" == "" ]
    then
        executor_memory=2g
    fi

    export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH
    export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter
    export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /data_hdd/ttrrrc01/work --port 8889'

    pyspark --name "KrygShell"  \
            --queue $spark_queue\
            --master yarn\
            --deploy-mode client\
            --conf spark.hadoop.yarn.timeline-service.enabled=false\
            --num-executors $num_executors\
            --executor-cores 5  \
            --executor-memory $executor_memory  \
            --conf spark.serializer=org.apache.spark.serializer.KryoSerializer  \
            --jars /home/ppp/work/ttrrrc01/hdp26_c4000/apache-hive-1.2.1000.2.6.2.0-205-bin/lib/json-serde-1.3.8-jar-with-dependencies.jar
}



#########################################################################
############# k8s Development ###########################################
https://kubernetes.io/docs/tasks/tools/install-kubectl/

### Kube CTL path
export PATH=tttcb301/sssvols05/ks8tmp/gitdev/bin:$PATH;




#############################################################################
### Install cmake compiler
export PATH=tttcb301/sssvols05/ks8tmp/gitdev/cmake_run/bin/:$PATH;


export HTTP_PROXY="http://dev-proxy.db.zzz.co.jp:9501/"  && export HTTPS_PROXY="http://dev-proxy.db.zzz.co.jp:9501"



#############################################################################
##### Compile fasstext
git clone https://github.com/facebookresearch/fastText.git
cd fastText
mkdir build && cd build && 
cmake ..
make
#### binaries are in build/


#############################################################################
### Compile lightgbm 
cd lightgbm
cd build
tttcb301/sssvols05/ks8tmp/cmake_run/bin/cmake  ..
tttcb301/sssvols05/ks8tmp/cmake_run/bin/make 

It will generate boht executable and 







#############################################################################
# Extra environnment
base                     tttcb301/sssvols05/ks8tmp/miniconda3
pyextra               *  tttcb301/sssvols05/ks8tmp/miniconda3/envs/pyextra



###################################################################################
pip install lightgbm --install-option=--mpi




#############################################################################
#### PS: remove past history, this will not keep your old commit history around
git checkout --orphan latest_branch
git add -A
git commit -am "init"
git branch -D master
git branch -m master  Rename the current branch to master
git push -f origin master   Finally, force update your repository


######### Details   ###########################################################
Pull request  ml into test
git checkout ml
git pull origin test  --allow-unrelated-histories



######### Merge commits into single ones  ######################################
master and merge in your feature branch:

git checkout topical_xFeature
git rebase -i master
git checkout master
git merge topical_xFeature
Alternatively, if you just want to squash everything in topical_xFeature into master, you could just do the following:

git checkout master
git merge --squash topical_xFeature
git commit




Access as 
sudo su root


find / -name '*.ipynb'



                      *  tttcb301/sssvols05/ks8tmp/miniconda3
pyextra                  /home/ppp/.conda/envs/pyextra
base                     /opt/anaconda3
cass                     /opt/anaconda3/envs/cass





command > /dev/null 2>&1 & 
Copy
>/dev/null 2>&1 means redirect stdout to /dev/null and stderr to stdout .

Use the jobs utility to display the status of all stopped and background jobs in the current shell session:
jobs -l



docker system df





#### Necessary to start worker
bin_path=tttcb301/sssvols05/ppp/test_scylla/bin/


#### need chdmo on the folder

(base) [root@ins-101 ipsvols05]# chown -R ppp.ppp  ks8tmp/
(base) [root@ins-101 ipsvols05]# chmod -R 777 ks8tmp/
(base) [root@ins-101 ipsvols05]# ls -l  ks8tmp/




class SSHRemote(object):
    def __init__(self,config_file_path,queue_suffix='',monitor=False,overrides={}):
        self.config_file_path = config_file_path
        self.config = ConfigReader(config_file_path).config
        self.logger = Logger().logger
        self.hosts = self.config.get('ssh_remote','hosts')
        self.num_workers_per_host = int(self.config.get('ssh_remote','num_workers_per_host'))
        self.use_docker = False
        try:
            self.use_docker = self.config.get('ssh_remote','use_docker')
            self.docker_container_name = self.config.get('ssh_remote','docker_container_name')
        except Exception as e:
            self.logger.info('not using docker')
            self.use_docker=False
        self.host_list = self.hosts.split(',')*self.num_workers_per_host
        self.env   = self.config.get('environment','bin_path')





########################################################################
#### Pyspark in ####################################################
sudo su ppp
source /home/ppp/work/ttrrrc01/hdp26_c4000/.bashrc.Spark2.3

export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;



#########################################################################
### HIVE HDFS 
sudo su ppp
kinit -kt ~/keytabs/ppp.nnn.keytab ppp@C2000.HADOOP.zzz.COM

klist

##### Details 
tttcb301/sssvols05/ppp/tbin/tbin.sh

hdfs:///user/coconuts/profile/version=2.0.0/service=z/span=whole/key=member/type=all/year=2020/month=10/day=04


hdfs dfs -ls  /user/ppp/nono/db/ww_items/

hdfs dfs -mkdir  /user/ppp/nono/db/ww_items/

hdfs dfs -put /a/acb401/sssvols06/ww_check/hdfs/daily_ccs/      /user/ppp/nono/db/ww_items/






#########################################################################
## source the env
source /home/ppp/work/ttrrrc01/hdp26_c4000/.bashrc.Spark2.3

## definition of the bash function
declare -f notebook
notebook ()
{
    if [ "$spark_queue" == "" ]; then
        echo "\$spark_queue variable is empty";
        return 1;
    fi;
    export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
    export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;
    export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /data_hdd/ttrrrc01/work --port 8889';
    pyspark --name "KrygShell" --queue $spark_queue --master yarn --deploy-mode client --conf spark.hadoop.yarn.timeline-service.enabled=false --num-executors 64 --executor-cores 5 --executor-memory 5g --conf spark.serializer=org.apache.spark.serializer.KryoSerializer --jars /home/ppp/work/ttrrrc01/hdp26_c4000/apache-hive-1.2.1000.2.6.2.0-205-bin/lib/json-serde-1.3.8-jar-with-dependencies.jar
}
 
export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;


###export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /home/ppp/work/popo01/  --ip=0.0.0.0 --no-browser  --port 1904';
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /tttcb301/sssvols05/ppp/  --ip=0.0.0.0 --no-browser  --port 1904';


# export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /data_hdd/zhaomeng02--port 9999';
####use the local mode
pyspark --master local[*]


jupyter lab --notebook-dir  tttcb301/sssvols05/ppp/   --allow-root --ip=0.0.0.0 --no-browser --port 1904


###Create Symbolic Link :
ln -s /home/ppp/   tttcb301/sssvols05/ppp/test_code/ppp

ls -s  tttcb301/sssvols05/  ipsls05

cd /home/ppp/work/popo01/ 


20/10/12 06:22:51 WARN util.Utils: Service 'SparkUI' could not bind on port 4040. Attempting port 4041.

1904/?token=60fc2dd5375849ae435542ce3a01836d16d0a18ae3161d64




#### Docker Run #####################################################################
// one example
docker container run -it --rm --name "test_Meng" docker-regi.intra.zzz-it.com/ppp/sc-reporting:yarn-1.3.0 sh
 
// environment variable for Japan Standard Time (JST), default is UTC
export TZ=Asia/Tokyo
 
// keytabs can be found in the following folder
ls -l /usr/local/hdp26/


kinit -kt /usr/local/hdp26/keytabs/ppp.nnn.keytab ppp@C2000.HADOOP.zzz.COM




################################## AOG server ###################################
// use anaconda of zzztt
$ hostname
ins-101
$ export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
$ jupyter notebook --notebook-dir /data_hdd/zhaomeng02 --port 9999
#################################################################################

export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;


export PATH=/data_hdd/popo01/conda/bin/:$PATH;


jupyter lab --notebook-dir /data_hdd/popo01/  --allow-root --ip=0.0.0.0 --no-browser --port 1904





##################################### VM ########################################
// in order to access jupyter page on VM, the following settings are needed
// check VMs IP
$ C:\Users\meng.a.zhao>hostname
ajpe2-p1-0285
$ C:\Users\meng.a.zhao>ipconfig
 

// check IP
$ ifconfig

// just for check: try to ssh local machine from step login server. Note that the account names are different
// make sure ssh-server service enable (for mac, turn on remote login)
$ ssh meng.a.zhao@10.80.118.206
$ exit


// reverse ssh tunneling
$ ssh -N -R 8801:ins-101.nnn.hnd2..local:9999 meng.a.zhao@10.80.118.206



https://juicefs.com/blog/en/posts/how-to-make-hbase-faster-more-stable-and-cheaper/





#######################################################################
#### Install  #########################################################

When restart a node , the node is not boostraped and attached direclty.
it takes 30min to sync the trees with other nodes.
type
   nodetool bootstrap resume 
   nodetool describecluster   

An error occurs
Cluster Information:
        Name: Test Cluster
        Snitch: org.apache.cassandra.locator.SimpleSnitch
        DynamicEndPointSnitch: enabled
        Partitioner: org.apache.cassandra.dht.Murmur3Partitioner
        Schema versions:
                f926bae3-0827-3e7d-8ceb-328fbe037124: [100.99.158.17, 100.99.158.13]

                UNREACHABLE: [100.99.158.18, 100.99.158.16]

---> After 30mins, it should be fine.
Dont do ANYTHING.



sudo su root
vim  /etc/cassandra/conf/cassandra.yaml

nodetool drain  &&  service cassandra stop  && service cassandra start


https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/initialize/initSingleDS.html



Execute nodetool scrub in the affected node. it solved the issue related to Cassandra Validation failed error.

﻿
Share
Edit
Follow
Flag
edited Oct 31 '17 at 3:08
answered May 17 '17 at 8:22


##### Scrub
Cassandra Validation failed error - Repair session failed with error

Scrub worked for me, on some occasions where it didn't, I just restarted Cassandra process and ran repair without validation errors.
 Hopefully this helps people searching for the same issue – APZ Oct 31 '17 at 19:27




##########################################################################
################ Cassandra Update  #######################################
 nodetool repair -pr  productmaster




To build a Merkle tree on a node with 500 GB will read through the full 500 GB (when using -pr, it will be roughly a factor of replication factor lower). However, the Merkle trees are constant size (a few MB) so very little is sent over the network if the nodes are in sync.

The best way to run scheduled repairs is to run with -pr on each node in turn. This avoids repairing the same data multiple times. Also, only run on one node at once to avoid placing extra load on your cluster.




##########################################################################
################ Cassandra Update  #######################################
Chenge the 
vim  /etc/cassandra/conf/cassandra.yaml
:x

vim  /etc/cassandra/conf/cassandra-rackdc.properties 

nodetool drain &&  service cassandra stop  && service cassandra start


commitlog_compression:
   - class_name: LZ4Compressor
#     parameters:

################################################################################
######### Cassandra Read Prev Dial Back Read Ahead #################################################
https://thelastpickle.com/blog/2019/01/30/new-cluster-recommendations.html
https://github.com/Azure-Samples/cassandra-on-azure-vms-performance-experiments/blob/master/docs/cassandra-read-ahead.md

## Check current read ahread 
blockdev --getra /dev/nvme0n1p1    {device}

blockdev --setra 32 /dev/nvme0n1p1  


blockdev --getra  /dev/mapper/data     # 256
blockdev --setra 32 /dev/mapper/data


blockdev --getra  /dev/mapper/data2
blockdev --setra 32 /dev/mapper/data2


https://github.com/Azure-Samples/cassandra-on-azure-vms-performance-experiments/blob/master/docs/cassandra-read-ahead.md
os.path.exists




##################################################################################
### Disable snitch  ##############################################################
https://issues.apache.org/jira/browse/CASSANDRA-6908
https://user.cassandra.apache.narkive.com/WBFeWcLD/dynamic-snitch-false-prioritisation-order-or-reads-from-replicas

dynamic_snitch: false     ### in cassandra.yaml.



### Put num_token to 4:  #####################################################
### A bit dangerous, not needed for key value store
https://cassandra.apache.org/doc/latest/getting_started/production.html
https://docs.datastax.com/en/dse/5.1/dse-admin/datastax_enterprise/config/configRecommendedSettings.html

allocate_tokens_for_keyspace


######
home$ ls /sys/class/block/
nvme0n1  nvme0n1p1  nvme0n1p14  nvme0n1p15  nvme0n1p16  nvme1n1  nvme1n1p1



Filesystem      Size  Used Avail Use% Mounted on
devtmpfs         32G     0   32G   0% /dev
tmpfs            32G     0   32G   0% /dev/shm
tmpfs            32G  708K   32G   1% /run
tmpfs            32G     0   32G   0% /sys/fs/cgroup
/dev/nvme0n1p1  723G   16G  707G   3% /
/dev/nvme1n1p1  932G  238G  694G  26% /var/lib/cassandra



 cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy productmaster.productmaster (key) to '/data_hdd/popo01/itemaster/mona1.csv'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237. 




 cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY QUORUM ; copy productmaster.productmaster (key) to '/data_hdd/popo01/itemaster/mona1.csv'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237. 


 cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p cassandra237. 


ssh cass103.analysis-shared.jpe2b.dcnw.zzz

ING cass104.analysis-shared.jpe2b.dcnw.zzz (100.99.158.13) 

ssh cass102.analysis-shared.jpe2b.dcnw.zzz

dynamic_snitch: false     ### in cassandra.yaml


vim  /etc/cassandra/conf/cassandra.yaml

nodetool status && nodetool drain &&  service cassandra stop   && service cassandra start  


service cassandra start


### TODO
cass106
cass105 to attach




############ Server
100.99.158.16    cass101.analysis-shared.jpe2b.dcnw.zzz

100.99.158.17    cass102.analysis-shared.jpe2b.dcnw.zzz

100.99.158.18    cass103.analysis-shared.jpe2b.dcnw.zzz

100.99.158.13    cass104.analysis-shared.jpe2b.dcnw.zzz



100.89.9.60   cass104.nnn.hnd2..local  
100.89.9.119  cass105.nnn.hnd2..local     
100.89.9.90   cass106.nnn.hnd2..local    


seeds: "100.99.158.16,100.99.158.17,100.99.158.18"



cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 --protocol-version 4 --connect-timeout 7600 --request-timeout 7600  -e  " consistency one;  COPY z.user_history (shop_id)  TO '/dev/null' "     -u cassandra -p  cassandra237.




---  cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 --protocol-version 4 --connect-timeout 7600 --request-timeout 7600   -u cassandra -p  cassandra237.

---  cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 --protocol-version 4 --connect-timeout 7600 --request-timeout 7600  -e  "COPY ztest.productmaster_all  TO '/dev/null' "     -u cassandra -p  cassandra237.


-- Count values
-- cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY QUORUM ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.



-- cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.


 cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



 cqlsh   cass101.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY QUORUM ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  


 cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ONE ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  


 cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



cqlsh   cass105.nnn.hnd2..local   9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



cqlsh   cass106.nnn.hnd2..local   9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  


cqlsh   cass104.nnn.hnd2..local   9042 -e "CONSISTENCY QUORUM ; copy productmaster.productmaster (key) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



cqlsh   cass106.nnn.hnd2..local   9042 -e "CONSISTENCY ONE ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  


cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



cqlsh   cass103.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  


cqlsh   cass102.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  

cqlsh   cass104.analysis-shared.jpe2b.dcnw.zzz  9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  

cqlsh   cass105.nnn.hnd2..local   9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  


cqlsh   cass106.nnn.hnd2..local   9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  



cqlsh   cass104.nnn.hnd2..local   9042 -e "CONSISTENCY ALL ; copy productmaster.productmaster (key,value) to '/dev/null'"  --protocol-version 4 --connect-timeout 7600 --request-timeout 7600    -u cassandra -p  cassandra237.  




split -b 15000M -d  file.txt file



wc -l <filename>



awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat)






vim  /etc/cassandra/conf/cassandra.yaml

cass102 went down


86416da9-0b16-3208-acff-aa5619625762: [100.99.158.18]

UNREACHABLE: [100.99.158.17, 100.99.158.16, 100.99.158.13]

seeds: "100.99.158.17,100.99.158.18,100.99.158.13"




cass104.analysis-shared.jpe2b.dcnw.zzz  100.99.158.13

nodetool rebuild

nodetool rebuild: is similar to the bootstrapping process (when you add a new node to the cluster) but for a datacenter. 
The process here is mainly a streaming from the already live nodes to the new nodes (the new ones are empty). So after defining the key ranges for the nodes which is very fast, the rest can be seen as a copy operation.




######  Product Master Statistics
nodetool cfstats -H productmaster.productmaster

  Compacted partition minimum bytes: 43
  Compacted partition maximum bytes: 1597
  Compacted partition mean bytes: 449


nodetool cfhistograms productmaster productmaster



##### transfer to HDFS
source tttcb301/sssvols05/ppp/tbin/tbin.sh 

hdfs dfs -put  /data/workspaces/popo01/img/models/fashion/dcf_vae/    hdfs://nameservice1/user/ppp/nono/z/  &


hdfs dfs -put /data/workspaces/popo01/img/data/  hdfs://nameservice1/user/ppp/nono/z/  &



df1 = df.where(pd.notnull(df), None)




cat -head 20 tttcb201/sssvols03/ndata/cpa/emb/seq/z_order_20210901b_itemtagb2/aseq_1000000000_full.txt  > zpur_check.txt 









#### Local read
python run_test.py  --do local_bigtable  --arg1 1   --arg2  100   --arg3  0.2   --arg4 cassandra  --arg5 200



python run_test.py  --do ks8_bigtable  --arg1 5   --arg2  100   --arg3  0.05   --arg4 cassandra  --arg5 200








DATA_DIR = '/a/ndt101/vol/aog/itemMaster'


a/cb301/sssvols05/ppp/test_scylla/cass_loader


/a/nbackup401/search_batch_log/price_inventory_data/incr_genre 


### Mounted
 -v "$(pwd)"/target:/app2:ro,rslave \



$ docker volume create \
    --name mynfs \
    --opt type=nfs \
    --opt device=:<nfs export path> \
    --opt o=addr=<nfs host> \
    mynfs
$ docker run -it -v mynfs:/foo alpine sh





git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done





data/workspaces/popo01/img/models/fashion/dcf_vae





find . -name '*scylla_test*' #-delete

find  tttcb301/sssvols05/Temp/logs/  -name '*scylla_test*' -delete

export PATH="/home/popo01/home/zscript/:$PATH"  && chmod -R 777  /home/popo01/home/zscript/




ssh   scylladb101.analysis-shared.jpe2b.dcnw.zzz

ssh  popo01@scylladb101.analysis-shared.jpe2b.dcnw.zzz


plink -m hmac-sha2-512 popo01@loginjpe1101z.nnn.jp.local



#########################################################################
cd 
git pull --all ;
env TZ=Japan/Tokyo date > zlog/zlog.txt  &&  python example.py >> zlog/zlog.txt
gitpush test
sleep 36000




#### Jupyterlab to read the dot files :


Activate an environment with jupyter-core installed (you should have it if you can start a jupyterlab or notebook server),
Generate a jupyter config file
$ jupyter notebook --generate-config
Open up the generated file (named jupyter_notebook_config.py, typically in ~/.jupyter)
$ cd ~/.jupyter && nano jupyter_notebook_config.py
Go down to the ContentsManager section to the commented line #c.ContentsManager.allow_hidden = False, uncomment the line, change False to True, and save the file
Restart your jupyter server.
Now jupyterlab will serve hidden files and you’ll be able access them easily through the File Browser.






gitpush $(env TZ=Japan/Tokyo date)

#########################################################################
ssh bdigcpadv102.nnn.hnd2..local


bdigcpadv10[2-3].nnn.hnd2..local


##### Local windows
If you are using Microsoft windows environment then you can set a variable named HTTP_PROXY, FTP_PROXY, or HTTPS_PROXY depending on the requirement.

I have used following settings for allowing my commands at windows command prompt to use the browser proxy to access internet.


set HTTP_PROXY=http://dev-proxy.db.zzz.co.jp:9501  && set HTTPS_PROXY=http://dev-proxy.db.zzz.co.jp:9501


http_proxy     : http://dev-proxy.db.zzz.co.jp:9501
https_proxy    : http://dev-proxy.db.zzz.co.jp:9501
npm_http_proxy : http://pkg.proxy.nnn.jp.local:10080
npm_https_proxy: http://pkg.proxy.nnn.jp.local:10080



alias info_cpu="lscpu  &&  lscpu | egrep 'Model name|Socket|Thread|NUMA|CPU\(s\)'  && lscpu -p"




#### Analyist server, access to data
ssh  ins-101.nnn.hnd2..local


Start-Transcript [[-path] FilePath] [-force] [-noClobber] [-append]
Stop-Transcript


zzz_proxy   && git config --global user.email "kevin.noel@zzz.com"  &&  git config --global user.name "kevin.noel"  && git config --global credential.helper "cache --timeout=90600" 




##### All tools available
git clone https://git.zzz-it.com/scm/~kevin.noel/home.git




##### Airflow Server :
docker run -d -p 8089:8089 -e LOAD_EX=y puckel/docker-airflow




mkdir -p \
tttgfs101/sssvolh01 \
tttgfs104/sssvolh01 \
tttgfs201/sssvolh02 \
tttgfs204/sssvolh02 \
tttgfs201/sssvols02 \
tttgfs204/sssvols02 \
tttcb201/sssvolh03 \
tttcb204/sssvolh03 \
tttcb201/sssvols03 \
tttcb204/sssvols03 \
/a/ins-apiopds101/sssvols04 \
/a/ins-apiopds101/sssvolh04 \
/a/ins-apiopds104/sssvols04 \
/a/ins-apiopds104/sssvolh04 \
/a/ins-apiopds101/apiopdsgv01 \
tttcb301/sssvols05 \
/a/acb401/sssvols06





# Unsecured
mv /var/lib/glusterd/secure-access /var/lib/glusterd/secure-access.sav
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs101.nnn.hnd1..local:/sssvolh01 tttgfs101/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs104.nnn.hnd1..local:/sssvolh01 tttgfs104/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvolh02 tttgfs201/sssvolh02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs204.nnn.hnd1..local:/sssvolh02 tttgfs204/sssvolh02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvols02 tttgfs201/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs204.nnn.hnd1..local:/sssvols02 tttgfs204/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvolh03 tttcb201/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvolh03 tttcb204/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvols03 tttcb204/sssvols03
mount -t glusterfs -o log-level=WARNING ins-apiopds104.nnn.jp.local:/apiopdsgv01 /a/ins-apiopds101/apiopdsgv01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds101.nnn.hnd1..local:/sssvols04 /a/ins-apiopds101/sssvols04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds101.nnn.hnd1..local:/sssvolh04 /a/ins-apiopds101/sssvolh04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds104.nnn.hnd1..local:/sssvols04 /a/ins-apiopds104/sssvols04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds104.nnn.hnd1..local:/sssvolh04 /a/ins-apiopds104/sssvolh04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05


mkdir -p  tttcb301/sssvols05 

mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05


umount tttcb301/sssvols05 

#####################################################################################
Generally, limit a Cassandra cluster low hundreds of tables, regardless of number of keyspaces. 
Beyond low hundreds is certainly an “expert” feature and requires great care. 
Sure, maybe you can have 500 or 750 or maybe even 1,000 tables in a cluster, 
but don’t be surprised if you start running into memory and performance issues.

There is an undocumented method to reduce the table overhead to support more tables, 
but... if you are not expert enough to find it on your own, then you are definitely not expert enough to be using it.


The table thresholds have additional dependencies on JVM Heap and the byte count. 
Each table uses approximately 1 MB of memory. For each table being acted on,
 there is a memtable representation in JVM Heap. 
 Tables with large data models increase pressure on memory. 
 Each keyspace also causes additional overhead in JVM memory; 
 therefore having lots of keyspaces may also reduce the table threshold.

DataStax recommends not to have more than 500, although I have seen more, 
but it required an additional tuning of table parameters



Understanding is  grouping  is a static map.
hierarchy in the UI (4th).  
  Some agg. might need to adjust slightly

Virtual hiearchy.
  level1, level2, level3,..
  level1 : "zone_id"
  level2 :

data independant part.






#####################################################################################
######### Docker #####################################################################
scylladb101.analysis-shared.jpe2b.dcnw.zzz:8888

ins-101.nnn.hnd2..local:8888


docker run -v "$(pwd)":/workdir -p 8888:8888 casewareint/jupyterlab-docker  --no-browser 

docker exec -it cranky_morse /bin/bash 

docker pull casewareint/jupyterlab-docker

 

#### Scyllab server
docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks   -e PASSWORD="elise237" amalic/jupyterlab


    def pd_read_filter(dirin, filter_col:str, filter_vals:list) :   


CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
4c83ece718df        amalic/jupyterlab   "entrypoint.sh"     2 weeks ago         Up 2 weeks         




### Analysis server
docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks -v /data_hdd/popo01/:/notebooks/share  -e PASSWORD="elise237" amalic/jupyterlab



docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks -v /data_hdd/popo01/:/notebooks/share  -v /a/:/notebooks/a    -e PASSWORD="elise237" amalic/jupyterlab 



#####  
docker stop pykev  && docker run --rm  -d -it  --name pykev --network host    -p 8888:8888   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/notebooks   -v /a/:/notebooks/a   -v /data_hdd/popo01/:/notebooks/share  -e PASSWORD="elise237" amalic/jupyterlab 



### Enter manually the Docker
docker run --rm -it --network host    -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    -p 8888:8888 -v /home/popo01/:/notebooks   -v /a/:/notebooks/a   -v /data_hdd/popo01/:/notebooks/share  -e PASSWORD="elise237"   --entrypoint /bin/bash  amalic/jupyterlab  



 

 http://docker101.analysis-shared.jpe2b.dcnw.zzz:8888/lab/workspaces/off7




  PASSWORD=$(python -c "import IPython; print(IPython.lib.security.passwd('$PASSWORD'))")
  CMD="$CMD --NotebookApp.token='' --NotebookApp.password='${PASSWORD}'"


python -m ipykernel install --user

jupyter lab --port=8888 --no-browser --ip=0.0.0.0 --debug  --no-browser --allow-root



CMD="jupyter lab --allow-root --ip=0.0.0.0 --no-browser"


$ screen -X -S [session # you want to kill] quit



##### Run details  #####################################
docker run --rm -d -it --name py3jax_fraud --net=host -v /tmp:/tmp -v tttcb301/sssvols05/ks8tmp/:tttcb301/sssvols05/ks8tmp/  --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2 bash

docker exec -it  py3jax_fraud /bin/bash 





docker commit   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2.fraud



ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2         "bash"                   10 months ago       Up 10 months                                                                                                                                 py3jax_fraud


docker commit  ba3293028c09  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud 





docker run --rm -d -it --name py3jax_fraud --net=host -v /tmp:/tmp -v tttcb301/sssvols05/ks8tmp/:tttcb301/sssvols05/ks8tmp/  --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2 bash


#### Good docker 
docker push  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud  &


####
docker run --rm -d -it --name py3jax_fraud2  -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a     -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud  

docker exec -it  py3jax_fraud2 /bin/bash



docker run --rm -d -it --name py3jax_fraud2  -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a     -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud  






docker exec -it  14d195d57238 /bin/bash 



##### Access qdrant from inside
docker exec -it  generall/qdrant   /bin/bash 




#### Docker for C6000 and C4000
screen -R m1
sudo su ppp
docker run --rm -d -it --name py3_c6000 --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.5


docker exec -it  py3_c6000  /bin/bash 



Sorry for being late.
I used www1-c6000-pro hadoop client when I checked the access to ultra_cv on c6000.

https://git.zzz-it.com/projects//repos/sc-dockers/browse/hadoop-client/Makefile#53-59



#######################################################################################################
#### Accordint to the .bashrc file in the docker image, you can find keytab in the following path.

$ cat /usr/local/hdp314/.bashrc
export KEYTAB_FILE=/usr/local/hdp314/keytabs/ppp.p6000jp.keytab
export PRINCIPAL=ppp@JP.HADOOP.zzz.COM

- details

https://confluence.zzz-it.com/confluence/display/~meng.a.zhao/4-2.+Confirmation+of+access+to+ad_mkt.ultra_cv+on+C6000



##################################################################################
#########C6000  #########################################################################
// use test image of gluster-ds to access www1
docker run --rm -d -it --name py3_c6000ok --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-ds:py3-www1-c6000-pro-1.0.0 bash

docker exec -it  py3_c6000ok /bin/bash 


source /usr/local/hdp314/.bashrc
/usr/local/hdp314/bin/init_hdp.sh
/usr/local/hdp314/bin/kinit.sh
## kinit confirmation
klist
Ticket cache: FILE:/tmp/krb5cc_20640
Default principal: ppp@JP.HADOOP.zzz.COM
 
Valid starting       Expires              Service principal
04/21/2021 02:54:20  04/22/2021 02:54:20  krbtgt/JP.HADOOP.zzz.COM@JP.HADOOP.zzz.COM
    renew until 04/28/2021 02:54:20
 
// check databases on c6000
hive -e 'show databases;'



/user/piop/gsp/prod/itemdata_delta 




http://dev-proxy.db.zzz.co.jp:9501







#!/bin/bash
find $1 -type f -exec stat --format '%Y :%y %n' "{}" \; | sort -nr | cut -d: -f2- | head

find /data/ -type f -mtime 1

pkill firefox

cache.db-wal  117gb 





docker run --rm -d -it --name py3_c4 --net=host   -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd    -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"      --privileged    bash    




###  Docker  Launch  ################################
docker run --rm -d -it --name py3jax_3 --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"    --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2  bash


initially you will need to :     sh mount_gluster.sh
/a/acb401/sssvols06/pydata/item_quant



### Enter bash  ######################################
docker exec -it  py3jax /bin/bash 

docker exec -it  py3jax_3 /bin/bash   ## Batch system

#### Add those proxy in the docker
export HTTP_PROXY="http://dev-proxy.db.zzz.co.jp:9501/"  && export HTTPS_PROXY="http://dev-proxy.db.zzz.co.jp:9501"




########### CRON JOB :  ################################################
pip install pandas==1.1.0  holidays==0.10.3 

pip  gluonts==0.5.0  optuna==2.0.0

conda install -c conda-forge fbprophet==0.6.0


######################################################################
###  Docker : Setup for Jupyter ##################################
screen -R da7

sudo su ppp

source /home/ppp/work/ttrrrc01/hdp26_c4000/.bashrc.Spark2.3    ### Spark



docker run --rm -d -it --name py3jax_jup --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2  bash

docker exec -it  py3jax_jup /bin/bash 
export HTTP_PROXY="http://dev-proxy.db.zzz.co.jp:9501/"  && export HTTPS_PROXY="http://dev-proxy.db.zzz.co.jp:9501"


####
docker run --rm -d -it --name py3jax_fraud --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v  tttcb301/sssvols05/ks8tmp/:tttcb301/sssvols05/ks8tmp/   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2  bash




#### This one has secure certificates for Gluster
docker run --rm -d -it --name py3_c5 --net=host -v /tmp:/tmp  -v /home:/home  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/   -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4   bash 


#### this one has certificates + C6000
docker run --rm -d -it --name py3_c5 --net=host -v /tmp:/tmp  -v /home:/home  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/   -v /data_hdd:/data_hdd  --privileged  docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:offline_v3   bash 










CONTAINER ID   IMAGE                                                                            COMMAND                  CREATED        STATUS                 PORTS                                                                              NAMES
23a1fb4d1be9   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   9 hours ago    Up 9 hours                                                                                                quirky_swanson
5e670f73185f   jo-jupyterhub_ppp-sparklab-c6000-www1                                        "/bin/sh -c 'source …"   10 hours ago   Up 10 hours            8888/tcp, 0.0.0.0:9000-9014->9000-9014/tcp                                         jupyter-sodkomkhamda01
c5dfe29d06fe   jo-jupyterhub_hub                                                                "/bin/sh -c 'jupyter…"   10 hours ago   Up 10 hours            0.0.0.0:443->443/tcp, :::443->443/tcp, 0.0.0.0:8000->8000/tcp, :::8000->8000/tcp   jupyterhub
dd12c17ec1fb   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2      "bash"                   4 days ago     Up 4 days                                                                                                 romantic_williams
aad7a252900a   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   5 days ago     Up 5 days                                                                                                 adoring_haslett
5b0a30661d99   registry-jpe2.r-local.net/aog-docker-regi-public/json_exporter:v0.4.0            "/bin/json_exporter …"   2 weeks ago    Up 2 weeks             0.0.0.0:7979->7979/tcp, :::7979->7979/tcp                                          busy_bartik
f7f8cb46aeab   8d57dcb95c89                                                                     "bash"                   3 weeks ago    Up 3 weeks                                                                                                py3fraud_mig2
4b53d10e127e   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   3 weeks ago    Up 3 weeks                                                                                                reverent_lalande
6fea95382f59   docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v05       "bash"                   4 weeks ago    Up 4 weeks                                                                                                py3fraud_mig1
b10ad7e49d8d   docker-regi.intra.zzz-it.com/ppp/sc_clk_summary:13.0                     "bash"                   4 weeks ago    Up 4 weeks                                                                                                quizzical_wu
1fc70fd4f695   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4_c4new2   "bash"                   4 weeks ago    Up 4 weeks                                                                                                py3jax_fraud2
73f759ea13ed   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   4 weeks ago    Up 4 weeks                                                                                                exciting_hawking
64c66c6b811e   docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v03       "bash"                   4 weeks ago    Up 4 weeks                                                                                                py3fraud_mig0
90273721903a   6df2ae4957cc                                                                     "bash"                   4 weeks ago    Up 4 weeks                                                                                                sweet_antonelli
13fcedf3a412   docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01                "/bin/bash"              4 weeks ago    Up 4 weeks                                                                                                jup37
2a9bf0d2a2ef   registry-jpe2.r-local.net/aog-docker-regi-public/vouch-proxy:0.37.0              "/vouch-proxy"           4 weeks ago    Up 4 weeks (healthy)   9090/tcp                                                                           vouch-mkdocs-platform
064fe88a516d   registry-jpe2.r-local.net/aog-docker-regi-public/vouch-proxy:0.37.0              "/vouch-proxy"           4 weeks ago    Up 4 weeks (healthy)   9090/tcp                                                                           vouch-k8s200-dashboard-proxy
2672e0ed0bc7   docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-star-2.2.0              "/bin/bash"              6 weeks ago    Up 6 weeks                                                                                                jupyter-moiseetspave01-py37-star
4ad3887ab2ad   registry-jpe2.r-local.net/aog-docker-regi-public/nginx:1.21.6-alpine             "/docker-entrypoint.…"   2 months ago   Up 2 months            0.0.0.0:8081->80/tcp                                                               vouch-nginx-mkdocs-platform
90f3b222add4   registry-jpe2.r-local.net/aog-docker-regi-public/nginx:1.21.6-alpine             "/docker-entrypoint.…"   2 months ago   Up 2 months            0.0.0.0:8080->80/tcp                                                               vouch-nginx-k8s200-dashboard-proxy
45ce7c763ba0   registry-jpe2.r-local.net/aog-docker-regi-public/nginx:1.21.6-alpine             "/docker-entrypoint.…"   3 months ago   Up 3 months            80/tcp                                                                             mkdocs-platform
19eb7fb932ee   docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-star-2.2.0              "/bin/bash"              3 months ago   Up 3 months                                                                                               jupyter-chenjiahong01-py37-star













/usr/local/bin/mount_gluster.sh 




### Check HDFS
kdestroy 
kinit -kt  /usr/local/hdp26/keytabs/ppp.nnn.keytab ppp
klist
hadoop fs  -ls  /user/ppp/nono/quantity_extract

hive -e 'describe database nono2 ; '
which hadoop && which hive


docker exec -it  py3_c4  /bin/bash 




while true ; do ./cpu.sh ; sleep 60 ; done &


top -b -n 1 s




-c sudo /usr/local/bin/mount   && ./init_hdp.sh && while true ; do /kniit.sh ; sleep 3600 ; done


  test_code/acass_user_histo


import os



https://stackoverflow.com/questions/64786/error-handling-in-bash



Epoch timestamp: 1622505600
Timestamp in milliseconds: 1622505600000
Date and time (GMT): Tuesday, June 1, 2021 0:00:00
Date and time (your time zone): Tuesday, June 1, 2021 9:00:00 GMT+09:00


6 months --> 425 Gb  --> 200 Gb 3 month click



1592038825




cat *.txt >> all.txt

cat file1 file2 > file3


cd tttcb201/sssvols03/ndata/cpa/emb/seq/z_clk_202006_202012d_itemtagb_202009_12/


cat seq_1000000000.txt    ../z_clk_202102_202108_itemtagb2_202106_08/aseq_1000000000.txt     >     seq_2020_2021_merge.txt  &


f = open('test.txt','r')
g = open('test1.txt','w') 
while True:
    x = f.readline()
    x = x.rstrip()
    if not x: break
    print >> g, int(x, 16)




#########################################################
#########################################################
fallocate -l 4970M  /home/dump.tmp


fallocate -l 140100M  /home/dump.tmp



base64 /dev/urandom/ | head -c 30000000 > /home/fdump2.tmp 


rm -f /home/dump2.tmp

rm -f /home/dump.tmp


/home/popo01/test_code/sparkc/new_mona


du -Sh  /data/ | sort -rh | head -20


du -Sh  /home/popo01/ | sort -rh | head -20



du -Sh  /home/popo01/ | sort -rh | head -20





cp -R  /home/popo01/.keras/  /data/workspaces/popo01/









du -Sh  /sys/fs/cgroup/cpa/db  | sort -rh | head -20


print(get_size(), 'bytes')




find -maxdepth 1 -type d   -exec du -sh {} /data/ 


du -Sh  /data/workspaces/takos01/ | sort -rh | head -20


du -Sh  /data/workspaces/ | sort -rh | head -20



du -Sh  tttcb201/sssvolh03/ndata/ | sort -rh | head -100  > zbigfile.txt




du -Sh  /data/ | sort -rh | head -20





378435387



/a/acb401/sssvols06/pydata/brw_ran_v15//17/***




###############################################################
###############################################################
$ find . -printf '%s %p\n'|sort -nr|head

du -Sh  /data_hdd/popo01/ | sort -rh | head -20

rm -rf /data_hdd/popo01/code15/zdata/optimization



du -Sh  /home/ | sort -rh | head -20



du -Sh  /data_hdd/popo01/ | sort -rh | head -20



du -Sh  /home/popo01/ | sort -rh | head -20

50GB logs in /var/log/glusterfs
100GB in /var/lib/docker
58GB in /home
   24.2 GiB [##########] /ppp
   21.9 GiB [######### ] /chenjiahong01
    5.7 GiB [##        ] /ttrrrc01
    3.3 GiB [#         ] /ishimnikovle01
    1.6 GiB [          ] /popo01
    1.5 GiB [          ] /campsjames01
600GB in /data_hdd
--- /data_hdd ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  205.5 GiB [######### ] /ishimnikovle01
  156.5 GiB [#######   ] /kubotamaki01
   88.4 GiB [####      ] /ttrrrc01
   64.4 GiB [###       ] /popo01
   47.9 GiB [##        ] /ppp
   47.6 GiB [##        ] /mona_test
   44.0 GiB [##        ] /zhaomeng02
   40.8 GiB [#         ] /chenjiahong01
  310.8 MiB [          ] /chizhovaleks01

  

export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;


/opt/anaconda3/bin/jupyter lab --notebook-dir  /   --allow-root --ip=0.0.0.0 --no-browser --port 1904

##### Find Docker 
docker ps --filter name=py3
a7bcd8bfb527        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"          py3jax_jup
d5ba7c687016        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"          py3jax_3
69d0695f0854        amalic/jupyterlab                                                             "/bin/bash"     pykev
e4881654b87d        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"          py3jax


docker exec -it  py3jax /bin/bash 

docker exec -it  py3jax_jup /bin/bash 

ssh ins-101.nnn.hnd2..local



docker exec -it  py3jax_4 /bin/bash 


docker exec -it  py3jax_fraud  /bin/bash 



docker exec -it pykev  /bin/bash





/dd/101/sssvols07/offline//backend_data/kchi/data/model//error_modelitem_optimization_20220325.parquet
      agg_id  item_id                                          modelitem
0         11  1296014  {'base': -3.224547615922365, 'elasticity': -3....
1         13  1296014  {'base': -4.049982016855569, 'elasticity': -3....
2         14  1296014  {'base': -3.271179998893387, 'elasticity': -3....
3         16  1296014  {'base': -3.324842975858724, 'elasticity': -3....
4         17  1296014  {'base': -4.249226686613811, 'elasticity': -3....
...      ...      ...                                                ...
3658      16  2359017  {'base': -6.608906015461773, 'elasticity': -6....
3659      17  2359017  {'base': -6.482890183639738, 'elasticity': -6....
3660      18  2359017  {'base': -6.594497162414932, 'elasticity': -6....
3661      21  2359017  {'base': -6.850701738881379, 'elasticity': -6....
3662      22  2359017  {'base': -6.809341203779371, 'elasticity': -6....

[3663 rows x 3 columns]





ONTAINER ID        IMAGE                                                                               COMMAND                  CREATED             STATUS              PORTS               NAMES
a2fce4d968f5        docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2                     "bash"                 py3_batch


7cc318034a97        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4         "bash"                 py3_c5bis
9a2916729ae2        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:offline_v3       "bash"                 py3_c5
143c0437d0cb        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.6            "bash"                 py3jax_4
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2         "bash"                 py3jax_fraud




#### py3jax_fraud offline
docker commit -p    ba3293028c09     docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_v01  &&
docker push  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_v01







#### prom/alertmanager:v0.20.0  
c5ea15ec0ae5        prom/alertmanager:v0.20.0           "/bin/alertmanager -…"   20 months ago       Up 20 months              0.0.0.0:9093->9093/tcp  

docker pull docker-regi.intra.zzz-it.com/ppp/mona:prom_alertmanager_v0_20_0



####  py3jax_fraud2
9724f8bc7502        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud   "bash"                  py3jax_fraud2

docker commit -p    9724f8bc7502    docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4_1_2_fraud   &&
docker push  docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4_1_2_fraud 

docker pull   docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4_1_2_fraud 


docker run --rm -d -it --net host --name py3jax_fraud2  -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a     -v /home/popo01/:/home/popo01/   --privileged   docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4_1_2_fraud 

docker exec -it  py3jax_fraud2 /bin/bash

screen b2 



b7 : build docker
b8 : api luanched
docker run --net=host --privileged --rm -it --name 'off_stg3'  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02    /bin/bash 




####   py3_c5
9a2916729ae2        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:offline_v3       "bash"                 py3_c5

docker commit -p    9a2916729ae2    docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdpstar-anaconda3_offline_v3     &&
docker push  docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdpstar-anaconda3_offline_v3 



#### Prometheus 
docker exec -it    promcheck  /bin/bash




#### on docker101




docker images  | tac

docker push docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4.1.2

docker push docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_py3_c4new





    def daily_eod_topk_check(df, finame):
        ### Check output
        ## #'easy_id', 'siid', 'siids', 'top_genre', 'topk', 'topk_emb', 'topk_emb_n', 'topk_genre', 'topk_genre_n', 'topk_n'],
        dd= {} ; err = False
        for ci in [ 'topk_n',  'topk_emb_n', 'topk_genre_n' ] :
            if ci not in df.columns : continue
            dd[ci] = df[ci].mean()
            if dd[ci]  < 10.0 :
                err = True 

        if err :
            msg = f"{finame} ,   {dd}"
            to_file( dir_cpa3 +'/ topk_error.py', msg)






docker ps --filter name=pykev

○ → which entrypoint.sh
/usr/local/bin/entrypoint.sh






CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
14d195d57238        amalic/jupyterlab   "entrypoint.sh"     8 months ago        Up 8 months                             pykev






###############################################################################
Fraud Detection project :
    ADPDE : RPP Black List , Extension .
            Phrae : C6000, MysQL C60000,

    Ricky : Consuming data some batches,  White listing, Ba
    Fraud Detection part :
       Black List tables :  Rickey Riki, Prae :  consuming data.
                
    Confluence page :
        
        Nice to meet you.





CONTAINER ID        IMAGE                                                                               COMMAND             CREATED             STATUS              PORTS               NAMES
9724f8bc7502        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud   "bash"              6 weeks ago         Up 6 weeks                              py3jax_fraud2
143c0437d0cb        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.6            "bash"              8 months ago        Up 8 months                             py3jax_4
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2         "bash"              11 months ago       Up 11 months                            py3jax_fraud






###### Find docker ######################################
CONTAINER ID        IMAGE                                                                         COMMAND                  CREATED             STATUS              PORTS        NAMES
a7bcd8bfb527        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"                   2 months ago        Up 2 months                    py3jax_jup

69d0695f0854        amalic/jupyterlab                                                             "/bin/bash"              4 months ago        Up 4 months                    pykev
987167260b8c        prom/prometheus                                                               "/bin/prometheus --c"   2 months ago        Up 2 months         

 docker ps --filter name="jax"

CONTAINER ID        IMAGE                                                                         COMMAND             CREATED              STATUS              PORTS               NAMES
51911111cb06        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"              About a minute ago   Up About a minute                       py3jax_fraud
d5ba7c687016        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"              3 months ago         Up 3 months                             py3jax_3
e4881654b87d        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2   "bash"              6 months ago         Up 6 months                             py3jax




###############
(py36) [popo01@ins-101 ~]$ docker ps --filter name=py3
CONTAINER ID        IMAGE                                                                           COMMAND                  CREATED             STATUS              PORTS               NAMES
8230fd723c8e        docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-www1-c6000-pro-1.0.0   "/bin/sh -c 'sudo /u…"   2 weeks ago         Up 2 weeks                              jupyter-zhaomeng02-py37-www1-c6000-pro
6533e344875b        docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-star-1.0.0             "/bin/bash"              3 weeks ago         Up 3 weeks                              jupyter-chenjiahong01-py37-star

143c0437d0cb        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.6        "bash"                   2 months ago        Up 2 months                             py3jax_4
2fc48bb290e9        docker-regi.intra.zzz-it.com/ppp/gluster-ds:py3-www1-c6000-pro-1.0.0    "bash"                   3 months ago        Up 3 months                             py3_c6000ok
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2     "bash"                   5 months ago        Up 5 months                             py3jax_fraud
d5ba7c687016        d919cebdc3b1                                                                    "bash"                   11 months ago       Up 11 months                            py3jax_3
e4881654b87d        d919cebdc3b1                                                                    "bash"                   14 months ago       Up 14 months                            py3jax

 





cut -c9- < /proc/1/cpuset


CONTAINER ID   IMAGE                                                                            COMMAND                  CREATED        STATUS                 PORTS                                                                              NAMES
23a1fb4d1be9   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   9 hours ago    Up 9 hours                                                                                                quirky_swanson
5e670f73185f   jo-jupyterhub_ppp-sparklab-c6000-www1                                        "/bin/sh -c 'source …"   10 hours ago   Up 10 hours            8888/tcp, 0.0.0.0:9000-9014->9000-9014/tcp                                         jupyter-sodkomkhamda01
c5dfe29d06fe   jo-jupyterhub_hub                                                                "/bin/sh -c 'jupyter…"   10 hours ago   Up 10 hours            0.0.0.0:443->443/tcp, :::443->443/tcp, 0.0.0.0:8000->8000/tcp, :::8000->8000/tcp   jupyterhub


dd12c17ec1fb   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2      "bash"                   4 days ago     Up 4 days                                                                                                 romantic_williams
aad7a252900a   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   5 days ago     Up 5 days                                                                                                 adoring_haslett
                          
f7f8cb46aeab   8d57dcb95c89                                                                     "bash"                   3 weeks ago    Up 3 weeks                                                                                                py3fraud_mig2
4b53d10e127e   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   3 weeks ago    Up 3 weeks                                                                                                reverent_lalande
6fea95382f59   docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v05       "bash"                   4 weeks ago    Up 4 weeks       
                                                                                         py3fraud_mig1
                                                                                              quizzical_wu
1fc70fd4f695   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4_c4new2   "bash"                   4 weeks ago    Up 4 weeks                                                                                                py3jax_fraud2
73f759ea13ed   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0         "bash"                   4 weeks ago    Up 4 weeks                                                                                                exciting_hawking


64c66c6b811e   docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v03       "bash"                   4 weeks ago    Up 4 weeks   

                                                                                             py3fraud_mig0
90273721903a   6df2ae4957cc                                                                     "bash"                   4 weeks ago    Up 4 weeks                                                                                                sweet_antonelli
13fcedf3a412   docker-regi.intra.zzz-it.com/ppp/mona:jupyterlab_huss_v01                "/bin/bash"              4 weeks ago    Up 4 weeks                                                                                                jup37
                                                                         vouch-k8s200-dashboard-proxy


C6000 Docker ready

fraud docker for c6000
(base) [root@docker101 cprod]# basename "$(cat /proc/1/cpuset)"
f7f8cb46aeabc2db38252bedb0d62c081e3db82c87d39836de82a75e52381e11


docker commit  -p   f7f8cb46aeabc2db38252bedb0d62c081e3db82c87d39836de82a75e52381e11      docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v09
docker push    docker-regi.intra.zzz-it.com/ppp/mona:fraud_c4k_c6k_conda_py37_v09  




docker commit  -p   f7f8cb46aeabc2db38252bedb0d62c081e3db82c87d39836de82a75e52381e11      docker-regi.intra.zzz-it.com/ppp/mona:hdp_c4k_c6k_conda_py37_v10
docker push    docker-regi.intra.zzz-it.com/ppp/mona:hdp_c4k_c6k_conda_py37_v10  





sha256:38cb3331ee59d601705c18ed42e859f49fd1de8f29812cdb199c472793abb582



utilmy dockerid





basename "$(cat /proc/1/cpuset)"

py3jax_jup
py3jax_3
py3jax

a1       py3jax_3   ( cass setup, py2, ), Cass running update 
a2 :  SQL   py3jax_3  
a3 :  d5ba7c687016,  py3jax_3    docker exec -it  py3jax_3 /bin/bash 

a4 :  Nothing

a5 :  e4881654b87d  py3jax  ( feat-env, fraud, ....)    docker exec -it  py3jax /bin/bash 
a6 :  e4881654b87   py3jax   docker                     docker exec -it  py3jax /bin/bash 

a7 : Spark
a8 : Spark in 101
a9 : Spark in 101


b2 : Fraud Docker


docker exec -it  py3jax_3 /bin/bash 

docker exec -it  py3jax /bin/bash 



 docker exec -it  py3jax /bin/bash 


pip --user install here
ls ~/.local/lib/python3.7/site-packages



[ppp@ins-101 cprod]$ ls ~/.local/lib/python3.7/site-packages
cramjam                    fire                    k8s_remote-0.0.1.dist-info  pyinstrument-3.4.1.dist-info                       test
cramjam-2.4.0.dist-info    fire-0.3.1.dist-info    k8s-remote.egg-link         pyinstrument_cext-0.2.4.dist-info
diskcache                  gensim                  pandas                      pyinstrument_cext.cpython-37m-x86_64-linux-gnu.so
diskcache-5.2.1.dist-info  gensim-3.8.3.dist-info  pandas-1.2.1.dist-info      smart_open
easy-install.pth           k8s_remote              pyinstrument                smart_open-3.0.0.dist-info



pip install tensorflow-cpu==2.6.0  tensorflow_text tensorflow_hub


docker exec -it  py3_batch  /bin/bash 



CONTAINER ID        IMAGE                                                                           COMMAND             CREATED             STATUS              PORTS               NAMES
7cc318034a97        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4     "bash"               Up 4 weeks            py3_c5bis
9a2916729ae2        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:offline_v3   "bash"                    Up 4 weeks         py3_c5
6533e344875b        docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-star-1.0.0             "/bin/bash"         Up 3 months           jupyter-chenjiahong01-py37-star
143c0437d0cb        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.6        "bash"                  Up 4 months        py3jax_4
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2     "bash"               Up 8 months           py3jax_fraud


docker exec -it  py3_c5bis  /bin/bash   #only ppp user.

docker exec -it   py3jax_fraud  /bin/bash





In [5]: list(set(temp1) - set(temp2))
Out[5]: ['Four', 'Three']





py3jax_fraud



########## Commit   ##############################
 docker ps --filter name="py3_c4new"

190c6089bdb3   py3_c4new


docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.0.2    


#### Need to check pip folders


docker commit -p  --message 'py_c4new'  190c6089bdb3  docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_py3_c4new2



docker images  | tac

docker push docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4.1.2

docker push docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_py3_c4new



docker-regi.intra.zzz-it.com/ppp/mona                    gluster-hdp4000pro-anaconda3_py3_c4new   b444efd1c7fd   8 seconds ago   10.2GB



docker push docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_py3_c4new




#### most recent modified files
find CodeV16/ -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" "





def file_recent(dir0, pattern=*.*, n=20):
   cmd = f"find CodeV16/ -name "*.py" -print0 | xargs -r -0 ls -1 -t |  head -20"
   print( os.system(cmd) )

def folder_size






docker101





[sudo] password for popo01:
[ppp@docker101 popo01]$ docker ps
CONTAINER ID   IMAGE                                                                                    COMMAND                  CREATED        STATUS                 PORTS                                                                                                                   NAMES
79305f1d6249   amalic/jupyterlab                                                                        "entrypoint.sh"          4 hours ago    Up 4 hours                                                                                                                                     pykev

d0c964673e68   jo-jupyterhub_ppp-sparklab-c6000-www1                                                "/bin/sh -c 'source …"   26 hours ago   Up 26 hours            8888/tcp, 0.0.0.0:9000-9014->9000-9014/tcp                                                                              jupyter-sodkomkhamda01
94f60d4af1f3   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0                 "bash"                   7 days ago     Up 7 days                                                                                                                                      optimistic_zhukovsky
7a7497d5a927   docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4_1_2_fraud   "bash"                   2 weeks ago    Up 2 weeks                                                                                                                                     py3jax_fraud2
d9d4af56c0d0   577b3f2dce2b                                                                             "bash"                   2 weeks ago    Up 2 weeks                                                                                                                                     flamboyant_tharp
d76b54a03861   577b3f2dce2b                                                                             "bash"                   2 weeks ago    Up 2 weeks                                                                                                                                     elated_moore
b20d854fa42f   jo-jupyterhub_hub                                                                        "/bin/sh -c 'jupyter…"   3 weeks ago    Up 3 weeks             0.0.0.0:443->443/tcp, :::443->443/tcp, 0.0.0.0:8000->8000/tcp, :::8000->8000/tcp                                        jupyterhub
1c56da7dbf56   docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.3.0                 "bash"                   3 weeks ago    Up 3 weeks                                                                                                                                     zen_diffie
45ce7c763ba0   registry-jpe2.r-local.net/aog-docker-regi-public/nginx:1.21.6-alpine                     "/docker-entrypoint.…"   5 weeks ago    Up 5 weeks             80/tcp                                                                                                                  mkdocs-platform
97acd367706c   registry-jpe2.r-local.net/aog-docker-regi-public/nginx:1.21.6-alpine                     "/docker-entrypoint.…"   5 weeks ago    Up 5 weeks             0.0.0.0:8081->80/tcp                                                                                                    vouch-nginx-mkdocs-platform
5d83e5b41605   registry-jpe2.r-local.net/aog-docker-regi-public/vouch-proxy:0.36.0                      "/vouch-proxy"           5 weeks ago    Up 5 weeks (healthy)   9090/tcp                                                                                                                vouch-mkdocs-platform
bf8ddd436771   registry-jpe2.r-local.net/aog-docker-regi-public/nginx-proxy-manager:2.9.15              "/init"                  5 weeks ago    Up 5 weeks             0.0.0.0:8008->80/tcp, :::8008->80/tcp, 0.0.0.0:8009->81/tcp, :::8009->81/tcp, 0.0.0.0:8443->443/tcp, :::8443->443/tcp   nginx-proxy-manager_app_1
48e6614f38ba   registry-jpe2.r-local.net/aog-docker-regi-public/nginx:1.21.6-alpine                     "/docker-entrypoint.…"   6 weeks ago    Up 6 weeks             0.0.0.0:8080->80/tcp                                                                                                    vouch-nginx-k8s200-dashboard-proxy
19eb7fb932ee   docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-star-2.2.0                      "/bin/bash"              7 weeks ago    Up 6 weeks                                                                                                                                     jupyter-chenjiahong01-py37-star
f85e10c19561   registry-jpe2.r-local.net/aog-docker-regi-public/vouch-proxy:0.36.0                      "/vouch-proxy"           2 months ago   Up 6 weeks (healthy)   9090/tcp                                                                                                                vouch-k8s200-dashboard-proxy
[ppp@docker101 popo01]$



79305f1d6249   amalic/jupyterlab                                                                        "entrypoint.sh"          pykev
7a7497d5a927   docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4_1_2_fraud   "bash"                   py3jax_fraud2
929d90d16aeb   c0f94c1b9b13                                                                             "bash"                   off_stg


#### Offline docker
929d90d16aeb   c0f94c1b9b13                                                                             "bash"                   off_stg

docker pull  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02  
docker run --net=host --privileged --rm -d -it --name 'off_stg2'  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02    /bin/bash 


docker exec -it  off_stg  /bin/bash
cd /opt/rrma/rrma-backend-api/ && scripts/start_stg.sh


b1,b2,b3 :   py3jax_fraud2

b3,b4 :  docker exec -it  off_stg  /bin/bash






docker exec -it   py3jax_fraud2  /bin/bash









### get docker is from insider
cat /proc/self/cgroup | head -1 | tr --delete ‘10:memory:/docker/’


292996ab244824fb2a98682f8269275338795284249



docker ps --filter "id=292996ab244"


#### Build offline ###########################################################################
b7 in docker101  : build docker
b8 : Launch docker
  

### Actual Build
docker build -f dockers/stg/Dockerfile  -t docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02         --build-arg http_proxy='dev-proxy.db.zzz.co.jp:9502'     --build-arg https_proxy='dev-proxy.db.zzz.co.jp:9502' .


### push to docker   ####################################################################
docker push docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02

docker tag docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02 registry-jpe2.r-local.net/offline-ai-staging/rrma-simulation-api:1.0.0.dev



### Check Launch
docker run --net=host --privileged --rm -it --name 'off_stg3'  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02    /bin/bash 






```




###  Usage offline   #######################################################################
### Manual custom code on  Docker101   #####################################################
cd tttcb301/sssvols05/ppp/test_code/offsim/simul_api


#### Logging
export verbose=20
export logdir='tttcb301/sssvols05/ppp/test_code/offsim/simul_api/zlog/'
mkdir -p $logdir

python service.py main --mode stg,test  --host 0.0.0.0   --port 6777   2>&1 | tee -a "${logdir}log.log"


#### In Firefox:
http://docker101.analysis-shared.jpe2b.dcnw.zzz:6777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=2520215&start_date=1645974000000&end_date=1646697599999&cost=284.0&price=328&price_current=345



###########################################################################################
### Check the docker Launch  ##########################
docker run --net=host --privileged --rm -it --name 'off_stg3'  docker-regi.intra.zzz-it.com/ppp/offline-backend:py36_backend_api_v02    /bin/bash 

##### In Docker101  port 6777
cd /opt/rrma/rrma-backend-api/ && export verbose=20 && scripts/start_feat_local.sh
tail -n 2 /opt/rrma/zlog_feat/log.log



############################################################################################
#######
Once you have downloaded roc 
https://onecloud.zzz-it.com/one-docs/docs/Compute/CaaS/caas-technical-guide-cli#overview
and run 
roc install to get kubectl
Login to the cluster with 



Prod UI:
https://revenue-management.biz.zzz.co.jp/report/item#
kevin.noel@zzz.com
Josephkubo237.  intra Account




###########################################################################################
### Offline Staging Logs In local PC

   roc login -c jpe2-caas1-dev1 -n offline-ai-staging


   kubectl get pods   #### Track the logs in realtime  for offline


   kubectl logs --follow  rrma-simulation-api-c47c468f9-5sh49     rrma-simulation-api   >> log_stg_offline.py 2>&1   ### Add the pod 


   http://rrma-simulation-api-8080-offline-ai-staging.jpe2-caas1-dev1.caas.jpe2b.r-local.net/simulation/v1/item?access_key=simulationapi1&user_id=1&merchant_id=1&aggregation_id=16&item_id=3096019&start_date=1642550400000&end_date=1674192000000&cost=100&price=248&event_type=0&price_current=248
  



### Offline Prod Logs In local PC
   roc login -c jpe2-caas1-prod1 -n offline-ai-production


   kubectl get pods   #### Track the logs in realtime  for offline


   kubectl logs --follow  rrma-simulation-api-857fbfb9d4-9pgdd     rrma-simulation-api      ### Add the pod 



   kubectl logs --follow  rrma-simulation-api-857fbfb9d4-9pgdd     rrma-simulation-api   >> log_prod_offline.py 2>&1


   ### firefox 
   https://rrma-simulation-api-8080-offline-ai-production.jpe2-caas1-prod1.caas.jpe2b.r-local.net/simulation/v1/item?access_key=eLNAiRtt6NkWh&user_id=1&merchant_id=1&aggregation_id=16&item_id=2076004&cost=17&price_current=25&price=30&start_date=1648425600000&end_date=1653523200000 



rrma-simulation-api-58584c798-zvr45 



http://docker101.analysis-shared.jpe2b.dcnw.zzz:6777/simulation/v1/item?access_key=simulationapi1&user_id=2&merchant_id=1&aggregation_id=16&item_id=2320033&start_date=1645974000000&end_date=1646697599999&cost=145.0&price=168&price_current=168



debug: Future                 ts  model_sales      date                                                                   
235  1648684800000      4877500  20220331                                                                                 
236  1648771200000      3937398  20220401                                                                                 
237  1648857600000      3976653  20220402                                                                                 
238  1648944000000      6330267  20220403                                                                                 
239  1649030400000      4006822  20220404                                                                                 
240  1649116800000      5045736  20220405                                                                                 
241  1649203200000      3748012  20220406 


'genre_sales': 31943878,




#### Genre model params  #####################################                                                            
#### Genre KPI Calc   ########################################                                                            
debug:                 ts  model_sales      date                                                                          
237  1648857600000      3976653  20220402                                                                                 
238  1648944000000      6330267  20220403                                                                                 
239  1649030400000      4006822  20220404                                                                                 
240  1649116800000      5045736  20220405                                                                                 
241  1649203200000      3748012  20220406 


(py36) C:\D\gitdev\zshortcut>kubectl get pods                                                                                                                    
NAME                                                         READY   STATUS      RESTARTS   AGE                                                                  
daily-active-item-update-kchi-1644177600-6z4sj           0/1     Error       0          45d                                                                  
daily-active-item-update-kchi-1647979200-fgwmg           0/1     Completed   0          31h                                                                  
daily-active-item-update-kchi-1648065600-7vbl6           0/1     Completed   0          7h45m                                                                
daily-item-exclusion-kchi-1644177600-smkgz               0/1     Error       0          45d                                                                  
daily-item-exclusion-kchi-1647979200-5wldf               0/1     Completed   0          31h                                                                  
daily-item-exclusion-kchi-1648065600-tnj4d               0/1     Completed   0          7h45m                                                                
daily-item-name-sync-kchi-1644177600-p5tkh               0/1     Error       0          45d                                                                  
daily-item-name-sync-kchi-1647979200-xcgwk               0/1     Completed   0          31h                                                                  
daily-item-name-sync-kchi-1648065600-hpcg7               0/1     Completed   0          7h45m                                                                
daily-kchi-price-recommendation-check-1644181200-m6v98   0/1     Error       0          45d                                                                  
daily-kchi-price-recommendation-check-1647982800-t6lcl   0/1     Completed   0          30h                                                                  
daily-kchi-price-recommendation-check-1648069200-2p8qt   0/1     Completed   0          6h45m                                                                
daily-piop-target-item-update-kchi-1644159600-pws8w      0/1     Error       0          45d                                                                  
daily-piop-target-item-update-kchi-1647961200-2xrt7      0/1     Completed   0          36h                                                                  
daily-piop-target-item-update-kchi-1648047600-t4grw      0/1     Completed   0          12h                                                                  
daily-price-publishing-kchi-1644149100-k5f6r             0/1     Error       0          45d                                                                  
daily-price-publishing-kchi-1647950700-f9c64             0/1     Completed   0          39h                                                                  
daily-price-publishing-kchi-1648037100-xpmst             0/1     Completed   0          15h                                                                  
daily-target-items-kchi-1644177600-6zr54                 0/1     Error       0          45d                                                                  
daily-target-items-kchi-1647979200-bbpcb                 0/1     Completed   0          31h                                                                  
daily-target-items-kchi-1648065600-x8fgs                 0/1     Completed   0          7h45m                                                                
monthly-active-item-billing-kchi-1640995200-r7t52        0/1     Completed   0          82d                                                                  
monthly-active-item-billing-kchi-1646092800-vjvwx        0/1     Error       0          23d                                                                  
monthly-piop-target-item-billing-kchi-1633046400-7nw74   0/1     Error       0          173d                                                                 
monthly-piop-target-item-billing-kchi-1643673600-xvdbj   0/1     Completed   0          51d                                                                  
monthly-piop-target-item-billing-kchi-1646092800-dtn9t   0/1     Completed   0          23d                                                                  
rrma-company-api-6fd7d77465-6rqb7                            2/2     Running     2166       174d                                                                 
rrma-dev-gateway-api-6879c6575f-zcr7l                        3/3     Running     0          260d                                                                 
rrma-gateway-api-dd8f7fcd7-xs7sm                             3/3     Running     0          2d12h                                                                
rrma-item-master-api-688d4b4449-hr4s8                        2/2     Running     0          134d                                                                 
rrma-kpi-api-7bc5bf86b6-kndgt                                2/2     Running     0          16d                                                                  
rrma-price-api-64f474db84-cjxmm                              2/2     Running     1          23d                                                                  
rrma-simulation-api-5bd5bf8c68-m8czx                         2/2     Running     0          14m                                                                  
rrma-table-api-5d546c649d-vgj79                              2/2     Running     1          20h                                                                  
rrma-ui-5f5786fd99-qsv96                                     2/2     Running     0          7d2h  



And use the follow command (Replace the hash bit 858ddfdfc8-lnvwq with whatever is set)
e.g kubectl logs --follow rrma-simulation-api-858ddfdfc8-lnvwq rrma-simulation-api



#### Track the logs in relatime
 kubectl get pods

 ### Add the pod 
 kubectl logs --follow rrma-simulation-api-58584c798-74lrj     rrma-simulation-api




rrma-simulation-api-58584c798-74lrj   



[root@ins-101 ppp]# find CodeV16/ -name "*.py" -print0 | xargs -r -0 ls -1 -t |  head -20
CodeV16/rpp/rpp_core_ab.py
CodeV16/rpp/rpp_core.py
CodeV16/scripts/.ipynb_checkpoints/load_kv-checkpoint.py
CodeV16/scripts/load_kv.py
CodeV16/rpp/rpp_core_ab_20211130.py
CodeV16/pur/pur_ran_hist_new.py
CodeV16/kkkma/kkkma_index.py
CodeV16/targeting/target_cc_wrapper_test.py
CodeV16/targeting/target_cc_wrapper_ser.py
CodeV16/targeting/target_cc_wrapper.py
CodeV16/targeting/target_cc_wrapper_kao.py
CodeV16/targeting/target_cc_test.py
CodeV16/targeting/target_cc_series.py
CodeV16/targeting/.ipynb_checkpoints/target_cc_realtime-checkpoint.py
CodeV16/targeting/target_cc_realtime.py
CodeV16/targeting/.ipynb_checkpoints/target_cc-checkpoint.py
CodeV16/targeting/target_cc.py
CodeV16/targeting/target_cc_nofirst.py
CodeV16/targeting/target_cc_ngenre.py
CodeV16/targeting/target_cc_kao.py



rmv() { mv "$2/${1##*/}" "${1%/*}" ; }





[root@ins-101 ppp]# find CodeV16/ -type f -printf '%T@ %p\n' | sort -n | tail -30 | cut -f2- -d" "
CodeV16/targeting/target_cc_ngenre.py
CodeV16/targeting/target_cc_nofirst.py
CodeV16/targeting/.ipynb_checkpoints/target_cc-checkpoint.py
CodeV16/targeting/target_cc.py
CodeV16/targeting/.ipynb_checkpoints/target_cc_realtime-checkpoint.py
CodeV16/targeting/target_cc_realtime.py
CodeV16/targeting/target_cc_series.py
CodeV16/targeting/target_cc_test.py
CodeV16/targeting/target_cc_wrapper_20210618_py
CodeV16/targeting/target_cc_wrapper_kao.py
CodeV16/targeting/target_cc_wrapper.py
CodeV16/targeting/target_cc_wrapper_ser.py
CodeV16/targeting/target_cc_wrapper_test.py
CodeV16/targeting/target_items_20210323_py
CodeV16/kkkma/kkkma_index.py
CodeV16/kkkma/__pycache__/kkkma_index.cpython-38.pyc
CodeV16/pur/pur_ran_hist_20211125_py
CodeV16/config/config_v16.properties
CodeV16/pur/pur_ran_hist_new.py
CodeV16/pur/__pycache__/pur_ran_hist_new.cpython-38.pyc
CodeV16/bin/start_pur_brw_summary.sh
CodeV16/rpp/rpp_core_ab_20211130.py
CodeV16/config/config_v16_20210621_properties
CodeV16/scripts/.ipynb_checkpoints/load_kv-checkpoint.py
CodeV16/scripts/load_kv.py
CodeV16/scripts/__pycache__/load_kv.cpython-38.pyc
CodeV16/bin/start_daily_item.sh
CodeV16/rpp/rpp_core.py
CodeV16/rpp/rpp_core_ab.py
CodeV16/rpp/__pycache__/rpp_core_ab.cpython-38.pyc





[root@ins-101 ppp]# find CodeV15/ -type f -printf '%T@ %p\n' | sort -n | tail -30 | cut -f2- -d" "
CodeV15/tda/__pycache__/tda_pro.cpython-38.pyc
CodeV15/tda/__pycache__/tda_pro.cpython-37.pyc
CodeV15/kchi/agg_daily_20211102_py
CodeV15/kchi/kchi_queries.py
CodeV15/kchi/__pycache__/kchi_queries.cpython-38.pyc
CodeV15/kchi/optimize_item_20211104_py
CodeV15/kchi/optimize_item.py
CodeV15/kchi/__pycache__/optimize_item.cpython-38.pyc
CodeV15/item_1.tsv
CodeV15/item_2.tsv
CodeV15/brw/__pycache__/brw_item_hist.cpython-38.pyc
CodeV15/kchi/kchi_item.py
CodeV15/kchi/__pycache__/kchi_item.cpython-38.pyc
CodeV15/db/.ipynb_checkpoints/couch_conn-checkpoint.py
CodeV15/db/couch_conn.py
CodeV15/db/__pycache__/couch_conn.cpython-37.pyc
CodeV15/db/__pycache__/couch_conn.cpython-38.pyc
CodeV15/rpp/rpp_se_cpc_rec_20211110_py
CodeV15/rpp/__pycache__/rpp_se_cpc_rec_c6k.cpython-37.pyc
CodeV15/config/config_v15_c6k.properties
CodeV15/rpp/rpp_se_cpc_rec_c6k.py
CodeV15/rpp/__pycache__/rpp_se_cpc_rec_c6k.cpython-38.pyc
CodeV15/bin/start_rpp_se_cpc_rec_c6k.sh
CodeV15/kchi/model_item_20211129_py
CodeV15/kchi/model_item.py
CodeV15/kchi/agg_daily_20211129_py
CodeV15/kchi/agg_daily.py
CodeV15/kchi/__pycache__/agg_daily.cpython-38.pyc
CodeV15/kchi/__pycache__/model_item.cpython-38.pyc
CodeV15/targeting/__pycache__/target_cc_wrapper.cpython-38.pyc







########## Commit   ##############################
 docker ps --filter name="jax"
--> e4881654b87d

docker commit -p  -m 'py_c4k'  e4881654b87d  docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4.1.2

docker images  | tac

docker push docker-regi.intra.zzz-it.com/ppp/mona:gluster-hdp4000pro-anaconda3_4.1.2




###### Launch ppp Docker 
ssh ins-101.nnn.hnd2..local

        docker exec -it  py3jax /bin/bash    a4 a5  a6

        docker exec -it  py3jax_3 /bin/bash   a1 a2 a3 

        docker exec -it  py3jax_fraud /bin/bash   b2 

        cd tttcb301/sssvols05/ppp/

        docker exec -it  py3jax_jup /bin/bash 



#####
docker run -d -it --name py3kevin --net=host -v /tmp:/tmp --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2 bash


#### New from 
docker run --rm -d -it --name py3jax_fraud --net=host -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a   -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  -e https_proxy="https://dev-proxy.db.zzz.co.jp:9501"   -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2  bash

docker exec -it  py3jax_fraud /bin/bash 


docker run -d -it --name py3kevin --net=host -v /tmp:/tmp --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2 bash
 
then docker exec -it py3kevin bash
sh mount_gluster.sh


####################################################################################
##### Images  

 docker ps --filter name="jax"

p                                                                                             postgres-reporting
(py36) [16:33:55 ppp@ins-101 test_code]$  docker ps --filter name="jax"
CONTAINER ID        IMAGE                                                                         COMMAND             CREATED             STATUS              PORTS               NAMES
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2   "bash"        Up 2 months            py3jax_fraud
d5ba7c687016        d919cebdc3b1                                                                  "bash"       Up 8 months              py3jax_3
e4881654b87d        d919cebdc3b1                                                                  "bash"       Up 11 months             py3jax



CONTAINER ID        IMAGE                                                                         COMMAND                  CREATED             STATUS              PORTS               NAMES
ba3293028c09           "bash"                   5 weeks ago         Up 5 weeks                              py3jax_fraud
63b910498beb        docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-jp-c4000-pro-1.0.0        jupyter-chenjiahong01-py37-jp-c4000-pro
d5ba7c687016        d919cebdc3b1                                                                                            py3jax_3
e4881654b87d        d919cebdc3b1                                                                                           py3jax




(py36) [popo01@ins-101 ~]$ docker ps --filter name=py3
CONTAINER ID        IMAGE                                                                           COMMAND                  CREATED             STATUS              PORTS               NAMES
143c0437d0cb        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.6        "bash"                   2 months ago        Up 2 months                             py3jax_4
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2     "bash"                   5 months ago        Up 5 months                             py3jax_fraud
d5ba7c687016        d919cebdc3b1                                                                    "bash"                   11 months ago       Up 11 months                            py3jax_3
e4881654b87d        d919cebdc3b1                                                                    "bash"                   14 months ago       Up 14 months                            py3jax

docker name 
cat /proc/self/cgroup | grep -o  -e "docker-.*.scope" | head -n 1 | sed "s/docker-\(.*\).scope/\\1/"


###############################################################################################################
###### Create New images ############################################
Lets say you have a container bd91ca3ca3c8 running, and you want to create a new image after you made changes in the container. 
Generating another image will allow you to preserve your changes.


docker commit -p -a "author_here" -m "your_message" bd91ca3ca3c8 name_of_new_image

-p pauses the container while commit command is building the new image.
-a allows you to supply author information of the new image.
-m allows you to add a comment just as in the Git.

###3 Create Manually a new docker image name
https://docker-regi.intra.zzz-it.com/repositories/ppp/gluster-hdp4000pro-anaconda3/tags


###### Fraud Docker
docker commit -p -a 'kev' -m 'fraud_v01'  ba3293028c09  docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv01:4.1.2

docker images  | tac

# docker tag gluster-hdp4000pro-anaconda3_fr_v01 docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv01:4.1.2

docker push docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2  



#### Jupyter Docker
89d764809554        amalic/jupyterlab 

docker commit -p   -m 'jup_v01'  89d764809554  docker-regi.intra.zzz-it.com/ppp/zamalic_jupyterlab:1.0
docker images  | tac
### Create repostioy in the website
docker push docker-regi.intra.zzz-it.com/ppp/zamalic_jupyterlab:1.0  




from random import sample
x = [[i] for i in range(10)]
shuffle(x)

# print(x)  gives  [[9], [2], [7], [0], [4], [5], [3], [1], [8], [6]]
# of course your results will vary





docker tag nginx:alpine dev-zedregistry.r-local.net/${NAMESPACE}/nginx-alpine:v1
#### Fraud Docker :
docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv01:4.1.2




{
  "name": "zbatch1",
  "command": "sh mount_gluster.sh &&  ls /a &&   mkdir -p /a/nbackup401/search_batch_log  && mount -o 'nolock,timeo=14,rsize=8192,wsize=8192,hard,intr,tcp,ro' -t nfs nbackup401-v.bk.jp.local:/search_batch_log /a/nbackup401/search_batch_log  && ls /a/nbackup401/    && runuser -m ppp -c 'sh tttcb301/sssvols05/ppp/test_code/bin/fraud.sh '",
  "shell": true,
  "executor": "",
  "executorFlags": "",
  "taskInfoData": "",
  "retries": 1,
  "owner": "",
  "ownerName": "",
  "description": "",
  "cpus": 6,
  "disk": 10024,
  "mem": 12000,
  "disabled": false,
  "softError": false,
  "dataProcessingJobType": false,
  "fetch": [
    {
      "uri": "file:///etc/ppp-docker.tar.gz",
      "executable": false,
      "cache": false,
      "extract": true
    }
  ],
  "uris": [],
  "environmentVariables": [
    {
      "name": "NAGIOS_CONTACT",
      "value": "something"
    }
  ],
  "arguments": [],
  "highPriority": false,
  "runAsUser": "root",
  "concurrent": false,
  "container": {
    "type": "DOCKER",
    "image": "docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.0",
    "network": "HOST",
    "networkInfos": [],
    "volumes": [],
    "forcePullImage": false,
    "parameters": [
      {
        "key": "privileged",
        "value": "true"
      }
    ]
  },
  "constraints": [],
  "schedule": "R/2022-12-22T16:18:00.000+09:00/PT15M",
  "scheduleTimeZone": ""
}




## source the env
source /home/ppp/work/ttrrrc01/hdp26_c4000/.bashrc.Spark2.3

## definition of the bash function
declare -f notebook
notebook ()
{
    if [ "$spark_queue" == "" ]; then
        echo "\$spark_queue variable is empty";
        return 1;
    fi;
    export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
    export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;
    export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /data_hdd/ttrrrc01/work --port 8889';
    pyspark --name "KrygShell" --queue $spark_queue --master yarn --deploy-mode client --conf spark.hadoop.yarn.timeline-service.enabled=false --num-executors 64 --executor-cores 5 --executor-memory 5g --conf spark.serializer=org.apache.spark.serializer.KryoSerializer --jars /home/ppp/work/ttrrrc01/hdp26_c4000/apache-hive-1.2.1000.2.6.2.0-205-bin/lib/json-serde-1.3.8-jar-with-dependencies.jar
}
 
export PATH=/home/ppp/work/ttrrrc01/anaconda2/bin:$PATH;
export PYSPARK_DRIVER_PYTHON=/home/ppp/work/ttrrrc01/anaconda2/bin/jupyter;


###export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /home/ppp/work/popo01/  --ip=0.0.0.0 --no-browser  --port 1904';
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /tttcb301/sssvols05/ppp/  --ip=0.0.0.0 --no-browser  --port 1904';


# export PYSPARK_DRIVER_PYTHON_OPTS='notebook --notebook-dir /data_hdd/zhaomeng02--port 9999';
####use the local mode
pyspark --master local[*]




find . -type f -size -1024k -print0 | tar -czf --null -T - -f archive.tar.gz


tar cf small-archive.tar /big/tree --exclude-from <(find /big/tree -size +3M)





#### Conda pack for

conda create --name spark3 --clone base



conda pack -n spark3  -o /dd/101/sssvols07/fdata/zconda/env_spark3.tar.gz





#################################################################################################################
### Install SPARK on YARN

Also change the path inside Hadoop folder and  to make it relative
to 
   /usr/bin/hdp 
   /usr/bin/spark3


Confs to modify :

    tttcb301/sssvols05/ppp/tbin/hadoop/spark-3.1.1-bin-hadoop3.2/conf/spark-env.sh

    tttcb301/sssvols05/ppp/tbin/hadoop/spark-3.1.1-bin-hadoop3.2/conf/spark-defaults.conf    ### pyspark shell start



Sym Link
  /usr/bin/hdp   --->

  /usr/bin/spark3   --->     



#### 
   ### Symlink  Hadoop Folder --> /usr/local/hdp
   ### Symlink  Spark Folder  --> /usr/local/spark3


### Plug Correct HADOOP
           rm /usr/local/hdp  ### remove sym link
          ln -s tttcb301/sssvols05/ppp/tbin/hadoop/hdp314  /usr/local/hdp   && ls -l /usr/local/hdp  
        #     
        
        
        #   rm  /etc/hadoop/conf   
        #   ln -s  tttcb301/sssvols05/ppp/tbin/hadoop/hdp314/hadoop/etc/hadoop    /etc/hadoop/conf    
        ###/etc/hadoop/conf -> /usr/local/hdp314/hadoop-3.1.1.3.1.4.0-315/etc/hadoop/



### Plug Correct Spark
           rm /usr/local/spark3     ### remove sym link
           ln -s tttcb301/sssvols05/ppp/tbin/hadoop/spark-3.1.1-bin-hadoop3.2   /usr/local/spark3  && ls -l   /usr/local/spark3   


###    source tttcb301/sssvols05/ppp/test_code/fraud/c6k_run01.sh


##########################################################################################################
cd tttcb301/sssvols05/ppp/test_code/fraud/


### kinit as zdatauser
### kinit -kt /usr/local/hdp/keytabs/zdatauser.C2000.keytab zdatauser@C2000.HADOOP.zzz.COM
### switch to ppp and execute the same distcp command => succeeded
/usr/local/hdp/bin/kinit.sh


#### Hadoop install
export HADOOP_HOME='/usr/local/hdp/hadoop'
export HIVE_HOME='/usr/local/hdp/hive'
export KRB5_CONFIG='/usr/local/hdp/krb5.conf'
export HBASE_HOME='/usr/local/hdp/hbase'
export JAVA_HOME='/usr/local/hdp/jre'
export KEYTAB_FILE='/usr/local/hdp/keytabs/ppp.nnn.keytab'
export PRINCIPAL='ppp@C2000.HADOOP.zzz.COM'


export HADOOP_LZO_DIR=/usr/local/hdp/hadoop/lib
export HADOOP_CLASSPATH=:/usr/local/hdp/*:/usr/local/hdp/jars/*:/usr/hdp314/hadoop/lib/*:/usr/local/hdp/hadoop/lib/native/*:/usr/local/hdp/hadoop/lib/native/Linux-amd64-64/*
export LD_LIBRARY_PATH=:/usr/local/hdp/hadoop/lib/native:/usr/local/hdp/hadoop/lib/native/Linux-amd64-64:/usr/local/hdp/
export HDP_VERSION=3.1.4.0-315


# export PYTHONPATH='/usr/local/hdp/spark2/python/lib/pyspark.zip:/usr/local/hdp/spark2/python/lib/py4j-0.10.7-src.zip:/work_dir:'

#### Changes for SG batch
#SG batch uses Spark 3.  Install it using Spark3 on HDP3 C6000 cluster. Spark version used is spark-3.0.2
#Ensure following properties are set up properly
#export SPARK_HOME=/usr/local/spark3/spark-3.0.2-bin-hadoop3.2

#export PYSPARK_PYTHON=/usr/bin/python3.6
#export PYSPARK_DRIVER_PYTHON=/usr/bin/python3.6
export PYTHONPATH="/usr/local/spark3/python/lib/py4j-0.10.9-src.zip:/usr/local/spark3/python/lib/pyspark.zip:/usr/local/spark3/:/usr/local/spark3/python:"

export PATH='/opt/anaconda3/bin:/opt/anaconda3/condabin:/usr/local/hdp/hbase/bin:/usr/local/hdp/hive/bin:/usr/local/hdp/spark2/bin:/usr/local/hdp/jre/bin:/usr/local/hdp/hadoop/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/hdp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/anaconda3/bin'


### local ptyhon /usr/local/python/bin:



# The java implementation to use.
# export JAVA_HOME=/usr/local/hdp/jre
#export SPARK_HOME='/usr/local/hdp/spark2'
#export PYSPARK_PYTHON='/usr/bin/python3.6'

export SPARK_HOME=/usr/local/spark3
export PYSPARK_PYTHON='/opt/anaconda3/bin/python'
export SPARK_CLASSPATH=:/usr/local/hdp/hadoop/lib/native/*:/usr/local/hdp/hadoop/lib/native/Linux-amd64-64/*:${SPARK_HOME}/jars/*:
export SPARK_SUBMIT_OPTS='-Djava.security.krb5.conf=/usr/local/hdp/krb5.conf'
export SPARK_LOCAL_DIR='/tmp'
export SPARK_CONF_DIR=/usr/local/spark3/conf





unset   HADOOP_CONF_DIR
# export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-/usr/hdp314/hadoop/conf}
# export HADOOP_CONF_DIR=/usr/hdp314/hadoop/conf
export HADOOP_CONF_DIR='/usr/local/hdp/hadoop/etc/hadoop'

export PYTHONPATH="$PYTHONPATH:$REPO"




##### SPARK RELATED Needed  ################################################################
### Need ROOT For spark
### export PYTHONPATH='/usr/local/spark3/python/:/usr/local/spark3/python/lib/pyspark.zip:/usr/local/spark3/python/lib/py4j-0.10.9-src.zip:'
export SPARK_LOCAL_DIR='/tmp/spark/'
mkdir -p '/tmp/spark/'
export SPARK_HOME=/usr/local/spark3
export PYSPARK_PYTHON='/opt/anaconda3/bin/python'
export PYSPARK_DRIVER_PYTHON=$PYSPARK_PYTHON

export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip:$PYTHONPATH




echo "########  Spark3 batches:  "
cd tttcb301/sssvols05/ppp/test_code/fraud/c6k/
 ## python data_pipe_line/get_hourly_rp_and_ip.py --config config/prod.yaml  2>&1 | tee -a zlog4.py



echo '######## hive check'
hive -e "select ip  FROM   rastauser_ad_orochi.imp_rasta  WHERE  dt = '2022-04-07'AND hour=12 LIMIT 2 "
# INFO  : OK
# | 160.86.11.157  |
# | 72.14.199.24   |












#### ppp Migration

cb300 / ppp4 Couchbase cluster will be stopped, nodes by nodes, starting with 301 next week on Tuesday May 17.
You should already have moved your applications and batches to use instead acb200 / Scorpion. Which is in fact the same cluster. (Nodes from cb300 and acb200).




















####### Fraud Detection   ##############################
Partial migrate : 1 month,
Migrate take 2 weeks, 1month,  
   Adjust on time schedule.


Estimate :  
   1.5 month total efforts for table :   6 tables.
   Solve/Fine tune of different parts.


Purchases :
  Partial migration
  Fine/Tuning Spark
  Approval of use of changes.


CMA :
   Docker image to C6000.
   Prepared data.
   + Prepprocessing in CMA 
   --> some updates, 



Data Center :
  JPC, www : www1 (Choose Ad )
   JPC :   Archive  only
   www1 :  Table, RAT  

  Base Image docker can access differnt servers.
      hdfs://www1ns1/user/ppp/aog-user-behaviors/z_item_browsing_with_vran/dt=%Y%m%d
         Daily.
      Impression 


Isak Rabin : ad_normalized_logs


feature_write_path: '/rpp_fraud/features/'
feature_write_cnt_path: '/rpp_fraud/features/cnt/'
feature_write_path_clk: '/rpp_fraud/features/clk/'
feature_write_path_imp: '/rpp_fraud/features/imp/'
feature_write_path_cv: '/rpp_fraud/features/cv/'
feature_write_path_label: '/rpp_fraud/features/label/'
feature_write_path_ip_gms: '/rpp_fraud/features/gms/'
feature_write_path_invalid_user_agent: '/rpp_fraud/features/user_agent/'
clk_cnt_time_wise_write_path: '/rpp_fraud/features/clk_cnt_log/'
imp_cnt_time_wise_write_path: '/rpp_fraud/features/imp_cnt_log/'
clk_time_lag_write_path: '/rpp_fraud/features/clk_lag_log/'
imp_time_lag_write_path: '/rpp_fraud/features/imp_lag_log/'
feature_cnt_csv_write_path: '/rpp_fraud/features/log/'
infer_write_path: 'rpp_fraud/random_forest_trees/infer/'
infer_write_path_black_list: 'rpp_fraud/random_forest_trees/infer_black_list/'
 infer_write_path_black_list_local: 'ndata/fraud/output/merge_impratio-time_full_{date}/config_spark_random_forest/check/'

local_outlier_detection, model_path: '/rpp_fraud/local_outlier_detection'

random_forest,model_path: '/rpp_fraud/random_forest'

dashboard_write_path: 'rpp_fraud/dashboard_summary/'





'ad_normalized_logs.filter_click_logs'
'ad_normalized_logs.filter_impression_logs'
'ad_mkt.ultra_cv'
'ad_cpc.m_click_filter'
'ad_cpc.t_rpp_itempv'
'ad_cpc.rpp_cv_formatted'
'ad_cpc.t_rpp_click'
'ad_cpc.t_rpp_itempv'
'ad_cvt.imp_rasta'
'ad_cvt.click_rasta'
'ad_cvt.request_rasta'
'ad_orochi.imp_log'
  
  'adop_sg.rpp_bot_ip_rp_no_gms'
  'adop_sg.bot_no_gms_missed_gms'
  'adop_sg.rpp_bot_ip_rp_out_jp'
  'adop_sg.rpp_bot_ip_rp_low_ctr'
  'adop_sg.bot_low_ctr_missed_gms'
  'adop_sg.bot_low_ctr_less_clk'
  'adop_sg.bot_out_jp_missed_gms'







Sharing opportunity, 
    Impression of table: 









  

1) Current HDFS Table (C4000) :



INPUT Tables (Ad C4000)

feature_write_path: '/rpp_fraud/features/'
feature_write_cnt_path: '/rpp_fraud/features/cnt/'
feature_write_path_clk: '/rpp_fraud/features/clk/'
feature_write_path_imp: '/rpp_fraud/features/imp/'
feature_write_path_cv: '/rpp_fraud/features/cv/'
feature_write_path_label: '/rpp_fraud/features/label/'
feature_write_path_ip_gms: '/rpp_fraud/features/gms/'
feature_write_path_invalid_user_agent: '/rpp_fraud/features/user_agent/'
clk_cnt_time_wise_write_path: '/rpp_fraud/features/clk_cnt_log/'
imp_cnt_time_wise_write_path: '/rpp_fraud/features/imp_cnt_log/'
clk_time_lag_write_path: '/rpp_fraud/features/clk_lag_log/'
imp_time_lag_write_path: '/rpp_fraud/features/imp_lag_log/'
feature_cnt_csv_write_path: '/rpp_fraud/features/log/'
cv_table: 'ad_mkt.ultra_cv'
t_rpp_item_pv: 'ad_cpc.t_rpp_itempv'
t_rpp_cv: 'ad_cpc.rpp_cv_formatted'
rpp_click_table: 'ad_cpc.t_rpp_click'
rpp_item_pv: 'ad_cpc.t_rpp_itempv'
infer_write_path: 'rpp_fraud/random_forest_trees/infer/'
infer_write_path_black_list: 'rpp_fraud/random_forest_trees/infer_black_list/'
infer_write_path_black_list_local: 'ndata/fraud/output/merge_impratio-time_full_{date}/config_spark_random_forest/check/'
local_outlier_detection,         : '/rpp_fraud/local_outlier_detection'
random_forest,model_path: '/rpp_fraud/random_forest'




environ{'NVM_RC_VERSION': '',
        'HOSTNAME': 'ins-101',
        'SPARK_HOME': '/usr/local/hdp26/spark2',
        'NVM_CD_FLAGS': '',
        'SHELL': '/bin/bash',
        'TERM': 'xterm',
        'KEYTAB_FILE': '/usr/local/hdp26/keytabs/ppp.nnn.keytab',
        'HADOOP_HOME': '/home/ppp/hdp26_jp_c4000_pro/hadoop',
        'OLDPWD': '/',
        'QTDIR': '/usr/lib64/qt-3.3',
        'QTINC': '/usr/lib64/qt-3.3/include',
        'QT_GRAPHICSSYSTEM_CHECKED': '1',
        'USER': 'ppp',
        'http_proxy': 'http://dev-proxy.db.zzz.co.jp:9501',
        'NVM_DIR': '/root/.nvm',
        'LS_COLORS': 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:',
        'PYSPARK_PYTHON': '/usr/bin/python3.6',
        'PRINCIPAL': 'ppp@C2000.HADOOP.zzz.COM',
        'ANACONDA_FILE_NAME': 'Anaconda3-2019.10-Linux-x86_64.sh',
        'ANACONDA_ARTIFACT': 'Anaconda3',
        'PATH': '/home/ppp/bin:~/.local/bin:/usr/lib64/qt-3.3/bin:/usr/local/hdp26/hive/bin:/usr/local/hdp26/hadoop/bin:/usr/local/hdp26/jdk/bin:/opt/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/hdp26/jdk/bin:/home/ppp/hdp26_jp_c4000_pro/hadoop/bin',
        'HIVE_HOME': '/usr/local/hdp26/hive',
        'PWD': 'tttcb301/sssvols05/ppp/test_code/offsim/simul_api',
        'JAVA_HOME': '/usr/local/hdp26/jdk',
        'SPARK_SUBMIT_OPTS': '-Djava.security.krb5.conf=/usr/local/hdp26/krb5.conf',
        'LANG': 'en_US.UTF-8',
        'KRB5_CONFIG': '/usr/local/hdp26/krb5.conf',
        'https_proxy': 'https://dev-proxy.db.zzz.co.jp:9501',
        'ANACONDA_VARIANT': '3',
        'ANACONDA_URL': 'https://nexus.rwasp.intra.zzz-it.com/repository/raw/anaconda/Anaconda3/2019.10-Linux-x86_64/Anaconda3-2019.10-Linux-x86_64.sh',
        'HOME': '/home/ppp',
        'SHLVL': '2',
        'ANACONDA_VERSION': '2019.10-Linux-x86_64',
        'GREP_OPTIONS': '--color=auto',
        'DIRECTORY': '/usr/local/hdp26',
        'REQUIREMENTS_PATH': 'hdp-anaconda3',
        'LOGNAME': 'ppp',
        'PYTHONPATH': '/usr/local/hdp26/spark2/python/lib/pyspark.zip:/usr/local/hdp26/spark2/python/lib/py4j-0.10.4-src.zip:',
        'QTLIB': '/usr/lib64/qt-3.3/lib',
        'LESSOPEN': '||/usr/bin/lesspipe.sh %s',
        'HISTTIMEFORMAT': '%d/%m/%y %T ',
        'ANACONDA_PATH': 'anaconda3',
        '_': '/opt/anaconda3/bin/ipython'}








genremts_13_0_0_0.json
genremts_50_0_0_0.json
genremts_16_0_0_0.json






#!/bin/bash

mkdir -p \
tttgfs101/sssvolh01 \
tttgfs104/sssvolh01 \
tttgfs201/sssvolh02 \
tttgfs204/sssvolh02 \
tttgfs201/sssvols02 \
tttgfs204/sssvols02 \
tttcb201/sssvolh03 \
tttcb204/sssvolh03 \
tttcb201/sssvols03 \
tttcb204/sssvols03 \
/a/ins-apiopds101/sssvols04 \
/a/ins-apiopds101/sssvolh04 \
/a/ins-apiopds104/sssvols04 \
/a/ins-apiopds104/sssvolh04 \
/a/ins-apiopds101/apiopdsgv01 \
tttcb301/sssvols05 \
/a/acb401/sssvols06 \
/dd/101/sssvols07

# Unsecured
mv /var/lib/glusterd/secure-access /var/lib/glusterd/secure-access.sav
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs101.nnn.hnd1..local:/sssvolh01 tttgfs101/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs104.nnn.hnd1..local:/sssvolh01 tttgfs104/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvolh02 tttgfs201/sssvolh02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs204.nnn.hnd1..local:/sssvolh02 tttgfs204/sssvolh02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvols02 tttgfs201/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs204.nnn.hnd1..local:/sssvols02 tttgfs204/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvolh03 tttcb201/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvolh03 tttcb204/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvols03 tttcb204/sssvols03
mount -t glusterfs -o log-level=WARNING ins-apiopds104.nnn.jp.local:/apiopdsgv01 /a/ins-apiopds101/apiopdsgv01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds101.nnn.hnd1..local:/sssvols04 /a/ins-apiopds101/sssvols04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds101.nnn.hnd1..local:/sssvolh04 /a/ins-apiopds101/sssvolh04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds104.nnn.hnd1..local:/sssvols04 /a/ins-apiopds104/sssvols04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=ins-apiopds102.nnn.hnd1..local:ins-apiopds103.nnn.hnd1..local ins-apiopds104.nnn.hnd1..local:/sssvolh04 /a/ins-apiopds104/sssvolh04
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05

# Secured
mv /var/lib/glusterd/secure-access.sav /var/lib/glusterd/secure-access
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=acb402.analysis-shared.jpe2b.dcnw.zzz:acb403.analysis-shared.jpe2b.dcnw.zzz acb401.analysis-shared.jpe2b.dcnw.zzz:/sssvols06 /a/acb401/sssvols06
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.aog.jpe2b.dcnw.zzz:gfs103.aog.jpe2b.dcnw.zzz gfs101.aog.jpe2b.dcnw.zzz:/sssvols07 /dd/101/sssvols07



#### cp -R  /home/popo01/ssl  /etc/   copy the SSL into   /etc/ for secure mount


#### transpor end point issues :  secure-access.sav  and    umount tttcb201/sssvols03  and then mount it


####  umount  /a/ins-apiopds104/sssvols04 

## mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03


## umount tttcb201/sssvols03  && mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03  


## umount  tttcb204/sssvolh03  &&   mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb204.nnn.hnd2..local:/sssvolh03 tttcb204/sssvolh03



## umount tttcb201/sssvolh03  &&  mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvolh03 tttcb201/sssvolh03  



umount tttcb301/sssvols05 

mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05



umount /a/acb401/sssvols06
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=acb402.analysis-shared.jpe2b.dcnw.zzz:acb403.analysis-shared.jpe2b.dcnw.zzz acb401.analysis-shared.jpe2b.dcnw.zzz:/sssvols06 /a/acb401/sssvols06


umount tttcb201/sssvolh03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvolh03 tttcb201/sssvolh03




tttcb301/sssvols05/ppp/test_code/fraud


$http_proxy


--rm		Automatically remove the container when it exits



export http_proxy     : http://dev-proxy.db.zzz.co.jp:9501
https_proxy    : http://dev-proxy.db.zzz.co.jp:9501
npm_http_proxy : http://pkg.proxy.nnn.jp.local:10080
npm_https_proxy: http://pkg.proxy.nnn.jp.local:10080






http_proxy     : http://dev-proxy.db.zzz.co.jp:9501
https_proxy    : http://dev-proxy.db.zzz.co.jp:9501
npm_http_proxy : http://pkg.proxy.nnn.jp.local:10080
npm_https_proxy: http://pkg.proxy.nnn.jp.local:10080


export http_proxy=http://dev-proxy.db.zzz.co.jp:9501
export https_proxy=http://dev-proxy.db.zzz.co.jp:9501

export npm_http_proxy=http://pkg.proxy.nnn.jp.local:10080
export npm_https_proxy=http://pkg.proxy.nnn.jp.local:10080




ef5b153dbd4a33821114660cb292fe0ea567ebb2ebccc465


########  JupyterLab
docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks -e PASSWORD="elise237" umids/jupyterlab:latest

docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks -e PASSWORD="elise237" amalic/jupyterlab


docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks -e PASSWORD="elise237" \
           -p 9501:9501  \
           --network host  \
           -e http_proxy="http://dev-proxy.db.zzz.co.jp:9501" \
           -e https_proxy="http://dev-proxy.db.zzz.co.jp:9501"  \
           --entrypoint /bin/bash  amalic/jupyterlab  


curl https://getmic.ro | bash 
mv micro /usr/local/bin/micro 
micro /usr/local/bin/entrypoint.sh


--NotebookApp.allow_origin='*' --debug --log-level 0


[D 12:36:33.116 NotebookApp] Connecting to: tcp://127.0.0.1:41307
[D 12:36:33.116 NotebookApp] Connecting to: tcp://127.0.0.1:47655



CMD=""
jupyter lab --allow-root --ip=0.0.0.0 --no-browser



pip install tornado==4.5.3


pip3 install tornado==5.1.1


ENTRYPOINT ["entrypoint.sh"]


args:
    http_proxy: http://dev-proxy.db.zzz.co.jp:9501
    https_proxy: http://dev-proxy.db.zzz.co.jp:9501


###########################################################################
docker run -ti \
    --hostname localhost \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -p 5006:5006 \
    -p 9501:9501 \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -e DOCKER_ADMIN_USER=$(id -un) \
    -v "$(pwd)":/workdir \
    -v "$(dirname $HOME)":/home_host \
    dclong/jupyterhub-ds /bin/bash


jupyter notebook    --port 8000 --no-browser


docker run -ti \
    --hostname localhost \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -p 5006:5006 \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -e DOCKER_ADMIN_USER=$(id -un) \
    -v "$(pwd)":/workdir \
    -v "$(dirname $HOME)":/home_host \
    dclong/jupyterhub-ds /scripts/sys/init.sh

jupyter notebook 
cd /root
jupyterhub -f /etc/jupyterhub/jupyterhub_config.py




# This will start a code-server container and expose it at http://127.0.0.1:8080.
# It will also mount your current directory into the container as `/home/coder/project`
# and forward your UID/GID so that all file system operations occur as your user outside  the container.
docker run -it -p 127.0.0.1:8080:8080 \
  -v "$PWD:/home/coder/" \
  -u "$(id -u):$(id -g)" \
  codercom/code-server:latest




eriebenoit01@ins-101 ~]$ w
04:07:16 up 907 days, 5:38, 8 users, load average: 6.43, 6.39, 6.30
USER TTY FROM LOGIN@ IDLE JCPU PCPU WHAT
noelkevi pts/0 loginjpe1101z.pr 15Feb22 4:28 24:57m 0.28s -bash
noelkevi pts/2 loginjpe1101z.pr 24Feb22 3days 1:56 1:48 docker exec -it py3jax_fraud /bin/bash
noelkevi pts/3 loginjpe1101z.pr 16Feb22 39days 18:03 1:56 docker exec -it py3jax_fraud /bin/bash
noelkevi pts/4 loginjpe1101z.pr 24Feb22 11days 44:49 1:29 docker exec -it py3jax_fraud /bin/bash
noelkevi pts/5 loginjpe1101z.pr 24Feb22 4days 12:51 1:35 docker exec -it py3jax_fraud /bin/bash
noelkevi pts/6 loginjpe1101z.pr 10Mar22 17days 0.08s 0.08s -bash
noelkevi pts/8 loginjpe1101z.pr 01Mar22 27days 0.09s 0.05s -bash


py36) [popo01@ins-101 stg]$ docker ps
CONTAINER ID        IMAGE                                                                                     COMMAND                  CREATED             STATUS                  PORTS                    NAMES
fac3ffd17961        docker-regi.intra.zzz-it.com/ppp/hadoop-client:star-c6000-star-2022.01.19         "bash"                   6 hours ago         Up 6 hours                                       thirsty_pare
87b691a5707a        amalic/jupyterlab                                                                         "entrypoint.sh"          3 weeks ago         Up 3 weeks                                       pykev
08ecd086e84d        prom/prometheus                                                                           "/bin/prometheus --c…"   5 weeks ago         Up 5 weeks              0.0.0.0:9099->9090/tcp   promcheck
d06a5f4de7dd        docker-regi.intra.zzz-it.com/ppp/hadoop-client:star-c6000-star-2021.11.25-log4j   "/bin/bash"              7 weeks ago         Up 7 weeks                                       leo_hadoop
22b0594384d2        docker-regi.intra.zzz-it.com/ppp/aog-user-behaviors:py36-star-pro-2.0.0           "bash"                   7 weeks ago         Up 7 weeks                                       inspiring_heisenberg
bac4cb315a94        docker-regi.intra.zzz-it.com/ppp/aog-user-behaviors:py36-star-pro-2.0.0           "bash"                   7 weeks ago         Up 7 weeks                                       peaceful_hypatia
f49580db9203        docker-regi.intra.zzz-it.com/ppp/aog-user-behaviors:py36-star-pro-2.0.0           "bash"                   7 weeks ago         Up 7 weeks                                       gallant_gauss
a2fce4d968f5        docker-regi.intra.zzz-it.com/ppp/zanaconda3_frv02:4.1.2                           "bash"                   2 months ago        Up 2 months                                      py3_batch
9724f8bc7502        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud         "bash"                   2 months ago        Up 2 months                                      py3jax_fraud2
e5f4eef82270        8deeb9754649                                                                              "bash"                   2 months ago        Up 2 months                                      recursing_kapitsa
5af559d67b19        docker-regi.intra.zzz-it.com/ppp/ds-jupyter:py37-jp-c4000-pro-1.0.1               "/bin/sh -c 'sudo /u…"   3 months ago        Up 3 months                                      jupyter-zhaomeng02-py37-jp-c4000-pro
7f24645bf85e        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.11            "bash"                   4 months ago        Up 4 months                                      clever_diffie
cf4fe4e422dc        docker-regi.intra.zzz-it.com/ppp/hadoop-client:1.0.1-hadoop-c4000                 "/bin/sh -c 'source …"   4 months ago        Up 4 months                                      container_hdfs_inspection
cf66fe09da0f        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.11            "bash"                   4 months ago        Up 4 months                                      happy_hoover
30e3b655b3ad        63916bb36f9a                                                                              "bash"                   4 months ago        Up 4 months                                      festive_cray
bf80556de8b2        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.11            "bash"                   4 months ago        Up 4 months                                      distracted_galois
9bb82b54a868        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.11            "bash"                   4 months ago        Up 4 months                                      youthful_leavitt
e58dabbf59e6        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-stg:2.5.11.dev         "bash"                   4 months ago        Up 4 months                                      focused_nobel
65886bbd3289        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.9             "bash"                   4 months ago        Up 4 months                                      recursing_mcnulty
4ff636802ee5        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7                  "bash"                   4 months ago        Up 4 months                                      nifty_benz
41413666169d        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.9             "bash"                   4 months ago        Up 4 months                                      pedantic_shirley
2df6d71d6b15        docker-regi.intra.zzz-it.com/ppp/hadoop-client:star-c6000-star-2021.07.02         "/bin/bash"              4 months ago        Up 4 months                                      unruffled_varahamihira
852183d1b137        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.9             "bash"                   4 months ago        Up 4 months                                      goofy_shockley
c259a5c7eea1        docker-regi.intra.zzz-it.com/ppp/sc-cc-advance-batches-prod:2.5.9             "bash"                   5 months ago        Up 5 months                                      hopeful_tesla
7cc318034a97        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.2.4               "bash"                   5 months ago        Up 5 months                                      py3_c5bis
9a2916729ae2        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:offline_v3             "bash"                   5 months ago        Up 5 months                                      py3_c5
02b579c5b1ad        docker-regi.intra.zzz-it.com/ppp/cpc-reborn-feed:pro-c5fbbbf                      "/bin/bash -c bash"      5 months ago        Up 5 months                                      boring_ptolemy
c4b110030d9e        2cd28c80ecd1                                                                              "bash"                   5 months ago        Up 5 months                                      agitated_zhukovsky
7ace044824d4        283372c219e2                                                                              "bash"                   5 months ago        Up 5 months                                      blissful_kepler
c832613c6f50        docker-regi.intra.zzz-it.com/ppp/hadoop-client:star-c6000-star-2021.07.02         "bash"                   5 months ago        Up 5 months                                      clever_lewin
e301128307eb        docker-regi.intra.zzz-it.com/ppp/hadoop-client:star-c6000-star-2021.07.02         "bash"                   5 months ago        Up 5 months                                      gracious_northcutt
b81636c1f4c6        docker-regi.intra.zzz-it.com/ppp/hadoop-client:star-c6000-star-2021.07.02         "bash"                   5 months ago        Up 5 months                                      musing_shannon
58080ae958a7        apache/superset                                                                           "/usr/bin/docker-ent…"   8 months ago        Up 8 months (healthy)   0.0.0.0:7070->8088/tcp   superset
143c0437d0cb        docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.6                  "bash"                   9 months ago        Up 9 months                                      py3jax_4
ba3293028c09        docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2               "bash"                   12 months ago       Up 12 months                                     py3jax_fraud
c5ea15ec0ae5        prom/alertmanager:v0.20.0   





#### Setup Proxy  ##########################################################################
https://medium.com/@bennyh/docker-and-proxy-88148a3f35f7



##### Prometheus Listening :
docker run -ti -p 9099:9090 -v /data_hdd/popo01/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.local.path=/prometheus --storage.local.memory-chunks=10000


### Ok
docker run  --rm -ti -p 9099:9090 -v /data_hdd/popo01/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml 



export http_proxy="http://dev-proxy.db.zzz.co.jp:9501"  
export https_proxy="https://dev-proxy.db.zzz.co.jp:9501"  


 -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2  bash




-storage.local.path=/prometheus -storage.local.memory-chunks=10000


#### Screen 
ssh ins-101.nnn.hnd2..local

da1 


docker stop 

docker run  --rm -ti -p 9099:9090 -v /data_hdd/popo01/prometheus/log_cass/:/prometheus -v /data_hdd/popo01/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml 
docker -ti


987167260b8c  





######### Qdrant  ######################################

notebooks/data/workspaces/takos01/ndata

in popo01  g9 





https://www.thorsten-hans.com/docker-container-cpu-limits-explained/

########################################################
docker pull generall/qdrant  &&  \

docker run -p 6333:6333 \
    -v /data/workspaces/takos01/ndata:/qdrant/storage \
    -v /data/workspaces/takos01/config_qdrant.yaml:/qdrant/config/production.yaml \
    generall/qdrant



BE CAREFUL TO REMOVE Proxy when launching bash
#### New name 
e9b2783b0ba3   jupydrant                                                                 "./qdrant"               28 seconds ago   Up 27 seconds 


#### Need to remove the port exposure
docker run --rm -ti  --name drant01 --cpus 6   \
       -v /data/workspaces/takos01/ndata:/qdrant/storage  \
       -v /data/workspaces/takos01/config_qdrant.yaml:/qdrant/config/production.yaml  \
       jupydrant





####
100.78.23.56

docker pull generall/qdrant  &&  \
docker run --rm -ti  --cpus 4 -p 6333:6333 \
    -v /data_hdd/popo01/qdrant/:/qdrant/storage \
    -v /data_hdd/popo01/qdrant/config.yaml:/qdrant/config/production.yaml \
    generall/qdrant  


docker run --rm -ti  --cpus 6 -p 6333:6333 \
    -v /data_hdd/popo01/qdrant/:/qdrant/storage \
    -v /data_hdd/popo01/qdrant/config.yaml:/qdrant/config/production.yaml \
    jupydrant  




Binaries portable 




     /bin/bash



docker execti  



#######################################################################
##### Run as binaries inside a custom docker  #########################

#### Symbolic 
/qdrant/storage   --->  /data/workspaces/takos01/qdrant



  /qdrant --->  

  ln -s /data/workspaces/takos01/qdrant   /qdrant 

  mkdir /qdrant/storage





ln -s /path/to/file /path/to/symlink



#### to point to the host localhost, otherwise only docker
--network="host"


mkdir /qdrant/storage/copy

cp -r qdrant   /qdrant/storage/copy/
cp -r config   /qdrant/storage/copy/

chmod -R  /qdrant 777 .


cd /qdrant  && ./qdrant >> /data/workspaces/takos01/qdrant/log.py  2>&1   &


conda install -c anaconda libopenblas


conda install -c anaconda gcc 

./qdrant: /usr/lib64/libstdc++.so.6: version `CXXABI_1.3.8' not found (required by ./qdrant)
./qdrant: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.22' not found (required by ./qdrant)
./qdrant: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by ./qdrant)
./qdrant: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.21' not found (required by ./qdrant)
./qdrant: /usr/lib64/libc.so.6: version `GLIBC_2.18' not found (required by ./qdrant)





https://stackoverflow.com/questions/29143903/how-to-connect-two-docker-containers-through-localhost

LINK
Another solution that is most common and that I prefer when possible, is to link the containers.

You need to add the --name flag to the server docker run command: --name sails_server

You need to add the --link flag to the application docker run command: --link sails_server:sails_server



190c6089bdb3   py3_c4new                                                                 "bash"                   2 months ago   Up 2 months                                                                                      py3_c4new2


conda install -c creditx gcc-7 --no-deps



 __glibc[version='>=2.17']

### 2.18
conda install -c dan_blanchard glibc



UnsatisfiableError: The following specifications were found to be incompatible with each other:

Output in format: Requested package -> Available versions

Package libstdcxx-ng conflicts for:
python=3.7 -> libstdcxx-ng[version='>=7.2.0|>=7.3.0']
gcc-7 -> gmp[version='>=6.1'] -> libstdcxx-ng[version='>=7.2.0|>=7.3.0']The following specifications were found to be incompatible with your system:

  - feature:/linux-64::__glibc==2.17=0
  - python=3.7 -> libgcc-ng[version='>=7.5.0'] -> __glibc[version='>=2.17']

Your installed version is: 2.17




/lib64/libstdc++.so.6  /lib64/libstdc++.so.6.0.19


/lib64/libstdc++.so.6.0.28 

./qdrant: /lib64/libstdc++.so.6: version `CXXABI_1.3.8' not found (required by ./qdrant)
./qdrant: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.22' not found (required by ./qdrant)
./qdrant: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by ./qdrant)

https://stackoverflow.com/questions/44205687/glibcxx-3-4-21-not-found-on-centos-7
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64


export LD_LIBRARY_PATH=/opt/anaconda3/lib/


export LD_LIBRARY_PATH=/data/workspaces/takos01/ndata/zbin/lib64/



export LD_LIBRARY_PATH=/home/ags/miniconda3/envs/GE/lib:$LD_LIBRARY_PATH



 ln -s libstdc++.so.6.0.28 libstdc++.so.6


 $ cd ~/miniconda3/envs/envname/lib/
$ ll | grep libstdc++
-rw-r--r--  2 xxx xxx   4669688 Aug  1  2016 libstdc++.a
-rw-r--r--  2 xxx xxx    722358 Aug  1  2016 libstdc++fs.a
-rwxr-xr-x  1 xxx xxx       941 Sep  7 23:05 libstdc++fs.la
-rwxr-xr-x  1 xxx xxx      1001 Sep  7 23:05 libstdc++.la
lrwxrwxrwx  1 xxx xxx        19 May 16  2020 libstdc++.so.6.0.21 -> libstdc++.so.6.0.24
-rwxr-xr-x  2 xxx xxx   1561568 Aug  1  2016 libstdc++.so.6.0.22
-rw-r--r--  1 xxx xxx      2487 Sep  7 23:05 libstdc++.so.6.0.22-gdb.py
-rwxrwxr-x  2 xxx xxx  13139544 Oct  3 08:49 libstdc++.so.6.0.2



https://anaconda.org/conda-forge/gcc_linux-64
ls /opt/anaconda3/envs/gcc7/lib
GCC  libstdc++.so.6.0.29  


export LD_LIBRARY_PATH=/opt/anaconda3/envs/gcc7/lib




GLIBCXX_3.4.26 comes with gcc-8. Installing gcc-8 and upgrading libstdc++6 worked for me. Run the following as shown here:

sudo apt update
sudo apt install wget gcc-8 unzip libssl1.0.0 software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update


conda


lib64


ls /opt/anaconda3/lib 


    anaconda-custom            |           py37_0           6 KB  anaconda
    backports.functools_lru_cache-1.6.1|             py_0          11 KB  anaconda
    bleach-3.2.1               |             py_0         111 KB  anaconda
    ca-certificates-2020.10.14 |                0         128 KB  anaconda
    certifi-2020.6.20          |           py37_0         159 KB  anaconda
    conda-4.11.0               |   py37h06a4308_0        14.4 MB
    dask-core-2.5.2            |             py_0         579 KB  anaconda
    libopenblas-0.3.10         |       h5a2b251_0         7.8 MB  anaconda
    numpy-base-1.17.2          |   py37hde5b4d6_0         5.3 MB  anaconda
    openssl-1.1.1h             |       h7b6447c_0         3.8 MB  anaconda
    packaging-20.4             |             py_0          35 KB  anaconda
    psutil-5.7.2               |   py37h7b6447c_0         342 KB  anaconda




FROM rust:1.51 as builder

COPY . ./qdrant
WORKDIR ./qdrant

ENV OPENBLAS_DYNAMIC_ARCH="1"
RUN apt-get update ; apt-get install -y clang libopenblas-dev libgfortran-8-dev gfortran

# Build actual target here
RUN cargo build --release --bin qdrant

FROM debian:buster-slim
ARG APP=/qdrant

RUN apt-get update \
    && apt-get install -y ca-certificates tzdata \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6333
EXPOSE 6334

ENV TZ=Etc/UTC \
    RUN_MODE=production \
    OPENBLAS_NUM_THREADS=1

RUN mkdir -p ${APP}

COPY --from=builder /qdrant/target/release/qdrant ${APP}/qdrant
COPY --from=builder /qdrant/config ${APP}/config

WORKDIR ${APP}

CMD ["./qdrant"]




cp -r ./   /data/workspaces/takos01/qdrant/


cp -r ./SourceFolder ./DestFolder



## ok workges
docker run -p 6333:6333 \
    -v /data/workspaces/takos01/ndata:/qdrant/storage \
    generall/qdrant




root@474a41944687:/qdrant# ls
config  qdrant  storage
root@474a41944687:/qdrant# ls -l
total 37724
drwxr-xr-x. 2 root root       72 Oct 27 21:27 config
-rwxr-xr-x. 1 root root 38625696 Oct 27 21:26 qdrant
drwxr-xr-x. 4 root root       45 Dec 31 15:31 storage


100.66.227.2:

traceroute  240.0.0.3


unset http_proxy



find docker ip address
docker inspect -f &#39;{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}&#39; container_name_or_id


docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' drant01



wget  http://240.0.0.3:6333



curl 'http://240.0.0.3:6333/collections/test5'

ins-101.nnn.hnd2..local

:8888/lab/workspaces/mona3






##### How to make qdrant works AS binary Inside a docker


Launch a docker wihtout Host mapping  Remove  --net host

docker run --rm -d -it --name py3jax_fraud2  -v /tmp:/tmp  -v /home/ppp:/home/ppp  -v /a:/a     -v /home/popo01/:/home/popo01/  -v /data_hdd:/data_hdd  --privileged   docker-regi.intra.zzz-it.com/ppp/gluster-hdp4000pro-anaconda3:4.1.2.fraud  




2) launch the binary
a/cb301/sssvols05/ppp/tbin/wheel/qdrant

   hostname -i    ---> Docker IP address 

3) Access in Local with

curl -X POST 'localhost:6333/collections' \
    -H 'Content-Type: application/json' \
    --data '{
        "create_collection": {
            "name": "test6",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'









### Check listeaning port
ss -tulpn | grep LISTEN


docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}'    py3jax_fraud2

172.17.0.12



docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id



curl -X POST 'localhost:6333/collections' \
    -H 'Content-Type: application/json' \
    --data '{
        "create_collection": {
            "name": "test6",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'




curl -X POST '172.17.0.12:6333/collections' \
    -H 'Content-Type: application/json' \
    --data '{
        "create_collection": {
            "name": "test6",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'





curl -X POST 'http://ins-101.nnn.hnd2..local:6333/collections' \
    -H 'Content-Type: application/json' \
    --data-raw '{
        "create_collection": {
            "name": "test6",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'



curl -X POST 'http://240.0.0.3:6333/collections' \
    -H 'Content-Type: application/json' \
    --data-raw '{
        "create_collection": {
            "name": "test6",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'



curl -L -X POST 'http://240.0.0.3:6333/collections/test5?wait=true' \
    -H 'Content-Type: application/json' \
    --data-raw '{
      "upsert_points": {
        "points": [
          {"id": 1, "vector": [0.05, 0.61, 0.76, 0.74], "payload": {"city": "Berlin"}},
          {"id": 2, "vector": [0.19, 0.81, 0.75, 0.11], "payload": {"city": ["Berlin", "London"]}},
          {"id": 3, "vector": [0.36, 0.55, 0.47, 0.94], "payload": {"city": ["Berlin", "Moscow"]}},
          {"id": 4, "vector": [0.18, 0.01, 0.85, 0.80], "payload": {"city": ["London", "Moscow"]}},
          {"id": 5, "vector": [0.24, 0.18, 0.22, 0.44], "payload": {"count": 0}},
          {"id": 6, "vector": [0.35, 0.08, 0.11, 0.44]}
        ]
      }
    }'







curl -X POST 'http://100.89.8.84:6333/collections' \
    -H 'Content-Type: application/json' \
    --data-raw '{
        "create_collection": {
            "name": "test5",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'




##### From Inside
curl -X POST 'http://100.78.23.56:6333/collections' \
    -H 'Content-Type: application/json' \
    --data-raw '{
        "create_collection": {
            "name": "test5",
            "vector_size": 4,
            "distance": "Dot"
        }
    }'


###
{"result":true,"status":"ok","time":0.135384467}(



### {"result":{"operation_id":0,"status":"completed"},"status":"ok","time":0.000297372}
curl -L -X POST 'http://100.78.23.56:6333/collections/test5?wait=true' \
    -H 'Content-Type: application/json' \
    --data-raw '{
      "upsert_points": {
        "points": [
          {"id": 1, "vector": [0.05, 0.61, 0.76, 0.74], "payload": {"city": "Berlin"}},
          {"id": 2, "vector": [0.19, 0.81, 0.75, 0.11], "payload": {"city": ["Berlin", "London"]}},
          {"id": 3, "vector": [0.36, 0.55, 0.47, 0.94], "payload": {"city": ["Berlin", "Moscow"]}},
          {"id": 4, "vector": [0.18, 0.01, 0.85, 0.80], "payload": {"city": ["London", "Moscow"]}},
          {"id": 5, "vector": [0.24, 0.18, 0.22, 0.44], "payload": {"count": 0}},
          {"id": 6, "vector": [0.35, 0.08, 0.11, 0.44]}
        ]
      }
    }'




curl -L -X POST 'http://100.78.23.56:6333/collections/test5/points/search' \
    -H 'Content-Type: application/json' \
    --data-raw '{
      "filter": {
          "should": [
              {
                  "key": "city",
                  "match": {
                      "keyword": "London"
                  }
              }
          ]
      },
      "vector": [0.2, 0.1, 0.9, 0.7],
      "top": 3
  }'





curl -X POST 'http://100.89.8.84:6333/collections' \
     -H 'Content-Type: application/json' \
     --data-raw '{
         "create_collection": {
             "name": "test6",
             "vector_size": 4,
             "distance": "Dot"
         }
     }'





 curl -X POST 'http://XXX.XXX.XXX:6333/collections' \
>     -H 'Content-Type: application/json' \
>     --data-raw '{
>         "create_collection": {
>             "name": "test2",
>             "vector_size": 4,
>             "distance": "Dot"
>         }
>     }'

{"result":true,"status":"ok","time":1.630784197}









storage:
  # Where to store all the data
  storage_path: ./storage

  # Write-ahead-log related configuration
  wal:
    # Size of a single WAL segment
    wal_capacity_mb: 32

    # Number of WAL segments to create ahead of actual data requirement
    wal_segments_ahead: 0


  performance:
    # Number of parallel threads used for search operations. If 0 - auto selection.
    max_search_threads: 0

  optimizers:
    # The minimal fraction of deleted vectors in a segment, required to perform segment optimization
    deleted_threshold: 0.2

    # The minimal number of vectors in a segment, required to perform segment optimization
    vacuum_min_vector_number: 1000

    # If the number of segments exceeds this value, the optimizer will merge the smallest segments.
    max_segment_number: 5

    # Maximum number of vectors to store in-memory per segment.
    # Segments larger than this threshold will be stored as read-only memmaped file.
    memmap_threshold: 50000

    # Maximum number of vectors allowed for plain index.
    # Default value based on https://github.com/google-research/google-research/blob/master/scann/docs/algorithms.md
    indexing_threshold: 20000

    # Starting from this amount of vectors per-segment the engine will start building index for payload.
    payload_indexing_threshold: 10000

    # Minimum interval between forced flushes.
    flush_interval_sec: 10
    
    # Max number of threads, which can be used for optimization. If 0 - `NUM_CPU - 1` will be used
    max_optimization_threads: 0

  # Default parameters of HNSW Index. Could be override for each collection individually
  hnsw_index:
    # Number of edges per node in the index graph. Larger the value - more accurate the search, more space required.
    m: 16
    # Number of neighbours to consider during the index building. Larger the value - more accurate the search, more time required to build index.
    ef_construct: 100
    # Minimal amount of points for additional payload-based indexing.
    # If payload chunk is smaller than `full_scan_threshold` additional indexing won't be used -
    # in this case full-scan search should be preferred by query planner and additional indexing is not required.
    full_scan_threshold: 10000

service:

  # Maximum size of POST data in a single request in megabytes
  max_request_size_mb: 32

  # Host to bind the service on
  host: 0.0.0.0

  # HTTP port to bind the service on
  port: 6333

  # GRPC port to bind the service on
  grpc_port: 6334

















docker run -d $DOCKER_PARAM $USER_PERMISSIONS \
     $DATA_DIR \
     -v $PWD/prometheus/build/prometheus.yml:/etc/prometheus/prometheus.yml:Z \
     -v $PROMETHEUS_RULES:/etc/prometheus/prometheus.rules.yml:Z \
     $SCYLLA_TARGET_FILE \
     $SCYLLA_MANGER_TARGET_FILE \
     $NODE_TARGET_FILE \
     $PORT_MAPPING --name $PROMETHEUS_NAME prom/prometheus:$PROMETHEUS_VERSION  --config.file=/etc/prometheus/prometheus.yml $PROMETHEUS_COMMAND_LINE_OPTIONS >& /dev/null
     
     



kevin.noel
kubo237.



git.kkken-it.com
kevin.noel
kubo237.


#############################################################################################
screen -S sy1

Ctrl+a d    You can detach from the screen session at any time by typing:

screen -r  sy1    ### Put Back the session

screen -ls

screen -X -S [session # you want to kill] quit


#### Access to GFS Cluster for data sharing
ssh ins-101.nnn.hnd2..local

/data_hdd/popo01/


Proxy access
  dev-proxy.db.zzz.co.jp    port 9502 or 9510




##########################################################################################
ssh -f  popo01@loginjpe1101z.nnn.jp.local -L 8888:localhost:8888 -N


ssh -f popo01@ins-101.nnn.hnd2..local:8888 -L  8888:popo01@loginjpe1101z.nnn.jp.local:8888  -N

#### In sublime
ssh -m hmac-sha2-512 popo01@loginjpe1101z.nnn.jp.local



######## k website
http://bcarpp104.nnn.hnd2..local:3010/


scylladb10[1-3].analysis-shared.jpe2b.dcnw.zzz



ssh -m hmac-sha2-512 popo01@loginjpe1101z.nnn.jp.local


ssh  popo01@scylladb101.analysis-shared.jpe2b.dcnw.zzz


#### Proxy
zzz_proxy

http_proxy     : http://dev-proxy.db.zzz.co.jp:9501
https_proxy    : http://dev-proxy.db.zzz.co.jp:9501
npm_http_proxy : http://pkg.proxy.nnn.jp.local:10080
npm_https_proxy: http://pkg.proxy.nnn.jp.local:10080
 




hdfs://www1ns1/user/ppp/rpp/fraud/c4000/geo_location/2021-06-02/*



hadoop fs -cp /path1/file1 /path2/file2 path3/file3 /pathx/target


hdfs dfs -cp 




########
hdfs://www1ns1/user/ppp/rpp/fraud/data/features_ip/geo_location/dt=2022-05-16/hr=-1



hdfs dfs -mkdir -p   hdfs://www1ns1/user/ppp/rpp/fraud/data/features_ip/geo_location/dt=2022-05-23/hr=-1




hdfs dfs -cp  /user/ppp/rpp/fraud/c4000/geo_location/*/*.gz  /user/ppp/rpp/fraud/data/features_ip/geo_location/dt=2022-05-23/hr=-1/



hdfs dfs -cp /myroot/*/*/*.parq /mynewdir


hdfs dfs -copyToLocal   /user/ppp/rpp/fraud/c4000/geo_location/2021-06-02/*.gz   "/dd/101/sssvols07/fdata/input/hdfs/geo_location/past/"  &








#####  Login Server   ##################################################################
ssh -m hmac-sha2-512 popo01@loginjpe1101z.nnn.jp.local

 
export http_proxy=http://pkg.proxy.nnn.jp.local:10080  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:10080   &&

git config --global user.email "kevin.noel@zzz.com"  &&  git config --global user.name "Kevin Noel"  && git config --global credential.helper "cache --timeout=90600" 


export http_proxy=http://pkg.proxy.nnn.jp.local:9501  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:9501



zzz_proxy



http_proxy     : http://dev-proxy.db.zzz.co.jp:9501
https_proxy    : http://dev-proxy.db.zzz.co.jp:9501
export npm_http_proxy="http://pkg.proxy.nnn.jp.local:10080"
export npm_https_proxy="http://pkg.proxy.nnn.jp.local:10080"




#####################################################################################
popo01


Old travel server :           ssh ins-bdstrv101.nnn.jp.local

-deps Login server :  popo01@loginjpe1101z.nnn.jp.local

travel Server :    ssh  popo01@ins-adstrvns101z.nnn.hnd1..local

ETL tool server :       ssh  ins-bdsplat201z.nnn.jp.local 

GPU Server :  ssh -p 2201 gpuuser@aacpgpu104.nnn.jp.local    changeme123        (4 GPU)


Travel  Analysis  :      ssh   ins-adstrvns101z.nnn.hnd1..local
Travel                 :   cd   /data_hdd/ggg/nono/ttrv/

Jenkins server ;      ssh       popo01@ins-adsadmin101z.nnn.jp



#####################################################################################
screen -X -S 31600 quit

devakevin   ----------->  devfeature  ------------->   devstreaming   
             copy files                    (Pull request: download devstream + copy files). 


DOCKER local :
      data_share                 ----->  C:\D\project27_kkk\data_share
      data_share/repodev     ----->  C:\D\project27_kkk\git_dev\devfeature


VMware Ubuntu  :
        devkevin    --->  C:\D\project27_kkk\git_dev\devkevin


nitbucket

kevin.noel
sophie237.




################################################################################
#### Docker file ###############################################################
FROM   ubuntu
 
RUN apt-get update
RUN apt install -y openjdk-8-jdk
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
 
RUN echo 'root:root' |chpasswd
 
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
 
RUN mkdir /root/.ssh
 
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
# Setup JAVA_HOME -- useful for docker commandline
#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
#RUN export JAVA_HOME
 
EXPOSE 22
 
CMD    ["/usr/sbin/sshd", "-D"]




###################################################################
## Save above code as "Dockerfile"
## And execute the following command in command line (From the same folder where "Dockerfile" above reside)
docker build -f Dockerfile . -t <new image name>
 
ex :
docker build -f Dockerfile . -t sshjava
 
 
create containers based on newly created image :
docker run -d -p 21:21 sshjava
 
 

#####################################################################
############ VIM  ###################################################
Open the terminal application in Linux or Unix
Next, open a file in vim / vi, type: vim filename
To save a file in Vim / vi, press Esc key, type :w and hit Enter key
One can save a file and quit vim / Vi by pressing Esc key, type :x and hit Enter key




OOMKilled—Limit Overcommit
Kubernetes uses memory requests to determine on which node to schedule the pod. For example, on a node with 8 GB free RAM, Kubernetes will schedule 10 pods with 800 MB for memory requests, five pods with 1600 MB for requests, or one pod with 8 GB for request, etc. However, limits can (and should) be higher than requests and are not considered for scheduling.

So, for example, you can schedule 10 pods on the same node with 800 MB for memory requests and 1 GB for memory limit. This leads to a situation where some pods may try to use more memory than node capacity.

In this case, Kubernetes may terminate some pods. Because of this, it’s important to understand how Kubernetes decides which pod to kill.

Here is the hierarchy Kubernetes uses to decide which pods to delete:

First, it will terminate pods with neither requests nor limits set.
Second, it will terminate those without limits set.
Next, it terminates pods using more memory than requested (but are within their limit).
Only after the first three types of pods listed have been terminated will Kubernetes terminate pods with both limits and requests set and are currently using less than requested memory.
And this hierarchy is why it’s so important to set the appropriate value for both requests and limits for each workflow.

CPU Requests/Limits
Setting CPU requests and limits isn’t as straightforward as memory, where you can simply define a specific amount of bytes. Kubernetes defines CPU resources as “CPU units.” They equal one vCPU/core for cloud providers and one hyperthread on bare-metal machines. In theory, a CPU request of “1” will allow a container to use one vCPU/core (regardless of whether it’s running on a single-core or 24-core machine). Fractional values are also possible, so a value of “0.5” will allow a container to use half of the core.

However, Kubernetes translates these values under the hood into a proportion of CPU cycles, which means if there’s high CPU usage on the node, there’s no guarantee the container will get as much CPU as it requested. So, it’s really a priority setting.

Unlike memory limits, Kubernetes will not kill a container that tries to use more CPU than its limit. Instead, Kubernetes will only throttle down the process and assign less CPU time to it.

Since CPU requests/limits aren’t absolute value settings but the percentage of the quota, it can be difficult to troubleshoot CPU performance-related issues.



##### Demo pricing  ####################################################



tttgfs104/sssvolh01/zgraph/json/price/

rsync -a -m --include='**/1592419*' --include='*/' --exclude='*'  /data_hdd/mona_test/incr_genre/   tttcb301/sssvols05/ppp/test_scylla/  
 



rsync   -a  tttcb301/sssvols05/ppp/CodeV15/ipl_v2/  tttcb301/sssvols05/ppp/test_code/ipl_v2/   



on ins-101:   



rsync   /data_hdd/mona_test/incr_genre/15934*  

mkdir  /data_hdd/popo01/mona_test/  

rsync -a -m --include='**/1592419*' --include='*/' --exclude='*'  /data_hdd/mona_test/incr_genre/   /data_hdd/popo01/mona_test/  



rsync -a -m --include='**/1592419*' --include='*/' --exclude='*'  /data_hdd/mona_test/incr_genre/   tttcb301/sssvols05/offline/test/ztmp1/



price_inventory.txt.gz  1592734981_price_inventory.txt.gz  1593061681_price_inventory.txt.gz  1593385681_price_inventory.txt.gz
1592411881_price_inventory.txt.gz  1592735881_price_inventory.txt.gz  1593062581_price_inventory.txt.gz  1593386581_price_inventory.txt.gz
1592439781_price_inventory.txt.gz  1592763781_price_inventory.txt.gz  1593090481_price_inventory.txt.gz
(py36) [popo01@ins-101 ztool]$ ls  /data_hdd/mona_test/incr_genre/



ls


tar -zcf  /test_code.tar.gz

tttcb301/sssvols05/ppp/tbin/wheel/qdrant



tar -zcf  /test_code.tar.gz /test_code 


tar -zcf  tttcb301/sssvols05/offline/test/pred/export.tar.gz  tttcb301/sssvols05/offline/test/pred/export/


tar -zcf  tttcb301/sssvols05/offline/test/model/shopid_20200801.tar.gz  tttcb301/sssvols05/offline/test/model/shopid_20200801/



tar -zcf tttcb301/sssvols05/ppp/offline_v14.tar.gz  tttcb301/sssvols05/ppp/CodeV14/offline



#########################################################################
cd   tttcb301/sssvols05/ppp/test_code

cd tttcb301/sssvols05/offline/test/model/
tar -zcf     unit_itemid_20200701.tar.gz   export/unit_itemid_20200701/



tar -zcf     tttcb301/sssvols05/offline/test/model/export/unitfull_itemid_20200507.tar.gz  tttcb301/sssvols05/offline/test/model/unitfull_itemid_20200507/




a/cb301/sssvols05/offline/test/model/unitfull_itemid_20200507/17-RandomForestRegressor_daily/17_2_205_20504_0

mkdir  tttcb301/sssvols05/offline/test/model/export/






tar -zcf     unit_itemid_20200701.tar.gz   export/unit_itemid_20200701/



tar -zcf     unit_itemid_20200701.tar.gz   all/



### Zip folder into nono.tar.gz   ###
tar -zcvf    /data_hdd/popo01/itemaster/pos.tar.gz    kchi/data/pos/





tar -czvf newlarge.tgz largefile.dat





from scipy.sparse import hstack
hstack((X, X2))







#######################################################################
####  Start docker :

docker ps | grep search | awk '{print $1}' | xargs docker stop



docker pull continuumio/miniconda
docker run -i -t continuumio/miniconda /bin/bash

Alternatively, you can start a Jupyter Notebook server and interact with Miniconda via your browser:

docker run -i -t -p 8888:8888 continuumio/miniconda /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"


###by opening http://localhost:8888 in your browser, or http://<DOCKER-MACHINE-IP>:8888 if you are using a Docker Machine VM.




/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8080 --no-browser "



####
docker run -p 8888:8888 -v ~/share:C:C:\D\gitdev\docker_share


jupyter notebook --notebook-dir= ~/notebooks   --ip='*' --port=8080 --no-browser "


docker run -it -p 8000:8000  -v C:/D/gitdev/docker_share:/opt/share  continuumio/miniconda3 /bin/bash 


-c " /opt/conda/bin/jupyter notebook --notebook-dir= ~/notebooks   --ip='*' --port=8000 --no-browser " 





conda install jupyter -y --quiet && mkdir /opt/share && jupyter notebook --notebook-dir= ~/notebooks   --ip='*' --port=8000 --no-browser



/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser""




####### Minconda


wget 





C:\D\gitdev\docker_share


With the directory mounted, go to the Jupyter server and create a new notebook. Rename the notebook from “Unititled” to “Example Notebook”.




/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 


##### SSH keya
Cannot use on SSO server

Authorize your Windows machine to connect
Run one of the following commands, in a local PowerShell window replacing user and host name as appropriate to copy your local public key to the SSH host.

Connecting to a macOS or Linux SSH host:

$USER_AT_HOST="popo01@loginjpe1101z.nnn.jp.local"
$PUBKEYPATH="$HOME\.ssh\id_rsa.pub"

$pubKey=(Get-Content "$PUBKEYPATH" | Out-String); ssh  -m hmac-sha2-512   "$USER_AT_HOST" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '${pubKey}' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

echo '' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
ssh  -m hmac-sha2-512   "$USER_AT_HOST"

######################################################################
####  Bitbucket :

   Login with password
      kevin.noel
      kubo237.


   Need to generate ssh key pairs :
   Transform in ppk files in /.ssh/ file

    In Bitbucket add the key to the account.
      + Add Kevin Noel in the repo access as admin

    In local need to load the key when using Tortoise



tar 


######################################################################
In Pycharm :
(python35) noel:devstreampull2$ git config --global  user.email " kevin.noel@zzz.com"
(python35) noel:devstreampull2$ git config --global user.name   "kevin.noel"


Open VCS on Left, and on right file explorer

OPen terminal   View ---> Tool Windows --->   Terminal   F3

1)   git checkout master

2)  VCS / Git / Merge Changes
        Select current Branches
        Update one by one the giles


3) Confirm the merge

    git add --all
    git commit -m   " Merge XXXX "
    git push --all   origin    master


devfeature --->   feature/stream

devstreaming : Master branch for dev

zdev : Kevin alpha branch



pip install pip==19.2.3




pbr                                5.5.1
pep8                               1.7.1
pexpect                            4.8.0
pickleshare                        0.7.5
Pillow                             6.2.0
pip                                19.2.3



### Build wheel

pip install wheel setuptools

python setup.py bdist_wheel 







https://intelpython.github.io/sdc-doc/latest/examples.html
    

    
#### cmake
    export PATH="tttcb301/sssvols05/ppp/tbin/build/cmake_run/bin:$PATH"
        
    
    pip install absolute_path_to_seaborn.tar.gz  
    
  pip install    --no-index file://tttcb301/sssvols05/ppp/tbin/wheel/pqkmeans/pqkmeans-1.0.5.tar.gz --no-deps


  pip install  --no-index  --no-deps  tttcb301/sssvols05/ppp/tbin/wheel/pqkmeans/pqkmeans-1.0.5-cp37-cp37m-linux_x86_64.whl



  pip install  --no-index --no-deps  tttcb301/sssvols05/ppp/tbin/wheel/pqkmeans/texmex_python-1.0.0.tar.gz

    
    
--no-index --find-links




#### iterator encoding:
### reading gzip
f = gzip.open(path, 'rb')
vec_iterator = texmex_python.reader.read_bvec_iter(f)
Then, you can read each SIFT vector one by one using a usual for-loop access, e.g., "for v in vec_iterator: ...". Note that you do not need to read all data at once, which would require 97.9 GB of memory space.


learn_data, _ = pqkmeans.evaluation.get_siftsmall_dataset()
M = 4

  
    
encoder = pqkmeans.encoder.PQEncoder(num_subdim=M, Ks=256)
encoder.fit(learn_data)

pqcode_generator = encoder.transform_generator(vec_iterator)



# Train a PQ encoder.
# Each vector is divided into 4 parts and each part is
# encoded with log256 = 8 bit, resulting in a 32 bit PQ code.




#### Install using 101

cp /root/.cache/pip/wheels/84/30/eb/cd5ac76ab58690867d28c9819022a65da38211ae1b22d36745/pqkmeans-1.0.5-cp37-cp37m-linux_x86_64.whl  tttcb301/sssvols05/ppp/tbin/wheel/pqkmeans/



  pip install    tttcb301/sssvols05/ppp/tbin/wheel/pqkmeans/pqkmeans-1.0.5-cp37-cp37m-linux_x86_64.whl

    
    

Processing ./pqkmeans-1.0.5.tar.gz
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Installing backend dependencies ... done
    Preparing wheel metadata ... done
Building wheels for collected packages: pqkmeans
  Building wheel for pqkmeans (PEP 517) ... done
  Created wheel for pqkmeans: filename=pqkmeans-1.0.5-cp37-cp37m-linux_x86_64.whl size=222100 sha256=25e28433099ec41b13eb7524bf36e1db227e4451e6b53ab95361c048f974dfcd
  Stored in directory: /root/.cache/pip/wheels/84/30/eb/cd5ac76ab58690867d28c9819022a65da38211ae1b22d36745
Successfully built pqkmeans
Installing collected packages: pqkmeans
Successfully installed pqkmeans-1.0.5


    
    numpy
scikit-learn
pipe
scipy
six
texmex_python==1.0.0
    
























###############################################################################
########## Conda install ######################################################
pip install tensorflow==2.6.0 tensorflow-hub==0.12.0 tensorflow-text==2.6.0  numpy==1.19.2 six==1.15.0 ujson==1.35 umap-learn==0.5.1 numba==0.53.1 dirty-cat==0.2.0 diskcache==5.2.1 editdistance==0.6.0 hdbscan==0.8.27 gensim==4.1.2 scikit-learn==0.24.2 utilmy cassandra-driver==3.14.0 lightgbm==3.3.1 mmh3==2.5.1 ipykernel==5.1.2 jupyter_console ipython==7.15.0 scipy==1.4.1 fastparquet==0.7.1 pyarrow==0.17.0 psutil==5.8.0 pandas==1.3.2 matplotlib==3.1.1 python-box==5.4.1

### no MKL version
tensorflow==2.6.0  
tensorflow-hub==0.12.0  
tensorflow-text==2.6.0 
faiss-cpu==1.7.1  
numpy==1.19.2 
six==1.15.0  
ujson==1.35  
umap-learn==0.5.1  
numba==0.53.1 
dirty-cat==0.2.0 
diskcache==5.2.1 
editdistance==0.6.0 
hdbscan==0.8.27 
gensim==4.1.2  
scikit-learn==0.24.2  
utilmy  
cassandra-driver==3.14.0  
lightgbm==3.3.1  
mmh3==2.5.1  
ipykernel==5.1.2 
jupyter_console 
ipython==7.15.0 
scipy==1.4.1 
fastparquet==0.7.1  
pyarrow==0.17.0 
psutil==5.8.0  
pandas==1.3.2 
matplotlib==3.1.1 
python-box==5.4.1  
msgpack==0.6.1

#### need conda
conda install -c pytorch blas faiss-cpu  libfaiss libopenblas  --no-deps



mkl-fft==1.0.14
mkl-random==1.1.0
mkl-service==2.3.0



tensorboard==2.7.0
tensorboard-data-server==0.6.1
tensorboard-plugin-wit==1.8.0
tensorflow==2.6.0
tensorflow-estimator==2.6.0
tensorflow-hub==0.12.0
tensorflow-text==2.6.0

##################################################
### MKL version
pip install tensorflow==2.6.0 tensorflow-hub==0.12.0 tensorflow-text==2.6.0 six==1.15.0 ujson==1.35 umap-learn==0.5.1 numba==0.53.1 dirty-cat==0.2.0 diskcache==5.2.1 editdistance==0.6.0 hdbscan==0.8.27 gensim==4.1.2 utilmy cassandra-driver==3.14.0 lightgbm==3.3.1 mmh3==2.5.1 ipykernel==5.1.2 jupyter_console ipython==7.15.0 fastparquet==0.7.1 pyarrow==0.17.0 psutil==5.8.0 matplotlib==3.1.1 python-box==5.4.1 msgpack==0.6.1 fire pipe==1.6.0



tensorflow==2.6.0  
tensorflow-hub==0.12.0  
tensorflow-text==2.6.0 
six==1.15.0  
ujson==1.35  
umap-learn==0.5.1  
numba==0.53.1 
dirty-cat==0.2.0 
diskcache==5.2.1 
editdistance==0.6.0 
hdbscan==0.8.27 
gensim==4.1.2  
utilmy  
cassandra-driver==3.14.0  
lightgbm==3.3.1  
mmh3==2.5.1  
ipykernel==5.1.2 
jupyter_console 
ipython==7.15.0 
fastparquet==0.7.1  
pyarrow==0.17.0 
psutil==5.8.0  
matplotlib==3.1.1 
python-box==5.4.1  
msgpack==0.6.1
fire 
pipe==1.6.0 


conda install -c pytorch blas faiss-cpu  libfaiss libopenblas  --no-deps



#### MKL version
https://www.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/top/installation/install-using-package-managers/pip.html




mkdir -p  /dd/101/sssvols07/ndata/zconda/py37_tf26/ && 
conda pack -o /dd/101/sssvols07/ndata/zconda/py37_tf26/envbig.tar.gz

pip freeze > /dd/101/sssvols07/ndata/zconda/py37_tf26/piplist.py
conda export 


conda install -c pytorch blas faiss-cpu  libfaiss libopenblas  --no-deps

    blas-1.0                   |         openblas          46 KB
    faiss-cpu-1.7.1            |py3.6_h2a577fa_1_cpu         1.7 MB  pytorch
    libfaiss-1.7.1             |   h2bc3f7f_1_cpu         2.0 MB  pytorch
    libopenblas-0.3.13         |       h4367d64_0         4.8 MB
    numpy-1.17.0               |   py36h99e49ec_0          24 KB
    numpy-base-1.17.0          |   py36h2f8d375_0         5.2 MB


conda install -c pytorch intel-openmp libgfortran-ng libgfortran4  mkl

  intel-openmp       pkgs/main/linux-64::intel-openmp-2021.3.0-h06a4308_3350
  libgfortran-ng     pkgs/main/linux-64::libgfortran-ng-7.5.0-ha8ba4b0_17
  libgfortran4       pkgs/main/linux-64::libgfortran4-7.5.0-ha8ba4b0_17
  mkl                pkgs/main/linux-64::mkl-2021.3.0-h06a4308_520
  numpy              pkgs/r/linux-64::numpy-1.17.0-py36h99e49ec_0
  numpy-base         pkgs/r/linux-64::numpy-base-1.17.0-py36h2f8d375_0



xcopy "C:/D/" "C:/z/" /t /e




absl-py==0.15.0
alabaster==0.7.12
anaconda-client==1.7.2
anaconda-navigator==1.9.7
anaconda-project==0.8.3
aogcommon==0.1.1
asn1crypto==1.0.1
astor==0.8.1
astroid==2.3.1
astropy==3.2.2
astunparse==1.6.3
atomicwrites==1.3.0
attrs==19.2.0
Babel==2.7.0
backcall==0.1.0
backports.functools-lru-cache==1.6.4
backports.os==0.1.1
backports.shutil-get-terminal-size==1.0.0
backports.tempfile==1.0
backports.weakref==1.0.post1
bcrypt==3.1.7
beautifulsoup4==4.8.0
bitarray==1.0.1
bkcharts==0.2
bleach==4.1.0
blosc==1.8.3
bokeh==1.3.4
boto==2.49.0
boto3==1.13.22
botocore==1.16.22
Bottleneck==1.2.1
cached-property==1.5.2
cachetools==4.1.0
cassandra-driver==3.14.0
category-encoders==2.3.0
certifi==2020.4.5.1
cffi==1.14.0
chardet==3.0.4
clang==5.0
Click==7.0
cloudpickle==1.2.2
clyent==1.2.2
colorama==0.4.1
conda==4.10.3
conda-build==3.18.9
conda-package-handling==1.6.0
conda-verify==3.4.2
contextlib2==0.6.0
convertdate==2.3.2
couchbase==2.5.10
cramjam==2.3.2
cryptography==2.9.2
cycler==0.10.0
Cython==0.29.13
cytoolz==0.10.0
dask==2021.8.1
datasketch==1.5.3
decorator==4.4.2
defusedxml==0.6.0
dill==0.3.4
dirty-cat==0.2.0
diskcache==5.2.1
distributed==2.5.2
docutils==0.15.2
editdistance==0.6.0
entrypoints==0.3
et-xmlfile==1.0.1
faiss==1.7.1
fastcache==1.1.0
fastparquet==0.7.1
filelock==3.0.12
fire==0.4.0
Flask==1.1.1
flatbuffers==1.12
fsspec==0.7.4
future==0.18.2
gast==0.4.0
gensim==4.1.2
gevent==1.4.0
glob2==0.7
gmpy2==2.0.8
google-auth==1.16.0
google-auth-oauthlib==0.4.1
google-pasta==0.2.0
greenlet==0.4.15
grpcio==1.41.1
h5py==3.1.0
halo==0.0.31
hdbscan==0.8.27
HeapDict==1.0.1
hijri-converter==2.2.2
holidays==0.11.3.1
html5lib==1.0.1
idna==2.9
imageio==2.6.0
imagesize==1.1.0
importlib-metadata==1.6.0
ipykernel==5.1.2
ipython==7.15.0
ipython-genutils==0.2.0
ipython-sql==0.3.9
ipywidgets==7.5.1
isort==4.3.21
itsdangerous==1.1.0
jdcal==1.4.1
jedi==0.17.0
jeepney==0.4.1
Jinja2==2.10.3
jmespath==0.10.0
joblib==1.1.0
json5==0.8.5
jsonschema==3.0.2
jupyter==1.0.0
jupyter-client==5.3.3
jupyter-console==6.0.0
jupyter-core==4.5.0
jupyterlab==1.1.4
jupyterlab-server==1.0.6
keras==2.6.0
Keras-Applications==1.0.8
Keras-Preprocessing==1.1.2
keyring==18.0.0
kiwisolver==1.1.0
korean-lunar-calendar==0.2.1
kubernetes==10.0.1
lazy-object-proxy==1.4.2
libarchive-c==2.8
lief==0.9.0
lightgbm==3.3.1
llvmlite==0.36.0
locket==0.2.0
log-symbols==0.0.14
loguru==0.5.3
lxml==4.4.1
Markdown==3.2.2
MarkupSafe==1.1.1
matplotlib==3.1.1
mccabe==0.6.1
mecab-python3==0.996.2
mistune==0.8.4
mkl-fft==1.0.14
mkl-random==1.1.0
mkl-service==2.3.0
mmh3==2.5.1
mock==3.0.5
more-itertools==7.2.0
mpld3==0.5.5
mpmath==1.1.0
msgpack==0.6.1
multipledispatch==0.6.0
navigator-updater==0.2.1
nbconvert==5.6.0
nbformat==4.4.0
networkx==2.3
nltk==3.4.5
nose==1.3.7
notebook==6.0.1
numba==0.53.1
numexpr==2.7.0
numpy==1.19.2
numpydoc==0.9.1
oauthlib==3.1.0
olefile==0.46
opencv-python==4.5.3.56
openpyxl==3.0.0
opt-einsum==3.3.0
packaging==21.0
pandas==1.3.2
pandocfilters==1.4.2
paramiko==2.7.1
parquet-metadata==0.0.1
parquet-tools==0.2.0
parso==0.7.0
partd==1.0.0
path.py==12.0.1
pathlib2==2.3.5
patsy==0.5.1
pep8==1.7.1
pexpect==4.8.0
pickleshare==0.7.5
Pillow==6.2.0
pip-check-reqs==2.3.2
pipe==1.6.0
pkginfo==1.5.0.1
pluggy==0.13.0
ply==3.11
pqkmeans==1.0.5
pretty-html-table==0.9.14
prettytable==0.7.2
prometheus-client==0.7.1
prompt-toolkit==3.0.5
protobuf==3.10.0
psutil==5.8.0
psycopg2-binary==2.8.3
ptyprocess==0.6.0
py==1.8.0
pyarrow==0.17.0
pyasn1==0.4.8
pyasn1-modules==0.2.8
pycodestyle==2.5.0
pycosat==0.6.3
pycparser==2.20
pycrypto==2.6.1
pycurl==7.43.0.3
pyflakes==2.1.1
Pygments==2.6.1
PyHive==0.6.2
pyinstrument==4.0.4
pylint==2.4.2
PyMeeus==0.5.11
PyNaCl==1.4.0
pynndescent==0.5.4
pyod==0.9.5
pyodbc==4.0.27
pyOpenSSL==19.0.0
pyparsing==2.4.2
PyQt5==5.12.3
PyQt5-sip==12.9.0
PyQtWebEngine==5.12.1
pyrsistent==0.15.4
PySocks==1.7.1
pytest==5.2.1
pytest-arraydiff==0.3
pytest-astropy==0.5.0
pytest-doctestplus==0.4.0
pytest-openfiles==0.4.0
pytest-remotedata==0.3.2
python-box==5.4.1
python-dateutil==2.8.1
python-highcharts==0.4.2
python-snappy==0.5.4
pytz==2020.1
PyWavelets==1.0.3
PyYAML==5.3.1
pyzmq==18.1.0
QtAwesome==0.6.0
qtconsole==4.5.5
QtPy==1.9.0
rapidfuzz==1.8.2
redis==3.3.8
redis-py-cluster==2.0.0
requests==2.23.0
requests-oauthlib==1.3.0
roaringbitmap==0.7
rope==0.14.0
rsa==4.0
ruamel-yaml==0.15.46
s3fs==0.4.0
s3transfer==0.3.3
sasl==0.2.1
scikit-image==0.15.0
scikit-learn==0.24.2
scipy==1.4.1
seaborn==0.9.0
SecretStorage==3.1.1
Send2Trash==1.5.0
sentencepiece==0.1.95
simplegeneric==0.8.1
simplejson==3.16.0
simpleneighbors==0.1.0
singledispatch==3.4.0.3
six==1.15.0
smart-open==5.2.1
snowballstemmer==2.0.0
sortedcollections==1.1.2
sortedcontainers==2.1.0
soupsieve==1.9.3
Sphinx==2.2.0
sphinxcontrib-applehelp==1.0.1
sphinxcontrib-devhelp==1.0.1
sphinxcontrib-htmlhelp==1.0.2
sphinxcontrib-jsmath==1.0.1
sphinxcontrib-qthelp==1.0.2
sphinxcontrib-serializinghtml==1.1.3
sphinxcontrib-websupport==1.1.2
spinners==0.0.24
spyder-kernels==0.5.2
SQLAlchemy==1.3.17
sqlparse==0.3.1
statsmodels==0.10.1
stdlib-list==0.8.0
swifter==1.0.9
sympy==1.4
tables==3.5.2
tabulate==0.8.9
tblib==1.4.0
tenacity==8.0.1
tensorboard==2.7.0
tensorboard-data-server==0.6.1
tensorboard-plugin-wit==1.8.0
tensorflow==2.6.0
tensorflow-estimator==2.6.0
tensorflow-hub==0.12.0
tensorflow-text==2.6.0
termcolor==1.1.0
terminado==0.8.2
testpath==0.4.2
texmex-python==1.0.0
threadpoolctl==2.2.0
thrift==0.13.0
thrift-sasl==0.4.2
toolz==0.10.0
tornado==6.0.3
tqdm==4.36.1
traitlets==4.3.3
typed-ast==1.4.3
typing-extensions==3.7.4.3
ujson==1.35
umap-learn==0.5.1
unicodecsv==0.14.1
urllib3==1.25.9
utilmy==0.1.16362544
utils==0.9.0
wcwidth==0.2.3
webencodings==0.5.1
websocket-client==0.57.0
Werkzeug==1.0.1
wget==3.2
widgetsnbextension==3.5.1
wrapt==1.12.1
wurlitzer==1.0.3
xlrd==1.2.0
XlsxWriter==1.2.1
xlwt==1.3.0
zict==1.0.0
zipp==3.1.0


absl-py==0.15.0
alabaster==0.7.12
anaconda-client==1.7.2
anaconda-navigator==1.9.7
anaconda-project==0.8.3
aogcommon==0.1.1
asn1crypto==1.0.1
astor==0.8.1
astroid==2.3.1
astropy==3.2.2
astunparse==1.6.3
atomicwrites==1.3.0
attrs==19.2.0
Babel==2.7.0
backcall==0.1.0
backports.functools-lru-cache==1.6.4
backports.os==0.1.1
backports.shutil-get-terminal-size==1.0.0
backports.tempfile==1.0
backports.weakref==1.0.post1
bcrypt==3.1.7
beautifulsoup4==4.8.0
bitarray==1.0.1
bkcharts==0.2
bleach==4.1.0
blosc==1.8.3
bokeh==1.3.4
boto==2.49.0
boto3==1.13.22
botocore==1.16.22
Bottleneck==1.2.1
cached-property==1.5.2
cachetools==4.1.0
cassandra-driver==3.14.0
category-encoders==2.3.0
certifi==2020.4.5.1
cffi==1.14.0
chardet==3.0.4
clang==5.0
Click==7.0
cloudpickle==1.2.2
clyent==1.2.2
colorama==0.4.1
conda==4.10.3
conda-build==3.18.9
conda-package-handling==1.6.0
conda-verify==3.4.2
contextlib2==0.6.0
convertdate==2.3.2
couchbase==2.5.10
cramjam==2.3.2
cryptography==2.9.2
cycler==0.10.0
Cython==0.29.13
cytoolz==0.10.0
dask==2021.8.1
datasketch==1.5.3
decorator==4.4.2
defusedxml==0.6.0
dill==0.3.4
dirty-cat==0.2.0
diskcache==5.2.1
distributed==2.5.2
docutils==0.15.2
editdistance @ file:///home/popo01/test_code/recsys/wheel/editdistance-0.6.0-cp37-cp37m-manylinux2010_x86_64.whl
entrypoints==0.3
et-xmlfile==1.0.1
faiss==1.7.1
fastcache==1.1.0
fastparquet==0.7.1
filelock==3.0.12
fire==0.4.0
Flask==1.1.1
flatbuffers==1.12
fsspec==0.7.4
future==0.18.2
gast==0.4.0
gensim==4.1.2
gevent==1.4.0
glob2==0.7
gmpy2==2.0.8
google-auth==1.16.0
google-auth-oauthlib==0.4.1
google-pasta==0.2.0
greenlet==0.4.15
grpcio==1.41.1
h5py==3.1.0
halo==0.0.31
hdbscan==0.8.27
HeapDict==1.0.1
hijri-converter==2.2.2
holidays==0.11.3.1
html5lib==1.0.1
idna==2.9
imageio==2.6.0
imagesize==1.1.0
importlib-metadata==1.6.0
ipykernel==5.1.2
ipython==7.15.0
ipython-sql==0.3.9
ipython_genutils==0.2.0
ipywidgets==7.5.1
isort==4.3.21
itsdangerous==1.1.0
jdcal==1.4.1
jedi==0.17.0
jeepney==0.4.1
Jinja2==2.10.3
jmespath==0.10.0
joblib==1.1.0
json5==0.8.5
jsonschema==3.0.2
jupyter==1.0.0
jupyter-client==5.3.3
jupyter-console==6.0.0
jupyter-core==4.5.0
jupyterlab==1.1.4
jupyterlab-server==1.0.6
keras==2.6.0
Keras-Applications==1.0.8
Keras-Preprocessing==1.1.2
keyring==18.0.0
kiwisolver==1.1.0
korean-lunar-calendar==0.2.1
kubernetes==10.0.1
lazy-object-proxy==1.4.2
libarchive-c==2.8
lief==0.9.0
lightgbm==3.3.1
llvmlite==0.36.0
locket==0.2.0
log-symbols==0.0.14
loguru==0.5.3
lxml==4.4.1
Markdown==3.2.2
MarkupSafe==1.1.1
matplotlib==3.1.1
mccabe==0.6.1
mecab-python3==0.996.2
mistune==0.8.4
mkl-fft==1.0.14
mkl-random==1.1.0
mkl-service==2.3.0
mmh3==2.5.1
mock==3.0.5
more-itertools==7.2.0
mpld3==0.5.5
mpmath==1.1.0
msgpack==0.6.1
multipledispatch==0.6.0
navigator-updater==0.2.1
nbconvert==5.6.0
nbformat==4.4.0
networkx==2.3
nltk==3.4.5
nose==1.3.7
notebook==6.0.1
numba==0.53.1
numexpr==2.7.0
numpy==1.19.2
numpydoc==0.9.1
oauthlib==3.1.0
olefile==0.46
opencv-python==4.5.3.56
openpyxl==3.0.0
opt-einsum==3.3.0
packaging==21.0
pandas==1.3.2
pandocfilters==1.4.2
paramiko==2.7.1
parquet-metadata==0.0.1
parquet-tools==0.2.0
parso==0.7.0
partd==1.0.0
path.py==12.0.1
pathlib2==2.3.5
patsy==0.5.1
pep8==1.7.1
pexpect==4.8.0
pickleshare==0.7.5
Pillow==6.2.0
pip-check-reqs==2.3.2
pkginfo==1.5.0.1
pluggy==0.13.0
ply==3.11
pretty-html-table==0.9.14
prettytable==0.7.2
prometheus-client==0.7.1
prompt-toolkit==3.0.5
protobuf==3.10.0
psutil==5.8.0
psycopg2-binary==2.8.3
ptyprocess==0.6.0
py==1.8.0
pyarrow==0.17.0
pyasn1==0.4.8
pyasn1-modules==0.2.8
pycodestyle==2.5.0
pycosat==0.6.3
pycparser==2.20
pycrypto==2.6.1
pycurl==7.43.0.3
pyflakes==2.1.1
Pygments==2.6.1
PyHive==0.6.2
pyinstrument==4.0.4
pylint==2.4.2
PyMeeus==0.5.11
PyNaCl==1.4.0
pynndescent==0.5.4
pyod==0.9.5
pyodbc==4.0.27
pyOpenSSL==19.0.0
pyparsing==2.4.2
PyQt5==5.12.3
PyQt5-sip==12.9.0
PyQtWebEngine==5.12.1
pyrsistent==0.15.4
PySocks==1.7.1
pytest==5.2.1
pytest-arraydiff==0.3
pytest-astropy==0.5.0
pytest-doctestplus==0.4.0
pytest-openfiles==0.4.0
pytest-remotedata==0.3.2
python-box==5.4.1
python-dateutil==2.8.1
python-highcharts==0.4.2
python-snappy==0.5.4
pytz==2020.1
PyWavelets==1.0.3
PyYAML==5.3.1
pyzmq==18.1.0
QtAwesome==0.6.0
qtconsole==4.5.5
QtPy==1.9.0
rapidfuzz==1.8.2
redis==3.3.8
redis-py-cluster==2.0.0
requests==2.23.0
requests-oauthlib==1.3.0
roaringbitmap==0.7
rope==0.14.0
rsa==4.0
ruamel_yaml==0.15.46
s3fs==0.4.0
s3transfer==0.3.3
sasl==0.2.1
scikit-image==0.15.0
scikit-learn==0.24.2
scipy==1.4.1
seaborn==0.9.0
SecretStorage==3.1.1
Send2Trash==1.5.0
sentencepiece==0.1.95
simplegeneric==0.8.1
simplejson==3.16.0
simpleneighbors @ file://tttcb301/sssvols05/ppp/tbin/wheel/simpleneighbors-0.1.0-py2.py3-none-any.whl
singledispatch==3.4.0.3
six==1.15.0
smart-open==5.2.1
snowballstemmer==2.0.0
sortedcollections==1.1.2
sortedcontainers==2.1.0
soupsieve==1.9.3
Sphinx==2.2.0
sphinxcontrib-applehelp==1.0.1
sphinxcontrib-devhelp==1.0.1
sphinxcontrib-htmlhelp==1.0.2
sphinxcontrib-jsmath==1.0.1
sphinxcontrib-qthelp==1.0.2
sphinxcontrib-serializinghtml==1.1.3
sphinxcontrib-websupport==1.1.2
spinners==0.0.24
spyder-kernels==0.5.2
SQLAlchemy==1.3.17
sqlparse==0.3.1
statsmodels==0.10.1
stdlib-list==0.8.0
swifter==1.0.9
sympy==1.4
tables==3.5.2
tabulate==0.8.9
tblib==1.4.0
tenacity==8.0.1
tensorboard==2.7.0
tensorboard-data-server==0.6.1
tensorboard-plugin-wit==1.8.0
tensorflow==2.6.0
tensorflow-estimator==2.6.0
tensorflow-hub==0.12.0
tensorflow-text==2.6.0
termcolor==1.1.0
terminado==0.8.2
testpath==0.4.2
threadpoolctl==2.2.0
thrift==0.13.0
thrift-sasl==0.4.2
toolz==0.10.0
tornado==6.0.3
tqdm==4.36.1
traitlets==4.3.3
typed-ast==1.4.3
typing-extensions==3.7.4.3
ujson==1.35
umap-learn==0.5.1
unicodecsv==0.14.1
urllib3==1.25.9
utilmy==0.1.16362544
utils==0.9.0
wcwidth==0.2.3
webencodings==0.5.1
websocket-client==0.57.0
Werkzeug==1.0.1
wget==3.2
widgetsnbextension==3.5.1
wrapt==1.12.1
wurlitzer==1.0.3
xlrd==1.2.0
XlsxWriter==1.2.1
xlwt==1.3.0
zict==1.0.0
zipp==3.1.0




############ Conda  hnsw pacakge with filtering  ##################################

The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    numpy-1.16.6               |   py37h2d18471_3          50 KB
    numpy-base-1.16.6          |   py37hdc34a94_3         3.5 MB
    ------------------------------------------------------------
                                           Total:         3.6 MB

The following NEW packages will be INSTALLED:

  blas               pkgs/main/linux-64::blas-1.0-mkl
  intel-openmp       pkgs/main/linux-64::intel-openmp-2021.4.0-h06a4308_3561
  libgfortran-ng     pkgs/main/linux-64::libgfortran-ng-7.3.0-hdf63c60_0
  mkl                pkgs/main/linux-64::mkl-2021.4.0-h06a4308_640
  mkl-service        pkgs/main/linux-64::mkl-service-2.4.0-py37h7f8727e_0
  mkl_fft            pkgs/main/linux-64::mkl_fft-1.3.1-py37hd3c417c_0
  mkl_random         pkgs/main/linux-64::mkl_random-1.2.2-py37h51133e4_0
  numpy              pkgs/main/linux-64::numpy-1.16.6-py37h2d18471_3
  numpy-base         pkgs/main/linux-64::numpy-base-1.16.6-py37hdc34a94_3
  six                pkgs/main/noarch::six-1.16.0-pyhd3eb1b0_0


Proceed ([y]/n)? y


print('start')
import hnswlib
import numpy as np
import pickle

dim = 8
num_elements = 10

# Generating sample data
data = np.float32(np.random.random((num_elements, dim)))
ids = np.arange(num_elements)

# We split the data in two batches:
data1 = data[:num_elements // 2]
data2 = data[num_elements // 2:]


# Declaring index
p = hnswlib.Index(space = 'l2', dim = dim) # possible options are l2, cosine or ip
print(p)

# Initializing index - the maximum number of elements should be known beforehand
p.init_index(max_elements = num_elements, ef_construction = 200, M = 16)

# Element insertion (can be called several times):
p.add_items(data1)
                     

p.init_index(max_elements=num_elements//2, ef_construction=100, M=16)

# Controlling the recall by setting ef:
# higher ef leads to better accuracy, but slower search
p.set_ef(10)

# Set number of threads used during batch search/construction
# By default using all available cores
p.set_num_threads(4)


print("Adding first batch of %d elements" % (len(data1)))
p.add_items(data1)

# Query the elements for themselves and measure recall:
labels, distances = p.knn_query(data1, k=1)
labels = np.array(labels)
print("Recall for the first batch:", np.mean(labels.reshape(-1) == np.arange(len(data1))), "\n")

# Serializing and deleting the index:
index_path='first_half.bin'
print("Saving index to '%s'" % index_path)
p.save_index("first_half.bin")
del p

# Re-initializing, loading the index
p = hnswlib.Index(space='l2', dim=dim)  # the space can be changed - keeps the data, alters the distance function.

print("\nLoading index from 'first_half.bin'\n")

# Increase the total capacity (max_elements), so that it will handle the new data
p.load_index("first_half.bin", max_elements = num_elements)

print("Adding the second batch of %d elements" % (len(data2)))
p.add_items(data2)

# Query the elements for themselves and measure recall:
labels, distances = p.knn_query(data, k=5)
labels = np.array(labels)
print("Recall for two batches:", np.mean(labels.reshape(-1) == np.arange(len(data))), "\n")










HUE password

popo01
miekubo237.






###################################################################################
###################################################################################
skein  hadoop launcher driver stop


#### Launch server skein
cd a/cb301/sssvols05/ppp/tbin/wheel/skein

skein driver start --keytab /usr/local/hdp26/keytabs/ppp.nnn.keytab --principal ppp   --log /dd/101/sssvols07/ndata/cpa/log/log_skein/log.py  &







#### ipykernel on yarn
https://jcristharif.com/skein/recipes-ipython-kernel.html







#### Launch app
a/cb301/sssvols05/ppp/tbin/wheel/skein
 skein application submit test2.yaml

    max RAM 200 Gb, Max CPU cores: 32


####        
 skein application ls

    
    
#### Conda Env    ################################
    conda create -n test python=3.7.4
    conda install -c conda-forge conda-pack 

### pip is corrupted
pip install  ../pip-19.2.3-py2.py3-none-any.whl


  pip install  pandas numpy fire python-box


    
    
    

cd a/cb301/sssvols05/ppp/tbin/wheel/skein

 skein application submit test.yaml

    max RAM 200 Gb, Max CPU cores: 32


        

skein driver restart¶
Restart the skein driver

usage: skein driver restart [--keytab PATH] [--principal PRINCIPAL]
                            [--log LOG] [--log-level LOG_LEVEL]
                            [--java-option JAVA_OPTIONS] [--help]
--keytab <path>
Path to a keytab file to use when starting the driver. If not provided, the driver will login using the ticket cache instead.

--principal <principal>
The principal to use when starting the driver with a keytab.

--log <log>
If provided, the driver will write logs here.

--log-level <log_level>
The driver log level, default is INFO

--java-option <java_options>
Forward a Java option to the driver, can be used multiple times.

--help, -h
Show this help message then exit



skein driver restart --keytab /usr/local/hdp26/keytabs/ppp.nnn.keytab --principal ppp   --log /dd/101/sssvols07/ndata/cpa/log/log_skein/log.py  






skein application submit test.yaml

application_1638177492250_1304103





# Create a new demo environment (output trimmed for brevity)
$ conda create -n ipython-demo
...

# Activate the environment
$ conda activate ipython-demo

# Install the needed packages (output trimmed for brevity)
$ conda install conda-pack skein ipykernel numpy jupyter_console -c conda-forge
...

# Package the environment into environment.tar.gz
$ conda pack -o environment.tar.gz
Collecting packages...
Packing environment at '/home/jcrist/miniconda/envs/ipython-demo' to 'environment.tar.gz'
[########################################] | 100% Completed | 35.3s
    
    
master:
  resources:
    memory: 2 GiB
    vcores: 1
  files:
    conda_env: env.tar.gz
    data.csv: hdfs:///path/to/some/data.csv
  script: |
    source conda_env/bin/activate
    start-jupyter-notebook-and-register-address  # pseudocode

    
#### Remote Kernal on YARN

https://jcristharif.com/skein/recipes-ipython-kernel.html
    
    
  
    
    # Install dependencies
$ conda install -c conda-forge grpcio protobuf cryptography pyyaml

# Install grpcio-tools (not on conda-forge currently)
 pip install grpcio-tools  grpcio protobuf cryptography pyyaml
    

    
    
    
    

Log Type: directory.info

Log Upload Time: Mon Dec 27 01:09:09 +0000 2021

Log Length: 921

ls -l:
total 16
-rw------- 1 ppp yarn  398 Dec 27 01:06 container_tokens
-rwx------ 1 ppp yarn 5205 Dec 27 01:06 launch_container.sh
drwxr-s--- 2 ppp yarn 4096 Dec 27 01:06 tmp
find -L . -maxdepth 5 -ls:
93323388    4 drwxr-s---   3 ppp  yarn         4096 Dec 27 01:06 .
93323394    4 -r-x------   1 ppp  ppp      1013 Dec 27 01:06 ./.skein.crt
6167023    4 -r-x------   1 ppp  ppp       736 Dec 27 01:06 ./.skein.proto
93323473    4 drwxr-s---   2 ppp  yarn         4096 Dec 27 01:06 ./tmp
93323521    8 -rwx------   1 ppp  yarn         5205 Dec 27 01:06 ./launch_container.sh
93323391 7660 -r-x------   1 ppp  ppp   7842343 Dec 27 01:06 ./.skein.jar
93323525    4 -rw-------   1 ppp  yarn          398 Dec 27 01:06 ./container_tokens
6167020    4 -r-x------   1 ppp  ppp      1704 Dec 27 01:06 ./.skein.pem
broken symlinks(find -L . -maxdepth 5 -type l -ls):

    


 Showing 4096 bytes. Click here for full log

     15T   12T  2.6T  83% /var/hadoop/vol08
/dev/sdl1        15T   12T  2.6T  83% /var/hadoop/vol11
/var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1316585/container_e105_1638177492250_1316585_01_000001/conda_env/bin/python
<module 'os' from '/var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1316585/container_e105_1638177492250_1316585_01_000001/conda_env/lib/python3.7/os.py'> <module 'pandas' from '/var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1316585/container_e105_1638177492250_1316585_01_000001/conda_env/lib/python3.7/site-packages/pandas/__init__.py'> <module 'numpy' from '/var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1316585/container_e105_1638177492250_1316585_01_000001/conda_env/lib/python3.7/site-packages/numpy/__init__.py'>
/bin/conda
check hadoop access
/bin/hadoop
21/12/27 06:42:54 DEBUG ipc.ProtobufRpcEngine: Call: getFileInfo took 119ms
21/12/27 06:42:54 DEBUG ipc.ProtobufRpcEngine: Call: getListing took 24ms
Found 9 items
drwxr-xr-x   - ppp ppp          0 2021-03-31 00:48 /user/ppp/nono/quantity_extract/hive
drwxr-xr-x   - ppp ppp          0 2021-03-24 14:46 /user/ppp/nono/quantity_extract/z_brand_aog_export_clean_v01.parquet
drwxr-xr-x   - ppp ppp          0 2020-12-28 08:01 /user/ppp/nono/quantity_extract/z_m_item_aog_export.parquet
drwxr-xr-x   - ppp ppp          0 2020-12-28 08:09 /user/ppp/nono/quantity_extract/z_m_item_aog_export_100k.parquet
drwxr-xr-x   - ppp ppp          0 2020-12-28 15:40 /user/ppp/nono/quantity_extract/z_m_item_aog_export_clean_v01.parquet
-rw-r--r--   3 ppp ppp      31036 2021-02-28 08:50 /user/ppp/nono/quantity_extract/ztest_100k.parquet
drwxr-xr-x   - ppp ppp          0 2021-03-17 01:59 /user/ppp/nono/quantity_extract/ztest_1k.parquet
drwxr-xr-x   - ppp ppp          0 2021-05-26 13:56 /user/ppp/nono/quantity_extract/zz_z_order_itemtag_202105.parquet

systemd
ls: cannot access conda_env/data/: No such file or directory
total 24
lrwxrwxrwx 1 ppp yarn  111 Dec 27 06:42 conda_env -> /var/hadoop/ssd02/yarn/nm/usercache/ppp/appcache/application_1638177492250_1316585/filecache/10/test.tar.gz
-rw------- 1 ppp yarn  398 Dec 27 06:42 container_tokens
-rwx------ 1 ppp yarn 5671 Dec 27 06:42 launch_container.sh
lrwxrwxrwx 1 ppp yarn  108 Dec 27 06:42 start.sh -> /var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1316585/filecache/13/start.sh
drwxr-s--- 3 ppp yarn 4096 Dec 27 06:42 tmp
total 7972
lrwxrwxrwx.    1 root root       7 Sep  5  2018 bin -> usr/bin
dr-xr-xr-x.    5 root root    4096 Dec  2  2020 boot
drwxr-xr-x    19 root root    3940 Apr 14  2021 dev
drwxr-xr-x.   16 root root    4096 Dec  2  2020 usr
drwxr-xr-x.   22 root root    4096 Dec  2  2020 var
sleep 100sec



  

Start
/bin/python
<module 'os' from '/usr/lib64/python2.7/os.pyc'>
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdm1       434G   36G  398G   9% /
devtmpfs        498G     0  498G   0% /dev
tmpfs           498G   44K  498G   1% /dev/shm
tmpfs           498G  2.1M  498G   1% /run
tmpfs           498G     0  498G   0% /sys/fs/cgroup
/dev/sda1        15T   12T  2.6T  83% /var/hadoop/vol01

/dev/nvme0n1p1  3.3T   91G  3.2T   3% /var/hadoop/ssd01
/dev/nvme1n1p1  3.3T   91G  3.2T   3% /var/hadoop/ssd02

/var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1315479/
container_e105_1638177492250_1315479_01_000001/conda_env/bin/python
<module 'os' from '/var/hadoop/ssd01/yarn/nm/usercache/ppp/appcache/application_1638177492250_1315479/
container_e105_1638177492250_1315479_01_000001/conda_env/lib/python3.7/os.py'>
/bin/conda


skein :
    
    

skein driver start  --log /dd/101/sssvols07/ndata/cpa/log/log_skein/log.py
127.0.0.1:37449

    

Hello World!
/bin/python
<module 'os' from '/usr/lib64/python2.7/os.pyc'>
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       434G   36G  398G   9% /
devtmpfs        498G     0  498G   0% /dev
tmpfs           498G   56K  498G   1% /dev/shm
tmpfs           498G  2.1M  498G   1% /run
tmpfs           498G     0  498G   0% /sys/fs/cgroup
/dev/nvme0n1p1  3.3T   75G  3.2T   3% /var/hadoop/ssd01
/dev/nvme1n1p1  3.3T   87G  3.2T   3% /var/hadoop/ssd02
/dev/sdk1        15T   12T  2.6T  83% /var/hadoop/vol11
/dev/sde1        15T   12T  2.7T  82% /var/hadoop/vol05
/dev/sdl1        15T   12T  2.6T  82% /var/hadoop/vol12
/dev/sdg1        15T   12T  2.7T  82% /var/hadoop/vol07
/dev/sdj1        15T   12T  2.6T  83% /var/hadoop/vol10
/dev/sdi1        15T   12T  2.6T  83% /var/hadoop/vol09
/dev/sdb1        15T   12T  2.7T  82% /var/hadoop/vol02
/dev/sdf1        15T   12T  2.6T  82% /var/hadoop/vol06
/dev/sdc1        15T   12T  2.6T  83% /var/hadoop/vol03
/dev/sdd1        15T   12T  2.7T  82% /var/hadoop/vol04
/dev/sdh1        15T   12T  2.7T  82% /var/hadoop/vol08
/dev/sdm1        15T   12T  2.6T  83% /var/hadoop/vol01
Filesystem        Inodes   IUsed     IFree IUse% Mounted on
/dev/sda1       57673728  197517  57476211    1% /
devtmpfs       130474089    1260 130472829    1% /dev
tmpfs          130487912       8 130487904    1% /dev/shm
tmpfs          130487912    1487 130486425    1% /run
tmpfs          130487912      16 130487896    1% /sys/fs/cgroup
/dev/nvme0n1p1 219774976  101716 219673260    1% /var/hadoop/ssd01
/dev/nvme1n1p1 219774976  116772 219658204    1% /var/hadoop/ssd02


    
    

Log Type: application.driver.log

Log Upload Time: Mon Dec 27 01:09:09 +0000 2021

Log Length: 74

/bin/python
Hello World!
<module 'os' from '/usr/lib64/python2.7/os.pyc'>

Log Type: application.master.log

Log Upload Time: Mon Dec 27 01:09:09 +0000 2021

Log Length: 3254

21/12/27 01:06:56 INFO skein.ApplicationMaster: Starting Skein version 0.8.1
uccessfully.
21/12/27 01:09:08 INFO skein.ApplicationMaster: Unregistering application with status SUCCEEDED
21/12/27 01:09:08 INFO impl.AMRMClientImpl: Waiting for application to be successfully unregistered.
21/12/27 01:09:08 WARN util.ShutdownHookManager: ShutdownHook '' failed, java.util.concurrent.ExecutionException: java.lang.IllegalArgumentException: Wrong FS: hdfs://nameservice1/user/ppp/.skein/application_1638177492250_1304984, expected: viewfs://fed/
java.util.concurrent.ExecutionException: java.lang.IllegalArgumentException: Wrong FS: hdfs://nameservice1/user/ppp/.skein/application_1638177492250_1304984, expected: viewfs://fed/
  at java.util.concurrent.FutureTask.report(FutureTask.java:122)
  at java.util.concurrent.FutureTask.get(FutureTask.java:206)
  at or
    
    
    An example specification file. This starts a jupyter notebook and a 4 node dask.distributed cluster. The example uses conda-pack to package and distribute conda environments, but applications are free to package files any way they see fit.

name: dask-with-jupyter
queue: default

master:
  resources:
    memory: 2 GiB
    vcores: 1
  files:
    conda_env: env.tar.gz
    data.csv: hdfs:///path/to/some/data.csv
  script: |
    source conda_env/bin/activate
    start-jupyter-notebook-and-register-address  # pseudocode

services:
  dask.scheduler:
    resources:
      memory: 2 GiB
      vcores: 1
    files:
      conda_env: env.tar.gz
    script: |
      source conda_env/bin/activate
      start-dask-scheduler-and-register-address  # pseudocode

  dask.worker:
    instances: 4
    resources:
      memory: 4 GiB
      vcores: 4
    max_restarts: 8  # Restart workers a maximum of 8 times
    files:
      conda_env: env.tar.gz
    depends:
      - dask.scheduler  # Ensure scheduler is started before workers
    script: |
      source conda_env/bin/activate
      get-dask-scheduler-address-and-start-worker  # pseudocode






git config --global credential.helper 'cache --timeout 990990099'




######################################################################


#### Command line Hadoop
http://www.dummies.com/programming/big-data/hadoop/hadoop-for-dummies-cheat-sheet/

HDFS.C4000    :

######## Error system
chmod -R 755 /data_hdd/ggg/nono/ttrv/



######################################################################
##### One BIG File delete  in git  ###################################
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch ztmp2.sql' \
  --prune-empty --tag-name-filter cat -- --all


echo 'ztmp/*' >> .gitignore

git push origin --force --all


git rm /ztmp2.sql




############## GIT usage     ###########################################


git config --global --unset user.password  


git log -10

git resset --hard  hasCommit


git checkout BranchName  :     Change Branch name

git clone -b staging  https://nxtstg_ai_sortrank_learning.git       Clone Some branch

git stash   : Save All before action.

git
#### Push new repo      ################################################
git init
git add --all
git commit -m "Initial Commit"
git remote add origin https://keviztes/hivesql.git
git push -u origin master

gitcreate.bat https://kevsd_learning_features.git


##### Git branch   ####################################################
git clone -b staging  https://kevinank_learning.git
git branch --set-upstream-to=origin/<branch> master
git checkout -b    [name_of_your_new_branch]  Create branch local and switch into.
git checkout     new_branch         Change working branch :
git push origin   nameBranch                            Push the branch on github :


### Pull Request : Conflict         #####################################
    Switch to dev branch:             git checkout develop-branch
    Run Git fetch on dev branch:   git fetch origin 
    Check out master:                 git checkout master
    Perform merge:                      git merge develop-branch
    Solve the issues :

   Step 4 resulted in a conflict (as it did on BitBucket), 
     which I resolved locally, committed, and pushed. 

    https://gist.github.com/hofmannsven/6814451


#############  GIT Branches       #################################
 legit install

 git switch <branch>     # Switches to branch. Stashes and restores unstaged changes.
 git sync   # Syncronizes current branch. Auto-merge/rebase, un/stash.
 git publish <branch>  # Publishes branch to remote server.
 git unpublish <branch> # Removes branch from remote server.
 git branches   # Nice & pretty list of branches + publication status.
 git undo [--hard]   # Removes the last commit from history.

 git config --global user.name "Noel, Kevin"
 git config --global user.email "kevin.noel@zzz.com"

### Push into repo    ##############################################
git add --all                               git commit -m   "  1  "

####Get from repot
git pull --all                        git fetch && git pull origin master

 gitpush.bat                                            gitpull.bat  


##### Show origin  ###############################################
git remote show origin






#### OVERWRITE LOCAL FILE #########################################
git fetch origin master
git reset --hard FETCH_HEAD
git clean -df



#### Merge Conflict

The process to fix merge conflict:
First, pull the latest from the destination branch you want to merge git pull origin develop
As you get the latest from the destination, now resolve the conflict manually in IDE by deleting those extra characters.
Do a git add to add these edited files to the git queue so that it can be commit and push to the same branch you are working on.
As git add is done, do a git commit to commit the changes.
Now push the changes to your working branch by git push origin HEAD
This is it and you will see it resolved in your pull request if you are using Bitbucket or GitHub.


-bash: /data_hdd/ggg/nono/anaconda2/envs/python3/bin/ipython: /data/personal/nono/anaconda2/envs/python3/bin/python: bad interpreter: No such file or directory




#####  Merge automatic   ###############################
You basically want to remove the files from Git history, but not from the file system.

If your file was pushed in your last commit, you can do:
git rm --cached path/to/your/big/file
git commit --amend -CHEAD
git push

If not, they recommend using BFG-a tool for cleaning up repositories 
bfg --strip-blobs-bigger-than 50M
This will remove files bigger than 50M.


#### Large file in git history ##########################################
find . -size +1G | cat >> .gitignore




#################################################################
#################################################################
Linux :  
   #!/bin/bash

   reanme folder  :  mv  /rename1   /rename2

   Shift + Insert  : Paste into text editor  (because SSH part).

   chmod -R 777 /home/popo01/shortcut/ Execution right

   . startup.sh     ==  source startup.sh   Execute in current page.

   alias python3="source activate /data/personal/nono/python3"
   home :       /home/popo01
   nono :       /personal/nono-
   python3 :    python3  Prod 
   python3test :  python3 test
   bashe   micro ./.bashrc
   bashr   source  ./.bashrc
   configmy  : shortcut to /home/popo01/config/configmy

   ttrv      :  Pull from git.

### Transfer Folder to new server
scp -r      popo01@ins-bdstrv101.nnn.jp.local:/data/personal/nono/*     popo01@loginjpe1101z.nnn.jp.local:/home/popo01/data/nono/  



scp -r      popo01@ins-bdstrv101.nnn.jp.local:/data_hdd/ggg/zlog.tar.gz     popo01@loginjpe1101z.nnn.jp.local:/home/popo01/data/nono/  


### Zip folder into nono.tar.gz   ###
tar -zcf    nono.tar.gz     /data/personal/nono/


You can also use the -C option to first change to the directory, then specify the files.

Such as "tar -C /some/path/to/a/dir -zcf <full path to>/archive.tar.gz ."

If you wanted the "dir" to be part of the archive, then use "tar -C /some/path/to/a/ -zcf <full path to>/archive.tar.gz dir"

tar -zcf    c6knew.tar.gz     c6k/




### replace recursiverly

find . -type f -name "*" -exec sed -i'' -e 's/OLDWord/NEWord/g' {} +




######### conda install    ####################################
pip install  configmy --upgrade --no-deps --force-reinstall
pip install git+git://github.com/google/pytype  --upgrade --no-deps --force-reinstall
--no-compile


conda install --no-deps --no-update-deps  --yes  numexpr  
conda uninstall --force --verbose  --yes -n root  pystan

#Export current environnment
conda list --explicit >   /home/popo01/conda_server/conda_server_35.txt   
conda create --name python3 --file conda_env__python3.txt  python=3.5

conda install pandas=0.13.0=np17py27_0

conda install   -c conda-forge  pandas=0.20.3=py35_1


python automl.py  |& tee -a   zlog_automl.txt


 pandas:  0.21.0-py35_0 


conda create --clone root --name python35  python=3.5.4


conda create -n python35 --clone root
conda install -n python35 python=3.5.4   #will update all the packages
conda update -n python35 --all





# set proxy if you need   ####################################################
 export http_proxy=http://pkg.proxy.nnn.jp.local:10080 &&  export httpsproxy=http://pkg.proxy.nnn.jp.local:10080  &&  export https_proxy=http://pkg.proxy.nnn.jp.local:10080


 export httpsproxy=http://pkg.proxy.nnn.jp.local:10080

 export https_proxy=http://pkg.proxy.nnn.jp.local:10080




export http_proxy=http://pkg.proxy.nnn.jp.local:10080  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:10080   && git config --global user.email "kevin.noel@zzz.com"  &&  git config --global user.name "Kevin Noel"  && git config --global credential.helper "cache --timeout=90600" 


&&  chmod 0700 /home/popo01/.git-credential-cache  



cd cdna/extract_all/　&& git stash --all && git pull --all



./make_cdnall.sh && ./make_cdnaraw.sh && ./make_cdna_point.sh 


chmod 0700 /home/popo01/.git-credential-cache  &&  export http_proxy=http://pkg.proxy.nnn.jp.local:10080  &&  export https_proxy=https://pkg.proxy.nnn.jp.local:10080   && git config --global user.email "kevin.noel@zzz.com"  &&  git config --global user.name "Kevin Noel"  && git config --global credential.helper "cache --timeout=90600"  && cd /home/popo01/datalab/a/d/a_card/aacredit/monthly/scoring



chmod -R 777 .





gdsd1234







#####################
   Number of hotel jumps.







############### VIM Commands ##########################################
1. Basic Vim commands#
The most simple commands allow you to open and close documents as well as saving them. As with most other text editors, there are protections in place to help you avoid exiting the editor without having saved what you're working on.

:help [keyword] - Performs a search of help documentation for whatever keyword you enter

:e [file] - Opens a file, where [file] is the name of the file you want opened

:w - Saves the file you are working on

:w [filename] - Allows you to save your file with the name you've defined

:wq - Save your file and close Vim

:q! - Quit without first saving the file you were working on

2. Vim commands for movement





fs -copyFromLocal -f $LOCAL_MOUNT_SRC_PATH/yourfilename.txt your_hdfs_file-path




exit 1










########################################################################
ETL Tool
https://confluence.zzz-it.com/confluence/pages/viewpage.action?pageId=1187268973

LDAP : 
python /usr/local/bis/tool/dsd-etl/etl/etlsetup.py

math character :   ⇔   

python fastFM_/d/t1/train_als.py   --n_iter 50  --l_rate 0.005  --rank 50 --l2_reg_V 0.05    --model ttfm  --folder  /data/personal/nono/ttrv/fastFM_/d/t2/   |& tee -a  fastFM_/d/t2/fastfm_train_log_als.txt









###########################################################################
Proxy Command for remote interpreter
https://unix.stackexchange.com/questions/215986/ssh-login-with-a-tunnel-through-intermediate-server-in-a-single-command


/usr/local/bis/data/personal/nono/anaconda2/envs/python2/lib/python2.7/site-packages/JapaneseTokenizer/init_logger.py


#### HIVE  in Jupyter   ##########################################################################
### Launch      
ipython   /home/bisuser/jupyter2/nono01/hive_script.py  |& tee -a   log_hive_all.txt


### Launch HIVE SQL   
cd /home/bisuser/jupyter2/nono01/
hive.c4000 -f  hivequery2.sql   |& tee -a   log_hive_all2.txt


### Launch HIVE SQL   
hive.c4000
SHOW databases;
SHOW tables;
SELECT    *   FROM dsd_nono.table1  ;



Teradata details

SELECT  TRIM(DatabaseName) AS "DatabaseName", 
        TRIM(TableName) AS "TableName", 
    TRIM(ColumnName) AS "ColumnName", 
    ColumnType 
FROM DBC.COLUMNS 
WHERE TableName = 'trv_hotelstat_all_201701';



CREATE TABLE ztest.productmaster (
    key ascii PRIMARY KEY,
    value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy', 'tombstone_compaction_interval': '13601'}
    AND compression = {'chunk_length_in_kb': '4', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 86400
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

truncate ztest.productmaster ;




##### Aster   #########################################################################
              Account name     : ua_popo01
              Initial password   : b68cqunt
              NOTE: you have an Analyst role.
              Aster  :  atraster101.db.zzz.co.jp




Query Grid
Query grid is useful since you can access rat_log and, say,  ua_view_mk_trvl in the same select statement. Usage is a bit tricky so because you have to make what's called a FOREIGN SERVER so I share the code that I created before: 

/* create aster query grid FOREIGN SERVER  */
DROP FOREIGN SERVER FS_A2T_ua_hikichikoki01
;
CREATE FOREIGN SERVER FS_A2T_ua_hikichikoki01 -- change here
USING
 TDPID('dbc')
 USERNAME ('')  -- change here
 PASSWORD ('')      -- change here
 LOGON_MECHANISM ('LDAP')
DO IMPORT WITH load_from_teradata,
DO EXPORT WITH load_to_teradata
USING WORKINGDATABASE('ua_view_mk_trvl')
;
 
/* run the sql */
select count(case when rat.f_pre_page_visit = 1                                                        then rat.easy_id else null end ) pre_page_visit
     , count(case when rat.f_pre_page_visit = 1 and rat.f_ss_page_visit = 1                            then rat.easy_id else null end ) ss_page_visit
     , count(case when rat.f_pre_page_visit = 1 and rat.f_ss_page_visit = 1 and cv.easy_id is not null then rat.easy_id else null end ) ss_cv
  from (
       select cast(rat.complemented_easy_id as integer) easy_id
            , max(
                 case when rat.dt between '2017-08-28' and '2017-09-02'
                       and rat.time_stamp between '2017-08-28 10:00:00' and '2017-09-02 18:59:59'
                       and rat.url like 'https://event.travel.zzz.co.jp/special/supersale/201709/car/%'
                      then 1
                      else 0
                  end
                 ) f_pre_page_visit
            , max(
                 case when rat.dt between '2017-09-02' and '2017-09-10'
                       and rat.time_stamp between '2017-09-02 19:00:00' and '2017-09-10 23:59:59'
                       and rat.url like 'https://travel.zzz.co.jp/cars/%'
                      then 1
                      else 0
                  end
                 ) f_ss_page_visit
         from dev_trvl_vw_lab.rat_log_normalized rat
        where rat.event_type   = 'pv'
          and rat.service_type = 'travel_jp'
          and rat.complemented_easy_id is not null
          and rat.complemented_easy_id <> '0'
          and (
                  (
                  rat.dt         between '2017-08-28'          and '2017-09-02'
              and rat.time_stamp between '2017-08-28 10:00:00' and '2017-09-02 18:59:59'
              and rat.url like 'https://event.travel.zzz.co.jp/special/supersale/201709/car/%'
                  )
               or (
                  rat.dt         between '2017-09-02' and '2017-09-10'
              and rat.time_stamp between '2017-09-02 19:00:00' and '2017-09-10 23:59:59'
              and rat.url like 'https://travel.zzz.co.jp/cars/%'
                  )
              )
         group by rat.complemented_easy_id
       ) rat
  left outer join
       (
       select distinct easy_id from foreign server ($$ select easy_id from ua_view_mk_trvl.red_trv_all_rsrv_tbl where rsrv_type_cd = 700 and rsrv_time between '2017-09-02 19:00:00' and '2017-09-10 23:59:59'; $$)@FS_A2T_ua_hikichikoki01
       ) cv
    on rat.easy_id = cv.easy_id




####### Extracting parameters from url in rat_log_normalized
Issue

Want to extract parameters (such as f_no (hotel number), scid (tracking code), etc.) from urls.
Sample SQL
Extract URL Parameters
select
   url
    , split_part(substring(url from '%#"f_no=([^&]*)#"%' for '#'), '=', 2) as hotel_id
    , split_part(substring(url from '%#"scid=([^&]*)#"%' for '#'), '=', 2) as scid
from
    dev_trvl_vw_lab.rat_log_normalized
where
    dt = '2017-02-25'
    and (
    url like '%f_no%'
    or url like '%scid%'
    )
limit
    100
;




####### Importing data from Hadoop
Issue

Want to import data from hadoop (usually extracted using a query with hive) to Aster for analysis.

Basic procedure of importing  a file to Teradata Aster through the Import CSV App is at:

Import CSV

However, one tip is needed when exporting from hive, which is to

(1) Replace TABs with commas

(2) Replace "NULL"s with "" (blank strings)
Sample UNIX command
Import data from Hadoop
$ hive.c4000 -f extract_from_rat.sql > rat_data.tsv
$ tr '\t' ',' < rat_data.tsv > rat_data.csv
$ sed -e 's/NULL//g' rat_data.csv > rat_data_with_nulls_eliminated.csv








##### Aggregate  by column, comma delimited  #################
Column_A                             Column_X
55555                               123,124,125,126,127
77777                               130,131,132

SELECT S_SKHK_SST,  
      TRIM(TRAILING ',' FROM (XMLAGG(K_STB_M || ','
                         ORDER BY K_STB_M
     ) (VARCHAR(10000))))
FROM UA_VIEW_MK_TRVL.trv_facilities_data  
GROUP BY 1







###############
WITH RECURSIVE STR_COLUMNS(COLUMNID,COLUMNNAME)
AS
(
SEL COLUMNID,CAST(COLUMNNAME AS VARCHAR(200)) AS COLUMNNAME
FROM DBC.COLUMNS
WHERE TABLENAME='TABLESIZEV'
AND DATABASENAME='DBC '
QUALIFY ROW_NUMBER() OVER(ORDER BY COLUMNID ASC)=1
UNION ALL
SEL TB1.COLUMNID,TRIM(TB2.COLUMNNAME)||'~'||TB1.COLUMNNAME
FROM DBC.COLUMNS TB1 , STR_COLUMNS TB2
WHERE TB1.COLUMNID=TB2.COLUMNID+1
AND TB1.TABLENAME='TABLESIZEV'
AND TB1.DATABASENAME='DBC'
)
SEL COLUMNNAME
FROM (
SEL TOP 1 COLUMNID,COLUMNNAME
FROM STR_COLUMNS
ORDER BY COLUMNID DESC
)TB1







##### SQL Tera
/**** concatenate ****/
SEL president_id,president_name,president_id||'-'||president_name AS str_concat FROM vt_president;
 

/**** index ****/
SEL president_id,president_name, INDEX(president_name,'.') AS str_index FROM vt_president;

/**** position ****/
SEL president_id,president_name, POSITION('.' IN president_name) AS str_position FROM vt_president;

/**** lower ****/
SEL president_id,president_name, LOWER(president_name) AS str_lower FROM vt_president;

/**** SUBSTR ****/
SEL president_id,president_name, SUBSTR(president_name,1,5) AS str_substr FROM vt_president;

/**** TRANSLATE ****/
SEL president_id,president_name, TRANSLATE(president_name USING UNICODE_TO_LATIN) AS str_translate FROM vt_president;

/**** TRANSLATE_CHK ****/
SEL president_id,president_name, TRANSLATE_CHK(president_name USING UNICODE_TO_LATIN) AS str_translate_chk FROM vt_president;

/**** TRIM ****/
SEL president_id,president_name, TRIM(president_name) AS str_trim FROM vt_president;

/**** UPPER ****/
SEL president_id,president_name, UPPER(president_name) AS str_upper FROM vt_president;


/*** ========= OPERATORS  ========= ***/

/**** NOT EQUAL ****/
SEL * FROM vt_president WHERE president_id<>'001′;
SEL * FROM vt_president WHERE president_id NE '001';
SEL * FROM vt_president WHERE president_id ^= '001';
SEL * FROM vt_president WHERE president_id NOT= '001';


/**** LESS THAN or EQUAL****/
SEL * FROM vt_president WHERE president_id<='003′;
SEL * FROM vt_president WHERE president_id>='033′;


/**** CHARACTERS ****/
SEL president_id,president_name, CHARACTERS(president_name) AS str_CHARACTERS FROM vt_president;

/**** CHARS ****/
SEL president_id,president_name, CHARS(president_name) AS str_CHARS FROM vt_president;

/**** CHAR ****/
SEL president_id,president_name, CHAR(president_name) AS str_CHAR FROM vt_president;

/**** CHARACTER_LENGTH ****/
SEL president_id,president_name, CHARACTER_LENGTH(president_name) AS str_CHARACTER_LENGTH FROM vt_president;


/**** BETWEEN ****/
SEL president_id,president_name FROM vt_president where president_id between '002' and '006';


/****NOT BETWEEN ****/
SEL president_id,president_name FROM vt_president WHERE president_id NOT BETWEEN '002' AND '006';

/**** LIKE ****/
SEL president_id,president_name FROM vt_president WHERE president_id like '00%';
SEL president_id,president_name FROM vt_president WHERE president_id NOT LIKE '00%';







### delete from pattenr
cd tttcb301/sssvols05/Temp/logs/
find   tttcb301/sssvols05/Temp/logs/ -name '*scylla_*' #-delete







##################################################################
1 ? SYSTEM INFORMATION

# Display Linux system information
uname -a

# Display kernel release information
uname -r

# Show which version of redhat installed
cat /etc/redhat-release

# Show how long the system has been running + load
uptime

# Show system host name
hostname

# Display the IP addresses of the host
hostname -I

# Show system reboot history
last reboot

# Show the current date and time
date

# Show this month's calendar
cal

# Display who is online
w

# Who you are logged in as
whoami

2 ? HARDWARE INFORMATION

# Display messages in kernel ring buffer
dmesg

# Display CPU information
cat /proc/cpuinfo

# Display memory information
cat /proc/meminfo

# Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
free -h

# Display PCI devices
lspci -tv

# Display USB devices
lsusb -tv

# Display DMI/SMBIOS (hardware info) from the BIOS
dmidecode

# Show info about disk sda
hdparm -i /dev/sda

# Perform a read speed test on disk sda
hdparm -tT /dev/sda

# Test for unreadable blocks on disk sda
badblocks -s /dev/sda

3 ? PERFORMANCE MONITORING AND STATISTICS

# Display and manage the top processes
top

# Interactive process viewer (top alternative)
htop

# Display processor related statistics
mpstat 1

# Display virtual memory statistics
vmstat 1

# Display I/O statistics
iostat 1

# Display the last 100 syslog messages  (Use /var/log/syslog for Debian based systems.)
tail 100 /var/log/messages

# Capture and display all packets on interface eth0
tcpdump -i eth0

# Monitor all traffic on port 80 ( HTTP )
tcpdump -i eth0 'port 80'

# List all open files on the system
lsof

# List files opened by user
lsof -u user

# Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
free -h

# Execute "df -h", showing periodic updates
watch df -h

4 ? USER INFORMATION AND MANAGEMENT

# Display the user and group ids of your current user.
id

# Display the last users who have logged onto the system.
last

# Show who is logged into the system.
who

# Show who is logged in and what they are doing.
w

# Create a group named "test".
groupadd test

# Create an account named john, with a comment of "John Smith" and create the user's home directory.
useradd -c "John Smith" -m john

# Delete the john account.
userdel john

# Add the john account to the sales group
usermod -aG sales john

5 ? FILE AND DIRECTORY COMMANDS

# List all files in a long listing (detailed) format
ls -al

# Display the present working directory
pwd

# Create a directory
mkdir directory

# Remove (delete) file
rm file

# Remove the directory and its contents recursively
rm -r directory

# Force removal of file without prompting for confirmation
rm -f file

# Forcefully remove directory recursively
rm -rf directory

# Copy file1 to file2
cp file1 file2

# Copy source_directory recursively to destination. If destination exists, copy source_directory into destination, otherwise create destination with the contents of source_directory.
cp -r source_directory destination

# Rename or move file1 to file2. If file2 is an existing directory, move file1 into directory file2
mv file1 file2

# Create symbolic link to linkname
ln -s /path/to/file linkname

# Create an empty file or update the access and modification times of file.
touch file

# View the contents of file
cat file

# Browse through a text cass
less file

# Display the first 10 lines of file
head file

# Display the last 10 lines of file
tail file

# Display the last 10 lines of file and "follow" the file as it grows.
tail -f file

6 ? PROCESS MANAGEMENT

# Display your currently running processes
ps

# Display all the currently running processes on the system.
ps -ef

# Display process information for processname
ps -ef | grep processname

# Display and manage the top processes
top

# Interactive process viewer (top alternative)
htop

# Kill process with process ID of pid








kill pid

# Kill all processes named processname
killall processname

# Start program in the background
program &

# Display stopped or background jobs
bg

# Brings the most recent background job to foreground
fg

# Brings job n to the foreground
fg n

7 ? FILE PERMISSIONS

Linux chmod example
        PERMISSION      EXAMPLE

         U   G   W
        rwx rwx rwx     chmod 777 filename
        rwx rwx r-x     chmod 775 filename
        rwx r-x r-x     chmod 755 filename
        rw- rw- r--     chmod 664 filename
        rw- r-- r--     chmod 644 filename

# NOTE: Use 777 sparingly!

        LEGEND
        U = User
        G = Group
        W = World

        r = Read
        w = write
        x = execute
        - = no access

8 ? NETWORKING

# Display all network interfaces and ip address
ifconfig -a

# Display eth0 address and details
ifconfig eth0

# Query or control network driver and hardware settings
ethtool eth0

# Send ICMP echo request to host
ping host

# Display whois information for domain
whois domain

# Display DNS information for domain
dig domain

# Reverse lookup of IP_ADDRESS
dig -x IP_ADDRESS

# Display DNS ip address for domain
host domain

# Display the network address of the host name.
hostname -i

# Display all local ip addresses
hostname -I

# Download http://domain.com/file
wget http://domain.com/file

# Display listening tcp and udp ports and corresponding programs
netstat -nutlp

 
9 ? ARCHIVES (TAR FILES)

# Create tar named archive.tar containing directory.
tar cf archive.tar directory

# Extract the contents from archive.tar.
tar xf archive.tar

# Create a gzip compressed tar file name archive.tar.gz.
tar czf archive.tar.gz directory

# Extract a gzip compressed tar file.
tar xzf archive.tar.gz

# Create a tar file with bzip2 compression
tar cjf archive.tar.bz2 directory

# Extract a bzip2 compressed tar file.
tar xjf archive.tar.bz2

10 ? INSTALLING PACKAGES

# Search for a package by keyword.
yum search keyword

# Install package.
yum install package

# Display description and summary information about package.
yum info package

# Install package from local file named package.rpm
rpm -i package.rpm

# Remove/uninstall package.
yum remove package

# Install software from source code.
tar zxvf sourcecode.tar.gz
cd sourcecode
./configure
make
make install

11 ? SEARCH

# Search for pattern in file
grep pattern file

# Search recursively for pattern in directory
grep -r pattern directory

# Find files and directories by name
locate name

# Find files in /home/john that start with "prefix".
find /home/john -name 'prefix*'

# Find files larger than 100MB in /home
find /home -size +100M

12 ? SSH LOGINS

# Connect to host as your local username.
ssh host

# Connect to host as user
ssh user@host

# Connect to host using port
ssh -p port user@host

13 ? FILE TRANSFERS

# Secure copy file.txt to the /tmp folder on server
scp file.txt server:/tmp

# Copy *.html files from server to the local /tmp folder.
scp server:/var/www/*.html /tmp

# Copy all files and directories recursively from server to the current system's /tmp folder.
scp -r server:/var/www /tmp

# Synchronize /home to /backups/home
rsync -a /home /backups/

# Synchronize files/directories between the local and remote system with compression enabled
rsync -avz /home server:/backups/

14 ? DISK USAGE

# Show free and used space on mounted filesystems
df -h

# Show free and used inodes on mounted filesystems
df -i

# Display disks partitions sizes and types
fdisk -l

# Display disk usage for all files and directories in human readable format
du -ah

# Display total disk usage off the current directory
du -sh

15 ? DIRECTORY NAVIGATION

# To go up one level of the directory tree.  (Change into the parent directory.)
cd ..

# Go to the $HOME directory
cd

# Change to the /etc directory
cd /etc



pip install tensorflow==2.6.0 tensorflow-estimator==2.6.0  tensorflow-hub==0.12.0  tensorflow-text==2.6.0  psutil==5.8.0  tabulate





psutil 






absl-py==0.15.0
alabaster==0.7.12
anaconda-client==1.7.2
anaconda-navigator==1.9.7
anaconda-project==0.8.3
aogcommon==0.1.1
asn1crypto==1.0.1
astor==0.8.1
astroid==2.3.1
astropy==3.2.2
astunparse==1.6.3
atomicwrites==1.3.0
attrs==19.2.0
Babel==2.7.0
backcall==0.1.0
backports.functools-lru-cache==1.6.4
backports.os==0.1.1
backports.shutil-get-terminal-size==1.0.0
backports.tempfile==1.0
backports.weakref==1.0.post1
bcrypt==3.1.7
beautifulsoup4==4.8.0
bitarray==1.0.1
bkcharts==0.2
bleach==4.1.0
blosc==1.8.3
bokeh==1.3.4
boto==2.49.0
boto3==1.13.22
botocore==1.16.22
Bottleneck==1.2.1
cached-property==1.5.2
cachetools==4.1.0
cassandra-driver==3.14.0
category-encoders==2.3.0
certifi==2020.4.5.1
cffi==1.14.0
chardet==3.0.4
clang==5.0
Click==7.0
cloudpickle==1.2.2
clyent==1.2.2
colorama==0.4.1
conda==4.10.3
conda-build==3.18.9
conda-package-handling==1.6.0
conda-verify==3.4.2
contextlib2==0.6.0
convertdate==2.3.2
couchbase==2.5.10
cramjam==2.3.2
cryptography==2.9.2
cycler==0.10.0
Cython==0.29.13
cytoolz==0.10.0
dask==2021.8.1
datasketch==1.5.3
decorator==4.4.2
defusedxml==0.6.0
dill==0.3.4
dirty-cat==0.2.0
diskcache==5.2.1
distributed==2.5.2
docutils==0.15.2
editdistance==0.6.0
entrypoints==0.3
et-xmlfile==1.0.1
faiss==1.7.1
fastcache==1.1.0
fastparquet==0.7.1
filelock==3.0.12
fire==0.4.0
Flask==1.1.1
flatbuffers==1.12
fsspec==0.7.4
future==0.18.2
gast==0.4.0
gensim==4.1.2
gevent==1.4.0
glob2==0.7
gmpy2==2.0.8
google-auth==1.16.0
google-auth-oauthlib==0.4.1
google-pasta==0.2.0
greenlet==0.4.15
grpcio==1.41.1
h5py==3.1.0
halo==0.0.31
hdbscan==0.8.27
HeapDict==1.0.1
hijri-converter==2.2.2
holidays==0.11.3.1
html5lib==1.0.1
idna==2.9
imageio==2.6.0
imagesize==1.1.0
importlib-metadata==1.6.0
ipykernel==5.1.2
ipython==7.15.0
ipython-genutils==0.2.0
ipython-sql==0.3.9
ipywidgets==7.5.1
isort==4.3.21
itsdangerous==1.1.0
jdcal==1.4.1
jedi==0.17.0
jeepney==0.4.1
Jinja2==2.10.3
jmespath==0.10.0
joblib==1.1.0
json5==0.8.5
jsonschema==3.0.2
jupyter==1.0.0
jupyter-client==5.3.3
jupyter-console==6.0.0
jupyter-core==4.5.0
jupyterlab==1.1.4
jupyterlab-server==1.0.6
keras==2.6.0
Keras-Applications==1.0.8
Keras-Preprocessing==1.1.2
keyring==18.0.0
kiwisolver==1.1.0
korean-lunar-calendar==0.2.1
kubernetes==10.0.1
lazy-object-proxy==1.4.2
libarchive-c==2.8
lief==0.9.0
lightgbm==3.3.1
llvmlite==0.36.0
locket==0.2.0
log-symbols==0.0.14
loguru==0.5.3
lxml==4.4.1
Markdown==3.2.2
MarkupSafe==1.1.1
matplotlib==3.1.1
mccabe==0.6.1
mecab-python3==0.996.2
mistune==0.8.4
mkl-fft==1.0.14
mkl-random==1.1.0
mkl-service==2.3.0
mmh3==2.5.1
mock==3.0.5
more-itertools==7.2.0
mpld3==0.5.5
mpmath==1.1.0
msgpack==0.6.1
multipledispatch==0.6.0
navigator-updater==0.2.1
nbconvert==5.6.0
nbformat==4.4.0
networkx==2.3
nltk==3.4.5
nose==1.3.7
notebook==6.0.1
numba==0.53.1
numexpr==2.7.0
numpy==1.19.2
numpydoc==0.9.1
oauthlib==3.1.0
olefile==0.46
opencv-python==4.5.3.56
openpyxl==3.0.0
opt-einsum==3.3.0
packaging==21.0
pandas==1.3.2
pandocfilters==1.4.2
paramiko==2.7.1
parquet-metadata==0.0.1
parquet-tools==0.2.0
parso==0.7.0
partd==1.0.0
path.py==12.0.1
pathlib2==2.3.5
patsy==0.5.1
pep8==1.7.1
pexpect==4.8.0
pickleshare==0.7.5
Pillow==6.2.0
pip-check-reqs==2.3.2
pipe==1.6.0
pkginfo==1.5.0.1
pluggy==0.13.0
ply==3.11
pqkmeans==1.0.5
pretty-html-table==0.9.14
prettytable==0.7.2
prometheus-client==0.7.1
prompt-toolkit==3.0.5
protobuf==3.10.0
psutil==5.8.0
psycopg2-binary==2.8.3
ptyprocess==0.6.0
py==1.8.0
pyarrow==0.17.0
pyasn1==0.4.8
pyasn1-modules==0.2.8
pycodestyle==2.5.0
pycosat==0.6.3
pycparser==2.20
pycrypto==2.6.1
pycurl==7.43.0.3
pyflakes==2.1.1
Pygments==2.6.1
PyHive==0.6.2
pyinstrument==4.0.4
pylint==2.4.2
PyMeeus==0.5.11
PyNaCl==1.4.0
pynndescent==0.5.4
pyod==0.9.5
pyodbc==4.0.27
pyOpenSSL==19.0.0
pyparsing==2.4.2
PyQt5==5.12.3
PyQt5-sip==12.9.0
PyQtWebEngine==5.12.1
pyrsistent==0.15.4
PySocks==1.7.1
pytest==5.2.1
pytest-arraydiff==0.3
pytest-astropy==0.5.0
pytest-doctestplus==0.4.0
pytest-openfiles==0.4.0
pytest-remotedata==0.3.2
python-box==5.4.1
python-dateutil==2.8.1
python-highcharts==0.4.2
python-snappy==0.5.4
pytz==2020.1
PyWavelets==1.0.3
PyYAML==5.3.1
pyzmq==18.1.0
QtAwesome==0.6.0
qtconsole==4.5.5
QtPy==1.9.0
rapidfuzz==1.8.2
redis==3.3.8
redis-py-cluster==2.0.0
requests==2.23.0
requests-oauthlib==1.3.0
roaringbitmap==0.7
rope==0.14.0
rsa==4.0
ruamel-yaml==0.15.46
s3fs==0.4.0
s3transfer==0.3.3
sasl==0.2.1
scikit-image==0.15.0
scikit-learn==0.24.2
scipy==1.4.1
seaborn==0.9.0
SecretStorage==3.1.1
Send2Trash==1.5.0
sentencepiece==0.1.95
simplegeneric==0.8.1
simplejson==3.16.0
simpleneighbors==0.1.0
singledispatch==3.4.0.3
six==1.15.0
smart-open==5.2.1
snowballstemmer==2.0.0
sortedcollections==1.1.2
sortedcontainers==2.1.0
soupsieve==1.9.3
Sphinx==2.2.0
sphinxcontrib-applehelp==1.0.1
sphinxcontrib-devhelp==1.0.1
sphinxcontrib-htmlhelp==1.0.2
sphinxcontrib-jsmath==1.0.1
sphinxcontrib-qthelp==1.0.2
sphinxcontrib-serializinghtml==1.1.3
sphinxcontrib-websupport==1.1.2
spinners==0.0.24
spyder-kernels==0.5.2
SQLAlchemy==1.3.17
sqlparse==0.3.1
statsmodels==0.10.1
stdlib-list==0.8.0
swifter==1.0.9
sympy==1.4
tables==3.5.2
tabulate==0.8.9
tblib==1.4.0
tenacity==8.0.1
tensorboard==2.7.0
tensorboard-data-server==0.6.1
tensorboard-plugin-wit==1.8.0
tensorflow==2.6.0
tensorflow-estimator==2.6.0
tensorflow-hub==0.12.0
tensorflow-text==2.6.0
termcolor==1.1.0
terminado==0.8.2
testpath==0.4.2
texmex-python==1.0.0
threadpoolctl==2.2.0
thrift==0.13.0
thrift-sasl==0.4.2
toolz==0.10.0
tornado==6.0.3
tqdm==4.36.1
traitlets==4.3.3
typed-ast==1.4.3
typing-extensions==3.7.4.3
ujson==1.35
umap-learn==0.5.1
unicodecsv==0.14.1
urllib3==1.25.9
utilmy==0.1.16362544
utils==0.9.0
wcwidth==0.2.3
webencodings==0.5.1
websocket-client==0.57.0
Werkzeug==1.0.1
wget==3.2
widgetsnbextension==3.5.1
wrapt==1.12.1
wurlitzer==1.0.3
xlrd==1.2.0
XlsxWriter==1.2.1
xlwt==1.3.0
zict==1.0.0
zipp==3.1.0







cd "\Users\kevin.noel\Box\Data Science Department\Personal\znono\z\"


conda create --prefix  py36all    python=3.6.9 -y




  pip install tensorflow==1.15.2 keras==2.3.1 numpy optuna==1.2.0 pandas==1.0 scipy==1.3.0 scikit-learn==0.21.2 numexpr==2.6.8 sqlalchemy==1.3.13 boto3==1.9.187 toml setuptools==45.2.0 python-dateutil==2.8.0 




#### DL framework
git+https://www.github.com/keras-team/keras-contrib.git
mlflow==1.7.1



### TF
tensorflow-datasets==3.0


### Lightning for GPU/TPu training
pytorch-lightning==0.7.3

## Required for gluon_FB prophet
fbprophet==0.6
convertdate>=2.1.2


### Computer Vision
torchvision==0.4.0
Pillow<7.0   ##Issue



### transformers with 7.0
pytorch-transformers
###transformers==2.4.1 #### fix issue #23 could not run on macos
transformers==2.3.0 #### due to sentence transformers
sentence-transformers==0.2.4
tensorboardX


### autokeras
# autokeras==1.0.2
# packaging==20.3
# tensorflow==2.0  ### Conflict



#####Gluon#######################
mxnet==1.6.0
gluonts==0.4.2
pydantic<=1.4
autogluon==0.0.5


lightgbm==2.3.0


############################
deepctr


############################

pip install  tensorflow=1.15.2 keras<2.4.0 gluonts==0.4.2 lightgbm==2.3.0 pandas<1.0 scipy>=1.3.0 scikit-learn==0.21.2 numexpr>=2.6.8, sqlalchemy<=1.3.13 boto3==1.9.187 toml setuptools==45.2.0 python-dateutil==2.8.0   deepctr 






###Utils
cli_code


#### NLP
torchtext
nltk
spacy
gensim 
matchzoo-py==1.1.1   #  pytorch-transformers >= 1.1.0, pytorch > 1.2.0


#### Distributed training
# horovod==0.16.2   #### Issues with OPEN MPI


#### For ARMDN 
tensorflow_probability<=0.7.0
keras-mdn-layer<=0.2.1





torch==1.2.0  ## Needed for other models
#torch==1.0.1
tensorflow==1.15.2
# tensorflow==2.1.0
keras<2.4.0
#keras
# autokeras
numpy
optuna<1.2.0



############################
pandas<1.0
scipy>=1.3.0
scikit-learn==0.21.2
numexpr>=2.6.8
# sqlalchemy>=1.3.8, 
sqlalchemy<=1.3.13
boto3==1.9.187
toml
setuptools==45.2.0
python-dateutil==2.8.0


#### Utils
cli_code    ### Utilities
versioneer==0.18   ## Auto Versionning







USER root




A B C



KUBO




#### Search Lo




Hello Sir,

In the week end, went through some Cassandra scheme,
just wondering if people is having access to this kind of log ?

https://cassandra.apache.org/doc/latest/new/fqllogging.html

It might be helpful for analyze latency/load of app. queries/data schemes
and make replay benchmarks (ie scyllab).


Besides this, it can be useful to track "bad-formed CQL queries".






Paritionining :
     Cardinality of <20, and direct access


Parition Key :   < 10s

clsutering key :cardinality   < 1000s





     
#################################################################################
https://community.datastax.com/questions/1057/data-modeling-one-to-many-and-many-to-many.html


The most important rule of data modelling is that you need to create a table for each application query. This means you need a [duplicate] table whose primary key is (city, favourite_colour) so you end up with partitions of cities which have clusters of colours of rows of people. Logically, it looks like this:

partition: 'LA'
- clustering column: 'red'
  - name: 'Alice', age: 20, gender: 'F'
  - name: 'Bob', age: 33, gender: 'M'
  - name: 'Carol', age 24, gender: 'F'
When you query this table with:

SELECT name, age, gender FROM users_by_city \
  WHERE city = 'LA' AND favourite_colour = 'red'




Erick Ramirez répondu · Oct 02 à 12:53 PM
@KARTHIKEYAN RASIPALAYAM DURAIRAJ when modelling your tables, you should always start with the queries. For example if you want to retrieve the country based on the state code, you would partition your table using the state code like this:

CREATE TABLE country_by_state_code (
    state_code text,
    country text,
    PRIMARY KEY (state_code)
)
If you want to retrieve the list of cities based on the state code, your table would look like this:

CREATE TABLE cities_by_state_code (
    state_code text,
    city text,
    PRIMARY KEY ( state_code, city )
)
The filter for your queries would always determine how the table will be partitioned and therefore determine the partition key. Cheers!






vikram.singh.chouhan_187371 répondu · Apr 10 à 3:43 AM
@milind.jivtode_158531: It is never a good idea to use ALLOW FILTERING in your application queries. It was designed to be used for development purposes only such that developers can interrogate the data in a non-production environment.

ALLOW FILTERING is only required when your search is either on a non-primary column or primary key columns without specifying its previous primary columns (if any) in the order defined during table creation (let me know if you need an example to understand this). And using ALLOW FILTERING doesn't always mean it will be inefficient, it actually depends on how much disk your query is going to scan in the end during runtime.

So if you have a query using allow filtering and you are sure that it will end up in scanning not more than a specific disk size or in other words record set less than a specific number (as per your performance principles) than it is ok to use it. This can be achieved by designing the appropriate partition key or primary key.
Although it has been discouraged to use allow filtering just to make sure it will never end up in bad performance scenarios if your data model design is poor or it may become ineffective future if your data insertion frequency makes your design look poor.

















##########################

A not too common anti-pattern seen is in the use of non-frozen collections, particularly in UDTs or when nested within another collection. These types of collections have a huge performance hit, and should be avoided by using a frozen collection when possible.

It's also interesting to see that strings are often used to represent dates and timestamps. Although it is able to represent the value, it may not be as easy to work with as the native datatypes. Since there are rules set up to represent a timestamp, such as specifying a timezone, it's much easier to keep this type of data consistent across different geographies as well as to manipulate them.

At the keyspace level, there are several anti-patterns that can pop up.

One of them is creating too many keyspace, but more importantly, too many tables. This can cause flushing problems.

One common anti-pattern seen is the improper use of TTLs and deletes, which causes tombstones to build up in a partition and become a huge bottleneck in read performance. This is typically caused by an improper data model that is designed to frequently delete small parts of a partition, therefore creating these tombstones much faster than then can be compacted or evicted.

Finally there has been some situations where read performance degrade significantly enough, due to improper data modeling or use of anti-patterns, where the read operation times out before responses are received from nodes. An anti-pattern here is increasing the length of the time before a timeout, instead of finding out what is causing such slow performance and improving on it. In this case you are merely masking the problem and not really solving it.

















Cassandra Docker Cheat Sheet
Common commands used when working with Cassandra and Docker:





docker pull datastax/dse-studio


docker pull datastax/dse-server:5.1.18




docker run -e DS_LICENSE=accept --name my-dse -d datastax/dse-server:5.1.18

docker exec -it my-dse bash    # [1]: this command will open the 





========= Status =========
#Active containers
docker ps



#Container Utilization
docker stats

#Container Details
docker inspect my-dse

#NodeTool Status
docker exec -it my-dse nodetool status

========== Logs ==========
#Server Logs
docker logs my-dse
#System Out
docker exec -it my-dse cat /var/log/cassandra/system.log
#Studio Logs
docker logs my-studio

==== Start/Stop/Remove ====
docker start my-dse

docker stop my-dse

docker stop my-studio



#Remove Container
docker remove my-dse



======= Additional =======
#Contaier IPAddress
&> docker inspect my-dse | grep IPAddress
#CQL (Requires IPAddress from above)
docker exec -it my-dse cqlsh [IPAddress]
#Bash
docker exec -it my-dse bash







docker run --name some-scylla --hostname some-scylla -d scylladb/scylla



Run nodetool utility
$ docker exec -it some-scylla nodetool status



Run cqlsh utility
 docker exec -it some-scylla cqlsh







version: '3'

services:
  some-scylla:
    image: scylladb/scylla
    container_name: some-scylla

  some-scylla2:
    image: scylladb/scylla
    container_name: some-scylla2
    command: --seeds=some-scylla

  some-scylla3:
    image: scylladb/scylla
    container_name: some-scylla3
    command: --seeds=some-scylla





Then, launch the 3-node cluster as follows:

docker-compose up -d







". www1_c6000_pro && sh /usr/local/hdp/bin/kinit.sh && sudo /usr/local/bin/mount_gluster.sh && sh tttcb301/sssvols05/ppp/CodeV16/bin/start_real_time.sh",
docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7





{
  "name": "v16_start_real_time",
  "command": ". www1_c6000_pro && sh /usr/local/hdp/bin/kinit.sh && sudo /usr/local/bin/mount_gluster.sh && sh tttcb301/sssvols05/ppp/CodeV16/bin/start_real_time.sh",
  "shell": true,
  "executor": "",
  "executorFlags": "",
  "taskInfoData": "",
  "retries": 1,
  "owner": "",
  "ownerName": "",
  "description": "",
  "cpus": 1,
  "disk": 1024,
  "mem": 10240,
  "disabled": false,
  "softError": false,
  "dataProcessingJobType": false,
  "fetch": [
    {
      "uri": "file:///etc/ppp-docker.tar.gz",
      "executable": false,
      "cache": false,
      "extract": true
    }
  ],
  "uris": [],
  "environmentVariables": [
    {
      "name": "NAGIOS_CONTACT",
      "value": "batch-frameworks-contact"
    }
  ],
  "arguments": [],
  "highPriority": false,
  "runAsUser": "root",
  "concurrent": false,
  "container": {
    "type": "DOCKER",
    "image": "docker-regi.intra.zzz-it.com/ppp/gluster-hdpstar-anaconda3:4.2.7",
    "network": "HOST",
    "networkInfos": [],
    "volumes": [],
    "forcePullImage": false,
    "parameters": [
      {
        "key": "privileged",
        "value": "true"
      }
    ]
  },
  "constraints": [],
  "schedule": "R/2022-06-25T03:05:00.000+09:00/PT4H",
  "scheduleTimeZone": ""
}










