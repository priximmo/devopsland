%title: LEARN ANSIBLE
%author: xavki


# 05 ANSIBLE : GENERATE AND USE SSH KEYS

<br>

# Who am I ? 

* a french youtubeur named xavki
* a Site Reliability Engineer

>> subscribe to my channel to not miss the next videos <<

<br>

* Ansible use ssh connection to push your tasks

<br>

## Why use a ssh key ?

* without configuration, ssh allow password connection

* infrastructure of many servers > bad idea (enter specific password for each server)

* with ssh keys, you don't need to use a password

* ssh connection has two steps :
		* authentication with asymetric exchange (private key / public key)
		* regular communication with symetric exchange (more faster)
			* this last key has been exchanged by asymmetric step 

* to use a ssh key you must secure it by passphrase (password for your private key)

--------------------------------------------------------------------------------

# 05 ANSIBLE : GENERATE AND USE SSH KEYS

<br>

## Generate the key and use it


* generate the ssh key with ssh-keygen

```
ssh-keygen -t ecdsa -b 521
```

Notes :
	* -t : type of key (ecdsa more shorter than rsa for the same level of security)
	* -b : size of the key (more longer = better security)

<br>

* find the key in the default directory ( $HOME/.ssh/)
		* public and private key

<br>

* copy the public key on target servers

```
vim $HOME/.ssh/authorized_keys
```

or with ssh-copy-id

```
ssh-copy-id -i $HOME/.ssh/id_ecdsa <user>@<target_server>
```

--------------------------------------------------------------------------------

# 05 ANSIBLE : GENERATE AND USE SSH KEYS

<br>

## Customize your connection


* for more security > reduce the ip tha can use this key

```
from="10.0.0.?,*.example.com",no-X11-forwarding ssh-rsa AB3Nz...EN8w== xavki@monhost
```

<br>

* to use the key 

```
ssh -i $HOME/id_ecdsa <user>@<target_server>
```

<br>

* not to have to re-specify your key > use ssh agent

* check if you have an agent

```
ssh-add -l
```

Note : if you have an agent or a key > key is in the output

<br>

* to run an agent

```
eval `ssh-agent`
```

--------------------------------------------------------------------------------

# 05 ANSIBLE : GENERATE AND USE SSH KEYS

<br> 

## Customize your connection

* another way to custom your ssh connection > ssh_config file

```
cat ~/.ssh/config
chmod 600 ~/.ssh/config

Host * !monhost*
    User vagrant
    Port 22
    IdentityFile /myhome/.ssh/maclefprivee
    LogLevel INFO
    Compression yes
    ForwardAgent yes
    ForwardX11 yes
```

Note : everywhere in ssh, pay attention on files permissions (less 600)

