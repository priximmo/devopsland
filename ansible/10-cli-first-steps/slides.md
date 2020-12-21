%title: LEARN ANSIBLE
%author: xavki


# 10 ANSIBLE : STARTING WITH CLI

<br>

>> subscribe to my channel <<

<br>

* today = ansible binary

* not the most used (ansible-playbook)

* doesn't run file and code (just the command line)

<br>

* useful :
		* to debug
		* to run one simple task

<br>

* but the same options as the ansible-playbook command

* some options :

		* -u : which user on target server

		* -b : for elevation of privileges (with sudo)

		* -K : password for elevation of privileges

		* -k : password for ssh connection

		* -C : check
		
		* -D : diff

		* -e : to set a variable

		* -v : verbose mode


-------------------------------------------------------------------------------------

# 10 ANSIBLE : STARTING WITH CLI


<br>

* to do a ping (ssh ping)

```
ansible -i "node2," all -u vagrant -m ping
```

<br>

* force ssh parameters like authentication

```
ansible -i "node2," all -u vagrant -k --ssh-extra-args="-o 'PreferredAuthentications=password'" -m ping
```

<br>

* if warning message on the password usage

```
sshpass -p 'vagrant' ansible -i "node2," all -u vagrant -k --ssh-extra-args="-o 'PreferredAuthentications=password'" -m ping
```

<br>

* to have a simple output

```
ansible -i "node2," all -u vagrant -m ping --one-line
```

<br>

* to use a module

```
ansible -i "node2," all -u vagrant -m command -a uptime
```

-------------------------------------------------------------------------------------

# 10 ANSIBLE : STARTING WITH CLI

<br>

* to set a variable

```
ansible -i "node2," all -b -e "var1=xavki" -m debug -a 'msg={{ var1 }}'
```

<br>

* to run a shell command

```
ansible -i "node2," all -u vagrant -m shell -a "ps aux | grep vagrant | wc -l" --one-line
```

<br>

* if you don't have python on target server

```
ansible -i "node2," all -u vagrant -b -K -m raw -a "apt install -y git"
```

<br>

* to install a debian package with apt

```
ansible -i "node2," all -b -m apt -a 'name=nginx state=latest'
```

-------------------------------------------------------------------------------------

# 10 ANSIBLE : STARTING WITH CLI

<br>

* to stop a systemd service

```
ansible -i "node2," all -b -m service -a 'name=nginx state=stopped'
```

<br>

* to copy a file on target server (like scp)

```
ansible -i "node2," all -m copy -a 'src=toto.txt dest=/tmp/titi.txt'
```

<br>

* to copy from target server on your ansible server

```
ansible -i "node2," all -m fetch -a 'src=/tmp/titi.txt dest=xavki.txt flat=yes'
```

<br>

* to see gathers facts about target servers

```
ansible -i "node2," all -m setup -a "filter=ansible_distribution*"
```

