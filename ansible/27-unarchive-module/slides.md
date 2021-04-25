%title: LEARN ANSIBLE
%author: xavki


# 27 ANSIBLE : UNARCHIVE AND GET_URL MODULES

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/2.9/modules/unarchive_module.html

Prerequisite : unzip, tar

<br>

PURPOSE :

* download and unzip packages in the same task

<br>

PARAMETERS :

<br>

* copy : deprecated (replaced by remote_src)

<br>

* creates : check a file/dirrectory, i present the task won't be run

<br>

* decrypt : yes by default (decrypt encrypted files)

<br>

* dest : where to store the file/directory

<br>

* exclude : path will be ignored in the archive

<br>

* extra_opt : extra options

-----------------------------------------------------------------------

# 27 ANSIBLE : UNARCHIVE AND GET_URL MODULES


<br>

* group : group of the file or the directory

<br>

* keep_newer : keep the more recent files/dirs between source and destination

<br>

* list_files : return the list of files that are in the archive

<br>

* mode : permissions (0755, u+rwx...)

<br>

* remote_src : use the ansible server to download the archive

<br>

* src : no > copy the file on target servers / yes > download and push

<br>

* validate_certs : when you use a https link (yes by default)


-----------------------------------------------------------------------

# 27 ANSIBLE : UNARCHIVE AND GET_URL MODULES


* our archive : https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz

<br>

* download and unarchive (unzip and untar)

```
  - name: test unarchive
    unarchive:
      src: /tmp/node_exporter-1.0.1.linux-amd64.tar.gz
      dest: /home/oki/
```

<br>

* with remote_src

```
  - name: test unarchive
    unarchive:
      src: https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
      dest: /home/oki/
      remote_src: yes
```


-----------------------------------------------------------------------

# 27 ANSIBLE : UNARCHIVE AND GET_URL MODULES


<br>

GET_URL

Documentation :
  * https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html

<br>

PARAMETERS

<br>

* backup : to do a backup before the change

<br>

* checksum : check the file with a checksum

<br>

* dest : destination to store the file

<br>

* force : to force the replacement

<br>

* force_basic_auth : to use a basic_auth authentication

<br>

* group : group of the file

<br>

* headers : add some headers

<br>

* http_agent : specify the agent

-----------------------------------------------------------------------

# 27 ANSIBLE : UNARCHIVE AND GET_URL MODULES


<br>

* owner : owner of the file

<br>

* mode : permissions

<br>

* url : address of the source

<br>

* url_password : for the basic_auth

<br>

* url_username : for the basic_auth

<br>


* exemple : https://downloads.apache.org/tomcat/tomcat-10/v10.0.0-M8/bin/

<br>

* with a checksum:

```
  - name: test unarchive
    get_url:
      url: https://downloads.apache.org/tomcat/tomcat-9/v9.0.41/src/apache-tomcat-9.0.41-src.tar.gz
      dest: /opt/tomcat8
      mode: 0755
      checksum: sha512:094e7cbd2519a4b812a2ca865f92802ece3385a20826c5e29b5f7cda8b9265d01ede6f598999f8aa2f1b04bcaca2e67e3f0132781b3f22007356df49ab6b1838
      validate_certs: no
      group: oki
      owner: oki
```
