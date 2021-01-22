%title: LEARN ANSIBLE
%author: xavki


# 23 ANSIBLE : HANDLERS

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/user_guide/playbooks_handlers.html

<br>

WHAT DOES IT DO ?

* allows you to create and use some triggers

<br>

* A simple example :

		* install a nginx server

		* reload when we change the configuration

<br>

* install the webserserver

```
- name: my first playbook
  hosts: all
  become: yes
  vars:
   nginx_port: 8888
  tasks:
  - name: install nginx
    apt:
      name: nginx,curl
      state: present
      cache_valid_time: 3600
      update_cache: yes
```

----------------------------------------------------------------------------------------
 
# 23 ANSIBLE : HANDLERS


<br>

* remove the default configuration (vhost)

```
  - name: remove default file
    file:
      path: "{{ item }}"
      state: absent
    with_items:
    - "/etc/nginx/sites-available/default"
    - "/etc/nginx/sites-enabled/default"
```

<br>

* create the template

```
  - name: install vhost
    template:
      src: default_vhost.conf.j2
      dest: /etc/nginx/sites-available/default_vhost.conf
      owner: root
      group: root
      mode: 0644
    notify: reload_nginx    # handler name
```

----------------------------------------------------------------------------------------
 
# 23 ANSIBLE : HANDLERS

<br>

* create the symbolic link for the vhost file

```
  - name: activate vhost
    file:
      src: /etc/nginx/sites-available/default_vhost.conf
      dest: /etc/nginx/sites-enabled/default_vhost.conf
      state: link
```

<br>

* start the nginx service

```
  - name: start nginx
    systemd:
      name: nginx
      state: started
```

----------------------------------------------------------------------------------------
 
# 23 ANSIBLE : HANDLERS

<br>

* create the handler

```
  handlers:
  - name: reload_nginx
    systemd:
      name: nginx
      state: reloaded
```

<br>

* to force when you wan to run the handler

```
  - name: Flush handlers
    meta: flush_handlers
```

<br>

* another example for a reboot

```
- name: Check if need to restart
  stat:
    path: /var/run/reboot.pending
  register: __need_reboot
  changed_when: __need_reboot.stat.exists
  notify: reboot_server
```


