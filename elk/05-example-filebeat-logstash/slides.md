%title: LEARN ELK
%author: xavki

# 05 FILEBEAT & LOGSTASH : Simple example

<br>

Purposes :

		* classic way : filebeat > logstash > elasticsearch

		* change the logstash configuration (video 3)

		* change the filebeat configuration (video 4)

		* create logs

		* check the elasticsearch index in kibana

------------------------------------------------------------------

# 05 FILEBEAT & LOGSTASH : Simple example


<br>

* change the filebeat configuration

```
input {
  beats {
    port => 5044
  }
}
```

Note : change the output index name

------------------------------------------------------------------

# 05 FILEBEAT & LOGSTASH : Simple example


<br>

* change the logstash configuration

```
output.logstash:
  hosts: ["192.168.16.41:5044"]
```

Note : keep the nginx module enabled

------------------------------------------------------------------

# 05 FILEBEAT & LOGSTASH : Simple example


<br>

* disable the nginx module

```
sudo filebeat modules disable nginx
```

* and add a path where filebeat finds logs

```
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/nginx/access.log
```

