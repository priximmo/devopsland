%title: LEARN ELK
%author: xavki

# 03 ELK Stack : Simple example

<br>

Purposes :

		* discovery video to visualize the stack

		* install nginx

		* add grok pattern

		* set logstash configuration

		* check in elasticsearch in kibana

-------------------------------------------------------------

# 03 ELK Stack : Simple example

<br>

* install a local nginx (just an example)

```
sudo apt install nginx
sudo usermod -aG adm logstash
```

-------------------------------------------------------------

# 03 ELK Stack : Simple example

<br>

* add a grok pattern (help to parse logs)

```
mkdir /etc/logstash/pattern
chmod 755 -R /etc/logstash/pattern
cat /etc/logstash/pattern/nginx
NGUSERNAME [a-zA-Z\.\@\-\+_%]+
NGUSER %{NGUSERNAME}
```

-------------------------------------------------------------

# 03 ELK Stack : Simple example

Useful website : https://grokdebug.herokuapp.com/

<br>

```
IPORHOST : ip ou hostname
NGUSER : cf ng user
HTTPDATE : date 
WORD : mot (GET...)
URIPATHPARAM : chemin uri
NUMBER : nombre
```

