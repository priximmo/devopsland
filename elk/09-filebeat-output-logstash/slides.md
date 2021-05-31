%title: LEARN ELK
%author: xavki

# 09 FILEBEAT : The Logstash Output

<br>

Purposes :

		* discover logstash output options for filebeat

		* how to configure multilogstash load-balancing


------------------------------------------------------------------

# 06 FILEBEAT : the log input


<br>

Main options :

		* compression_level : to compress datas to send its

		* worker : the number of filebeat workers per host

		* escape_html : when datas contain an html code

		* pipelining : number of batchs that you send without waiting the ack (callback)

		* index : to define the name of the elasticsearch index

		* timeout : to define the waiting time before timeout

		* max_retries : number of retries before the fail

		* ssl : to use the tls encryption

------------------------------------------------------------------

# 06 FILEBEAT : the log input

<br>

* install a second logstash

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt-get install logstash

------------------------------------------------------------------

# 06 FILEBEAT : the log input


<br>

* configure the loadbalancing in filebeat

```
output.logstash:
  hosts: ["192.168.16.41:5044","192.168.16.43:5044"]
  loadbalance: true
```
