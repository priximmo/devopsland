%title: LEARN ANSIBLE
%author: xavki


# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

>> subscribe to my channel <<


<br>

* many modules to collect informations

```
docker_container_info
docker_image_info
docker_network_info
docker_volume_info
docker_host_info
docker_node_info
docker_swarm_info
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* create many container

```
  - name: iter container
    docker_container:
      name: "n{{ item }}"
      image: "nginx:latest"
      state: started
    with_sequence: count=5
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* remove all containers with the container list

```
  - name: container list
    docker_host_info:
      containers: True
    register: docker_info
  - name: remove all containers
    docker_container:
      name: '{{ item.Names[0] | regex_replace("^/", "") }}'
      state: absent
    loop: '{{ docker_info.containers }}'
```

or for a specific image

```
when: item.Image == 'nginx'
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* to get ip of a container

```
  - name: run
    docker_container:
      name: c1
      image: nginx:latest
      state: started
    register: __container_infos
  - name: print output
    debug:
      var: __container_infos.ansible_facts.docker_container.NetworkSettings.IPAddress
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* check if a cotnainer is running

```
  - name: run
    docker_container:
      name: c1
      image: nginx:lastest
      state: started
    register: __container_infos
  - name: print output
    debug:
      var: __container_infos
  - name: test
    uri:
      url: "http://{{ __container_infos.container.NetworkSettings.Networks.bridge.IPAddress }}"
      status_code: 200
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* collect all container ips

```
  - name: run
    docker_container:
      name: "n{{ item }}"
      image: nginx:latest
      state: started
    with_sequence: count=5
  - name: container list
    docker_host_info:
      containers: True
    register: docker_info
  - name: collecte ips
    docker_container_info:
      name: '{{ item.Names[0] | regex_replace("^/", "") }}'
    register: __container_infos
    loop: '{{ docker_info.containers }}'
  - name: print
    debug:
      msg: "{{ item.container.NetworkSettings.Networks.bridge.IPAddress }}"
    with_items:
    - "{{ __container_infos.results }} "
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* network informations

```
  - name: create network xavki
    docker_network:
      name: xavki
  - name: Get infos about network
    docker_network_info:
      name: xavki
    register: __network_infos
  - name: debug
    debug:
      var: __network_infos
```

-------------------------------------------------------------------

# 43 : DOCKER INFOS : NETWORK, CONTAINER...

<br>

* or a volume

```
  - name: create directory
    file:
      path: /tmp/data
      state: directory
  - name: Create a volume
    docker_volume:
      name: xavki_data
      driver: local
      driver_options:
        o: bind
        type: none
        device: /tmp/data
  - name: get info about volume
    docker_volume_info:
      name: xavki
    register: __volume_infos
  - name: print
    debug:
      var: __volume_infos
```

