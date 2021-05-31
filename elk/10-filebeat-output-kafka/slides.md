%title: LEARN ELK
%author: xavki

# 10 FILEBEAT : The kafka output

<br>

Purposes :

		* send logs into kafka topics

		* get logs in the kafka topic with logstash


docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:19092 --list
kafkacat -C -b 192.168.16.1:19092 -t filebeat
docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:19092 --topic filebeat --delete

