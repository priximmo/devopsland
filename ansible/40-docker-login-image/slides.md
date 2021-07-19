%title: LEARN ANSIBLE
%author: xavki


# 40 : DOCKER LOGIN & IMAGE

<br>

>> subscribe to my channel <<

<br>

Purposes :

		* build an image

		* push it

		* login to a registry

<br>

Documentation :
https://docs.ansible.com/ansible/latest/collections/community/general/docker_image_module.html

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

Prerequisites :

	* docker on target servers

	* python3-docker or pip3 install docker

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

PARAMETERS :

<br>

* api_version : version de l'api docker (docker info)

<br>

* archive_path : cas d'une image en tar, chemin d'accès

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

* build : 
		* args : specific args with key/value
		* cache_from : use the source image in cache
		* container_limits: specific limits (for the build)
					* cpusetcpus : number
					* cpushares : weight
					* memory : max memory
					* memswap : full memory (mem + swap) , -1 = disable swap

		* dockerfile : name of the Dockerfile
		* /etc/hosts : specific /etc/hosts for the build
		* http_timeout : timeout
		* network 
		* no_cache: to not use the cache
		* path : contextual path
		* pull : pull for FROM instruction
		* rm : remove intermediate image
		* target : the final image
		* use_config_proxy : to use a proxy


-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE



<br>

* buildargs (deprecated) : idem build > args

<br>

* ca_cert : to check the certs (DOCKER_CERT_PATH)

<br>

* client_cert : tls client

<br>

* client_key : tls client key 

<br>

* containers_limit (deprecated) : build > container_limits


----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

* debug : activate the debug mode

<br>

* docker_hosts : to define the docker socket (local or remotely)

<br>

* dockerfile (deprecated) : set in the build

<br>

* force : to remove an image with state absent

<br>

* force_source :  build, load, pull if the image already exist

<br>

* force_tag : to force the image tag

<br>

* http_timeout (deprecated) : view build

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE


<br>

* load_path : load ans image from a tarball

<br>

* name : image name

<br>

* nocache : deactivate the cache for the build

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

* path (deprecated) : view build

<br>

* pull : view build

<br>

* push : view build

<br>

* repository : path to the repository

<br>

* rm (deprecated) : view build

<br>

* source : how to have an image
		* build : dockerfile source
		* load : tar archive
		* pull : pull from a registry
		* local : only the local cache

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE


<br>

* ssl_version : which tls version use by docker

<br>

* state : present / build / absent

<br>

* tag : which tag

<br>

* timeout : timeout delay to join the docker socket

<br>

* tls : to use a tls connexion to the docker socket

<br>

* tls_hostname : hostname for the tls connexion

<br>

* validate_certs : check tls strictly or not


-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE


<br>

EXAMPLES :

<br>

* just pull an image

```
  - name: Pull an image
    docker_image:
      name: alpine
      tag: latest
      source: pull
```

<br>

* to re-tag an image

```
  - name: Pull an image
    docker_image:
      name: alpine
      tag: latest
      repository: myregistry/monimage:v1.0
```

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE


<br>

* import with a tar file (docker save)

```
  - name: copy image
    copy:
      src: image.test.v1.0.tar
      dest: /tmp/
  - name: Pull an image
    docker_image:
      name: archive
      tag: v1.0
      load_path: /tmp/image.test.v1.0.tar
      source: load
```

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

* build an image from a Dockerfile

```
  - name: copy files
    file:
      path: /tmp/build
      state: directory
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
        path: /tmp/build/app/
        dockerfile: Dockerfile
        cache_from:
        - alpine:3.9
```

-----------------------------------------------------------------------

# 40 : DOCKER LOGIN & IMAGE

<br>

* build & push

```
  - include_vars: /home/oki/.vault.yml
  - name: docker login
    docker_login:
      registry_url: registry.gitlab.com
      username: xavki
      password: "{{ vault_token_gitlab }}"
      reauthorize: yes
  - name: build
    docker_image:
      build:
        path: /tmp/build/
        dockerfile: Dockerfile
        pull: yes
        cache_from:
        - alpine:3.9
      source: build
      name: registry.gitlab.com/xavki/testflux
      tag: v1.1
```

