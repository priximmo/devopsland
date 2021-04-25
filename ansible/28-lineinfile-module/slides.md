%title: LEARN ANSIBLE
%author: xavki


# 28 ANSIBLE : LINEINFILE MODULE

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/lineinfile_module.html

<br>

PURPOSE :

* allows you to change the file change

<br>

PARAMETERS :

<br>

* attributes : to change attributes like chattr

<br>

* backrefs : to allow to capture with regex

<br>

* create : to create the file if not exist

---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* firstmatch : to execute at the first occurence

<br>

* group : to set the group of the file

<br>

* insertafter : to insert a line after the occurence

<br>

* insertbefore : like insertafter but before

<br>

* line : the new line to add or edit (if regex)

---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES

<br>

* mode : to define the ode of the file (0755 or u+rwx...)

<br>

* owner : to set the owner of the file

<br>

* path : the location of the file

<br>

* regexp : to define the regexp to find the line

<br>

* state : present/absent > add, remove or edit the line


---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* a simple case : to add a line into a file

```
  - name: lineinfile
    lineinfile: 
      dest: /tmp/test.conf 
      line: "test"
      state: present
      create: True
```

Warning : if you change the line > new line	

---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* to find a specific line with a minimalist regexp

```
    lineinfile:
      dest: /tmp/test.conf
      line: "test 2"
      regexp: "^test$"
      state: present
      create: True
```


---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* to find with regexp and capture to reuse it

```
    lineinfile:
      dest: /tmp/test.conf
      line: 'je suis le nombre : \1'
      regexp: "^test ([0-2])$"
      backrefs: yes
      state: present
      create: True
```

---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* to comment a line... very easy

```
    lineinfile:
      dest: /tmp/test.conf
      line: '# \1'
      regexp: "(^je suis le nombre : [0-2])"
      backrefs: yes
      state: present
      create: True
```

---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* to add a new line before the line

```
    lineinfile:
      dest: /tmp/test.conf
      line: "Ma nouvelle ligne"
      insertbefore: '# je suis le nombre : [0-2]'
      state: present
      create: True
```


---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES



<br>

* to remove a line 

```
  - name: lineinfile
    lineinfile:
      dest: /tmp/test.conf
      regexp: "^Ma nouvelle ligne"
      #line: "^Ma nouvelle ligne"
      state: absent
```


---------------------------------------------------------------------------------------

# 28 ANSIBLE : LINEINFILE MODULES


<br>

* to backup before changing the file

```
  - name: lineinfile
    lineinfile: 
      dest: /tmp/test.conf
      regexp: "^#"
      state: absent
      backup: yes
```



