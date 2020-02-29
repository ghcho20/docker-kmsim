# Summary
IDQ KMS simulaion in docker
* kems tomcat(& mariadb) ready
  * 8080/tcp published
* kms initial/default configuration ready
  * master/slave setup
  * kems added
  * ~~neighbor(peer kms) added~~ (neighbor is handled by kems from v211 on)
  * neighbor kms cert & psk added
  * ETSI REST ports published
    * 7000/tcp : master kms(kmsm)
    * 7001/tcp : slave kms(kmss)
* used custom bridge network (kmsim_net) & static ip
  * mariadb: 172.16.238.2
  * kems: 172.16.238.3
  * kmsm: 172.16.238.4
  * kmss: 172.16.238.5
## branches & tags(#)
* v211 : v2.1.1 (master#)
* v202 : v2.0.2 with new QKD simulator
* v201 : v2.0.1

## images:
* kms:0 (base for kms containers derived from centos:systemd)
* tomcat:kems (tomcat + kems war derived from tomcat:8.5.38)
* mariadb:10.3 (mysql)

## supported Mode
* all-in-one simulation : kems(tomcat+mariadb), kms master, kms slave
* kems only

## persistent volumes
* mysql: kems mysql Db data path
* wlog: kems tomcat log path
* db_m/db_s: kms sqlite3 DB path
* cnf_m/cnf_s: kms config path
* init_m/init_s: startup initialization setup path
* log_m/log_s: kms log path
> How log paths are persistent ?

> To help clean up log files easily with containers not running when you want to erase log files regularly.

> You can delete logs after terminating containers.
```
[cos7@localhost kmsim]$ docker-compose down
[cos7@localhost kmsim]$ docker volume ls
DRIVER              VOLUME NAME
local               013bf5f8e7e54d97974b7cdaca69175c550b697a4937ecf24d1d9ce108fc60c9
local               45b9a369b1a62576efccbd5fdc3f68336ff847e4202cd628694bd9146cf338d2
local               kmsim_cnf_m
local               kmsim_cnf_s
local               kmsim_db_m
local               kmsim_db_s
local               kmsim_init_m
local               kmsim_init_s
local               kmsim_log_m
local               kmsim_log_s
local               kmsim_mysql
local               kmsim_wlog
[cos7@localhost kmsim]$ docker volume rm kmsim_wlog kmsim_log_m kmsim_log_s
```

# Quick Start Guide

## set TIMEZONE in runtime evnironmen (effective from branch v202)
* create a file, `.env` in the root folder
> TIMEZONE=\<your timezone\>
* To choose \<your timezone>\, consult [tz database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones "Title")
> example:
> TIMEZONE=Aisa/Seoul

## run all-in-one simulation
kems(tomcat + mariadb), kms master, kms slave
* (**_optional if upgraded to new version_**) `docker rmi tomcat:kems kms:0`

At **top** folder
* launch : `docker-compose up -d`
  * start containers in background
* stop : `docker-compose stop`
  * stop & leave containers in exit state
  * retain volumes
* restart : `docker-compose start`
  * resume stopped containers
* terminate : `docker-compose down`
  * stop & remove containers
  * retain volumes
* clean terminate : `docker-compose rm -svf`
  * stop & remove containers
  * remove anonymous volumes
  * retain persistent volumes

### total 4 containers should run
```
----------------
[cos7@localhost kmsim]$ docker ps -a
----------------
CONTAINER       3e2f33be887c kmss
IMAGE RUN       kms:0   "/usr/sbin/init"
PORTS
Exited (137) 47 minutes ago     @ 2020-02-29 15:01:27 +0900 KST
----------------
CONTAINER       7b3e1ceb675d kmsm
IMAGE RUN       kms:0   "/usr/sbin/init"
PORTS
Exited (137) 47 minutes ago     @ 2020-02-29 15:01:26 +0900 KST
----------------
CONTAINER       4fa5d0abbfe1 kems
IMAGE RUN       tomcat:kems     "bash -c 'echo > /de…"
PORTS
Exited (137) 47 minutes ago     @ 2020-02-29 15:01:25 +0900 KST
----------------
CONTAINER       f7abb57163c3 db
IMAGE RUN       mariadb:10.3    "docker-entrypoint.s…"
PORTS
Exited (0) 47 minutes ago       @ 2020-02-29 15:01:25 +0900 KST
```

## run **kems** only
kems(tomcat + mariadb) only to run standalone WAS
* (**_optional if upgraded to new version_**) `docker rmi tomcat:kems`

At **top** folder
* launch : `docker-compose -f docker-compose.ym up -d`
  * start containers in background
* stop : `docker-compose -f docker-compose.ym stop`
  * stop & leave containers in exit state
  * retain volumes
* restart : `docker-compose -f docker-compose.ym start`
  * resume stopped containers
* terminate : `docker-compose -f docker-compose.ym down`
  * stop & remove containers
  * retain volumes
* clean terminate : `docker-compose -f docker-compose.ym rm -svf`
  * stop & remove containers
  * remove anonymous volumes
  * retain persistent volumes

### total 2 containers should run
```
----------------
CONTAINER       4fa5d0abbfe1 kems
IMAGE RUN       tomcat:kems     "bash -c 'echo > /de…"
PORTS
Exited (137) 47 minutes ago     @ 2020-02-29 15:01:25 +0900 KST
----------------
CONTAINER       f7abb57163c3 db
IMAGE RUN       mariadb:10.3    "docker-entrypoint.s…"
PORTS
Exited (0) 47 minutes ago       @ 2020-02-29 15:01:25 +0900 KST
```
