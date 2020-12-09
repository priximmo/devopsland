%title: LEARN ANSIBLE
%author: xavki


# 06 ANSIBLE : INVENTORY, ITS STRUCTURE

<br>

# Who am I ? 

* a french youtubeur named xavki
* a Site Reliability Engineer

>> subscribe to my channel to not miss the next videos a<<

<br>

## What is it ??

<br>

* 2 types : static or dynamic inventory (generate by a script, api...)

* a file

<br>

* list of your target servers 

* describes your infrastructure

-----------------------------------------------------------------------

# 06 ANSIBLE : INVENTORY, ITS STRUCTURE


## The structure ?

<br>

* 3 types of format : yaml / ini / json

<br>

* composed by 2 types of items : hosts and groups
		* hosts : one server (how could you join it : ip, dns...)
		* group : one or many hosts

<br>

* could use pattern : srv-db-[1-6]

<br>

* inventory = inventory file + host_vars dir + group_vars dir

NOT ONLY INVENTORY FILE

<br>

* groups have a tree structure (hierarchy)

<br>

* the parent of all group is... "all" group

* to create a sub-group > use "children" term

-----------------------------------------------------------------------

# 06 ANSIBLE : INVENTORY, ITS STRUCTURE


## For example


```
all = group parent1
parent1 = host srv4 + group child1 + group child2
child2 = host srv3 + group child3
child1 = host srv1 + host srv2
```

-----------------------------------------------------------------------

# 06 ANSIBLE : INVENTORY, ITS STRUCTURE

<br>

* in yaml format

```
all:
  children:
    parent1:
      hosts:
        srv4:
      children:
        child1:
          hosts:
            srv1:
            srv2:
        child2:
          hosts:
            srv3:
        children
          child3:
            hosts:
              srv5:
```

-----------------------------------------------------------------------

# 06 ANSIBLE : INVENTORY, ITS STRUCTURE

<br>

* in ini format (no indentation)

```
[parent1]
srv4
[child1]
srv1
srv2
[child2]
srv3
[child3]
srv5
[parent1:children]
child1
child2
[child2:children]
child3
```

-----------------------------------------------------------------------

# 06 ANSIBLE : INVENTORY, ITS STRUCTURE


## Another example

<br>

* in our infrastructure :
		* "common" tasks : create user, security
		* "webserver" : srv1, srv2, srv3 , srv4 (like nginx)
		* "dbserver" : srv5, srv6 (like mysql)
		* "app" : srv7, srv8, srv9, srv10
		* "monitoring" : for common group but maybe... in the future (other groups or servers not in common group)

<br>

* we can translate it in inventory

```
all:
  children:
    common:
      children:
        webserver:
          hosts:
            srv[1:4]:
        dbserver:
          hosts:
            srv[5:6]:
        app:
          hosts:
            srv[7:10]:
    monitoring:
      children:
        common:
```

Note : monitoring group included common group

<br>

* json format : https://linuxhint.com/ansible_inventory_json_format/

