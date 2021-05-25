%title: LEARN DOCKER
%author: xavki

# 03 DOCKER : INSTALLATION

<br>

DEBIAN MANUALLY

<br>

* remove old docker versions

```
sudo apt-get remove docker docker-engine docker.io containerd runc
```

<br>

* to install the repository

```
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
```

<br>

* add the gpg key

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

---------------------------------------------------------------------------------------------

# 03 DOCKER : INSTALLATION

<br>

* add the repository in apt sources

```
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

<br>

* update the apt cache

```
sudo apt-get update
```

<br>

* install docker

```
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

---------------------------------------------------------------------------------------------

# 03 DOCKER : INSTALLATION

<br>

DEBIAN BY SCRIPT

<br>

* download the docker script

```
curl -fsSL https://get.docker.com -o get-docker.sh
```

<br>

* run the script

```
sudo sh get-docker.sh
```

<br>

* If you don't pass the sudo

```
sudo usermod -aG docker $USER
```
