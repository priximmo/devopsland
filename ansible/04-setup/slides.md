%title: LEARN ANSIBLE
%author: xavki


# 04 ANSIBLE : SETUP

<br>

# Who am I ? 

* a french youtubeur named xavki
* a Site Reliability Engineer

>> subscribe to my channel to not miss the next videos <<

<br>

## Requirements

* Controller Node > ansible server

		* python >= 2.7
		* ssh/sftp

* Managed node > targets servers

		python >= 2.6

Documentation : https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

<br>

* 4 ways to install ansible
		* with package manager in your distribution (apt, yum)
		* with python library
		* with binary (from source)
		* possibly with docker (not recommended)

<br>

* the repository : https://releases.ansible.com/ansible/


-------------------------------------------------------------------------------------------

# 03 ANSIBLE : SETUP


<br>

* with the binary

```
git clone https://github.com/ansible/ansible.git
cd ansible
source ./hacking/env-setup
sudo apt install python-pip
pip install --user -r ./requirements.txt
echo "127.0.0.1" > ~/ansible_hosts
export ANSIBLE_INVENTORY=~/ansible_hosts
ansible all -m ping --ask-pass
```

<br>

* with python library

```
sudo apt install python3-pip
pip3 install ansible==2.9
```

Note : can use virtualenv > multi-version

-------------------------------------------------------------------------------------------

# 03 ANSIBLE : SETUP

<br>

* with package manager (APT for debian)

```
sudo apt update
sudo apt install ansible
```

Note : don't need to install another repository


<br>

* Note on MacOS > increase the number of file handled (fork number upper 15)

```
sudo launchctl limit maxfiles unlimited
```

<br>

* choose python interpreter

```
ansible_python_interpreter=/usr/bin/python3
```

<br>

* if you don't have python

```
ansible myhost --become -m raw -a "yum install -y python2"
```

Note : raw module doesn't use python



