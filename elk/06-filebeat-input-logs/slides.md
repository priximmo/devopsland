%title: LEARN ELK
%author: xavki

# 06 FILEBEAT : the log input

<br>

Purposes :

		* discover the log input (without module)

		* see together different parameters

		* test a simple example

------------------------------------------------------------------

# 06 FILEBEAT : the log input


<br>

Main options of the log input :

    * enabled : activate this logs
    * paths : where filebeat can find your logs (pattern)
    * fields : to add some fields in your logs (documents)
    * recursive_glob.enabled : to activate the recursive pattern (depth 8 dirs)
    * include_lines : to include lines by pattern
    * exclude_lines : to exclude lines by pattern
    * json : specific format
    * exclude_files : to exclude some files (pattern)
    * ignore_older : to ignore files older than (some days...)
    * symlinks : to follow simlinks or not
    * tags : to add tags (see it later - next videos)
    * index : to specify an elasticsearch index


------------------------------------------------------------------

# 06 FILEBEAT : the log input


<br>

* example :

```
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/nginx/access*.log
  exclude_lines: ["^127.0.0.1"]
  exclude_files: [".gz$"]
  ignore_older: 24h
  tags: ["back"]
  fields:
    env: prod
    owner: xavki
```

