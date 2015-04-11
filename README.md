# owncloud

```
\#!/bin/bash
\# create mysql data directory
mkdir -p /opt/mysql/owncloud
\# initialize database.
docker run --name mysql_owncloud -e MYSQL_ROOT_PASSWORD=password -v /opt/mysql/owncloud:/var/lib/mysql -d mysql:5.7
\# create owncloud data directory
mkdir -p /opt/http/owncloud
\# run owncloud on localhost:80 with owncloud datadir /opt/http/ownclud and mysql datadir /opt/mysql/owncloud
docker run -dit -p 80:80 -p 443:443 --name owncloud_persist -v /opt/http/owncloud:/var/www/html/owncloud --link mysql_owncloud:mysql xziped/owncloud
```

### TODO

* add ssl-support
* add more variables
