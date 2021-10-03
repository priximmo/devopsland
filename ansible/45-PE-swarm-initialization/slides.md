%title: LEARN ANSIBLE
%author: xavki


# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

>> subscribe to my channel <<


<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/community/general/docker_swarm_module.html

<br>

MODULE : DOCKER_SWARM

Purpose :
	
		* add/remove node in cluster

		* manage cluster....

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)


<br>

PARAMETERS

<br>

* advertise_addr : wich address exposed for other nodes

<br>

* autolock_managers : lock managers datas with a key

<br>

* ca_cert / ca_force_rotate / client_cert / client_key...

<br>

* default_addr_pool : range of containers ips

<br>

* docker_host: docker socket (unix/tcp/ssh)

<br>

* election_tick : the delay to launch a new election (if no manager)

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* heartbeat_tick : the check frequency

<br>

* join_token : with state = join, use this token to join managers or workers

<br>

* keep_old_snapshots : number of snapshots we want to keep (history)

<br>

* listen_addr : address/interface that the socket use to listen

<br>

* name : the cluster name

<br>

* node_cert_expiry  : expirtation delay for certs (by default 3 months)

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* node_id : with state remove - to remove a node with this ID

<br>

* remote_addrs : list of cluster managers

<br>

* rotate_manager_token : to activate the token rotation

<br>

* rorate_worker_token : the same for worker

<br>

* snapshot_interval : delay between each snapshot

<br>

* state : present / absent / join / remove / inspect

<br>

OUTPUTS

* ip / tokens...

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

Our infrastructure for our pratical exercise

* inventory

```
all:
  children:
    managers:
      hosts:
        192.168.140.10:
        192.168.140.11:
        192.168.140.12:
        #192.168.140.15:
        #192.168.140.16:
    workers:
      hosts:
        192.168.140.13:
        192.168.140.14:
```

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* 1 - docker repository installation

```
- name: add gpg key
  apt_key:
    url: "{{ docker_repo_key }} "
    state: present
```

```
- name: Add repository
  apt_repository:
    repo: "{{ docker_repo }}"
```

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* 1 - packages installation

```
- name: install docker and dependencies
  apt:
    name: "{{ docker_packages }}"
    state: latest
    update_cache: yes
    cache_valid_time: 3600
  with_items: "{{ docker_packages}}"
```
 
-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* 1 - our variables

* les variables

```
docker_packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - software-properties-common
  - docker-ce
  - docker-ce-cli
  - containerd.io
  - python3-docker
docker_repo: deb [arch=amd64] https://download.docker.com/linux/{{ ansible_distribution|lower }} {{ ansible_distribution_release }} stable
docker_repo_key: https://download.docker.com/linux/ubuntu/gpg
docker_repo_key_id: 0EBFCD88
```

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* 1 - add vagrant user to docker group

```
- name: Add user to docker group
  user:
    name: vagrant
    group: docker
```

<br>

* 1 - start docker

```
- name: start docker
  service:
    name: docker
    state: started
    enabled: yes
```

-------------------------------------------------------------------------------

# 45 : PE SWARM CLUSTER & TOOLS > module docker-swarm (init)

<br>

* 1 - initialize the cluster - our first manager (leader)

```
- name: check/init swarm
  docker_swarm:
    state: present
    advertise_addr: enp0s8:2377
  register: __output_swarm
  when: inventory_hostname in groups['managers'][0]
```

