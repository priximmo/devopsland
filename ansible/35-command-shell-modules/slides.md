%title: LEARN ANSIBLE
%author: xavki


# 35 COMMAND & SHELL MODULES

<br>

>> subscribe to my channel <<

<br>

Documentation : 
https://docs.ansible.com/ansible/2.5/modules/shell_module.html
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/command_module.html

Purpose : run shell commands

Command vs Shell > 
		command : options are limited
		shell : use all that you find in CLI

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES

<br>

PARAMETRES : COMMAND

<br>

* argv : define your CLI with a list

* chdir : change the directory where you run the command

* cmd : the command you want to run

* creates : the command is not launched if the file exists

* removes : like creates but the command is launched if the file exists

* stdin : send a stdin to the command

* stdin_add_newline : add backline to your stdin

* strip_empty_ends : remove empty lines

* warn : activate/deactivate task warnings

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES



<br>

* simple :

```
  - name: test
    command:
      cmd: ls
    register: __output
```

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

* change directory :

```
  - name: test
    command:
      cmd: ls
      chdir: /etc/
    register: __output
```

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

* add a list of arguments

```
  - name: test
    command:
      argv:
      - ls
      - -larth
    register: __output
```

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

* add condition if a file doesn't exist

```
  - name: touch
    file:
      path: /tmp/xavki
      state: touch
  - name: test
    command: 
      cmd: ls -lath /tmp
      creates: /tmp/xavki
    register: __output
  - name: debug
    debug:
      var: __output
```

---------------------------------------------------------------------------------

# ANSIBLE : Modules COMMAND & SHELL

<br>

* and if the file exists

```
  - name: test
    command: 
      cmd: ls -lath /tmp
      removes: /tmp/xavki
```

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

PARAMTRES : SHELL

<br>

* chdir : the directory where you run the shell

<br>

* creates : the command is not launched if the file exists

<br>

* removes : like creates but the command is launched if the file exists

<br>

* executable : to choose which shel do you want to use ?

<br>

* stdin : to add an stdin input

<br>

* warn : display warm or not

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

* simple shell :

```
  - name: test
    shell: cat /etc/hosts | grep 127
    register: __output
  - name: debug
    debug:
      var: __output
```

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

* can use a yaml block

```
  - name: test
    shell: |
      cat /etc/hosts
      ls /etc/
    register: __output
  - name: debug
    debug:
      var: __output
```

-------------------------------------------------------------------------------------

# 35 COMMAND & SHELL MODULES


<br>

* define some environment variables

```
  - name: test
    shell: echo "Hello $MAVAR"
    environment:
      MAVAR: "xavki"
    register: __output
```

