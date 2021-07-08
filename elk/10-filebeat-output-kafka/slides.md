%title: LEARN ELK
%author: xavki

# 10 FILEBEAT : The kafka output

<br>

Purposes :

		* send logs into kafka topics

		* get logs in the kafka topic with logstash


--------------------------------------------------------------------------------

# 10 FILEBEAT : The kafka output



docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --create --zookeeper localhost:22181 --replication-factor 1 --partitions 1 --topic test

docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --list --zookeeper localhost:22181



docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:9092 --list
kafkacat -C -b 192.168.16.1:9092 -t test
kafkacat -P -b 192.168.16.1:9092 -t test
docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:9092 --topic filebeat --delete

