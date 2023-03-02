zip -x *.git* -r /tmp/archive.zip . && \
python sc/item_stats.py --z_stat --config config/config.yml && \
python sc/item_stats.py --cc_stat --config config/config.yml