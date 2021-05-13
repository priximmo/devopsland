#!/usr/bin/bash

###############################################################
#  TITRE: install prometheus/grafana
#
#  AUTEUR:   Xavier
#  VERSION: 1.0
#  CREATION:  23/04/2021
#
#  DESCRIPTION: 
###############################################################

set -euxo pipefail

# Variables ###################################################

IP=$(hostname -I | awk '{print $2}')

# Functions ###################################################

prometheus_install(){
  sudo apt-get update -qq >/dev/null
  sudo apt-get install -qq -y wget unzip prometheus >/dev/null
}

prometheus_configuration(){
echo "
global:
  scrape_interval:     5s 
  evaluation_interval: 5s 
  external_labels:
    monitor: 'codelab-monitor'
rule_files:
scrape_configs:
  - job_name: node_exporter
    static_configs:
      - targets: 
" > /etc/prometheus/prometheus.yml
awk '$1 ~ "^192.168" {print "        - "$2":9100"'} /etc/hosts >> /etc/prometheus/prometheus.yml
}

prometheus_restart(){
  systemctl restart prometheus
  systemctl enable prometheus
}

grafana_install(){
sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
apt-get update -qq >/dev/null
apt-get install -qq -y grafana >/dev/null
}


grafana_edit_configuration()
{
echo "
datasources:
-  access: 'proxy'
   editable: true 
   is_default: true
   name: 'prometheus'
   org_id: 1 
   type: 'prometheus' 
   url: 'http://192.168.16.25:9090' 
   version: 1
" > /etc/grafana/provisioning/datasources/all.yml
sudo chmod 644 /etc/grafana/provisioning/datasources/all.yml
}

grafana_dashboard(){
wget https://raw.githubusercontent.com/rfrail3/grafana-dashboards/master/prometheus/node-exporter-full.json -P /var/lib/grafana/

echo "
apiVersion: 1
providers:
- name: 'node-exporter'
  orgId: 1
  folder: ''
  type: file
  disableDeletion: false
  updateIntervalSeconds: 10 
  options:
    path: /var/lib/grafana/node-exporter-full.json
" > /etc/grafana/provisioning/dashboards/dashboard-node-exporter.yml
chown -R root:grafana /etc/grafana/provisioning/dashboards/dashboard-node-exporter.yml

}

grafana_restart(){
systemctl start grafana-server
systemctl enable grafana-server
}

# Let's Go !! #################################################

prometheus_install
prometheus_configuration
prometheus_restart
grafana_install
grafana_edit_configuration
grafana_dashboard
grafana_restart
