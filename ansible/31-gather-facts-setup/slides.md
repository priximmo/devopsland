%title: LEARN ANSIBLE
%author: xavki


# 31 GATHER FACTS & SETUP MODULE

<br>

>> subscribe to my channel <<

<br>

Documentation : 
	* setup : https://docs.ansible.com/ansible/2.3/setup_module.html
  * gather facts : https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html

<br>

* gather facts = get/collect many informations about target servers

		* networks

		* devices

		* os

		* hardware

		* mounts

* ansible get one dictionnary > ansible_facts


--------------------------------------------------------------


# 31 GATHER FACTS & SETUP MODULE


<br>

USAGE 


<br>

* by the CLI

```
ansible -i 00_inventory.yml all -m setup
ansible -i 00_inventory.yml all -m setup -a "filter=ansible_user*"
```
<br>

* or by the playbook

```
  - name: debug
    debug:
      var: ansible_facts
```


--------------------------------------------------------------


# 31 GATHER FACTS & SETUP MODULE


<br>

* use the module setup to register it into a variable

```
  - name: debug
    setup:
    register: _hosts_facts
  - name: display
    debug:
      var: _hosts_facts
```

<br>

* filter with the parameter

```
  - name: debug
    setup:
      filter: ansible_user*
    register: _hosts_facts
```

<br>

* to save time, you can refuse to gather fact

```
- name: test variables
  hosts: all
  gather_facts: no 
  tasks:
  - name: display
    debug:
      var: ansible_facts
```

