%title: LEARN DOCKER
%author: xavki

# 08 DOCKER : CREATE AN IMAGE FROM A CONTAINER

<br>

Purpose :

		* begin with docker image

		* discover the docker commit command

------------------------------------------------------------------------------

# 08 DOCKER : CREATE AN IMAGE FROM A CONTAINER

<br>

Be careful > not a good practice to do it

		* could help you to debug

		* to play with docker images

Best practice = Dockerfile (next video)

------------------------------------------------------------------------------

# 08 DOCKER : CREATE AN IMAGE FROM A CONTAINER

<br>

* create a container with ubuntu image

```
docker run -d --name c1 ubuntu sleep 3600
docker exec -ti c1 /bin/bash
```

------------------------------------------------------------------------------

# 08 DOCKER : CREATE AN IMAGE FROM A CONTAINER

<br>

* install nginx server for example

```
apt install nginx
/etc/init.d/nginx start
```

------------------------------------------------------------------------------

# 08 DOCKER : CREATE AN IMAGE FROM A CONTAINER

<br>

* create an image from our container

```
docker commit c1 myimage:v1.0
```

Note : -m option to add a comment

* launch a new container

```
docker run -d --name c2 myimage:v1.0
```
