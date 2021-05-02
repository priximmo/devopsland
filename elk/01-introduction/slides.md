%title: LEARN ELK
%author: xavki

# 01 ELK Stack : INTRODUCTION

<br>

## Who am I ? 

<br>

* a french youtubeur named xavki

* a Site Reliability Engineer

* love and practice devops

* share my experience

<br>

>> subscribe to my channel to not miss the next videos <<


-------------------------------------------------------------------------

# 01 ELK Stack : INTRODUCTION


<br>

* Whick stack ? ELK

Elasticsearch > Logstash > Kibana

* very popular stack

<br>

* others : EFK... (Fluentd)

<br>

Why ?

		* many company use it for logs centralization

		* SIEM (Security Information and Event Management)

		* but also to process datas

* free and pay versions (xpack)


-------------------------------------------------------------------------

# 01 ELK Stack : INTRODUCTION


<br>

ElasticSearch :

		* nosql database document-oriented

		* distributed (large scaling)

		* high performance in plain text search

		* index / sharding / replication

		* use lucene search engine

		* request by an API

		* respond in a json format


-------------------------------------------------------------------------

# 01 ELK Stack : INTRODUCTION


<br>

Logstash :

		* ETL (Extract Transfert and Load)

		* 3 steps : Input / Filter / Output 

		* many plugins to work with other databases etc

		* use a specific language Grok


-------------------------------------------------------------------------

# 01 ELK Stack : INTRODUCTION


<br>

Kibana :

		* GUI

		* manage some parts of elasticsearch

		* create requests easily

		* create visualizations (dashboards, charts, datatables...)

		* best competitor = grafana

<br>

Beats : 
		* help you to collect the data
		* system metrics, logs, network, apps performance...
