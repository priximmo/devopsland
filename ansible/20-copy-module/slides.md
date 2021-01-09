%title: LEARN ANSIBLE
%author: xavki


# 20 ANSIBLE : COPY MODULE

<br>

>> subscribe to my channel <<

<br>

Documentation: https://docs.ansible.com/ansible/2.5/modules/copy_module.html

<br>

PURPOSE

* to copy a file on target servers (like scp)

<br>

PARAMETERS

<br>

* attributes : attibutes of the file (man chattr)

<br>

* backup : to to a copy of the target file before the copy (with date and hour in the file name)

<br>

* checksum : to check the integrity of the file with a hash

<br>

* content : to create a file with a block or variable (not a file)

<br>

* decrypt : to decrypt the source file if need (with vault encrypt, by default yes)

<br>

* directory_mode : to copy an entire directory with recursive mode

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE


<br>

* follow : to set the target filesystem

<br>

* force : replace the file if it is different from the source

<br>

* group : the group of files or directories

<br>

* local_follow : to set the filesystem to use

<br>

* mode : to set permissions of files and directories (0755, u+rwx,g+rx,o+rx)

<br>

* owner : to set the owner 

<br>

* remote_src : no > to copy from ansible server to target, yes > to copy from target to target

<br>

* src : the path of the source file

<br>

* unsafe_writes : to avoid the file corruption

<br>

* validate : to use a command that validate the copy (ex : nginx -t...)

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE

<br>

* a simple copy

```
  tasks:
  - name: a simple copy
    copy:
      src: test.txt
      dest: /tmp/xavki.txt
```

Note : be carefull to the source location (playbook directory or files directory in a role)

<br>

* to do a recursive mode (simply use directory with /)

```
mkdir -p tmp/xavki/{1,2,3}
```

```
  - name: copy
    copy:
      src: tmp/
      dest: /tmp/
```

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE

<br>

* to do a mv command (for example to move a file into the target server)

* déplacer les fichiers ou répertoires sur la cible

```
  - name: copy
    copy:
      src: /home/oki
      dest: /tmp/
      remote_src: yes
```

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE

<br>

* to combine with a loop (ex : with_items)

* combinaison avec with_items

```
  vars:
    myfiles:
      - { source: "xavki1.txt", destination: "/tmp/{{ ansible_hostname }}_xavki1.txt", permission: "0755" }
      - { source: "xavki2.txt", destination: "/home/oki/{{ ansible_hostname }}_xavki2.txt", permission: "0644" }
  tasks:
  - name: copy
    copy:
      src: "{{ item.source }}"
      dest: "{{ item.destination }}"
      mode: "{{ item.permission }}"
    with_items: "{{ myfiles }}"
```

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE

<br>

* or with with_fileglob (to use a pattern)

```
  - name: copy
    copy:
      src: "{{ item }}"
      dest: /tmp/
    with_fileglob:
    - xavk*
```

<br>

* to create a backup file before the copy (if the file already exists)

```
  - name: copy
    copy:
      src: "{{ item }}"
      dest: /tmp/
      backup: yes
    with_fileglob:
    - xavk*
```

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE

<br>

* to not push a file but a block

```
  - name: copy
    copy:
      content: |
         Hi,
         xavki team !!
         we are on {{ ansible_hostname }}
      dest: /tmp/hello.txt
```

-----------------------------------------------------------------------------------

# 20 ANSIBLE : COPY MODULE

<br>

* some examples with the validate command

```
- name: copie du fichier nginx.conf avec check
  copy:
    src: nginx.conf
    dest: /etc/nginx/nginx.conf
    owner: root
    group: root
    mode: 0644
    validate: /usr/bin/nginx -t -c %s
```

or with visudo when you change the sudoers configuration

```
  - name: Add devops user to the sudoers
    copy:
      dest: "/etc/sudoers.d/devops"
      content: "devops ALL=(ALL)  NOPASSWORD: ALL"
      owner: root
      group: root
      mode: 0400
      validate: /usr/sbin/visudo -cf %s
    become: yes
```
