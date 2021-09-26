%title: LEARN ANSIBLE
%author: xavki


# 44 : DOCKER COMPOSE MODULE

<br>

>> subscribe to my channel <<


<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/community/general/docker_compose_module.html

<br>

Purpose : How to manage docker-compose ?

<br>

PARAMETERS 

* build : to add a build step (with Dockerfile path)

<br>

* definition : to define the docker-compose in this section

<br>

* dependencies : to create a dependancy with another service

<br>

* docker_host : which docker socket to use (unix/ssh/tcp)

--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE



<br>

* files : docker-compose list

<br>

* nocache : to build an image without cache (rebuild)

<br>

* pull : to pull images before to start

<br>

* remove_images : to remove the local image (on target server)

<br>

* remove_orphans : to remove all containers not manage by docker-compose

<br>

* remove_volumes : to remove all volumes

<br>

* scale : to add a scale value

<br>

* services : what do you want to do with services ?
		up (present), stop (stopped), restart (restarted)

<br>

* state : like services parameter



--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE


<br>

* the first step

```
  - name: copy docker-compose.yml
    copy:
      src: app/docker-compose.yml
      dest: tmp/
  - name: test docker-compose
    docker_compose:
      project_src: tmp/
      state: present
```

--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE


<br>

* what we have in the output ?

```
  - name: test docker-compose
    docker_compose:
      project_src: tmp/
      state: present
    register: __docker_compose
  - name: debug
    debug:
      var: __docker_compose
```

--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE


<br>

* to scale our service

```
  - name: test docker-compose
    docker_compose:
      project_src: tmp/
      state: present
      scale:
        app: 4
```


--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE


<br>

* to remove our service

```
  - name: test docker-compose
    docker_compose:
      project_src: tmp/
      state: absent
```

--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE


<br>

* to define the compose file in the ansible code

```
  - name: test docker-compose
    docker_compose:
      project_name: mynginx
      definition:
        version: "3.7"
        services:
          app:
            image: nginx:latest
```

--------------------------------------------------------------------------------------

# 44 : DOCKER COMPOSE MODULE


<br>

* to build the image before

```
  - name: copy docker-compose.yml
    copy:
      src: app/
      dest: /tmp/app

    docker_compose:
      project_name: mynginx
      definition:
        version: "3.7"
        services:
          app:
            build: "/tmp/app/"
            ports:
            - 8888:8080
```

