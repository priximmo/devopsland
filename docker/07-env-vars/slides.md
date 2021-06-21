%title: LEARN DOCKER
%author: xavki

# 07 DOCKER : ENVIRONMENT VARIABLES

<br>

Purpose :

		* how to set and use env vars


<br>

--env or -e

-----------------------------------------------------------------------------------------

# 07 DOCKER : ENVIRONMENT VARIABLES

<br>

* a simple example

```
docker run -d --name c1 --env MYVAR="Xavki" ubuntu:latest sleep 3600s
```

or

```
docker run -ti --name c1 --env MYVAR="Xavki" ubuntu:latest env
```

-----------------------------------------------------------------------------------------

# 07 DOCKER : ENVIRONMENT VARIABLES

<br>

* with a dedicated file

```
vim vars.env
```

```
docker run -d --name c1 --env-file vars.env ubuntu:latest sleep 3600s
```

Note : to set the hostname > --hostname xxx

