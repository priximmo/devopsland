%title: LEARN ANSIBLE
%author: xavki


# 30 THE PRECEDENCE OF VARIABLES

<br>

>> subscribe to my channel <<

<br>

* 23 types of variables :

``` 
        command line values (eg “-u user”)
        role defaults [1]
        inventory file or script group vars [2]
        inventory group_vars/all [3]
        playbook group_vars/all [3]
        inventory group_vars/* [3]
        playbook group_vars/* [3]
        inventory file or script host vars [2]
        inventory host_vars/* [3]
        playbook host_vars/* [3]
        host facts / cached set_facts [4]
        play vars
        play vars_prompt
        play vars_files
        role vars (defined in role/vars/main.yml)
        block vars (only for tasks in block)
        task vars (only for the task)
        include_vars
        set_facts / registered vars
        role (and include_role) params
        include params
        extra vars (always win precedence)
```

----------------------------------------------------------------

# 30 THE PRECEDENCE OF VARIABLES

<br>

* some examples

<br>

        * role : default variable
<br>

        * inventory : group vars
<br>

        * inventory : host vars
<br>

        * playbook : vars
<br>

        * roles : vars
<br>

        * set_fact in a role
<br>

        * ultimate leve : CLI


