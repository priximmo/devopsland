%title: LEARN ANSIBLE
%author: xavki


# 19 ANSIBLE : DELEGATE_TO, RUN_ONCE, LOCAL

<br>

>> subscribe to my channel <<

<br>

Documentation: https://docs.ansible.com/ansible/2.3/playbooks_delegation.html

<br>

PURPOSE

* use local run or delegate some tasks to specific server

* an example : get elements of servers A B on server C (or localhost) - ex : master/slave system

<br>

DELEGATE TO

* we are on a server A loop and we want to create/do something on server C

<br>

* to use it (for example with delegate to localhost) :

```
- name: my first playbook
  hosts: all
  tasks:
  - name: create a file on target server
    file:
      path: /tmp/i_m_on_target_server.txt
      state: touch
  - name: create a xavki file on localhost with delegation
    file:
      state: touch
      path: /tmp/xavki.txt
    delegate_to: localhost
```

----------------------------------------------------------------------------------

# 19 ANSIBLE : DELEGATE_TO, RUN_ONCE, LOCAL

<br>

* another example with inventory_hostname variable

```
- name: my first playbook
  hosts: all
  tasks:
  - name: create a file on target server
    file:
      path: /tmp/i_m_on_target_server.txt
      state: touch
  - name: create a xavki file on localhost with delegation
    file:
      state: touch
      path: "/tmp/{{ inventory_hostname }}.txt"
    delegate_to: localhost
```

----------------------------------------------------------------------------------

# 19 ANSIBLE : DELEGATE_TO, RUN_ONCE, LOCAL

<br>

* another example with var1

```
- name: my first playbook
  hosts: all
  tasks:
  - name: debug
    debug:
      var: var1
  - name: debug
    debug:
      var: var1
    delegate_to: localhost
```

----------------------------------------------------------------------------------

# 19 ANSIBLE : DELEGATE_TO, RUN_ONCE, LOCAL

<br>

* to run the task only once (ex : many slave and one master)

```
- name: my first playbook
  hosts: all
  tasks:
  - name: create a file on target server
    file:
      path: /tmp/i_m_on_target_server.txt
      state: touch
  - name: create a xavki file on localhost with delegation
    file:
      state: touch
      path: /tmp/xavki.txt
    run_once: yes
    delegate_to: localhost
```

----------------------------------------------------------------------------------

# 19 ANSIBLE : DELEGATE_TO, RUN_ONCE, LOCAL

<br>

LOCAL CONNECTION

<br>

* the wrong way = local_action module

```
- name: my first playbook
  hosts: localhost
  tasks:
  - name: local action
    local_action: "command touch /tmp/xavki2.txt"
```

Note : we need ssh connection (password and key)

----------------------------------------------------------------------------------

# 19 ANSIBLE : DELEGATE_TO, RUN_ONCE, LOCAL

<br>

* to do some task on ansible server

* local = without ssh command (no password and no key)

<br>

* with local connection

```
- name: my first playbook
  hosts: localhost
  connection: local
  tasks:
  - name: local action
    file:
      state: touch
      path: /tmp/xavki3.txt
```
