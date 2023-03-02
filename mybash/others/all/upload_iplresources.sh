iplresources_build="$1" #f14bee7d7fa
echo "iplresource tag is $iplresources_build"

cd /tmp && \
curl -skO https://artifactory.zzz-it.com/aog-generic-local/pm/iplresources/$iplresources_build/iplresources-$iplresources_build.tar.gz && \
mv iplresources-$iplresources_build.tar.gz iplresources.tar.gz

hadoop fs -mkdir -p /user/ppp/rpp/rt_summary/resources/latest
hadoop fs -put -f iplresources.tar.gz /user/ppp/rpp/rt_summary/resources/latest/