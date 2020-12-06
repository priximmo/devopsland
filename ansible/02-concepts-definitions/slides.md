%title: LEARN ANSIBLE
%author: xavki


# Who am I ? 

* a french youtubeur named xavki

* a Site Reliability Engineer

* love and practice devops

* like to share my experience

>> subscribe to my channel to not miss the next videos <<

<br>

# 02 ANSIBLE : DEFINITIONS AND CONCEPTS


<br>

## Control Node

<br>

* the node (server/laptop) who has ansible installed

<br>

* has ssh access to other servers

<br>

* an ssh access with password or ssh key (prefer it)

<br>

* it also means managing it security very well

--------------------------------------------------------------------------

# 02 ANSIBLE : DEFINITIONS AND CONCEPTS


<br>

## Managed Nodes

<br>

* these are the target servers

<br>

* allow ssh connexion (with key or password)

<br>

* allow privilege escalation with your user or a service account

<br>

## Inventory

<br>

* list of target servers (ip or dns)

<br>

* it allows ini, yaml or json format

<br>

* it stores inventory variables

<br>

* can be static or dynamic (with script ou api)

-----------------------------------------------------------------

# 02 ANSIBLE : DEFINITIONS AND CONCEPTS

<br>

## Groups

<br>

* allow to group the processing of servers

<br>

* allow you to create a tree with parent groups and their children (like a tree)

<br>

* one main group which is the "ALL" group

<br>

## Group_vars

<br>

* variables use by a same group

<br>

* are defined in a dedicated directory or file (with the group's name)

<br>

* or in the inventory file

-----------------------------------------------------------------

# 02 ANSIBLE : DEFINITIONS AND CONCEPTS


<br>

## Host_vars

<br>

* like group_vars but for single server

<br>

* overload many other variables in the variable precedence

<br>

## Inventory file (most important file)

<br>

* the main file in ansible (with playbook)

<br>

* stores the list of servers

<br>

* dispatches it into groups

<br>

* use by playbook file
