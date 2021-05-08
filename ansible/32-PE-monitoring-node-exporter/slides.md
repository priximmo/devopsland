%title: LEARN ANSIBLE
%author: xavki


# 32 PRACTICAL EXERCISE : MONITORING STACK - Node Exporter

<br>

>> subscribe to my channel <<

<br>

Purposes :

		* install prometheus/grafana stack with node-exporter

		* today > install node-exporter with ansible

		* install prometheus

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

Source : https://github.com/prometheus/node_exporter/releases

<br>

Developement :

			* inventory

			* playbook

			* node-exporter role

--------------------------------------------------------------------------------


# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

Node-exporter Role :
		
		1- create specific variables
		2- check if node-exporter is already installed
		3- create user/group to launch the binary
		4- create a directory (if we need to add configuration)
		5- download and unzip the binary
		6- move the binary in the $PATH
		7- clean archive file
		8- create the systemd service
		9- create handler and start the service

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

1- Variables (default)

```
node_exporter_version: "1.0.1"
node_exporter_bin: /usr/local/bin/node_exporter
node_exporter_user: node-exporter
node_exporter_group: "{{ node_exporter_user }}"
node_exporter_dir_conf: /etc/node_exporter
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

2- Check if node-exporter is already installed

```
- name: check if node exporter exist
  stat:
    path: "{{ node_exporter_bin }}"
  register: __check_node_exporter_present
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

3- create a user (named node-exporter)

```
- name: create node exporter user
  user:
    name: "{{ node_exporter_user }}"
    append: true
    shell: /usr/sbin/nologin
    system: true
    create_home: false
    home: /
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

4- create a configuration directory

```
- name: create node exporter config dir
  file:
    path: "{{ node_exporter_dir_conf }}"
    state: directory
    owner: "{{ node_exporter_user }}"
    group: "{{ node_exporter_group }}"
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

5- download and unzip the binary

```
- name: download and unzip node exporter if not exist
  unarchive:
    src: "https://github.com/prometheus/node_exporter/releases/download/v{{ node_exporter_version }}/node_exporter-{{ node_exporter_version }}.linux-amd64.tar.gz"
    dest: /tmp/
    remote_src: yes
    validate_certs: no
  when: __check_node_exporter_present.stat.exists == false
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

6- Move the binary in the PATH

```
- name: move the binary to the final destination
  copy:
    src: "/tmp/node_exporter-{{ node_exporter_version }}.linux-amd64/node_exporter"
    dest: "{{ node_exporter_bin }}"
    owner: "{{ node_exporter_user }}"
    group: "{{ node_exporter_group }}"
    mode: 0755
    remote_src: yes
  when: __check_node_exporter_present.stat.exists == false
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

7- clean the archive directory

```
- name: clean
  file:
    path: /tmp/node_exporter-{{ node_exporter_version }}.linux-amd64/
    state: absent
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

8- create a systemd service - install template

```
- name: install service
  template:
    src: node_exporter.service.j2
    dest: /etc/systemd/system/node_exporter.service
    owner: root
    group: root
    mode: 0755
  notify: reload_daemon_and_restart_node_exporter
```


--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

8- create a systemd service - template file

```
[Unit]
Description=Node Exporter
After=network-online.target
[Service]
User={{ node_exporter_user }}
Group={{ node_exporter_user }}
Type=simple
ExecStart={{ node_exporter_bin }}
[Install]
WantedBy=multi-user.target
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

9- start the service and flush the handler to ensure 

```
- meta: flush_handlers

- name: service always started
  systemd:
    name: node_exporter
    state: started
    enabled: yes
```

--------------------------------------------------------------------------------

# 32 PRACTICAL EXERCICES : MONITORING STACK - Node Exporter


<br>

9- create handler to reload the service if necessary

```
- name: reload_daemon_and_restart_node_exporter
  systemd:
    name: node_exporter
    state: restarted
    daemon_reload: yes
    enabled: yes
```
