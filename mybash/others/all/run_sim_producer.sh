zip -x *.git* -r /tmp/archive.zip . && \
python sc/target_items.py --config config/config.yml && \
python sc/similarity.py --config config/config.yml