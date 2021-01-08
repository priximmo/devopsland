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

* force : remplace le fichier si il est différent de la source

<br>

* group : group propriétaire

<br>

* local_follow : indique le filesystème dans la source

<br>

* mode : permissions du fichier ou du répertoire (0755, u+rwx,g+rx,o+rx)

<br>

* owner : user propriétiare

<br>

* remote_src : no > copie du master vers la target, yes > copie de la target vers la target

<br>

* src : localisation de la source
    * attention : roles / dir files / .

<br>

* unsafe_writes : éviter la corruption de fichier

<br>

validate : commande jouée pour valider le fichier avant de le copier (le fichier se situe %s)


