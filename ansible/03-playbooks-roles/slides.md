%title: LEARN ANSIBLE
%author: xavki


# 03 ANSIBLE : PLAYBOOKS AND ROLES

<br>

# Who am I ? 

* a french youtubeur named xavki
* a Site Reliability Engineer

>> subscribe to my channel to not miss the next videos <<

<br>

## Remember Inventory

<br>

* list of target servers

* servers can be grouped : to share their settings by variables

* but how could you do some actions (install, edit...)

----------------------------------------------------------------------------------

# 03 ANSIBLE : PLAYBOOKS AND ROLES

<br>

## Tasks

* one action = task

* each task use a module (user, group, apt...)

* each task call a module and run it with parameters

* can have output

* can have triggers or loop on it

<br>

## Modules

* action like you play a command (adduser, mkdir, createdb...)

* take parameters for it specific usage

* severals hundred modules (cloud, firewall, database, linux cli...)

* community modules are installed wih ansible

----------------------------------------------------------------------------------

# 03 ANSIBLE : PLAYBOOKS AND ROLES

<br>

## Roles

* one or many tasks

* set of tasks with a single objective (install nginx for exemple)

* organize the code

* the main things that can be exchanged within the community

* ansible galaxy community

* specific structure of directories and files

<br>

## Playbooks

* between inventory and roles

* which groups will receive which installations

* minimalist playbooks could have hosts and tasks (without inventory and roles)



