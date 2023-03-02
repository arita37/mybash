zip -x *.git* -r /tmp/archive.zip . && \
python sc/make_genre_targeting.py --config config/config.yml && \
python sc/make_top_targeting.py --config config/config.yml