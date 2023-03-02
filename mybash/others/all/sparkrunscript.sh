#!/bin/bash
#####  scripts/sparkrunscript.sh  config/config.yaml

########## configuration section ##############################################
# Please configure below variables as per deployment machine setup..
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export PYSPARK_PYTHON=/opt/miniconda/bin/python
export SPARK_HOME=/usr/spark
export PATH=$PATH:$SPARK_HOME/bin


######## main code ## #########################################################
if [ $# -eq 0 ]; then
  echo -e "Incorrect arguments are passed, aborting..."
  echo -e "\tUsage: $0 config_file_path";
  exit 1;
fi

config_file="$1"
echo "Spark-Submit execute job with $config_file config file."

spark-submit --py-files $config_file,dist/ProcessELBLog-1.0-py3.6.egg main.py --config_path $config_file


#############################################################################
# Below block will be more helpful if we need to run next job only if this is completed successfully.
if [ $? != 0 ]; then
  echo "Job failed.."
else
  echo "Job completed successfully.."
fi
