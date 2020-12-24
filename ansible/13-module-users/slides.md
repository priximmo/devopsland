%title: LEARN ANSIBLE
%author: xavki


# 13 ANSIBLE : USER MODULE

<br>

>> subscribe to my channel <<

<br>

Doc : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html

or : ansible-doc <module_name>

<br>

OBJECTIVE OF THIS MODULE

>> create, remove and manage users

>> command : adduser, useradd, userdel, deluser...

<br>

PARAMETERS

<br>

* append : yes/no - recreate groups or add groups to a user

<br>

* comment : add comment to the user

<br>

* create_home : yes/no - do you want to create an home

<br>

* expires : add an expiration date with epoch format

```
date "+%s" -d "10/06/2040 10:00:00"
```

-----------------------------------------------------------------------------------------

# 13 ANSIBLE : USER MODULE


<br>

* force : when you remove a user, you force to remove all user's files

<br>

* generate_ssh_key : create a ssh key when you create the user

<br>

* group : the user's primary group

<br>

* groups : the user's secondary groups

<br>

* home : the path of the user's home

<br>

* local : when you use the decentralization of users like ldap (to force to create locally)

<br>

* name : user's name

<br>

* password : hash of the password

<br>

* password_lock : lock the password

<br>

* remove : when state absent, remove user directories

-----------------------------------------------------------------------------------------

# 13 ANSIBLE : USER MODULE

<br>

* shell : define the user's shell

<br>

* skeleton : overload the skeleton of user's home

<br>

* ssh_key_bits : ssh key size

<br>

* ssh_key_comment : ssh key comment

<br>

* ssh_key_file : the key path

<br>

* ssh_key_passphrase : passphrase to unlock the ssh key

<br>

* ssh_key_type : type of the key (rsa, ecdsa...)

<br>

* state : present/absent - create or remove the user

<br>

* system : when you create a system user

-----------------------------------------------------------------------------------------

# 13 ANSIBLE : USER MODULE

<br>

* uid : to fix the uid

<br>

* update_password : to force to change password at first connection

<br>

* create a simple user

```
- name: create xavki user
  user:
    name: xavki
    state: present
    password: "{{ 'password' | password_hash('sha512') }}"   
```

Note : not a best practice, don't do that

-----------------------------------------------------------------------------------------

# 13 ANSIBLE : USER MODULE

<br>

* add user to the sudo group

```
- name: create xavki user
  user:
    name: xavki
    state: present
    groups: sudo
    append: yes
    password: "{{ 'password' | password_hash('sha512') }}"   
```

<br>

* to fix the uid

```
- name: create xavki user
  user:
    name: xavki
    state: present
    uid: 1200
    groups: sudo
    append: yes
    generate_ssh_key: yes
    password: "{{ 'password' | password_hash('sha512') }}"
```

-----------------------------------------------------------------------------------------

# 13 ANSIBLE : USER MODULE

<br>

* user with nologin

```
- name: création du user xavki
  user:
    name: xavki
    state: present
    shell: /sbin/nologin
    generate_ssh_key: yes
    uid: 1200
    groups: sudo
    append: yes
    password: "{{ 'password' | password_hash('sha512') }}"
    password_lock: yes
```

<br>

* to remove an user

```
- name: création du user xavki
  user:
    name: xavki
    state: absent
```

