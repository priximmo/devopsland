%title: LEARN ANSIBLE
%author: xavki


# 09 ANSIBLE : PLAYBOOK FILE

<br>

>> subscribe to my channel <<

<br>

## What's a playbook ?

<br>

* inventory = describe you infrastructure (single server or groups of servers)

* roles & tasks = which tasks ansible must do to install or configure or do something on target servers

<br>

* playbook joins :
		inventory > playbook < roles/tasks 

>>> which tasks will be done on which servers ?

<br>

* in the CLI : ansible-playbook

------------------------------------------------------------------------------------

# 09 ANSIBLE : PLAYBOOK FILE


<br>

## OPTIONS

<br>

* -i : which inventory file ?

<br>

* -l : limit the play to specific servers

<br>

* -u : a specific user who use ansible for the ssh command

<br>

* -k : to pass the password for the ssh connection

<br>

* -K : to pass the password for elevation of privileges

<br>

* -C : the check mode or dry run

<br>

* -D : make a diff before/after ansible run (like git or patch)

------------------------------------------------------------------------------------

# 09 ANSIBLE : PLAYBOOK FILE


<br>

* --ask-vault : to pass a vaul password when you have secrets in your play

<br>

* --syntax-check : to check the syntax (indetation)

<br>

* --vault-password-file : to pass the vault password with a file not in a prompt

<br>

* -e : to specify a variable value

<br>

* -f : the fork number if you parallelize

<br>

* -t : to specify tags (associate tags for some tasks)

<br>

* --flush-cache : to clean the facts cache

<br>

* --list-tasks : list which tasks will be launched

------------------------------------------------------------------------------------

# 09 ANSIBLE : PLAYBOOK FILE


<br>

## Example

```
all:
  hosts:
    devans1:
```

```
- name: This is my first playbook !!
  hosts: all
  tasks:
  - name: run the debug task
    debug:
      msg: "{{ var1 }}"
```

