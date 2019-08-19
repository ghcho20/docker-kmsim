# docker-kmsim
IDQ KMS simulaion in docker
* kems tomcat(& mariadb) ready (port 8080 exposed&forwarded)
* kms initial/default configuration ready
  * master/slave setup
  * kems added
  * neighbor(peer kms) added
  * kms psk added

## Images:
* centos:0 (base for kms:0)
* kms:0 (base for kms containers)
* kems_web (tomcat + kems war)
* kems_db (mariadb)

## Supported Mode
* all-in-one simulation : kems(tomcat+mariadb), kms master, kms slave
* kems only

# Quick Start

## Build base images
1. `cd 0_build_me_first`
2. set timezone
  * open `.env` file
  * change timezone string according to [tz database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones "Title")
3. `docker-compose -f build_only.yml build --force-rm` (**build only**)

## Run all-in-one simulation
kems(tomcat + mariadb), kms master, kms slave
* move to **top** folder
* launch: `docker-compose up -d`
* stop: `docker-compose stop`
* restart: `docker-compose start`
* terminate: `docker-compose down`
### total 4 containers should run
```
----------------
CONTAINER       af8cf348a8c3 kmss
IMAGE RUN       kms:0   "/usr/sbin/init"
PORTS           7000/tcp, 8000/tcp, 9000-9002/tcp, 9004/tcp
Up 16 seconds   @ 2019-08-19 02:44:05 +0900 KST
----------------
CONTAINER       13323b66d74c kmsm
IMAGE RUN       kms:0   "/usr/sbin/init"
PORTS           7000/tcp, 8000/tcp, 9000-9002/tcp, 9004/tcp
Up 17 seconds   @ 2019-08-19 02:44:05 +0900 KST
----------------
CONTAINER       38674f23f04c kems_web
IMAGE RUN       tomcat:kems     "catalina.sh run"
PORTS           0.0.0.0:8080->8080/tcp
Up 18 seconds   @ 2019-08-19 02:44:04 +0900 KST
----------------
CONTAINER       db2ae78ab6e0 kems_db
IMAGE RUN       mariadb:kems    "docker-entrypoint.s…"
PORTS           3306/tcp
Up 18 seconds   @ 2019-08-19 02:44:03 +0900 KST
```

## Run **kems** only
kems(tomcat + mariadb) only to run standalone WAS
* move to **top** folder
* launch: `docker-compose -f docker-compose.yml up -d`
* stop: `docker-compose -f docker-compose.yml stop`
* restart: `docker-compose -f docker-compose.yml start`
* terminate: `docker-compose -f docker-compose.yml down`
### total 2 containers should run
```
----------------
CONTAINER       38674f23f04c kems_web
IMAGE RUN       tomcat:kems     "catalina.sh run"
PORTS           0.0.0.0:8080->8080/tcp
Up 18 seconds   @ 2019-08-19 02:44:04 +0900 KST
----------------
CONTAINER       db2ae78ab6e0 kems_db
IMAGE RUN       mariadb:kems    "docker-entrypoint.s…"
PORTS           3306/tcp
Up 18 seconds   @ 2019-08-19 02:44:03 +0900 KST
```