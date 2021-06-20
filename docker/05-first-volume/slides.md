%title: LEARN DOCKER
%author: xavki

# 05 DOCKER : OUR FIRST VOLUME

<br>

* previous video

```
docker run -d -p 8080:80 nginx
```

Notes:
		* -d = detach
		* -p to redirect host port on docker port

<br>

* to add a volume

```
docker run -d -v /srv/data/nginx/:/usr/share/nginx/html/ -p 8080:80 nginx
```


