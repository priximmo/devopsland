%title: LEARN ANSIBLE
%author: xavki


# 22 ANSIBLE : TEMPLATE MODULE

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html

<br>

WHAT DOES IT DO ?

* combine : file with variables + variable values

* only inventory variables > the precedence variable when we'll see roles

<br>

PARAMETERS

<br>

* attributes : attributes of the file (man chattr)

<br>

* backup : to create a backup file before a change

<br>

* block_end_string : the end of a block ( by default %})

<br>

* block_start_string : the start of a block (by default {%)

<br>

* dest : the destination file on target servers

<br>

* follow : to follow symbolic links

<br>

* force : to overwrite a file if already exist (default : yes)

-------------------------------------------------------------------------------------

# 22 ANSIBLE : TEMPLATE MODULE


<br>

* group : the file group

<br>

* lstrip_blocks : to respect the strict indentation

```
#jinja2:lstrip_blocks: True
```

<br>

* mode : to set permissions (0755 or r+rwx,g+rx,o+rx)

<br>

* newline_sequence : which element define a new line

<br>

* output_encoding : the format of the file (by default utf8)

<br>

* owner : the file owner

<br>

* src : the template path and name (be careful to the location)
    * rôles = templates dir or the playbook directory

<br>

* trim_blocks : to remove line breaks (at the end of line)

<br>

* unsafe_writes : to avoid the corruption of your file

<br>

* validate : like copy, to validate before a change

<br>

* variable_end_string : to define characters for the end of strings

<br>

* variable_start_string : to define characters for the start of strings

-------------------------------------------------------------------------------------

# 22 ANSIBLE : TEMPLATE MODULE

<br>

* a simple example

```
- name: my first playbook
  hosts: all
  vars:
    var1: "Xavier !!!"
  tasks:
  - name: my template
    template:
      src: montemplate.txt.j2
      dest: /tmp/hello.txt
```

-------------------------------------------------------------------------------------

# 22 ANSIBLE : TEMPLATE MODULE

<br>

* specific variables for template

```
    ansible_managed : to add an header with a comment and tell that this file is managed by ansible (to prevent a user change it manually)
    template_host : which machine launched the playbook generating the change
    template_uid : the user who launched the playbook
    template_path : the path of the playbook
    template_fullpath : the full path of the playbook
    template_run_date : the date and the hour
```

* for example

```
#{{ template_run_date }} - "{{ ansible_managed }}" via {{ template_uid }}@{{ template_host }}

```



-------------------------------------------------------------------------------------

# 22 ANSIBLE : TEMPLATE MODULE

<br>

* change permissions

```
  - name: template
    template:
      src: montemplate.txt.j2
      dest: /tmp/hello.txt
      owner: oki
      group: oki
      mode: 0755
```

<br>

* to do a backup before the change

```
  - name: template
    template:
      src: montemplate.txt.j2
      dest: /tmp/hello.txt
      owner: oki
      group: oki
      mode: 0755
      backup: yes
```

-------------------------------------------------------------------------------------

# 22 ANSIBLE : TEMPLATE MODULE

<br>

* to use with a loop (ex : with_items)

```
  vars:
    var1: "Xavier !!!"
    var2:
      - { nom: "xavier", age: "40" }
      - { nom: "paul", age: "22" }
      - { nom: "pierre", age: "25" }
  tasks:
  - name: template
    template:
      src: montemplate.txt.j2
      dest: "/tmp/hello_{{ item.nom }}.txt"
    with_items:
    - "{{ var2 }}"
```

* with this template

template :

```
#{{ template_run_date }} - "{{ ansible_managed }}" via {{ template_uid }}@{{ template_host }}
Hello {{ var1 }}
I'm {{ item.nom }}
and I'm {{ item.age }} years old
```


-------------------------------------------------------------------------------------

# 22 ANSIBLE : TEMPLATE MODULE


<br>

* another example to do some operations in the template

```
  vars:
    var1: "Xavier !!!"
    var2:
      - { nom: "xavier", age: "40" }
      - { nom: "paul", age: "22" }
      - { nom: "pierre", age: "25" }
  tasks:
  - name: template
    template:
      src: montemplate.txt.j2
      dest: "/tmp/hello_all.txt"
```

template :

```
#{{ template_run_date }} - "{{ ansible_managed }}" via {{ template_uid }}@{{ template_host }}
Hello {{ var1 }}
{% for person in var2 %}
    FirstName : {{ person.nom }}
    Age : {{ person.age }}
{% endfor %}
```

