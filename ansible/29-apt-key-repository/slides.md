%title: LEARN ANSIBLE
%author: xavki


# 29 ANSIBLE : APT KEY & APT REPOSITORY

<br>

>> subscribe to my channel <<

<br>

Documentations :
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_key_module.html
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_repository_module.html

<br>

PURPOSE :

* add key and repository for debian distributions
* example : install docker and its repository

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

APT_KEY 

PARAMETERS :

<br>

* data : give directly the data key

* file : path to a file containing the key 

* id : ID of the key (to remove the key)

* keyring : local path to the key

* keyserver : server where ansible can find the key

* state : present/absent

* url : url to download the key

* validate_certs : if you to use strict TLS or not for https


------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

some examples :

<br>

* with a file

```
- name: Add a key from a file on the Ansible server.
  apt_key:
    data: "{{ lookup('file', 'apt.asc') }}"
    state: present
```

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY

<br>

* with the key url

```
- name: Add an Apt signing key to a specific keyring file
  apt_key:
    id: 9FED2BCBDCD29CDF762678CBAED4B06F473041FA
    url: https://ftp-master.debian.org/keys/archive-key-6.0.asc
    keyring: /etc/apt/trusted.gpg.d/debian.gpg
```

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

* to remove a key with its ID

```
- name: Remove a Apt specific signing key, leading 0x is valid
  apt_key:
    id: 0x9FED2BCBDCD29CDF762678CBAED4B06F473041FA
    state: absent
```

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


APT_REPOSITORY

PARAMETERS :


* codename : if you want to use a PPA (overwrite the distribution repository)

<br>

* filename : the repostory filename in /etc/apt/source.list.d/

<br>

* mode : to set a specific mode (0644)

<br>

* repo : line of the repository in the file

<br>

* state : present/absent

<br>

* update_cache : to update the cache after adding repository

<br>

* validate_certs : use strict TLS or not

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

EXAMPLE WITH DOCKER

<br>

* remove old packages if they are installed

```
  - name: Ensure old versions of Docker are not installed.
    apt:
      name: docker,docker-engine
      state: absent
```

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

* install dependencies

```
  - name: Install role dependencies.
    apt:
      name: apt-transport-https,ca-certificates,gnupg
      state: present
      autoclean: true
```


------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

* add the key

```
  - name: Add Docker apt key
    apt_key:
      url: "https://download.docker.com/linux/debian/gpg"
      state: present
```

<br>

* add the repository and update the apt cache

```
  - name: Add Docker repository.
    apt_repository:
      repo: "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
      state: present
      update_cache: true
```

------------------------------------------------------------------------------------

# 29 ANSIBLE : APT KEY & APT REPOSITORY


<br>

* install docker

```
  - name: install docker
    apt:
      name: docker-ce
      state: present
```

* and make sur it is started

```
  - name: start docker
    systemd:
      name: docker
      state: started
      enabled: yes
```

