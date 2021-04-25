%title: LEARN ANSIBLE
%author: xavki


# 26 ANSIBLE : SYSTEMD MODULE

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/2.9/modules/systemd_module.html

<br>

PURPOSE :

* manage systemd services (start/stop, enable, daemon-reload)

<br>

PARAMETERS :

<br>

* daemon_reexec : force the daemon restart

<br>

* daemon_reload : run a systemctl daemon-reload when you have chenged the configuration of a service

<br>

* enabled : when you want to start the service at the boot (ensure that the service is started)

---------------------------------------------------------------------------------

# 26 ANSIBLE : SYSTEMD MODULE

<br>

* force : to overwrite systemd symbolic links

<br>

* masked : like disable but doesn't remove the file just link to /dev/null

<br>

* name : the name of the service

<br>

* no_block : never wait the end of the task to continue

<br>

* scope : when you want to manage for a specific user or for all

<br>

* state : started / stopped / reloaded / restarted

---------------------------------------------------------------------------------

# 26 ANSIBLE : SYSTEMD MODULE


<br>

* start or ensure that a service is started

```
- name: Make sure a service is running
  systemd:
    name: haproxy
    state: started
```

<br>

* to start the service at the boot

```
- name: active to the start
  systemd:
    name: haproxy
    state: started
    enabled: yes
```

---------------------------------------------------------------------------------

# 26 ANSIBLE : SYSTEMD MODULE


<br>

* to reload the daemon and start the service if necessary

```
- name: with daemon reload
  systemd:
    name: haproxy
    state: started
    enabled: yes
    daemon-reload: yes
```

<br>

* just do a daemon-reload

```
- name: just do a daemon-reload
  systemd:
    daemon-reload: yes
```

