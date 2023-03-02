/usr/local/bin/env2yaml /usr/share/logstash/config/logstash.yml
/usr/share/logstash/bin/logstash --http.host 0.0.0.0 -f /logstash/logstash.conf