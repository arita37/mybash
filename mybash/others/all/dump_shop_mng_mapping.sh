DT="$(TZ=Asia/Tokyo date +%Y-%m-%d -d '1 day ago')"
echo $DT
hive -e "desc zdata.z_m_item partition (dt='$DT')" && \
hive -e "select distinct shop_id, shop_url from zdata.z_m_item where dt='$DT'" > /tmp/shop_mng_mapping.tsv

if [ -s "/tmp/shop_mng_mapping.tsv" ]
then
    echo "Copying"
    cp /tmp/shop_mng_mapping.tsv tttgfs101/sssvolh01/sc_rec_items/shop_mng_mapping.tsv
    chown 20640:20166 tttgfs101/sssvolh01/sc_rec_items/shop_mng_mapping.tsv
else
    echo "mapping is empty."
    exit 1
fi
