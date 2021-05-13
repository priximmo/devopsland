%title: LEARN PROMETHEUS & GRAFANA
%author: xavki

# 02 PROMETHEUS & GRAFANA : Installation


<br>

PROMETHEUS

<br>

* for debian

```
sudo apt-get install prometheus
```

<br>


* configuration file

```
/etc/prometheus/prometheus.yml
```

--------------------------------------------------------------------------

# 02 PROMETHEUS & GRAFANA : Installation

<br>

* to reload

```
sudo systemctl reload prometheus
curl -X POST http://localhost:9090/-/reload
```

<br>

* to open the GUI

```
localhost:9090
```

--------------------------------------------------------------------------

# 02 PROMETHEUS & GRAFANA : Installation


<br>


* with a container (Docker)

```
docker run -d --name prometheus \
-v $PWD/etc/:/etc/prometheus/ \
 -v $PWD/data/:/prometheus/ \
-p 9090:9090 quay.io/prometheus/prometheus:latest
```

--------------------------------------------------------------------------

# 02 PROMETHEUS & GRAFANA : Installation

GRAFANA

<br>


* installation


```
sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update -qq >/dev/null
sudo apt install -qq -y grafana >/dev/null
```
