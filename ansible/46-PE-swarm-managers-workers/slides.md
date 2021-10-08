%title: LEARN ANSIBLE
%author: xavki


# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)

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

# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)


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

# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)

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

# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)

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

# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)

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

# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)

<br>

* install managers (not leader)

```
- name: install nodes
  docker_swarm:
    state: join
    timeout: 60
    advertise_addr: enp0s8:2377
    join_token: "{{ hostvars[groups['managers'][0]]['__output_swarm']['swarm_facts']['JoinTokens']['Manager'] }}"
    remote_addrs: "{{ groups['managers'][0] }}"
  when: inventory_hostname in groups['managers'] and inventory_hostname not in groups['managers'][0]
```

-------------------------------------------------------------------------------

# 46 : PE SWARM CLUSTER & TOOLS > module docker-swarm (workers/managers)

<br>

* install workers

```
- name: install worker
  docker_swarm:
    state: join
    timeout: 60
    advertise_addr: enp0s8:2377
    join_token: "{{ hostvars[groups['managers'][0]]['__output_swarm']['swarm_facts']['JoinTokens']['Worker'] }}"
    remote_addrs: "{{ groups['managers'][0] }}"
  when: inventory_hostname in groups['workers']
```

