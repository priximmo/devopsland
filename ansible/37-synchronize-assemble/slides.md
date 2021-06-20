%title: LEARN ANSIBLE
%author: xavki


# 37 : MODULES SYNCHRONIZE & ASSEMBLE

<br>

>> subscribe to my channel <<

<br>

Purposes :

		* synchronize > like rsync (better than the copy module)

		* assemble > concatenate many files in one

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE


SYNCHRONIZE - PARAMETERS

<br>

* archive : to keep permissions

<br>

* checksum : check the file with a checksum

<br>

* compress : to compress and preserve your bandwith

<br>

* copy_links: to copy symbolic links

<br>

* delete : to remove all files not present on the source

<br>

* dest : to define the destination path

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE

<br>

* dest_port : to set the port (if you use ssh, like rsync)

<br>

* dirs : to transfert directories only

<br>

* existing_only : synchronize only files already exist on the target

<br>

* group : yes/no to preserve the group

<br>

* links : to copy symbolic links

<br>

* mode : push/pull mode

<br>

* owner : to keep the owner

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE

<br>

* partial : to preserve partial files

<br>

* perms : to keep permissions

<br>

* recursive : to copy files even files in subdirectories

<br>

* rsync_opts : other rsync options

<br>

* rsync_path : to define the path of the rsync command

<br>

* rsync_timeout : to set a timeout

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE

<br>

* set_remote_user : to use a specific user

<br>

* src : source files o directories

<br>

* times : to keep the date

<br>

* use_ssh_args : to add ssh args



-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE


SOME EXAMPLES

<br>

* to push a big file

```
truncate -s 1G xavki.txt
```

```
  - name:
    apt:
      name: rsync
      state: present
    become: yes
  - name: sync
    synchronize:
      src: xavki.txt
      dest: /tmp/xavki.txt
```

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE

<br>

* to synchronize an entire directory

```
mkdir -p files;for i in $(seq 1000);do touch files/$i;done
```

```
  - name: dir
    file:
      path: /tmp/files
      state: directory
  - name: sync
    synchronize:
      src: files/
      dest: /tmp/files
```

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE


ASSEMBLE PARAMETERS

<br>

* backup : to backup file before the update

<br>

* decrypt : to decrypt or not the vault

<br>

* delimiter : to user a delimiter between each files

<br>

* dest : the target file

-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE

<br>

* group : to define the file group

<br>

* regexp : to use a pattern 

<br>

* remote_src : to run on remote server or not

<br>

* src : the source directory

<br>

* validate : to add a command to validate the result


-----------------------------------------------------------------------

# 37 : MODULES SYNCHRONIZE & ASSEMBLE


<br>

* a simple example


```
  - name: dir
    file:
      path: /tmp/sources
      state: directory
  - name: copy
    copy:
      src: "files/{{ item }}"
      dest: /tmp/sources/
    with_items:
    - t1
    - t2
    - t3
  - name: test assemble
    assemble:
      src: /tmp/sources
      dest: /tmp/myconf.cfg
```

