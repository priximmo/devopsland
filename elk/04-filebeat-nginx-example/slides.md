%title: LEARN ELK
%author: xavki

# 04 FILEBEAT : our first beat example

<br>

Purposes :

		* install filebeat on another server

		* change elasticsearch configuration

		* install nginx

		* check the elasticsearch index in kibana

------------------------------------------------------------------

# 04 FILEBEAT : our first beat example


<br>

* filebeat > beats family (metricbeat, heartbeat...)

* filebeat > send logs directly in elasticsearch

* without log transformation

* better in this case > lighter thn logstash

------------------------------------------------------------------

# 04 FILEBEAT : our first beat example


<br>

* filebeat have many modules for specific softwares :
		* nginx
		* docker
		* redis
		* postgresql
		...

------------------------------------------------------------------

# 04 FILEBEAT : our first beat example


<br>

* installation of filebeat

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt-get install filebeat
```

------------------------------------------------------------------

# 04 FILEBEAT : our first beat example


* change listen IP and seed_discovery on elasticsearch

```
network.host: 0.0.0.0
discovery.seed_hosts: ["127.0.0.1"]
sudo systemctl restart elasticsearch
```

* set the elasticsearch IP in /etc/filebeat/filebeat.yml

------------------------------------------------------------------

# 04 FILEBEAT : our first beat example


<br>

* install nginx

```
sudo apt install nginx
```

<br>

* activate the nginx module

```
sudo filebeat modules list
ls /etc/filebeat/modules.d/
sudo filebeat modules enable nginx
sudo systemctl restart filebeat
```

* test
