%title: LEARN DOCKER
%author: xavki

# 06 DOCKER : DOCKER VOLUME

<br>

Purpose :

		* docker volume command line


<br>

```
docker volume --help
```

<br>

	* ls : list

	* inspect : see metadatas

	* create : create a volume

	* rm : remove

	* prune : to clean volumes


------------------------------------------------------------------

# 06 DOCKER : DOCKER VOLUME


<br>

* to create a volume

```
docker volume ls
docker volume create myvolume
```

<br>

* to read metadatas

```
docker volume inspect myvolume
```

Note :

	* MountPoint > where files are stored

	* Driver > local

------------------------------------------------------------------

# 06 DOCKER : DOCKER VOLUME


<br>

* to use a volume with a container

```
docker run -ti --name c1 -v myvolume:/usr/share/nginx/html nginx
```

------------------------------------------------------------------

# 06 DOCKER : DOCKER VOLUME


<br>

* to remove a container

```
docker volume ls
docker volume rm myvolume
```
