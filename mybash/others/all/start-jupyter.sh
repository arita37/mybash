nohup jupyter notebook \
--config=/dd/101/sssvols07/ppp-jupyter/configs/jupyter_notebook_config-$1.py \
> /dd/101/sssvols07/ppp-jupyter/logs/$1-$(date -Is).log 2>&1 &