#!/bin/bash

############################################################
#
#  Description : Deploy container as virtual machine
#
#  Auteur : Xavier
#
#  Date : 28/12/2018 - V2.0
#
###########################################################


# Functions #########################################################

help(){
echo "

Options :
		- --create : launch some containers (specify the number)

		- --drop : remove all containers started by the script
	
		- --infos : list container ips

		- --start : restart all container created by the script (restart laptop)

		- --ansible : to create the inventory with ip of each container

"

}

createNodes() {
	# set number of containers
	nb_machine=1
	[ "$1" != "" ] && nb_machine=$1
	# setting min/max
	min=1
	max=0

	# if you have already created some container - start from the last id
	idmax=`docker ps -a --format '{{ .Names}}' | awk -F "-" -v user="$USER" '$0 ~ user"-debian" {print $3}' | sort -r |head -1`
	# set new idmin and max from the last idmax
	min=$(($idmax + 1))
	max=$(($idmax + $nb_machine))

	# run containers
	for i in $(seq $min $max);do
		docker run -tid --privileged --publish-all=true -v /srv/data:/srv/html -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name $USER-debian-$i -h $USER-debian-$i priximmo/buster-systemd-ssh
		docker exec -ti $USER-debian-$i /bin/sh -c "useradd -m -p sa3tHJ3/KuYvI $USER"
		docker exec -ti $USER-debian-$i /bin/sh -c "mkdir  ${HOME}/.ssh && chmod 700 ${HOME}/.ssh && chown $USER:$USER $HOME/.ssh"
	docker cp $HOME/.ssh/id_rsa.pub $USER-debian-$i:$HOME/.ssh/authorized_keys
	docker exec -ti $USER-debian-$i /bin/sh -c "chmod 600 ${HOME}/.ssh/authorized_keys && chown $USER:$USER $HOME/.ssh/authorized_keys"
		docker exec -ti $USER-debian-$i /bin/sh -c "echo '$USER   ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers"
		docker exec -ti $USER-debian-$i /bin/sh -c "service ssh start"
		echo "Conteneur $USER-debian-$i créé"
	done
	infosNodes	

}

dropNodes(){
	echo "Remove containers..."
	docker rm -f $(docker ps -a | grep $USER-debian | awk '{print $1}')
	echo "End of deletion"
}

startNodes(){
	echo ""
	docker start $(docker ps -a | grep $USER-debian | awk '{print $1}')
  for container in $(docker ps -a | grep $USER-debian | awk '{print $1}');do
		docker exec -ti $container /bin/sh -c "service ssh start"
  done
	echo ""
}


createAnsible(){
	echo ""
  	ANSIBLE_DIR="ansible_dir"
  	mkdir -p $ANSIBLE_DIR
  	echo "all:" > $ANSIBLE_DIR/00_inventory.yml
	echo "  vars:" >> $ANSIBLE_DIR/00_inventory.yml
    echo "    ansible_python_interpreter: /usr/bin/python3" >> $ANSIBLE_DIR/00_inventory.yml
  echo "  hosts:" >> $ANSIBLE_DIR/00_inventory.yml
  for container in $(docker ps -a | grep $USER-debian | awk '{print $1}');do      
    docker inspect -f '    {{.NetworkSettings.IPAddress }}:' $container >> $ANSIBLE_DIR/00_inventory.yml
  done
  mkdir -p $ANSIBLE_DIR/host_vars
  mkdir -p $ANSIBLE_DIR/group_vars
	echo ""
}

infosNodes(){
	echo ""
	echo "List of IPs : "
	echo ""
	for container in $(docker ps -a | grep $USER-debian | awk '{print $1}');do      
		docker inspect -f '   => {{.Name}} - {{.NetworkSettings.IPAddress }}' $container
	done
	echo ""
}



# Let's Go !!! ###################################################################""

# option --create
if [ "$1" == "--create" ];then
	createNodes $2

# option --drop
elif [ "$1" == "--drop" ];then
	dropNodes

# option --start
elif [ "$1" == "--start" ];then
	startNodes

# option --ansible
elif [ "$1" == "--ansible" ];then
	createAnsible

# option --infos
elif [ "$1" == "--infos" ];then
	infosNodes

# if nothing show help
else
	help

fi




