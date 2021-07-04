%title: LEARN ANSIBLE
%author: xavki


# 39 : PE MONITORING - GRAFANA USER, DATASOURCE & DASHBOARD

<br>

>> subscribe to my channel <<

<br>

Purpose :

		* continue our practical exercise

		* add automatically prometheus datasource

		* change admin user and admin_password

		* add a grafana dashboard for node-exporter

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD


<br>

* add grafana variables

```
grafana_admin_user: "admin"
grafana_admin_password: "password"
```

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD

<br>

* change admin user

```
- name: change admin user
  lineinfile:
    path: /etc/grafana/grafana.ini
    regexp: "{{ item.before }}"
    line: "{{ item.after }}"
  with_items:
  - { before: "^;admin_user = admin", after: "admin_user = {{ grafana_admin_user }}"}
  - { before: "^;admin_password = admin", after: "admin_password = {{ grafana_admin_password }}"}
```

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD

<br>

* add a datasource to grafana

```
- name: add prometheus datasource
  grafana_datasource:
    name: "prometheus-local"
    grafana_url: "http://127.0.0.1:3000"
    grafana_user: "{{ grafana_user_admin }}"
    grafana_password: "{{ grafana_admin_password }}"
    org_id: "1"
    ds_type: "prometheus"
    ds_url: "http://prometheus:9090"
  changed_when: false
```

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD

<br>

* add a grafana dashboard for node exporter

```
- name: install node exporter dashboard
  get_url:
    url: https://raw.githubusercontent.com/rfrail3/grafana-dashboards/master/prometheus/node-exporter-full.json
    dest: /var/lib/grafana/node-exporter.json
    mode: '0755'
```

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD

<br>

* add a reference to the dashboard

```
- name: activate dashboard for node exporter
  template:
    src: dashboard-node-exporter.yml.j2
    dest: /etc/grafana/provisioning/dashboards/dashboard-node-exporter.yml
    mode: 0755
  notify: restart_grafana
```

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD

<br>

* create the template file

```
apiVersion: 1
providers:
- name: 'node-exporter'
  orgId: 1
  folder: ''
  type: file
  disableDeletion: false
  updateIntervalSeconds: 10 
  options:
    path: /var/lib/grafana/node-exporter.json
```

-----------------------------------------------------------------------

# 39 : PE MONITORING - GRAFANA USER & DASHBOARD

<br>

* add the handler to restart grafana

```
- name: restart_grafana
  systemd:
    name: grafana-server
    state: restarted
    enabled: yes
    daemon_reload: yes
```

