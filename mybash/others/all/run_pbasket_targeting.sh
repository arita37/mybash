zip -x *.git* -r /tmp/archive.zip . && \
python pbasket/personalize_basket.py --config config/config.yml