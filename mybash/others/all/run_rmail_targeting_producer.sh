zip -x *.git* -r /tmp/archive.zip . && \
python rmail/target_mails.py --config config/config.yml