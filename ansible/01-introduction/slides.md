%title: LEARN ANSIBLE
%author: xavki


# 01 ANSIBLE : INTRODUCTION


## Where does ansible come from ?

<br>
* Ansible was create in 2012 by Michael DeHaan (who create cobler)

<br>
* In 2015, Ansible take over ansible project

<br>
* Today ansible has one of the biggest orchestrator community

<br>
* Ansible is a python programming

<br>
* some competitors : puppet, chef, salt, capistrano

<br>
## Documentation

* https://docs.ansible.com/

* version : 2.10

------------------------------------------------------------------------------------------

# 01 ANSIBLE : INTRODUCTION


<br>
## Fundamental

<br>
* Ansible is one of the push orchestrators

<br>
* Ansible has no agent

<br>
* Ansible use ssh connexion to play tasks

<br>
## Why use ansible ?

<br>
* ansible is very simple because :
		* it has no agent
		* ssh simplifies understanding
		* ssh is the minimum to manage servers (if you have ssh connexion you can do it)

<br>
* ansible can be use for create or maintain infrastructure

<br>
* but ansible can be use in CI/CD (in pipeline, create account, configure, install applications... whatever)

<br>
* or use a cloud provider (aws, GCP)

<br>
* ansible use python but instructions are written in yaml (like erb in puppet)

<br>
* like many orchestrors ansible uses many notions (playbook, modules, roles, inventories)

<br>
* ansible cli has several tools :
		* ansible-vault : for encrypted variables
		* ansible-playbook : the most used command
		* ansible-galaxy : to share roles in the community
		* ansible-doc : to see documentation in the CLI

------------------------------------------------------------------------------------------

# 01 ANSIBLE : INTRODUCTION


## SUMMARY

<br>
Ansible :

		* push orchestrator

		* use python and SSH

		* no agent

		* behind ansible there is Redhat
