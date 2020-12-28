%title: LEARN ANSIBLE
%author: xavki


# 15 ANSIBLE : LOOPS & WITH ITEMS

<br>

>> subscribe to my channel <<

<br>

Doc : https://docs.ansible.com/ansible/latest/plugins/lookup/items.html

or : ansible-doc <module_name>

* with is a group of loops

<br>

* with_items : a simple list

<br>

* with_nested : list of list

<br>

* with_dict : loop on dictionnary

---------------------------------------------------------------------------------------

# 15 ANSIBLE : LOOPS & WITH ITEMS

<br>

* with_fileglob : list of files in a directory (can use pattern) but not recursive

<br>

* with_filetree : like fileglob but with recursive

<br>

* with_together : combination of two lists (A,B,C) (1,2,3)

<br>

* with_sequence : to use a range with interval

<br>

* with_random_choice : ansible select a random value in the list

<br>

* with_first_found : ansible take first element

<br>

* with_lines : get each line of a file

<br>

* with_ini : browse a file with ini format

<br>

* with_inventory_hostnames : get hosts of the inventory file

---------------------------------------------------------------------------------------

# 15 ANSIBLE : LOOPS & WITH ITEMS


<br>

* with a simple list > with_items

```
  - name: create some directories in a xavki dir
    file:
      path: /tmp/xavki/{{ item }}
      state: directory
      recurse: yes
    with_items:
    - xavki1
    - xavki2
    - xavki3
    - xavki4
```

---------------------------------------------------------------------------------------

# 15 ANSIBLE : LOOPS & WITH ITEMS

<br>

* with a list of dictionnaries

```
  - name: create dirs and files into it
    file:
      path: /tmp/xavki/{{ item.dir }}/{{ item.file }}
      state: touch
    with_items:
    - { dir: "xavki1", file: "fileA"}
    - { dir: "xavki2", file: "fileB"}
    - { dir: "xavki3", file: "fileC"}
    - { dir: "xavki4", file: "fileD"}
```

---------------------------------------------------------------------------------------


# 15 ANSIBLE : LOOPS & WITH ITEMS

<br>

* you can group this list in a single variable

```
  vars:
    files:
    - { dir: "xavki1", file: "fileA"}
    - { dir: "xavki2", file: "fileB"}
    - { dir: "xavki3", file: "fileC"}
    - { dir: "xavki4", file: "fileD"}
  tasks:
  - name: create dirs and files into it
    file:
      path: /tmp/xavki/{{ item.dir }}/{{ item.file }}
      state: touch
    with_items:
    - "{{ files }}"
```

<br>

* to create the same list of file

```
  - name: create dirs and files into it
    file:
      path: /tmp//{{ item }}
      state: touch
    with_fileglob:
    - files/file*.yml
```

---------------------------------------------------------------------------------------


# 15 ANSIBLE : LOOPS & WITH ITEMS

<br>

* if you want to use the servers list (with group all) - two examples

```
 with_items:
    - "{{ groups['all'] }}"
```

or 

```
  - name: create files
    file:
      path: /tmp/{{ item }}
      state: touch
    with_inventory_hostnames:
    - all
```




