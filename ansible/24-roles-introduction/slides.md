%title: LEARN ANSIBLE
%author: xavki


# 24 ANSIBLE : WHAT's A ROLE ?

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html

<br>

WHAT IS IT ?

<br>

	* group actions with the same aim

<br>

	* define specific variables for this aim

<br>

	* group files used by these tasks

-----------------------------------------------------------------------------

# 24 ANSIBLE : WHAT's A ROLE ?

<br>

WHY YOU MUST USE ROLES ?

<br>

	* to share your code : the role is the main shared element

<br>

	* to work with many colleague (with git usage)

<br>

	* roles can be reused (in other playbook)

<br>

	* but no rule on the perimeter (one task to many...)

	* some examples : 
			* install database engine
			* install and set up a webserver
			* to do backup

<br>

	* but a role have a skeleton

-----------------------------------------------------------------------------

# 24 ANSIBLE : WHAT's A ROLE ?

<br>

ORGANISE YOUR WORKFLOW

<br>

	* one repository by role (check ansible galaxy)

<br>

	* one release manager and other developpers do merge request

<br>

	* test your role (see the video number 14 or use molecule)

<br>

	* define rules for developpers (name of variables, document your roles)



-----------------------------------------------------------------------------

# 24 ANSIBLE : WHAT's A ROLE ?

<br>

STRUCTURE :

<br>

* to generate a skeleton :

```
ansible-galaxy init roles/my_role
```

<br>

* role like a tree (one directory per element)

<br>

    * tasks : the role entrypoint

    * defaults : for default variables

    * vars : to set variables that do not change

    * handlers : to define tasks that can be trigger

    * templates : to store template files

    * files : to store static files

    * meta : to share roles in galaxy or dependancies

    * test : to define some tests for the role

<br>

* to find or share a role : https://galaxy.ansible.com/

