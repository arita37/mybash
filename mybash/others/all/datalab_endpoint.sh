export http_proxy="$preinstall_http_proxy"
export https_proxy="$preinstall_https_proxy"
export no_proxy="$preinstall_no_proxy"
pip install -r requirements.txt
uvicorn server.main:app --host 0.0.0.0 --port 5000 --no-access-log
