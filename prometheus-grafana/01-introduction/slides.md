%title: LEARN PROMETHEUS & GRAFANA
%author: xavki

# 01 PROMETHEUS & GRAFANA : installation

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

# 01 PROMETHEUS & GRAFANA : installation


<br>

PROMETHEUS

<br>

What is it ?

<br>

* timeseries database

<br>

* allows you to store metrics (system, network, others)

<br>

* uses a pull method to scrape your metrics

<br>

* high performance - GO language

<br>

* timeseries DB + GUI (requests, see configuration)

-------------------------------------------------------------------------

# 01 PROMETHEUS & GRAFANA : installation


<br>

* scrape routes (for example 192.168.12.13:9100/metrics)

<br>

* openmetrics format

<br>

* metrics are stored with 3 values : clef / timestamp / value

<br>

* double delta : diff with the last value

-------------------------------------------------------------------------

# 01 PROMETHEUS & GRAFANA : installation

<br>

* service discovery : EC2, consul, dns...

<br>

Repo : https://github.com/prometheus/prometheus

Website : https://prometheus.io/

-------------------------------------------------------------------------

# 01 PROMETHEUS & GRAFANA : installation


GRAFANA


<br>

* GUI

<br>

* purpose : data visualization

<br>

* connection to several databases type : prometheus, elasticsearch, mysql, postgresql...

<br>

* create : dashboard, charts, tables, diagrams, maps

<br>

* authentication/authorization : LDAP, GoogleAuth...

<br>

* alerting : set triggers to send notifications (for example slack)

<br>

Website : https://grafana.com/

