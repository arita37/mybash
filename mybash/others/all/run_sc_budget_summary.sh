zip -x *.git* -r /tmp/archive.zip . && \
python sc_budget_rec/make_daily_summary.py --config config/config.yml

# for i in {1..5}; do echo $(date +'%Y%m%d' -d "20190723 -$i days"); done | xargs -n 1 python sc_budget_rec/make_daily_summary.py --config config/config.yml -d