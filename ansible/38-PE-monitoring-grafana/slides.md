%title: LEARN ANSIBLE
%author: xavki


# 38 : PE MONITORING - GRAFANA INSTALLATION

<br>

>> subscribe to my channel <<

<br>

Purpose :

		* continue our practical exercise

		* install grafana

-----------------------------------------------------------------------

# 38 : PE MONITORING - GRAFANA INSTALLATION

<br>

* add gnupg package

```
- name: install gpg
  apt:
    name: gnupg,software-properties-common
    state: present
    update_cache: yes
    cache_valid_time: 3600
```

* module apt_key :

```
- name: add gpg hey
  apt_key:
    url: "https://packages.grafana.com/gpg.key"
    validate_certs: no
```

-----------------------------------------------------------------------

# 38 : PE MONITORING - GRAFANA INSTALLATION

<br>

* module apt_repository

```
- name: add repository
  apt_repository:
    repo: "deb https://packages.grafana.com/oss/deb stable main"
    state: present
    validate_certs: no
```


-----------------------------------------------------------------------

# 38 : PE MONITORING - GRAFANA INSTALLATION


<br>

* install grafana

```
- name: install grafana
  apt:
    name: grafana
    state: latest
    update_cache: yes
    cache_valid_time: 3600
```

<br>

* ensure grafana is started

```
- name: start service grafana-server
  systemd:
    name: grafana-server
    state: started
    enabled: yes
```

-----------------------------------------------------------------------

# 38 : PE MONITORING - GRAFANA INSTALLATION


<br>

* wait the grafana response to continue

```
- name: wait for service up
  uri:
    url: "http://127.0.0.1:3000"
    status_code: 200
  register: __result
  until: __result.status == 200
  retries: 120
  delay: 1
```

-----------------------------------------------------------------------

# 38 : PE MONITORING - GRAFANA INSTALLATION

<br>

* change the default password for admin user

```
- name: change admin password for grafana gui
  shell : "grafana-cli admin reset-admin-password {{ grafana_admin_password }}"
	register: __command_admin
	changed_when: __command_admin.rc !=0
```

