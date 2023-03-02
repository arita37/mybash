

mkdir -p /tmp/libcouchbase
cd /tmp/libcouchbase

cp /usr/lib64/libcouchbase.so \
/usr/lib64/libcouchbase.so.2 \
/usr/lib64/libcouchbase.so.2.0.68 \
.

tar -C /tmp/libcouchbase -zcf /tmp/libcouchbase.tar.gz .
hadoop fs -mkdir -p /user/ppp/rpp/rt_summary/resources/latest
hadoop fs -put -f /tmp/libcouchbase.tar.gz /user/ppp/rpp/rt_summary/resources/latest/

