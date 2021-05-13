%title: LEARN PROMETHEUS & GRAFANA
%author: xavki

# 03 PROMETHEUS : Concepts & Defintions


<br>

Prometheus use the pull mode :

```
		server/exporter < prometheus < grafana
```

Note : the operation of collect is named "scrape"

-------------------------------------------------------------------------------------

# 03 PROMETHEUS : Concepts & Defintions


<br>

* scrape parameters

		* interval

		* define in job

-------------------------------------------------------------------------------------

# 03 PROMETHEUS : Concepts & Defintions


<br>

* job :

		* to define a scrape

		* specific path : where to fine metrics

		* static_config : to configure a static list of target servers

		* sd_config : to configure a dynamic list (consul, aws...)

		* target : target servers will be scraped

		* where to scrape > (ip/dns + port + path

-------------------------------------------------------------------------------------

# 03 PROMETHEUS : Concepts & Defintions


<br>

* rules : 

		* alerting : to set alerts (threshold, duration...)

		* recording : to create a new metrics with complex formules/request and increase performance


-------------------------------------------------------------------------------------

# 03 PROMETHEUS : Concepts & Defintions


<br>

* openmetrics format :

```
up{job="<job-name>", instance="<instance-id>"} 0
up{instance="192.168.62.3:9100",job="node_exporter",service="myapp"} 1
```

Note :

	* up = name of the metric

	* job, instance, service = label

	* 1 = value

Doc : https://prometheus.io/docs/practices/naming/
