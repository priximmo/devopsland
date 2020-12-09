%title: LEARN ANSIBLE
%author: xavki


# 06 ANSIBLE : ANSIBLE.CFG FILE

<br>

# Who am I ? 

* a french youtubeur named xavki
* a Site Reliability Engineer

>> subscribe to my channel to not miss the next videos <<

<br>

## Where customize your ansible connection ?

<br>

3 ways to do it :

		* ~/.ansible/ansible.cfg
		* /etc/ansible/ansible.cfg
		* in your playbook directory
		* specify it in ANSIBLE_CONFIG 


<br>

* some parameters

```
inventory       = /etc/ansible/hosts
forks           = 5
sudo_user       = root
ask_sudo_pass   = True
ask_pass        = True
gathering       = implicit
gather_subset   = all
roles_path      = /etc/ansible/roles
log_path        = /var/log/ansible.log
vault_password_file = /path/to/vault_password_file
fact_caching_connection =/tmp
pipelining = False
```

Documentation : https://docs.ansible.com/ansible/2.9/intro_configuration.html

------------------------------------------------------------------------------------------

# 06 ANSIBLE : ANSIBLE.CFG FILE


<br>

* little-known commands

```
ansible-config
ansible-config view  # the state of your settings
ansible-config list  # list of variables
Documentation : https://docs.ansible.com/ansible/latest/reference_appendices/config.html

ansible-config dump  # another list
ansible-config dump --only-changed # variables that will be overloaded
```

<br>

* for example, arguments pass to ssh conection

```
ANSIBLE_SSH_ARGS:
  default: -C -o ControlMaster=auto -o ControlPersist=60s
  description:
  - If set, this will override the Ansible default ssh arguments.
  - In particular, users may wish to raise the ControlPersist time to encourage performance.  A
    value of 30 minutes may be appropriate.
  - Be aware that if `-o ControlPath` is set in ssh_args, the control path setting
    is not used.
  env:
  - name: ANSIBLE_SSH_ARGS
  ini:
  - key: ssh_args
    section: ssh_connection
  yaml:
    key: ssh_connection.ssh_args
```

------------------------------------------------------------------------------------------

# 06 ANSIBLE : ANSIBLE.CFG FILE


<br>

## Tune your ansible

<br>

* doesn't check the fingerprint

```
[defaults]
host_key_checking = False
```

<br>

* where ansible takes some times

```
[defaults]
callback_whitelist = profile_tasks
```

<br>

* pipelining > use temporary file (reduce ssh connection)

```
[ssh_connection]
pipelining = True
```

------------------------------------------------------------------------------------------

# 06 ANSIBLE : ANSIBLE.CFG FILE

<br>

* increase persistence of ssh connections

```
[ssh_connection]
ssh_args = -o ControlMaster=auto -o ControlPersist=60s
```


<br>

* specify the authentication method to ssh

```
[ssh_connection]
ssh_args = -o ControlMaster=auto -o ControlPersist=60s -o PreferredAuthentications=publickey
```

<br>

* increase the number of forks (parallelise)

```
[defaults]
forks = 30
```

------------------------------------------------------------------------------------------

# 06 ANSIBLE : ANSIBLE.CFG FILE

<br>

* reduce or remove gather facts step

```
gather_facts: no
```

or cache it in a file

```
fact_caching = jsonfile
fact_caching_timeout = 3600
fact_caching_connection = /tmp/mycachedir
```

or in redis server

```
fact_caching = redis
fact_caching_timeout = 3600
fact_caching_connection = localhost:6379:0
```

<br>

* add Mitogen tool (tune ssh connection)

Doc : https://mitogen.networkgenomics.com/ansible_detailed.html





