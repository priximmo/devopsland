%title: LEARN DOCKER
%author: xavki

# 04 DOCKER : OUR FIRST CONTAINER

<br>

FIND AN IMAGE - Docker Hub

* image (process) > run > container

https://hub.docker.com/\_/registry

-----------------------------------------------

# 04 DOCKER : OUR FIRST CONTAINER

<br>

PULL AN IMAGE

<br>

* store the image locally

```
docker pull nginx
```

* list local image

```
docker image ls
docker image rm nginx
```

-----------------------------------------------

# 04 DOCKER : OUR FIRST CONTAINER

<br>

RUN IMAGE PROCESS -> CONTAINER

<br>
* our first run

```
docker run nginx
```

-----------------------------------------------

# 04 DOCKER : OUR FIRST CONTAINER

<br>

* list our containers

```
docker ps
```

<br>

* get the container IP

```
docker inspect <name>
```

-----------------------------------------------

# 04 DOCKER : OUR FIRST CONTAINER

<br>

* stop/start

```
docker stop <name>
docker start <name>
```

-----------------------------------------------

# 04 DOCKER : OUR FIRST CONTAINER

<br>

* remove our container

```
docker stop <name>
docker ps -a
docker rm <name>
```
