zip -x *.git* -r /tmp/archive.zip . && \
python rpp_bta/target_users.py --config config/config.yml