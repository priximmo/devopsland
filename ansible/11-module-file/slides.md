%title: LEARN ANSIBLE
%author: xavki


# 11 ANSIBLE : FILE MODULE

<br>

>> subscribe to my channel <<

<br>

* this playlist :
			* discover many modules
			* concepts and definitions
			* some examples with practice

<br>

Doc : https://docs.ansible.com/ansible/latest/modules/file_module.html

or : ansible-doc <module_name>

<br>

OBJECTIVE OF THIS MODULE

>> manage files, directories and symbolic links

<br>

PARAMETERS

<br>

* attribute : specific characteristics of a file (https://en.wikipedia.org/wiki/Chattr)

<br>

* force : for symbolic links (create the link even if the source file does not exist)

<br>

* group : specify the group of the file/directory

<br>

* owner : same for the owner

---------------------------------------------------------------------------------

# 11 ANSIBLE : FILE MODULE

<br>

* mode : specify permissions with two formats : 0755 or "u=rwx,g=rx,o=rx"

<br>

* path : path of the file or the directory

<br>

* recurse : create all the path if necessary (only for directories)

<br>

* src : source of symbolic link

<br>

* state : absent / directory / file / hard / touch
		* touch : create an empty file
		* file : check if the file is present

<br>

* to start > inventory

```
all:
  children:
    common:
      hosts:
        devans2:
```

<br>

* create a playbook file

```
- name: my first playbook
  hosts: all
  remote_user: vagrant
  tasks:
```

---------------------------------------------------------------------------------

# 11 ANSIBLE : FILE MODULE

<br>

* to check 

```
- name: test ssh connection
  ping:
```

Note:

```
ansible -i inventory all -m ping
```

<br>

* create a directory

```
- name: create a simple directory
  file:
    path: /tmp/xavki/
    state: directory
```

---------------------------------------------------------------------------------

# 11 ANSIBLE : FILE MODULE

<br>

* create directory with specific user

```
- name: create a simple directory
  file:
    path: /tmp/xavki/
    state: directory
    owner: root
```

Note: become or -b (be careful to the indentation)

<br>

* with specific permissions

```
- name: create a simple directory
  file:
    path: /tmp/xavki/
    state: directory
    owner: root
    group: root
    mode: 0755
  become: yes
```

---------------------------------------------------------------------------------

# 11 ANSIBLE : FILE MODULE

<br>

* create a path

```
  - name: create a path
    file:
      path: /tmp/xavki/1/2/3/4
      recurse: yes
      state: directory
      owner: root
      group: root
      mode: 0755
``` 

<br>

* to create a file

```
  - name: touch a file
    file:
      path: /tmp/xavki/1/2/3/4/fichier.txt
      state: touch
      owner: root
      group: root
      mode: 0755
```

---------------------------------------------------------------------------------

# 11 ANSIBLE : FILE MODULE

<br>

* to create a symlink

```
  - name: create a symlink
    file:
      src: /tmp/xavki/1/2/3/4/
      dest: /tmp/symlink
      state: link  #hard
      owner: root
      group: root
      mode: 0755
```

<br>

* to remove a file

```
  - name: remove a file
    file:
      path: /tmp/xavki/1/2/3/4/fichier.txt
      state: absent
```

<br>

* to remove a path or directories

```
  - name: remove path
    file:
      path: /tmp/xavki/
      state: absent
```


