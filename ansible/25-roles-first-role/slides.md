%title: LEARN ANSIBLE
%author: xavki


# 25 ANSIBLE : ROLE FOR BEGINNER

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html

<br>

SKELETON OF A ROLE

<br>

* generate a standard role

```
ansible-galaxy init roles/myrole
```

<br>

* directories

    * tasks : the role entrypoint
    * defaults : for default variables
    * vars : to set variables that do not change
    * handlers : to define tasks that can be trigger
    * templates : to store template files
    * files : to store static files
    * meta : to share roles in galaxy or dependancies
    * test : to define some tests for the role

-----------------------------------------------------------------------------------------

# 25 ANSIBLE : ROLE FOR BEGINNER


<br>

* standard ansible directory with a role

```
├── 00_inventory.yml
├── group_vars
├── host_vars
├── playbook.yml
└── roles
    └── users
        ├── defaults
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── README.md
        ├── tasks
        │   └── main.yml
        ├── templates
        ├── tests
        │   ├── inventory
        │   └── test.yml
        └── vars
            └── main.yml
```

-----------------------------------------------------------------------------------------

# 25 ANSIBLE : ROLE FOR BEGINNER

<br>

* if want to create and use a role for ssh_keygen

```
- name: generate a local ssh key
  hosts: localhost
  connection: local
  roles:
  - ssh_keygen
- name: create user and deploy a key
  hosts: all
  become: yes
  roles:
	- manage_user
  - nginx_webserver
```

```
  - name: generate SSH key"
    openssh_keypair:
      path: /tmp/xavki
      type: rsa
      size: 4096
      state: present
      force: no
```

-----------------------------------------------------------------------------------------

# 25 ANSIBLE : ROLE FOR BEGINNER

<br>

* create a specific role to deploy the key

```
  - name: création du user devops
    user:
      name: devops
      shell: /bin/bash
      groups: sudo
      append: yes
      password: "{{ 'password' | password_hash('sha512') }}"

  - name: Add devops user to the sudoers
    copy:
      dest: "/etc/sudoers.d/devops"
      content: "devops  ALL=(ALL)  NOPASSWD: ALL"

  - name: Deploy SSH Key
    authorized_key: 
      user: devops
      key: "{{ lookup('file', '/tmp/xavki.pub') }}"
      state: present
```

-----------------------------------------------------------------------------------------

# 25 ANSIBLE : ROLE FOR BEGINNER

<br>

* install nginx

```
  - name: install nginx
    apt:
      name: nginx,curl
      state: present
      cache_valid_time: 3600
      update_cache: yes
  - name: remove default file
    file:
      path: "{{ item }}"
      state: absent
    with_items:
    - "/etc/nginx/sites-available/default"
    - "/etc/nginx/sites-enabled/default"
```

-----------------------------------------------------------------------------------------

# 25 ANSIBLE : ROLE FOR BEGINNER

<br>

* add vhost template

```
  - name: install vhost
    template:
      src: default_vhost.conf.j2
      dest: /etc/nginx/sites-available/default_vhost.conf
      owner: root
      group: root
      mode: 0644
    notify: reload_nginx
  - name: activate vhost
    file:
      src: /etc/nginx/sites-available/default_vhost.conf
      dest: /etc/nginx/sites-enabled/default_vhost.conf
      state: link
```

```
  - name: Flush handlers
    meta: flush_handlers
```

-----------------------------------------------------------------------------------------

# 25 ANSIBLE : ROLE FOR BEGINNER

<br>

* start service

```
  - name: start nginx
    systemd:
      name: nginx
      state: started
```

* handlers

```
  - name: reload_nginx
    systemd:
      name: nginx
      state: reloaded
```

