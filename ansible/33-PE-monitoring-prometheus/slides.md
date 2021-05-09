%title: LEARN ANSIBLE
%author: xavki


# 33 PRACTICAL EXERCISE : MONITORING STACK - Prometheus

<br>

>> subscribe to my channel <<

<br>

Purposes :

		* install prometheus/grafana stack with node-exporter

		* install node-exporter with ansible

		* today > install prometheus

		* install grafana

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Infrastructure

		* our script to deploy 4 nodes

		* 1 node = prometheus/grafana + node-exporter

		* 3 nodes = node-exporter


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

In this video :
		1- versionning for node-exporter
		2- install prometheus


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

How to check the node-exporter version and upgrade it ?

		* by the binary (--version) > that doesn't work

		* with a curl on the /metrics > more complexe

		* if we set it in the systemd service when we install it


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Node-exporter versionning : add the version in the template

```
[Unit]
Description=Node Exporter Version {{ node_exporter_version }}
After=network-online.target
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Node-exporter versionning : how to get the version with ansible

		* need to compare the systemd version and ansible variable

		* if we have a difference we upgrade it

```
- name: if node exporter exist get version
  shell: "cat /etc/systemd/system/node_exporter.service | grep Version | sed s/'.*Version '//g"
  when: __check_node_exporter_present.stat.exists == true
  changed_when: false
  register: __get_node_exporter_version
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Node-exporter versionning : change the when condition

```
  when: __check_node_exporter_present.stat.exists == false or not __get_node_exporter_version.stdout == node_exporter_version
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus installation :

		1- create the role
		2- add some variables
		3- install prometheus (with apt)
		4- change command-line arguments
		5- create the configuration file
		6- start the service
		7- create a handler


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : define variables

```
prometheus_dir_configuration: "/etc/prometheus"
prometheus_retention_time: "365d"
prometheus_scrape_interval: "30s"
prometheus_node_exporter: true
prometheus_node_exporter_group: "all"
prometheus_env: "production"
prometheus_var_config:
  global:
    scrape_interval: "{{ prometheus_scrape_interval }}"
    evaluation_interval: 5s
    external_labels:
      env: '{{ prometheus_env }}'
  scrape_configs:
    - job_name: prometheus
      scrape_interval: 5m
      static_configs:
        - targets: ['{{ inventory_hostname }}:9090']
```


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : apt installation

```
- name: update and install prometheus
  apt:
    name: prometheus
    state: latest
    update_cache: yes
    cache_valid_time: 3600
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : change the command line

```
- name: prometheus args
  template:
    src: prometheus.j2
    dest: /etc/default/prometheus
    mode: 0644
    owner: root
    group: root
  notify: restart_prometheus
```

and the prometheus.j2 template

```
ARGS="--web.enable-lifecycle --storage.tsdb.retention.time={{ prometheus_retention_time }} --web.console.templates=/etc/prometheus/consoles --web.console.libraries=/etc/prometheus/console_libraries
```


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : edit the configuration file

```
- name: prometheus configuration file
  template:
    src: prometheus.yml.j2
    dest: "{{ prometheus_dir_configuration }}/prometheus.yml"
    mode: 0755
    owner: prometheus
    group: prometheus
  notify: reload_prometheus
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : edit the configuration file

```
#jinja2: lstrip_blocks: "True"
{{ prometheus_var_config | to_nice_yaml(indent=2) }}
{% if prometheus_node_exporter_group %}
- job_name: node_exporter
  scrape_interval: 15s
  static_configs:
  - targets:
{% for server in groups[prometheus_node_exporter_group] %}
    - {{ server }}:9100
{% endfor %}
{% endif %}
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : ensure prometheus is started

```
- name: start prometheus
  systemd:
    name: prometheus
    state: started
    enabled: yes

- meta: flush_handlers
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Prometheus : create handlers

```
- name: restart_prometheus
  systemd:
    name: prometheus
    state: restarted
    enabled: yes
    daemon_reload: yes

- name: reload_prometheus
  uri:
    url: http://localhost:9090/-/reload
    method: POST
    status_code: 200
```

