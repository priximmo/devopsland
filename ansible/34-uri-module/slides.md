%title: LEARN ANSIBLE
%author: xavki


# 34 URI MODULE : send HTTP requests

<br>

>> subscribe to my channel <<

<br>

Documentation : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/uri_module.html

Purpose :

		* send HTTP requests (test, get information of an API...)

		* for example : ansible can wait a response before to continue

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

PARAMETERS :

* headers : add headers to your requests

* body : insert a body in your request

* body_format : format of the body (json or raw)

* creates : doesn't run the task if a file exists

* dest : where to create the new file

* follow_redirects : to follow redirections (like 301)

* force_basic_auth : to force to use basic auth 

* method : GET / POST/ DELETE / PUT / HEAD / PATCH / TRACE...

* password : for the basic auth


------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* removes : remove the file before to create a new file

* return_content : to get the content of the response

* status_code : list of the response code that meens a successfull request

* timeout : timeout in seconds (to abort the request)

* url : where is the target

* user : basic auth user

* validate_certs : to use a strict tls or not	


------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* simple example with a GET

```
- name: get an url
  hosts: all
  tasks:
  - name: uri
    uri:
      url: http://xavki.blog
      method: GET
      validate_certs: False
```

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* to check a specific status

```
- name: test
  hosts: all
  tasks:
  - name: uri
    uri:
      url: http://xavki.blog
      method: GET
      validate_certs: False
      status_code: 200
```

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* check multiple status code and POST request

```
  - name: uri
    uri:
      url: https://httpbin.org/status/500
      method: POST
      status_code: [200,201,301]
      validate_certs: False
```

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* get the content

```
- name: test
  hosts: all
  tasks:
  - name: uri
    uri:
      url: http://httpbin.org/get
      return_content: yes
      method: GET
    register: __content
  - name: debug
    debug:
      var: __content.content
```

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* get a specific element

```
  - name: uri
    uri:
      url: https://httpbin.org/get
      method: GET
      return_content: yes
      validate_certs: False
      body_format: json
    register: __body
  - name: debug
    debug:
      var: __body.json.url
```

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* check the content of the response

```
- name: test
  hosts: all
  tasks:
  - name: uri
    uri:
      url: http://xavki.blog
      return_content: yes
      method: GET
      validate_certs: False
    register: __content
    failed_when: " 'xavki' not in __content.content"
```

------------------------------------------------------------------

# 34 URI MODULE : send HTTP requests


<br>

* basic auth

```
  - name: uri
    uri:
      url: https://httpbin.org/basic-auth/toto/test
      user: "toto"
      password: "test"
      method: GET
      validate_certs: False
```

