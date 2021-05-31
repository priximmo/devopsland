%title: LEARN ANSIBLE
%author: xavki


# 36 ENV, PROMPT & VARS

<br>

>> subscribe to my channel <<

<br>

Purposes :

		* use an environment variable

		* get an env vars

		* define a prompt

---------------------------------------------------------------------------

# 36 ENV, PROMPT & VARS


<br>

* To define an env vars :

```
  environment:
    PATHLIB: "/var/lib/"
  tasks:
  - name: echo
    shell: echo $PATHLIB
    register: __output
  - name: print
    debug:
      var: __output
```

---------------------------------------------------------------------------

# 36 ENV, PROMPT & VARS

<br>

* to use a env vars from your ansible server

```
  - name: echo
    shell: "echo {{ lookup('env', 'ENV') }}"
    register: __output
  - name: print
    debug:
      var: __output
```

* or to add a default value :

```
    shell: "echo {{ lookup('env', 'ENV') | default('stage', True) }}"
```

---------------------------------------------------------------------------

# 36 ENV, PROMPT & VARS

<br>

* to use a prompt :

```
  vars_prompt:
    - name: name
  tasks:
  - name: echo
    shell: "echo Hello {{ name }}"
    register: __output
  - name: print
    debug:
      var: __output
```

---------------------------------------------------------------------------

# 36 ENV, PROMPT & VARS

<br>

* or to ask something

```
  vars_prompt:
  - name: env
    prompt: "Which environment ? prod/stage/dev"
    default: dev
  environment:
    ENV: "{{ env }}"
  tasks:
  - name: echo
    shell: "echo Salut $ENV"
    register: __output
  - name: print
    debug:
      var: __output
```
