%title: LEARN ANSIBLE
%author: xavki


# 42 : DOCKER NETWORKS & VOLUMES

<br>

>> subscribe to my channel <<

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

```
docker_compose – Manage multi-container Docker applications with Docker Compose
docker_config – Manage docker configs
docker_container – manage docker containers
docker_container_info – Retrieves facts about docker container
docker_host_info – Retrieves facts about docker host and lists of objects of the services
docker_image – Manage docker images
docker_image_info – Inspect docker images
docker_login – Log into a Docker registry
docker_network – Manage Docker networks
docker_network_info – Retrieves facts about docker network
docker_node – Manage Docker Swarm node
docker_node_info – Retrieves facts about docker swarm node from Swarm Manager
docker_prune – Allows to prune various docker objects
docker_secret – Manage docker secrets
docker_stack – docker stack module
docker_swarm – Manage Swarm cluster
docker_swarm_info – Retrieves facts about Docker Swarm cluster
docker_swarm_service – docker swarm service
docker_swarm_service_info – Retrieves information about docker services from a Swarm Manager
docker_volume – Manage Docker volumes
docker_volume_info – Retrieve facts about Docker volumes
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

Needed :
	
		* docker

		* python3-docker or pip3 install docker

<br>

DOCKER NETWORKS

Parameters :

<br>

* appends : to add a network to other networks of a container

<br>

* connected : to connect containers that already exist

<br>

* docker_host : which socket to use (local, ssh, tcp)

<br>

* ipam_config : to define your network

<br>

* name : the network name

<br>

* state : present / absent

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES


<br>

* a simple network

```
  - name: create network xavki
    docker_network:
      name: xavki
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

* to add a container to a network

```
  - name: create network xavki
    docker_network:
      name: xavki
      connected:
      - c1
  - name: run
    docker_container:
      name: c1
      image: myapp:v1.1
      state: started
      networks:
      - name: xavki
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

* to add another network on c1 container

```
  - name: create network xavki
    docker_network:
      name: xavki2
      appends: yes
      connected:
      - c1
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

* toe define the network

```
  - name: create network xavki
    docker_network:
      name: xavki
      connected:
      - c1
      ipam_config:
      - subnet: 172.13.12.0/24
        gateway: 172.13.12.1
        iprange: 172.13.12.0/24
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

DOCKER VOLUME

Parameters :

* driver : local / nfs...

* driver_options : to set the driver

* name : the volume name

* recreate : never / always

* state : present / absent

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

* a simple volume 

```
  - name: Create a volume
    docker_volume:
      name: xavki_data
      state: present
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

* to create a volume with specific path

```
  - name: Create a volume
    docker_volume:
      name: xavki_data
      driver: local
      driver_options:
        o: bind
        type: none 
        device: /tmp/data
```

------------------------------------------------------------

# 42 : DOCKER NETWORKS & VOLUMES

<br>

* to remove it 

```
  - name: Create a volume
    docker_volume:
      name: xavki_data
      state: present
      recreate: never
```

