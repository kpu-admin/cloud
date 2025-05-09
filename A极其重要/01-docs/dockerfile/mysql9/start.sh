#!/bin/bash
cur_dir=`pwd`
#--restart=always
docker stop kpu_mysql
docker rm kpu_mysql
docker run --name kpu_mysql  \
    -v `pwd`/conf:/etc/mysql/conf.d \
    -v `pwd`/data:/var/lib/mysql \
    -p 3218:3306 \
    -e MYSQL_ROOT_PASSWORD="root" \
    -e TZ=Asia/Shanghai \
    -d mysql:8.4