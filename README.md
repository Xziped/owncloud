# ownCloud docker-image

## Setup persistent MySQL Database (optional)
### Create MySQL data directory on host
```
mkdir -p /opt/owncloud/mysql
```

### initialize database.
```
docker run --name mysql_owncloud -e MYSQL_ROOT_PASSWORD=password -v /opt/owncloud/mysql:/var/lib/mysql -d mysql:5.7
```

## Setup persistent ownCloud data 
### create ownCloud data directory on host
```
mkdir -p /opt/owncloud/http
```

### create ownCloud certificate directory on host
```
mkdir -p /opt/owncloud/ssl
```

## run ownCloud with SSL (selfsigned certs) and linked MySQL 
```
docker run -dit -p 443:443 --name owncloud -v /opt/owncloud/http:/var/www/html -v /opt/owncloud/ssl:/var/www/ssl --link mysql_owncloud:mysql xziped/owncloud
```

## Variables
### Certificate
* `-e SSL_ROOT=/var/www/ssl`
* `-e HOST_NAME=example.org`
* `-e EMAIL=admin@example.org`

### Versions
#### Git
* `-e GIT_ENABLE=false`

#### ownCloud Community Version
* `-e OC_VERS=owncloud-8.0.2`

## Examples
### Minimal
Expose port 443. External MySQL-Support. Data is only stored in Docker-Image (not recomended)
```
docker run -dit xziped/owncloud
```
### With linked MySQL
Connect to Database over Hostname mysql.
```
docker run -dit --link mysql_owncloud:mysql xziped/owncloud
```
### Set some Variables
Run on Hostport 443 with name owncloud. Change Host_Name and EMAIL for Certificate. Enable Source Download from Git . Make data for owncloud and certificates persistent.
```
docker run -dit -p 443:443 --name owncloud -e HOST_NAME=example.com -e EMAIL=webmaster@example.com -e GIT_ENABLE=true -v /opt/owncloud/http:/var/www/html -v /opt/owncloud/ssl:/var/www/ssl --link mysql_owncloud:mysql xziped/owncloud
```
### Update OwnCloud Git Repository
```
docker run -dit xziped/owncloud update
```

## Start Paramater
### start
Defaultparameter when no parameter set
### cert
Creates a new Certificate and Key in ${SSL_ROOT}
### update
Updates all Github repositories
### shell
Executes a root-shell to debug and try out some things
