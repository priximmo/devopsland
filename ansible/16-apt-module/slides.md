%title: LEARN ANSIBLE
%author: xavki


# 16 ANSIBLE : APT MODULE

<br>

>> subscribe to my channel <<

<br>

Doc : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html

or : ansible-doc <module_name>

<br>

PURPOSE

* install, remove and manage packages

<br>

PARAMETERS

<br>

* install_recommends : could be use to install recommanded packages

<br>

* name : package name

<br>

* only_upgrade : upgrade packages only

-------------------------------------------------------------------------------------------

# 16 ANSIBLE : APT MODULE


<br>

* policy_rc_d : change the applicable rules after installing the package (start/stop the service)

<br>

* purge : to purge configuration files like --purge

<br>

* state : present / absent / latest / fixed / build-dep

<br>

* update_cache : to do an update cache before the installation

<br>

* update_cache_retries : number of retries for the update cache option

<br>

* update_cache_retry_max_delay : to set a timeout for the update

<br>

* upgrade : yes / no / safe / dist / full


-------------------------------------------------------------------------------------------

# 16 ANSIBLE : APT MODULE


<br>

* simply and just update the cache and add a valid time to it

```
  - name: update the cache
    apt:
      update_cache: yes
      cache_valid_time: 3600
```

<br>

* to install a package

```
  - name: install haproxy
    apt:
      name: haproxy
      update_cache: yes
      cache_valid_time: 60
```

-------------------------------------------------------------------------------------------

# 16 ANSIBLE : APT MODULE


<br>

* to use a specific version

```
  - name: install haproxy in stretch-backports
    apt:
      name: haproxy
      default_release: stretch-backports
      update_cache: yes
      cache_valid_time: 60
```

Note :

```
- apt list -a haproxy
- apt list -i haproxy
```

<br>

* if you want the latest version for each run (be careful)

```
  - name: install latest haproxy
    apt:
      name: haproxy
      update_cache: yes
      cache_valid_time: 60
      state: latest
```

-------------------------------------------------------------------------------------------

# 16 ANSIBLE : APT MODULE


<br>

* to remove a package

```
  - name: remove haproxy
    apt:
      name: haproxy
      state: absent
```

<br>

* to remove and clean all files

```
  - name: remove and clean haproxy
    apt:
      name: haproxy
      state: absent
      purge: yes
      autoremove: yes
```

-------------------------------------------------------------------------------------------

# 16 ANSIBLE : APT MODULE


<br>

* to install many packages

```
  - name: install latest haproxy
    apt:
      name: haproxy,git,vim
      update_cache: yes
      cache_valid_time: 60
      state: present
```



