# owncloud

```
#!/bin/bash
# create mysql data directory
mkdir -p /opt/owncloud/mysql

# initialize database.
docker run --name mysql_owncloud -e MYSQL_ROOT_PASSWORD=password -v /opt/owncloud/mysql:/var/lib/mysql -d mysql:5.7

# create owncloud data directory
mkdir -p /opt/owncloud/http

# create owncloud data directory
mkdir -p /opt/owncloud/ssl

# run owncloud on https://$HOST_NAME:443 with owncloud datadir /opt/http/ownclud and mysql datadir /opt/mysql/owncloud
docker run -dit -p 443:443 --name owncloud_persist -v /opt/owncloud/http:/var/www/html/owncloud -v /opt/owncloud/ssl:/var/www/ssl --link mysql_owncloud:mysql xziped/owncloud
```

