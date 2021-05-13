%title: LEARN PROMETHEUS & GRAFANA
%author: xavki

# 05 PROMETHEUS : Node Exporter


<br>

List of exporters : 

		https://github.com/prometheus/prometheus/wiki/Default-port-allocations

Purpose :

			* our first exporter > node-exporter

			* node-exporter installation

<br>

Github : https://github.com/prometheus/node_exporter
Doc : 
https://prometheus.io/docs/guides/node-exporter/#installing-and-running-the-node-exporter

------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

Some metrics in node-exporter :

		* disks
		* memory
		* cpu
		* load average
		* mounts
		* interfaces
		* ...

------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

Installation

<br>

* with apt manager

```
sudo apt-get install prometheus-node-exporter
```

Note : prefer the binary

------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

* the binary

Source : https://github.com/prometheus/node_exporter/releases

```
sudo useradd -rs /bin/false node_exporter
wget 
https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
tar -xvzf node_exporter-1.1.2.linux-amd64.tar.gz
mv node_exporter-*.linux-amd64/node_exporter /usr/local/bin/
chown node_exporter:node_exporter /usr/local/bin/node_exporter
chmod 755 /usr/local/bin/node_exporter
```

------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

* systemd : /etc/systemd/system/node_exporter.service

```
[Unit]
Description=Node Exporter
After=network-online.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
```

------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

```
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
```


------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

* by docker 

```
docker run -d \
  --net="host" \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  -p 9100:9100 \
  --name node_exporter \
  quay.io/prometheus/node-exporter \
  --path.rootfs=/host
```


------------------------------------------------------------------------------------------

# 05 PROMETHEUS : Node Exporter


<br>

* add the nexw target

```
  - job_name: node-exporter
    static_configs:
      - targets: ['localhost:9090']
```

