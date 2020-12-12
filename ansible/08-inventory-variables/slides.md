%title: LEARN ANSIBLE
%author: xavki


# 08 ANSIBLE : INVENTORY, ITS VARIABLES

<br>

# Who am I ? 

* a french youtubeur named xavki
* a Site Reliability Engineer

>> subscribe to my channel <<

<br>

## What are these variables ??

<br>

* ansible = 22 types: 

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

--------------------------------------------------------------------


# 08 ANSIBLE : INVENTORY, ITS VARIABLES


<br>

* if we group these types in some families :
		* configuration settings
		* cli options
		* playbook keywords
		* variables

<br>

* inventory variables are in the cli options variables

<br>

* 	which skeleton for the inventory ?

```
├── 00_inventory.yml  # inventory file
├── group_vars				# groups variables
│   ├── all.yml
│   ├── dbserver.yml
│   └── webserver
│       ├── vault.yml
│       └── webserver.yml
└── host_vars					# hosts variables
    ├── srv1
    │   └── srv1.yml
    └── srv2.yml
```

--------------------------------------------------------------------


# 08 ANSIBLE : INVENTORY, ITS VARIABLES


<br>

* mutlienv

```
├── dev
│   ├── 00_inventory.yml
│   ├── group_vars
│   │   ├── all.yml
│   │   ├── dbserver.yml
│   │   └── webserver
│   │       ├── vault.yml
│   │       └── webserver.yml
│   └── host_vars
│       ├── srv1
│       │   └── srv1.yml
│       └── srv2.yml
├── prod
│   ├── 00_inventory.yml
│   ├── group_vars
│   │   ├── all.yml
│   │   ├── dbserver.yml
│   │   └── webserver
│   │       ├── vault.yml
│   │       └── webserver.yml
│   └── host_vars
│       ├── srv1
│       │   └── srv1.yml
│       └── srv2.yml
└── stage
    ├── 00_inventory.yml
    ├── group_vars
    │   ├── all.yml
    │   ├── dbserver.yml
    │   └── webserver
    │       ├── vault.yml
    │       └── webserver.yml
    └── host_vars
        ├── srv1
        │   └── srv1.yml
        └── srv2.yml
```

--------------------------------------------------------------------


# 08 ANSIBLE : INVENTORY, ITS VARIABLES


<br>

* to test the precedence of variables

```
ansible -i "devans2," all -b -e "var1=xavki" -m debug -a 'msg={{ var1 }}'
```

and inventory file

```
all:
  children:
    common:
      children:
        webserver:
          hosts:
            devans[2:3]:
          vars:
            var1: "webserver"
        dbserver:
          hosts:
            devans4:
            devans5:
              var1: "node5"
          vars:
            var1: "dbserver"
```

--------------------------------------------------------------------


# 08 ANSIBLE : INVENTORY, ITS VARIABLES

<br>

* define group variable

```
├── group_vars
│   ├── dbserver.yml
│   └── webserver.yml
└── inventory.yml
```

or with specific directory

```
├── group_vars
│   ├── dbserver
│   │   └── dbserver.yml
│   └── webserver
│       └── webserver.yml
└── inventory.yml
```

--------------------------------------------------------------------


# 08 ANSIBLE : INVENTORY, ITS VARIABLES


<br>

* define host variable

```
├── group_vars
│   ├── dbserver
│   │   └── dbserver.yml
│   └── webserver
│       └── webserver.yml
├── host_vars
│   ├── devans2
│   │   └── variables.yml
│   └── node5.yml
└── inventory.yml
```

* if new host in group > gets the defintion of this variable



