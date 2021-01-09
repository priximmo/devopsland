%title: LEARN ANSIBLE
%author: xavki


# 21 ANSIBLE : FETCH MODULE

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/fetch_module.html

<br>

PURPOSE : collect some files on target servers

<br>

* dest : where to store the file

<br>

* fail_on_missing : generate an error of the file is not present (default yes)

<br>

* flat : overwrite the destination file

<br>

* src : which file do you like to collect 

<br>

* validate_checksum : to validate the file with a checksum

----------------------------------------------------------------------------

# 21 ANSIBLE : FETCH MODULE


<br>

* the simple case

```
  - name: fetch
    fetch:
      src: /etc/hosts
      dest: tmp/
```

<br>

* to get one fie by server

```
  - name: fetch
    fetch:
      src: /etc/hosts
      dest: tmp/hosts_{{ ansible_hostname }}.txt
```

----------------------------------------------------------------------------

# 21 ANSIBLE : FETCH MODULE

<br>

* with flat option (overwrite the file if necessary)

```
  - name: fetch
    fetch:
      src: /etc/hosts
      dest: tmp/hosts_{{ ansible_hostname }}.txt
      flat: yes
```

----------------------------------------------------------------------------

# 21 ANSIBLE : FETCH MODULE

<br>

* combine with nginx to display in browser

```
- name: our local server
  connection: local
  hosts: localhost
  become: yes
  tasks:
  - name: install nginx
    apt:
      name: nginx
      state: present
  - name: clean
    file:
      path: "{{ item }}"
    state: absent
    with_fileglob:
    - /var/www/html/*.html
```

----------------------------------------------------------------------------

# 21 ANSIBLE : FETCH MODULE

<br>

* to collect the hosts file


```
- name: get hosts and store it
  hosts: all
  tasks:
  - name: fetch
    fetch:
      src: /etc/hosts
      dest: /var/www/html/hosts_{{ ansible_hostname }}.txt
      flat: yes
```

* nginx conf

```
  autoindex on;
  autoindex_exact_size off;
```


