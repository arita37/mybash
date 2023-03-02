# Please configure below variables as per deployment machine setup..
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export PYSPARK_PYTHON=/opt/miniconda/bin/python
export SPARK_HOME=/usr/spark
export PATH=$PATH:$SPARK_HOME/b

cd $SPARK_HOME

bin\spark-class org.apache.spark.deploy.master.Master --host 127.0.0.9


bin\spark-class org.apache.spark.deploy.worker.Worker spark://127.0.0.9:8080  --host 





#To launch the master, navigate to /usr/local/bin and execute:

#sudo ./spark-1.5.1-bin-hadoop2.6/sbin/start-master.sh
#Once the master is up and running, you can use your browser to navigate to http://localhost:8080/. You should see the url where the master is listening. E.g. spark://virtual:7077

#You can launch and connect a slave with this url:

#sudo spark-1.5.1-bin-hadoop2.6/sbin/start-slave.sh spark://virtual:7077




