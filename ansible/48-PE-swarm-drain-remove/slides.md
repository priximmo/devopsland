%title: LEARN ANSIBLE
%author: xavki


# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes

<br>

>> subscribe to my channel <<


<br>

Execise : Remove managers with specific IP ( .15 .16) ?

-------------------------------------------------------------------------------------

# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes


<br>

*  Exemple : list all ansible hostnames

```
  vars:
    nodeList: []
```

```
- name: fact
  set_fact:
    nodeList: "{{ [ hostvars[item]['ansible_hostname'] ] + nodeList }}"
  with_items: "{{ groups['all'] }}"
  when: inventory_hostname in groups['managers'][0]
```

-------------------------------------------------------------------------------------

# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes


<br>

* Print all odd nodes ?

```
- name: print
  debug:
    msg: "{{ item }}"
  when: inventory_hostname in groups['managers'][0] and item | regex_replace('^devans.*([0-9]+)$', '\\1') | int is divisibleby 2
  with_items: "{{ nodeList }}"
```

-------------------------------------------------------------------------------------

# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes


<br>

* How to drain all these nodes ?

```
- name: drain node
  docker_node:
    hostname: "{{ item }}"
    availability: drain
  when: inventory_hostname in groups['managers'][0] and item | regex_replace('^devans.*([0-9]+)$', '\\1') | int is divisibleby 2
  with_items: "{{ nodeList }}"
```

-------------------------------------------------------------------------------------

# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes


<br>

* How to change to change the role ?

```
- name: change role
  docker_node:
    hostname: "{{ item }}"
    role: worker
  when: inventory_hostname in groups['managers'][0] and item | regex_replace('^devans.*([0-9]+)$', '\\1') | int is divisibleby 2
  with_items: "{{ nodeList }}"
```

-------------------------------------------------------------------------------------

# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes

<br>

* And how to remove these nodes ?

```
- name: stop node
  docker_swarm:
    state: absent
    force: true
  when: ansible_hostname | regex_replace('^devans.*([0-9]+)$', '\\1') | int is divisibleby 2
```

-------------------------------------------------------------------------------------

# 48 : PE SWARM CLUSTER & TOOLS > drain and remove nodes

<br>

* To inspect the cluster ?

```
- name: Inspect swarm
  docker_swarm:
    state: inspect
  register: __swarm_info
- name: print swarm infos
  debug:
    var: __swarm_info
```
