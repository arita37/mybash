#!/bin/bash


if [[-z $1 ]]; then

   docker compose -f  localstack/docker_redisplain.yml    up

fi 


if [[ $1=='redicluster' ]]; then

   export HOST_IP=$(ifconfig | awk '/inet /&&!/127.0.0.1/{print $2;exit}')
   ### HOSTIp avaialble in the docker NOW
   docker compose            -f  localstack/docker_rediscluster.yml       up

fi 
   


sleep 10

check/check_s3.sh
check/check_aim.sh




