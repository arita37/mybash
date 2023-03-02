
## Use requirements.txt command only if you have any requirements.txt file. Otherwise skip this 
## Here we use it to install streamlit which is not available by default on GDSP's HTTP Faas - sh-centos-science image
python3 -m pip install -r requirements.txt
python3 main.py