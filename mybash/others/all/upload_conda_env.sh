CONDA_HOME="$(dirname $(dirname $(which python)))"
echo "conda home at $CONDA_HOME"
cd $CONDA_HOME

tar -C $CONDA_HOME -zcvf /tmp/conda.tar.gz .
hadoop fs -put -f /tmp/conda.tar.gz /user/ppp/resources/
