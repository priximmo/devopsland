%title: LEARN ANSIBLE
%author: xavki


# 17 ANSIBLE : CHECK & REBOOT

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/reboot_module.html

<br>

PURPOSE

* reboot when necessary and resume after

<br>

PARAMETERS

<br>

* boot_time_command : command to genrate reboot ID

<br>

* connect_timeout : timeout for ssh connexion

<br>

* msg : send a message before the reboot

<br>

* post_reboot_delay : waiting time after launching the reboot

<br>

* pre_reboot_delay : waiting time before launching the reboot

<br>

* reboot_timeout : specific timeout for the reboot

<br>

* search_paths : which command to use for the reboot

<br>

* test_command : test command to confirm the success of the reboot

------------------------------------------------------------------------------

# 17 ANSIBLE : CHECK & REBOOT


<br>

* we just to an example with a sample file

```
- name: my first playbook
  hosts: all
  remote_user: vagrant
  become: yes
  tasks:
  - name: create file
    file:
      path: /tmp/xavki.txt
      state: touch
```
 
<br>

* test the sample file

```
  - name: test
    stat:
      path: /tmp/xavki.txt
    register: __file_exist
```

------------------------------------------------------------------------------

# 17 ANSIBLE : CHECK & REBOOT

<br>

* if the file exists, ansible starts the reboot

```
  - name: set the reboot module
    reboot:
      msg: "The message before the reboot..."
      connect_timeout: 5
      reboot_timeout: 300
      pre_reboot_delay: 0
      post_reboot_delay: 30
      test_command: uptime
    when: __file_exist.stat.exists

  - name: file2
    file:
      path: /tmp/xavki2.txt
      state: touch
```

------------------------------------------------------------------------------

# 17 ANSIBLE : CHECK & REBOOT

<br>

* a full example when we do an upgrade (dist)

```
    - name: update cache
      apt:
        update_cache: yes
        force_apt_get: yes
        cache_valid_time: 3600

    - name: dist upgrade
      apt:
        upgrade: dist
        force_apt_get: yes

    - name: check the rebot-required file
      register: reboot_required_file
      stat:
        path: /var/run/reboot-required
      register: reboot_required_file

    - name: launch the reboot
      reboot:
        msg: "Reboot with ansible..."
        connect_timeout: 5
        reboot_timeout: 300
        pre_reboot_delay: 0
        post_reboot_delay: 30
        test_command: uptime
      when: reboot_required_file.stat.exists
```



