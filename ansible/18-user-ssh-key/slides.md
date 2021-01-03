%title: LEARN ANSIBLE
%author: xavki


# 18 ANSIBLE : MODULES SSH (GENERATE AND PUSH)

<br>

>> subscribe to my channel <<

<br>

Documentation:
* https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html
* https://docs.ansible.com/ansible/latest/collections/community/crypto/openssh_keypair_module.html


<br>

PURPOSE

* generate an ssh key and deploy it

<br>

PARAMETERS : the openssh_keypair module

<br>

* attibutes : change attributes of the file (like chattr)

<br>

* comment : add a comment to the key

<br>

* force : regenerate the key if it already exists

<br>

* group : set the group for the key file

<br>

* mode : set permissions (0600, U+rw)

<br>

* owner : set the owner

-----------------------------------------------------------------------------

# 18 ANSIBLE : MODULE SSH (GENERATE AN PUSH)

<br>

* path : where to store the key

<br>

* regenerate : never / fail / partial_idempotence (if not valid) / full_idempotence (only if not readable) / always

<br>

* size : size of the key

<br>

* state : present/absent

<br>

* type : rsa / dsa / rsa1 / ecdsa / ed25519

<br>

* unsafe_writes : to prevent corruption of the ssh key

Note : only with force : yes

-----------------------------------------------------------------------------

# 18 ANSIBLE : MODULE SSH (GENERATE AN PUSH)


<br>

* just generate a simple key on our laptop

``` 
- name: mon premier playbook
  hosts: localhost
  connection: local
  remote_user: vagrant
  tasks:
  - name: generate SSH key"
    openssh_keypair:
      path: /tmp/xavki
      type: rsa
      size: 4096
      state: present
      force: no
```


-----------------------------------------------------------------------------

# 18 ANSIBLE : MODULE SSH (GENERATE AN PUSH)


<br>

PARAMETRES : the authorized_key module

<br>

* comment : add a comment or remove the comment added when creating the key

<br>

* exclusive : remove all others keys but only with_fileglob

<br>

* follow : to follow symbolic links

<br>

* key : to define the content of the key file

<br>

* key_options : to add specific options (from=<ip>...)

<br>

* manage_dir : the module manages the directory itself

<br>

* path : path to the key file (default .ssh...)

<br>

* state : present / absent

<br>

* user : the target user who you want to add the key


-----------------------------------------------------------------------------

# 18 ANSIBLE : MODULE SSH (GENERATE AN PUSH)


<br>

* create an user and add him the ssh key

```
  - name: create devops user
    user:
      name: devops
      shell: /bin/bash
      groups: sudo
      append: yes
      password: "{{ 'password' | password_hash('sha512') }}"
    become: yes

  - name: Add devops user to the sudoers
    copy:
      dest: "/etc/sudoers.d/devops"
      content: "devops  ALL=(ALL)  NOPASSWD: ALL"
    become: yes

  - name: Deploy SSH Key
    authorized_key: 
      user: devops
      key: "{{ lookup('file', '/tmp/xavki.pub') }}"
      state: present
    become: yes
```


-----------------------------------------------------------------------------

# 18 ANSIBLE : MODULE SSH (GENERATE AN PUSH)

<br>

* if you want to manage all keys

```
- name: Set authorized key, removing all the authorized keys already set
  authorized_key:
    user: root
    key: '{{ item }}'
    state: present
    exclusive: True
  with_file:
    - public_keys/doe-jane
```
