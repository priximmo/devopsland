%title: LEARN ANSIBLE
%author: xavki


# 14 ANSIBLE : STAT MODULE & REGISTER

<br>

>> subscribe to my channel <<

<br>

Doc : https://docs.ansible.com/ansible/2.9/modules/stat_module.html

or : ansible-doc <module_name>

<br>

OBJECTIVE OF THIS MODULE

>> collect get informations (facts) for a file or a directory

>> linux command : stat

<br>

PARAMETERS

<br>

* path : path to the file or the directory

<br>

* follow : if you want to follow symbolic link

<br>

* get_checksum  : to get checksum

<br>

* checksum_algorithm : which checksum do you want (md5, sha1...)

<br>

* get_mime: to get the type of data

-------------------------------------------------------------------------------------

# 14 ANSIBLE : MODULE STAT & REGISTER


<br>

* create a file with file module

```
  - name: create a file
    file:
      path: /tmp/xavki.txt
      state: touch
      owner: xavki
```

<br>

* to get fact about this file

```
  - name: check the file
    stat:
      path: /tmp/xavki.txt
```

-------------------------------------------------------------------------------------

# 14 ANSIBLE : MODULE STAT & REGISTER

<br>

* how to get the content of this variable ? with debug module

```
  - name: check the file
    stat:
      path: /tmp/xavki.txt
    register: __file_xavki_exist

  - name: debug
    debug:
      var: __file_xavki
```

<br>

* for example to use the exist key

```
  - name: debug
    debug:
      var: __file_xavki.stat.exists
```

<br>

* and now you can use a task that you are going to condition

```
  - name: create a dirrectory if the xavki file exist
    file:
      path: /tmp/mydir
      state: directory
    when: __file_xavki.stat.exists
```



