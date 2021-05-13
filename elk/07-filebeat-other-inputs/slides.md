%title: LEARN ELK
%author: xavki

# 07 FILEBEAT : INPUT CONTAINER & TCP

<br>

Purposes :

		* discover another inputs

------------------------------------------------------------------

# 07 FILEBEAT : INPUT CONTAINER & TCP


<br>

* list of inputs

```
    Azure eventhub
    Cloud Foundry
    Container
    Docker
    Google Pub/Sub
    HTTP JSON
    Kafka
    Log
    MQTT
    NetFlow
    Office 365 Management Activity API
    Redis
    s3
    Stdin
    Syslog
    TCP
    UDP
```

------------------------------------------------------------------

# 07 FILEBEAT : INPUT CONTAINER & TCP


<br>

* docker example

```
  curl -fsSL https://get.docker.com -o get-docker.sh 2>&1 >/dev/null
  sudo sh get-docker.sh 2>&1 >/dev/null
  sudo usermod -aG docker vagrant
```

```
- type: container
  enabled: true
  paths:
    - '/var/lib/docker/containers/*/*.log'
```

Documentation :
https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-input-container.html

------------------------------------------------------------------

# 07 FILEBEAT : INPUT CONTAINER & TCP


<br>

* TCP input

```
filebeat.inputs:
- type: tcp
  max_message_size: 10MiB
  host: "localhost:9000"
```

Documentation :
https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-input-tcp.html

* send data

```
 echo "field1 filed2 field3" |nc 192.168.16.42 9000
```
