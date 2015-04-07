# owncloud

* docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:5.7
* docker run -dit -p 80:80 -p 443:443 --name owncloud --link mysql:mysql xziped/owncloud

### TODO

* add ssl-support
* add more variables
