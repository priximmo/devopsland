%title: LEARN ANSIBLE
%author: xavki


# 41 : DOCKER CONTAINER

<br>

>> subscribe to my channel <<

<br>

Purposes :

		* run a container from an image

<br>

Documentation :
https://docs.ansible.com/ansible/latest/collections/community/general/docker_container_module.html

-----------------------------------------------------------------------

# 41 : DOCKER CONTAINER


<br>

PARAMETERS :

* capabilities : add some capabilities

* cap_drop : remove capabilities

* command : which command 

* comparisons : how ansible can handle a diff

* env : define environment variables

* env_file : to set env vars with a file

* exposed_ports : exposed ports


-----------------------------------------------------------------------

# 41 : DOCKER CONTAINER

<br>

* healthcheck : to define an healthcheck

* image: the source image

* links : specific for the docker network type

* log_driver : which log driver (syslog, docker...)

* log_options : log options

* name : container name

* networks : name of the network

* ports : port mapping

* recreate : always recreate the container

* restart : restart option (always, on-failure...)

* state : absent / present / stopped / started

* volumes : to mount a volume

* volumes_from : if a container is the source of volume

-----------------------------------------------------------------------

# 41 : DOCKER CONTAINER

<br>

* first container from our image

```
  - name: copy files
    file:
      path: /tmp/build
      state: direc tory
  - name: copy image
    copy:
      src: app/
      dest: /tmp/build
  - name: build
    docker_image:
      name: imgbuild
      tag: v1.0
      source: build
      build:
        pull: yes
        path: /tmp/build/
        dockerfile: Dockerfile
        cache_from:
        - alpine:3.9
  - name: run
    docker_container:
      name: c1
      image: imgbuild:v1.0
      state: started
```

-----------------------------------------------------------------------

# 41 : DOCKER CONTAINER

<br>

* with specific command

```
  - name: run
    docker_container:
      name: c1
      image: ubuntu:latest
      state: started
      detach: no
      command: sleep 10
```

<br>

* to expose a port

```
    - name: Start new docker container
      docker_container:
        name: c1
        pull: yes
        image: "myapp:{{ version }}"
        ports:
          - 8080:8080
```

-----------------------------------------------------------------------

# 41 : DOCKER CONTAINER

<br>

* to add a test

```
  - name: build
    docker_image:
      build:
        path: /tmp/build/
        dockerfile: Dockerfile
        pull: yes
      name: myapp
      tag: v1.1
      source: build
  - name: run
    docker_container:
      name: c1
      image: myapp:v1.1
      state: started
      ports:
      - 8888:8080
  - name: wait for instance
    uri:
      url: "http://127.0.0.1:8888/select"
      status_code: 200
    register: result
    until: result.status == 200
    retries: 120
    delay: 1
```

-----------------------------------------------------------------------

# 41 : DOCKER CONTAINER

<br>

* specific healthcheck

```
  - name: run
    docker_container:
      name: c1
      image: myapp:v1.3
      state: started
      ports:
      - 8888:8080
      healthcheck:
        test: ["CMD", "curl", "http://127.0.0.1:8080"]
        interval: 5s
        timeout: 10s
        retries: 3
        start_period: 10s
```
