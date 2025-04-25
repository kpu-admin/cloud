#!/bin/bash
cur_dir=`pwd`

docker stop kpu_mysql
docker rm kpu_mysql
docker run --name kpu_mysql --restart=always \
    -v `pwd`/conf:/etc/mysql/conf.d \
    -v /data/docker-data/mysql-data/:/var/lib/mysql \
    -p 3218:3306 \
    -e MYSQL_ROOT_PASSWORD="root" \
    -e TZ=Asia/Shanghai \
    -d mysql:5.7.9
